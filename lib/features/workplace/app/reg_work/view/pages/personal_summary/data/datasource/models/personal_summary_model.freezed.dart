// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonalSummaryRequest _$PersonalSummaryRequestFromJson(
    Map<String, dynamic> json) {
  return _PersonalSummaryRequest.fromJson(json);
}

/// @nodoc
mixin _$PersonalSummaryRequest {
  @JsonKey(name: 'DateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  int get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'Keyword')
  String get keyword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalSummaryRequestCopyWith<PersonalSummaryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalSummaryRequestCopyWith<$Res> {
  factory $PersonalSummaryRequestCopyWith(PersonalSummaryRequest value,
          $Res Function(PersonalSummaryRequest) then) =
      _$PersonalSummaryRequestCopyWithImpl<$Res, PersonalSummaryRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'IsApproved') int isApproved,
      @JsonKey(name: 'Keyword') String keyword});
}

/// @nodoc
class _$PersonalSummaryRequestCopyWithImpl<$Res,
        $Val extends PersonalSummaryRequest>
    implements $PersonalSummaryRequestCopyWith<$Res> {
  _$PersonalSummaryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? departmentId = null,
    Object? employeeId = null,
    Object? isApproved = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalSummaryRequestImplCopyWith<$Res>
    implements $PersonalSummaryRequestCopyWith<$Res> {
  factory _$$PersonalSummaryRequestImplCopyWith(
          _$PersonalSummaryRequestImpl value,
          $Res Function(_$PersonalSummaryRequestImpl) then) =
      __$$PersonalSummaryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'IsApproved') int isApproved,
      @JsonKey(name: 'Keyword') String keyword});
}

/// @nodoc
class __$$PersonalSummaryRequestImplCopyWithImpl<$Res>
    extends _$PersonalSummaryRequestCopyWithImpl<$Res,
        _$PersonalSummaryRequestImpl>
    implements _$$PersonalSummaryRequestImplCopyWith<$Res> {
  __$$PersonalSummaryRequestImplCopyWithImpl(
      _$PersonalSummaryRequestImpl _value,
      $Res Function(_$PersonalSummaryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? departmentId = null,
    Object? employeeId = null,
    Object? isApproved = null,
    Object? keyword = null,
  }) {
    return _then(_$PersonalSummaryRequestImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalSummaryRequestImpl implements _PersonalSummaryRequest {
  const _$PersonalSummaryRequestImpl(
      {@JsonKey(name: 'DateStart') required this.dateStart,
      @JsonKey(name: 'DateEnd') required this.dateEnd,
      @JsonKey(name: 'DepartmentID') required this.departmentId,
      @JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'IsApproved') required this.isApproved,
      @JsonKey(name: 'Keyword') required this.keyword});

  factory _$PersonalSummaryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalSummaryRequestImplFromJson(json);

  @override
  @JsonKey(name: 'DateStart')
  final DateTime dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime dateEnd;
  @override
  @JsonKey(name: 'DepartmentID')
  final int departmentId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;
  @override
  @JsonKey(name: 'IsApproved')
  final int isApproved;
  @override
  @JsonKey(name: 'Keyword')
  final String keyword;

  @override
  String toString() {
    return 'PersonalSummaryRequest(dateStart: $dateStart, dateEnd: $dateEnd, departmentId: $departmentId, employeeId: $employeeId, isApproved: $isApproved, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalSummaryRequestImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateStart, dateEnd, departmentId,
      employeeId, isApproved, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalSummaryRequestImplCopyWith<_$PersonalSummaryRequestImpl>
      get copyWith => __$$PersonalSummaryRequestImplCopyWithImpl<
          _$PersonalSummaryRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalSummaryRequestImplToJson(
      this,
    );
  }
}

abstract class _PersonalSummaryRequest implements PersonalSummaryRequest {
  const factory _PersonalSummaryRequest(
          {@JsonKey(name: 'DateStart') required final DateTime dateStart,
          @JsonKey(name: 'DateEnd') required final DateTime dateEnd,
          @JsonKey(name: 'DepartmentID') required final int departmentId,
          @JsonKey(name: 'EmployeeID') required final int employeeId,
          @JsonKey(name: 'IsApproved') required final int isApproved,
          @JsonKey(name: 'Keyword') required final String keyword}) =
      _$PersonalSummaryRequestImpl;

  factory _PersonalSummaryRequest.fromJson(Map<String, dynamic> json) =
      _$PersonalSummaryRequestImpl.fromJson;

  @override
  @JsonKey(name: 'DateStart')
  DateTime get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd;
  @override
  @JsonKey(name: 'DepartmentID')
  int get departmentId;
  @override
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override
  @JsonKey(name: 'IsApproved')
  int get isApproved;
  @override
  @JsonKey(name: 'Keyword')
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$PersonalSummaryRequestImplCopyWith<_$PersonalSummaryRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalLeaveItem _$PersonalLeaveItemFromJson(Map<String, dynamic> json) {
  return _PersonalLeaveItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalLeaveItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeLeave')
  String? get employeeLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeTP')
  String? get employeeTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeHR')
  String? get employeeHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeOnLeave')
  int? get timeOnLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeOnLeaveText')
  String? get timeOnLeaveText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeText')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeIsReal')
  int? get typeIsReal => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeIsRealText')
  String? get typeIsRealText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelRegister')
  bool? get isCancelRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelRegisterText')
  String? get isCancelRegisterText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelTP')
  bool? get isCancelTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelHR')
  bool? get isCancelHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelTPText')
  String? get isCancelTpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCancelHRText')
  String? get isCancelHrText => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateCancel')
  DateTime? get dateCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalLeaveItemCopyWith<PersonalLeaveItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalLeaveItemCopyWith<$Res> {
  factory $PersonalLeaveItemCopyWith(
          PersonalLeaveItem value, $Res Function(PersonalLeaveItem) then) =
      _$PersonalLeaveItemCopyWithImpl<$Res, PersonalLeaveItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'EmployeeLeave') String? employeeLeave,
      @JsonKey(name: 'EmployeeTP') String? employeeTp,
      @JsonKey(name: 'EmployeeHR') String? employeeHr,
      @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
      @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'TotalTime') double? totalTime,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'TypeIsReal') int? typeIsReal,
      @JsonKey(name: 'TypeIsRealText') String? typeIsRealText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
      @JsonKey(name: 'IsCancelRegisterText') String? isCancelRegisterText,
      @JsonKey(name: 'IsCancelTP') bool? isCancelTp,
      @JsonKey(name: 'IsCancelHR') bool? isCancelHr,
      @JsonKey(name: 'IsCancelTPText') String? isCancelTpText,
      @JsonKey(name: 'IsCancelHRText') String? isCancelHrText,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'DateCancel') DateTime? dateCancel,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class _$PersonalLeaveItemCopyWithImpl<$Res, $Val extends PersonalLeaveItem>
    implements $PersonalLeaveItemCopyWith<$Res> {
  _$PersonalLeaveItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? employeeLeave = freezed,
    Object? employeeTp = freezed,
    Object? employeeHr = freezed,
    Object? timeOnLeave = freezed,
    Object? timeOnLeaveText = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalTime = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? typeIsReal = freezed,
    Object? typeIsRealText = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isCancelRegister = freezed,
    Object? isCancelRegisterText = freezed,
    Object? isCancelTp = freezed,
    Object? isCancelHr = freezed,
    Object? isCancelTpText = freezed,
    Object? isCancelHrText = freezed,
    Object? reasonCancel = freezed,
    Object? dateCancel = freezed,
    Object? statusTbp = freezed,
    Object? statusHr = freezed,
    Object? reasonDeciline = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? departmentStt = freezed,
    Object? createdDate = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeLeave: freezed == employeeLeave
          ? _value.employeeLeave
          : employeeLeave // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeTp: freezed == employeeTp
          ? _value.employeeTp
          : employeeTp // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeHr: freezed == employeeHr
          ? _value.employeeHr
          : employeeHr // ignore: cast_nullable_to_non_nullable
              as String?,
      timeOnLeave: freezed == timeOnLeave
          ? _value.timeOnLeave
          : timeOnLeave // ignore: cast_nullable_to_non_nullable
              as int?,
      timeOnLeaveText: freezed == timeOnLeaveText
          ? _value.timeOnLeaveText
          : timeOnLeaveText // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeIsReal: freezed == typeIsReal
          ? _value.typeIsReal
          : typeIsReal // ignore: cast_nullable_to_non_nullable
              as int?,
      typeIsRealText: freezed == typeIsRealText
          ? _value.typeIsRealText
          : typeIsRealText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelRegister: freezed == isCancelRegister
          ? _value.isCancelRegister
          : isCancelRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelRegisterText: freezed == isCancelRegisterText
          ? _value.isCancelRegisterText
          : isCancelRegisterText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelTp: freezed == isCancelTp
          ? _value.isCancelTp
          : isCancelTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelHr: freezed == isCancelHr
          ? _value.isCancelHr
          : isCancelHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelTpText: freezed == isCancelTpText
          ? _value.isCancelTpText
          : isCancelTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelHrText: freezed == isCancelHrText
          ? _value.isCancelHrText
          : isCancelHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCancel: freezed == dateCancel
          ? _value.dateCancel
          : dateCancel // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalLeaveItemImplCopyWith<$Res>
    implements $PersonalLeaveItemCopyWith<$Res> {
  factory _$$PersonalLeaveItemImplCopyWith(_$PersonalLeaveItemImpl value,
          $Res Function(_$PersonalLeaveItemImpl) then) =
      __$$PersonalLeaveItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'EmployeeLeave') String? employeeLeave,
      @JsonKey(name: 'EmployeeTP') String? employeeTp,
      @JsonKey(name: 'EmployeeHR') String? employeeHr,
      @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
      @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
      @JsonKey(name: 'StartDate') DateTime? startDate,
      @JsonKey(name: 'EndDate') DateTime? endDate,
      @JsonKey(name: 'TotalTime') double? totalTime,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'TypeIsReal') int? typeIsReal,
      @JsonKey(name: 'TypeIsRealText') String? typeIsRealText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
      @JsonKey(name: 'IsCancelRegisterText') String? isCancelRegisterText,
      @JsonKey(name: 'IsCancelTP') bool? isCancelTp,
      @JsonKey(name: 'IsCancelHR') bool? isCancelHr,
      @JsonKey(name: 'IsCancelTPText') String? isCancelTpText,
      @JsonKey(name: 'IsCancelHRText') String? isCancelHrText,
      @JsonKey(name: 'ReasonCancel') String? reasonCancel,
      @JsonKey(name: 'DateCancel') DateTime? dateCancel,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class __$$PersonalLeaveItemImplCopyWithImpl<$Res>
    extends _$PersonalLeaveItemCopyWithImpl<$Res, _$PersonalLeaveItemImpl>
    implements _$$PersonalLeaveItemImplCopyWith<$Res> {
  __$$PersonalLeaveItemImplCopyWithImpl(_$PersonalLeaveItemImpl _value,
      $Res Function(_$PersonalLeaveItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? employeeLeave = freezed,
    Object? employeeTp = freezed,
    Object? employeeHr = freezed,
    Object? timeOnLeave = freezed,
    Object? timeOnLeaveText = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalTime = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? typeIsReal = freezed,
    Object? typeIsRealText = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isCancelRegister = freezed,
    Object? isCancelRegisterText = freezed,
    Object? isCancelTp = freezed,
    Object? isCancelHr = freezed,
    Object? isCancelTpText = freezed,
    Object? isCancelHrText = freezed,
    Object? reasonCancel = freezed,
    Object? dateCancel = freezed,
    Object? statusTbp = freezed,
    Object? statusHr = freezed,
    Object? reasonDeciline = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? departmentStt = freezed,
    Object? createdDate = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_$PersonalLeaveItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeLeave: freezed == employeeLeave
          ? _value.employeeLeave
          : employeeLeave // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeTp: freezed == employeeTp
          ? _value.employeeTp
          : employeeTp // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeHr: freezed == employeeHr
          ? _value.employeeHr
          : employeeHr // ignore: cast_nullable_to_non_nullable
              as String?,
      timeOnLeave: freezed == timeOnLeave
          ? _value.timeOnLeave
          : timeOnLeave // ignore: cast_nullable_to_non_nullable
              as int?,
      timeOnLeaveText: freezed == timeOnLeaveText
          ? _value.timeOnLeaveText
          : timeOnLeaveText // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeIsReal: freezed == typeIsReal
          ? _value.typeIsReal
          : typeIsReal // ignore: cast_nullable_to_non_nullable
              as int?,
      typeIsRealText: freezed == typeIsRealText
          ? _value.typeIsRealText
          : typeIsRealText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelRegister: freezed == isCancelRegister
          ? _value.isCancelRegister
          : isCancelRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelRegisterText: freezed == isCancelRegisterText
          ? _value.isCancelRegisterText
          : isCancelRegisterText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelTp: freezed == isCancelTp
          ? _value.isCancelTp
          : isCancelTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelHr: freezed == isCancelHr
          ? _value.isCancelHr
          : isCancelHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCancelTpText: freezed == isCancelTpText
          ? _value.isCancelTpText
          : isCancelTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelHrText: freezed == isCancelHrText
          ? _value.isCancelHrText
          : isCancelHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCancel: freezed == dateCancel
          ? _value.dateCancel
          : dateCancel // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalLeaveItemImpl implements _PersonalLeaveItem {
  const _$PersonalLeaveItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApprovedTP') this.isApprovedTp,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHr,
      @JsonKey(name: 'IsApprovedTPText') this.isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') this.isApprovedHrText,
      @JsonKey(name: 'EmployeeLeave') this.employeeLeave,
      @JsonKey(name: 'EmployeeTP') this.employeeTp,
      @JsonKey(name: 'EmployeeHR') this.employeeHr,
      @JsonKey(name: 'TimeOnLeave') this.timeOnLeave,
      @JsonKey(name: 'TimeOnLeaveText') this.timeOnLeaveText,
      @JsonKey(name: 'StartDate') this.startDate,
      @JsonKey(name: 'EndDate') this.endDate,
      @JsonKey(name: 'TotalTime') this.totalTime,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'TypeText') this.typeText,
      @JsonKey(name: 'TypeIsReal') this.typeIsReal,
      @JsonKey(name: 'TypeIsRealText') this.typeIsRealText,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsCancelRegister') this.isCancelRegister,
      @JsonKey(name: 'IsCancelRegisterText') this.isCancelRegisterText,
      @JsonKey(name: 'IsCancelTP') this.isCancelTp,
      @JsonKey(name: 'IsCancelHR') this.isCancelHr,
      @JsonKey(name: 'IsCancelTPText') this.isCancelTpText,
      @JsonKey(name: 'IsCancelHRText') this.isCancelHrText,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'DateCancel') this.dateCancel,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'DepartmentSTT') this.departmentStt,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText});

  factory _$PersonalLeaveItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalLeaveItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApprovedTP')
  final bool? isApprovedTp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  final String? isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  final String? isApprovedHrText;
  @override
  @JsonKey(name: 'EmployeeLeave')
  final String? employeeLeave;
  @override
  @JsonKey(name: 'EmployeeTP')
  final String? employeeTp;
  @override
  @JsonKey(name: 'EmployeeHR')
  final String? employeeHr;
  @override
  @JsonKey(name: 'TimeOnLeave')
  final int? timeOnLeave;
  @override
  @JsonKey(name: 'TimeOnLeaveText')
  final String? timeOnLeaveText;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'TotalTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'TypeText')
  final String? typeText;
  @override
  @JsonKey(name: 'TypeIsReal')
  final int? typeIsReal;
  @override
  @JsonKey(name: 'TypeIsRealText')
  final String? typeIsRealText;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsCancelRegister')
  final bool? isCancelRegister;
  @override
  @JsonKey(name: 'IsCancelRegisterText')
  final String? isCancelRegisterText;
  @override
  @JsonKey(name: 'IsCancelTP')
  final bool? isCancelTp;
  @override
  @JsonKey(name: 'IsCancelHR')
  final bool? isCancelHr;
  @override
  @JsonKey(name: 'IsCancelTPText')
  final String? isCancelTpText;
  @override
  @JsonKey(name: 'IsCancelHRText')
  final String? isCancelHrText;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'DateCancel')
  final DateTime? dateCancel;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentStt;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;

  @override
  String toString() {
    return 'PersonalLeaveItem(id: $id, isApprovedTp: $isApprovedTp, isApprovedHr: $isApprovedHr, isApprovedTpText: $isApprovedTpText, isApprovedHrText: $isApprovedHrText, employeeLeave: $employeeLeave, employeeTp: $employeeTp, employeeHr: $employeeHr, timeOnLeave: $timeOnLeave, timeOnLeaveText: $timeOnLeaveText, startDate: $startDate, endDate: $endDate, totalTime: $totalTime, type: $type, typeText: $typeText, typeIsReal: $typeIsReal, typeIsRealText: $typeIsRealText, reason: $reason, note: $note, isCancelRegister: $isCancelRegister, isCancelRegisterText: $isCancelRegisterText, isCancelTp: $isCancelTp, isCancelHr: $isCancelHr, isCancelTpText: $isCancelTpText, isCancelHrText: $isCancelHrText, reasonCancel: $reasonCancel, dateCancel: $dateCancel, statusTbp: $statusTbp, statusHr: $statusHr, reasonDeciline: $reasonDeciline, departmentId: $departmentId, departmentName: $departmentName, departmentStt: $departmentStt, createdDate: $createdDate, statusTbpText: $statusTbpText, statusHrText: $statusHrText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalLeaveItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApprovedTp, isApprovedTp) ||
                other.isApprovedTp == isApprovedTp) &&
            (identical(other.isApprovedHr, isApprovedHr) ||
                other.isApprovedHr == isApprovedHr) &&
            (identical(other.isApprovedTpText, isApprovedTpText) ||
                other.isApprovedTpText == isApprovedTpText) &&
            (identical(other.isApprovedHrText, isApprovedHrText) ||
                other.isApprovedHrText == isApprovedHrText) &&
            (identical(other.employeeLeave, employeeLeave) ||
                other.employeeLeave == employeeLeave) &&
            (identical(other.employeeTp, employeeTp) ||
                other.employeeTp == employeeTp) &&
            (identical(other.employeeHr, employeeHr) ||
                other.employeeHr == employeeHr) &&
            (identical(other.timeOnLeave, timeOnLeave) ||
                other.timeOnLeave == timeOnLeave) &&
            (identical(other.timeOnLeaveText, timeOnLeaveText) ||
                other.timeOnLeaveText == timeOnLeaveText) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.typeIsReal, typeIsReal) ||
                other.typeIsReal == typeIsReal) &&
            (identical(other.typeIsRealText, typeIsRealText) ||
                other.typeIsRealText == typeIsRealText) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isCancelRegister, isCancelRegister) ||
                other.isCancelRegister == isCancelRegister) &&
            (identical(other.isCancelRegisterText, isCancelRegisterText) ||
                other.isCancelRegisterText == isCancelRegisterText) &&
            (identical(other.isCancelTp, isCancelTp) ||
                other.isCancelTp == isCancelTp) &&
            (identical(other.isCancelHr, isCancelHr) ||
                other.isCancelHr == isCancelHr) &&
            (identical(other.isCancelTpText, isCancelTpText) ||
                other.isCancelTpText == isCancelTpText) &&
            (identical(other.isCancelHrText, isCancelHrText) ||
                other.isCancelHrText == isCancelHrText) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.dateCancel, dateCancel) ||
                other.dateCancel == dateCancel) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.departmentStt, departmentStt) ||
                other.departmentStt == departmentStt) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isApprovedTp,
        isApprovedHr,
        isApprovedTpText,
        isApprovedHrText,
        employeeLeave,
        employeeTp,
        employeeHr,
        timeOnLeave,
        timeOnLeaveText,
        startDate,
        endDate,
        totalTime,
        type,
        typeText,
        typeIsReal,
        typeIsRealText,
        reason,
        note,
        isCancelRegister,
        isCancelRegisterText,
        isCancelTp,
        isCancelHr,
        isCancelTpText,
        isCancelHrText,
        reasonCancel,
        dateCancel,
        statusTbp,
        statusHr,
        reasonDeciline,
        departmentId,
        departmentName,
        departmentStt,
        createdDate,
        statusTbpText,
        statusHrText
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalLeaveItemImplCopyWith<_$PersonalLeaveItemImpl> get copyWith =>
      __$$PersonalLeaveItemImplCopyWithImpl<_$PersonalLeaveItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalLeaveItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalLeaveItem implements PersonalLeaveItem {
  const factory _PersonalLeaveItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'IsApprovedTP') final bool? isApprovedTp,
      @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedTPText') final String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') final String? isApprovedHrText,
      @JsonKey(name: 'EmployeeLeave') final String? employeeLeave,
      @JsonKey(name: 'EmployeeTP') final String? employeeTp,
      @JsonKey(name: 'EmployeeHR') final String? employeeHr,
      @JsonKey(name: 'TimeOnLeave') final int? timeOnLeave,
      @JsonKey(name: 'TimeOnLeaveText') final String? timeOnLeaveText,
      @JsonKey(name: 'StartDate') final DateTime? startDate,
      @JsonKey(name: 'EndDate') final DateTime? endDate,
      @JsonKey(name: 'TotalTime') final double? totalTime,
      @JsonKey(name: 'Type') final int? type,
      @JsonKey(name: 'TypeText') final String? typeText,
      @JsonKey(name: 'TypeIsReal') final int? typeIsReal,
      @JsonKey(name: 'TypeIsRealText') final String? typeIsRealText,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsCancelRegister') final bool? isCancelRegister,
      @JsonKey(name: 'IsCancelRegisterText') final String? isCancelRegisterText,
      @JsonKey(name: 'IsCancelTP') final bool? isCancelTp,
      @JsonKey(name: 'IsCancelHR') final bool? isCancelHr,
      @JsonKey(name: 'IsCancelTPText') final String? isCancelTpText,
      @JsonKey(name: 'IsCancelHRText') final String? isCancelHrText,
      @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
      @JsonKey(name: 'DateCancel') final DateTime? dateCancel,
      @JsonKey(name: 'StatusTBP') final int? statusTbp,
      @JsonKey(name: 'StatusHR') final int? statusHr,
      @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
      @JsonKey(name: 'DepartmentID') final int? departmentId,
      @JsonKey(name: 'DepartmentName') final String? departmentName,
      @JsonKey(name: 'DepartmentSTT') final int? departmentStt,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
      @JsonKey(name: 'StatusHRText')
      final String? statusHrText}) = _$PersonalLeaveItemImpl;

  factory _PersonalLeaveItem.fromJson(Map<String, dynamic> json) =
      _$PersonalLeaveItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText;
  @override
  @JsonKey(name: 'EmployeeLeave')
  String? get employeeLeave;
  @override
  @JsonKey(name: 'EmployeeTP')
  String? get employeeTp;
  @override
  @JsonKey(name: 'EmployeeHR')
  String? get employeeHr;
  @override
  @JsonKey(name: 'TimeOnLeave')
  int? get timeOnLeave;
  @override
  @JsonKey(name: 'TimeOnLeaveText')
  String? get timeOnLeaveText;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'TotalTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'TypeText')
  String? get typeText;
  @override
  @JsonKey(name: 'TypeIsReal')
  int? get typeIsReal;
  @override
  @JsonKey(name: 'TypeIsRealText')
  String? get typeIsRealText;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsCancelRegister')
  bool? get isCancelRegister;
  @override
  @JsonKey(name: 'IsCancelRegisterText')
  String? get isCancelRegisterText;
  @override
  @JsonKey(name: 'IsCancelTP')
  bool? get isCancelTp;
  @override
  @JsonKey(name: 'IsCancelHR')
  bool? get isCancelHr;
  @override
  @JsonKey(name: 'IsCancelTPText')
  String? get isCancelTpText;
  @override
  @JsonKey(name: 'IsCancelHRText')
  String? get isCancelHrText;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'DateCancel')
  DateTime? get dateCancel;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(ignore: true)
  _$$PersonalLeaveItemImplCopyWith<_$PersonalLeaveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalEarlyLateItem _$PersonalEarlyLateItemFromJson(
    Map<String, dynamic> json) {
  return _PersonalEarlyLateItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalEarlyLateItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeEarlyLate')
  String? get employeeEarlyLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeApprovedHR')
  String? get employeeApprovedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'Unit')
  int? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitText')
  String? get unitText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeText')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeApprovedTP')
  String? get employeeApprovedTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProblem')
  bool? get isProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeRegister')
  double? get timeRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalEarlyLateItemCopyWith<PersonalEarlyLateItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalEarlyLateItemCopyWith<$Res> {
  factory $PersonalEarlyLateItemCopyWith(PersonalEarlyLateItem value,
          $Res Function(PersonalEarlyLateItem) then) =
      _$PersonalEarlyLateItemCopyWithImpl<$Res, PersonalEarlyLateItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeEarlyLate') String? employeeEarlyLate,
      @JsonKey(name: 'EmployeeApprovedHR') String? employeeApprovedHr,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'Unit') int? unit,
      @JsonKey(name: 'UnitText') String? unitText,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'EmployeeApprovedTP') String? employeeApprovedTp,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'TimeRegister') double? timeRegister,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class _$PersonalEarlyLateItemCopyWithImpl<$Res,
        $Val extends PersonalEarlyLateItem>
    implements $PersonalEarlyLateItemCopyWith<$Res> {
  _$PersonalEarlyLateItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApproved = freezed,
    Object? isApprovedText = freezed,
    Object? employeeEarlyLate = freezed,
    Object? employeeApprovedHr = freezed,
    Object? dateRegister = freezed,
    Object? unit = freezed,
    Object? unitText = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? reason = freezed,
    Object? employeeApprovedTp = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedTp = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? decilineApprove = freezed,
    Object? statusTbp = freezed,
    Object? statusHr = freezed,
    Object? reasonDeciline = freezed,
    Object? isProblem = freezed,
    Object? timeRegister = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEarlyLate: freezed == employeeEarlyLate
          ? _value.employeeEarlyLate
          : employeeEarlyLate // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeApprovedHr: freezed == employeeApprovedHr
          ? _value.employeeApprovedHr
          : employeeApprovedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      unitText: freezed == unitText
          ? _value.unitText
          : unitText // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeApprovedTp: freezed == employeeApprovedTp
          ? _value.employeeApprovedTp
          : employeeApprovedTp // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeRegister: freezed == timeRegister
          ? _value.timeRegister
          : timeRegister // ignore: cast_nullable_to_non_nullable
              as double?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalEarlyLateItemImplCopyWith<$Res>
    implements $PersonalEarlyLateItemCopyWith<$Res> {
  factory _$$PersonalEarlyLateItemImplCopyWith(
          _$PersonalEarlyLateItemImpl value,
          $Res Function(_$PersonalEarlyLateItemImpl) then) =
      __$$PersonalEarlyLateItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeEarlyLate') String? employeeEarlyLate,
      @JsonKey(name: 'EmployeeApprovedHR') String? employeeApprovedHr,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'Unit') int? unit,
      @JsonKey(name: 'UnitText') String? unitText,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'EmployeeApprovedTP') String? employeeApprovedTp,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'TimeRegister') double? timeRegister,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class __$$PersonalEarlyLateItemImplCopyWithImpl<$Res>
    extends _$PersonalEarlyLateItemCopyWithImpl<$Res,
        _$PersonalEarlyLateItemImpl>
    implements _$$PersonalEarlyLateItemImplCopyWith<$Res> {
  __$$PersonalEarlyLateItemImplCopyWithImpl(_$PersonalEarlyLateItemImpl _value,
      $Res Function(_$PersonalEarlyLateItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApproved = freezed,
    Object? isApprovedText = freezed,
    Object? employeeEarlyLate = freezed,
    Object? employeeApprovedHr = freezed,
    Object? dateRegister = freezed,
    Object? unit = freezed,
    Object? unitText = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? reason = freezed,
    Object? employeeApprovedTp = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedTp = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? decilineApprove = freezed,
    Object? statusTbp = freezed,
    Object? statusHr = freezed,
    Object? reasonDeciline = freezed,
    Object? isProblem = freezed,
    Object? timeRegister = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_$PersonalEarlyLateItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEarlyLate: freezed == employeeEarlyLate
          ? _value.employeeEarlyLate
          : employeeEarlyLate // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeApprovedHr: freezed == employeeApprovedHr
          ? _value.employeeApprovedHr
          : employeeApprovedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int?,
      unitText: freezed == unitText
          ? _value.unitText
          : unitText // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeApprovedTp: freezed == employeeApprovedTp
          ? _value.employeeApprovedTp
          : employeeApprovedTp // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeRegister: freezed == timeRegister
          ? _value.timeRegister
          : timeRegister // ignore: cast_nullable_to_non_nullable
              as double?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalEarlyLateItemImpl implements _PersonalEarlyLateItem {
  const _$PersonalEarlyLateItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'EmployeeEarlyLate') this.employeeEarlyLate,
      @JsonKey(name: 'EmployeeApprovedHR') this.employeeApprovedHr,
      @JsonKey(name: 'DateRegister') this.dateRegister,
      @JsonKey(name: 'Unit') this.unit,
      @JsonKey(name: 'UnitText') this.unitText,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'TypeText') this.typeText,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'EmployeeApprovedTP') this.employeeApprovedTp,
      @JsonKey(name: 'IsApprovedTPText') this.isApprovedTpText,
      @JsonKey(name: 'IsApprovedTP') this.isApprovedTp,
      @JsonKey(name: 'DateStart') this.dateStart,
      @JsonKey(name: 'DateEnd') this.dateEnd,
      @JsonKey(name: 'DecilineApprove') this.decilineApprove,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'IsProblem') this.isProblem,
      @JsonKey(name: 'TimeRegister') this.timeRegister,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText});

  factory _$PersonalEarlyLateItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalEarlyLateItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'EmployeeEarlyLate')
  final String? employeeEarlyLate;
  @override
  @JsonKey(name: 'EmployeeApprovedHR')
  final String? employeeApprovedHr;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime? dateRegister;
  @override
  @JsonKey(name: 'Unit')
  final int? unit;
  @override
  @JsonKey(name: 'UnitText')
  final String? unitText;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'TypeText')
  final String? typeText;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'EmployeeApprovedTP')
  final String? employeeApprovedTp;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  final String? isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedTP')
  final bool? isApprovedTp;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime? dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime? dateEnd;
  @override
  @JsonKey(name: 'DecilineApprove')
  final int? decilineApprove;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'IsProblem')
  final bool? isProblem;
  @override
  @JsonKey(name: 'TimeRegister')
  final double? timeRegister;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;

  @override
  String toString() {
    return 'PersonalEarlyLateItem(id: $id, isApproved: $isApproved, isApprovedText: $isApprovedText, employeeEarlyLate: $employeeEarlyLate, employeeApprovedHr: $employeeApprovedHr, dateRegister: $dateRegister, unit: $unit, unitText: $unitText, type: $type, typeText: $typeText, reason: $reason, employeeApprovedTp: $employeeApprovedTp, isApprovedTpText: $isApprovedTpText, isApprovedTp: $isApprovedTp, dateStart: $dateStart, dateEnd: $dateEnd, decilineApprove: $decilineApprove, statusTbp: $statusTbp, statusHr: $statusHr, reasonDeciline: $reasonDeciline, isProblem: $isProblem, timeRegister: $timeRegister, statusTbpText: $statusTbpText, statusHrText: $statusHrText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalEarlyLateItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.employeeEarlyLate, employeeEarlyLate) ||
                other.employeeEarlyLate == employeeEarlyLate) &&
            (identical(other.employeeApprovedHr, employeeApprovedHr) ||
                other.employeeApprovedHr == employeeApprovedHr) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitText, unitText) ||
                other.unitText == unitText) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.employeeApprovedTp, employeeApprovedTp) ||
                other.employeeApprovedTp == employeeApprovedTp) &&
            (identical(other.isApprovedTpText, isApprovedTpText) ||
                other.isApprovedTpText == isApprovedTpText) &&
            (identical(other.isApprovedTp, isApprovedTp) ||
                other.isApprovedTp == isApprovedTp) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.decilineApprove, decilineApprove) ||
                other.decilineApprove == decilineApprove) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            (identical(other.timeRegister, timeRegister) ||
                other.timeRegister == timeRegister) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isApproved,
        isApprovedText,
        employeeEarlyLate,
        employeeApprovedHr,
        dateRegister,
        unit,
        unitText,
        type,
        typeText,
        reason,
        employeeApprovedTp,
        isApprovedTpText,
        isApprovedTp,
        dateStart,
        dateEnd,
        decilineApprove,
        statusTbp,
        statusHr,
        reasonDeciline,
        isProblem,
        timeRegister,
        statusTbpText,
        statusHrText
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalEarlyLateItemImplCopyWith<_$PersonalEarlyLateItemImpl>
      get copyWith => __$$PersonalEarlyLateItemImplCopyWithImpl<
          _$PersonalEarlyLateItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalEarlyLateItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalEarlyLateItem implements PersonalEarlyLateItem {
  const factory _PersonalEarlyLateItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
          @JsonKey(name: 'EmployeeEarlyLate') final String? employeeEarlyLate,
          @JsonKey(name: 'EmployeeApprovedHR') final String? employeeApprovedHr,
          @JsonKey(name: 'DateRegister') final DateTime? dateRegister,
          @JsonKey(name: 'Unit') final int? unit,
          @JsonKey(name: 'UnitText') final String? unitText,
          @JsonKey(name: 'Type') final int? type,
          @JsonKey(name: 'TypeText') final String? typeText,
          @JsonKey(name: 'Reason') final String? reason,
          @JsonKey(name: 'EmployeeApprovedTP') final String? employeeApprovedTp,
          @JsonKey(name: 'IsApprovedTPText') final String? isApprovedTpText,
          @JsonKey(name: 'IsApprovedTP') final bool? isApprovedTp,
          @JsonKey(name: 'DateStart') final DateTime? dateStart,
          @JsonKey(name: 'DateEnd') final DateTime? dateEnd,
          @JsonKey(name: 'DecilineApprove') final int? decilineApprove,
          @JsonKey(name: 'StatusTBP') final int? statusTbp,
          @JsonKey(name: 'StatusHR') final int? statusHr,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'IsProblem') final bool? isProblem,
          @JsonKey(name: 'TimeRegister') final double? timeRegister,
          @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
          @JsonKey(name: 'StatusHRText') final String? statusHrText}) =
      _$PersonalEarlyLateItemImpl;

  factory _PersonalEarlyLateItem.fromJson(Map<String, dynamic> json) =
      _$PersonalEarlyLateItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'EmployeeEarlyLate')
  String? get employeeEarlyLate;
  @override
  @JsonKey(name: 'EmployeeApprovedHR')
  String? get employeeApprovedHr;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister;
  @override
  @JsonKey(name: 'Unit')
  int? get unit;
  @override
  @JsonKey(name: 'UnitText')
  String? get unitText;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'TypeText')
  String? get typeText;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'EmployeeApprovedTP')
  String? get employeeApprovedTp;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp;
  @override
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd;
  @override
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'IsProblem')
  bool? get isProblem;
  @override
  @JsonKey(name: 'TimeRegister')
  double? get timeRegister;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(ignore: true)
  _$$PersonalEarlyLateItemImplCopyWith<_$PersonalEarlyLateItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalOverTimeItem _$PersonalOverTimeItemFromJson(Map<String, dynamic> json) {
  return _PersonalOverTimeItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalOverTimeItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeFullName')
  String? get employeeFullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBP')
  String? get approvedTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeID')
  int? get typeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeStart')
  DateTime? get timeStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndTime')
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeReality')
  double? get timeReality => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  int? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationText')
  String? get locationText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostOvernight')
  double? get costOvernight => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'Overnight')
  bool? get overnight => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProblem')
  bool? get isProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalOverTimeItemCopyWith<PersonalOverTimeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalOverTimeItemCopyWith<$Res> {
  factory $PersonalOverTimeItemCopyWith(PersonalOverTimeItem value,
          $Res Function(PersonalOverTimeItem) then) =
      _$PersonalOverTimeItemCopyWithImpl<$Res, PersonalOverTimeItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'EmployeeFullName') String? employeeFullName,
      @JsonKey(name: 'ApprovedTBP') String? approvedTbp,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'TypeID') int? typeId,
      @JsonKey(name: 'TimeStart') DateTime? timeStart,
      @JsonKey(name: 'EndTime') DateTime? endTime,
      @JsonKey(name: 'TimeReality') double? timeReality,
      @JsonKey(name: 'TotalTime') double? totalTime,
      @JsonKey(name: 'Location') int? location,
      @JsonKey(name: 'LocationText') String? locationText,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'CostOvernight') double? costOvernight,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'Overnight') bool? overnight,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ApprovedID') int? approvedId});
}

/// @nodoc
class _$PersonalOverTimeItemCopyWithImpl<$Res,
        $Val extends PersonalOverTimeItem>
    implements $PersonalOverTimeItemCopyWith<$Res> {
  _$PersonalOverTimeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? employeeFullName = freezed,
    Object? approvedTbp = freezed,
    Object? approvedHr = freezed,
    Object? dateRegister = freezed,
    Object? typeId = freezed,
    Object? timeStart = freezed,
    Object? endTime = freezed,
    Object? timeReality = freezed,
    Object? totalTime = freezed,
    Object? location = freezed,
    Object? locationText = freezed,
    Object? typeName = freezed,
    Object? note = freezed,
    Object? isApprovedText = freezed,
    Object? reason = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? costOvernight = freezed,
    Object? projectName = freezed,
    Object? reasonDeciline = freezed,
    Object? overnight = freezed,
    Object? isProblem = freezed,
    Object? fileName = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
    Object? projectId = freezed,
    Object? approvedId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      employeeFullName: freezed == employeeFullName
          ? _value.employeeFullName
          : employeeFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTbp: freezed == approvedTbp
          ? _value.approvedTbp
          : approvedTbp // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeReality: freezed == timeReality
          ? _value.timeReality
          : timeReality // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      locationText: freezed == locationText
          ? _value.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      costOvernight: freezed == costOvernight
          ? _value.costOvernight
          : costOvernight // ignore: cast_nullable_to_non_nullable
              as double?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      overnight: freezed == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalOverTimeItemImplCopyWith<$Res>
    implements $PersonalOverTimeItemCopyWith<$Res> {
  factory _$$PersonalOverTimeItemImplCopyWith(_$PersonalOverTimeItemImpl value,
          $Res Function(_$PersonalOverTimeItemImpl) then) =
      __$$PersonalOverTimeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'EmployeeFullName') String? employeeFullName,
      @JsonKey(name: 'ApprovedTBP') String? approvedTbp,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'TypeID') int? typeId,
      @JsonKey(name: 'TimeStart') DateTime? timeStart,
      @JsonKey(name: 'EndTime') DateTime? endTime,
      @JsonKey(name: 'TimeReality') double? timeReality,
      @JsonKey(name: 'TotalTime') double? totalTime,
      @JsonKey(name: 'Location') int? location,
      @JsonKey(name: 'LocationText') String? locationText,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'CostOvernight') double? costOvernight,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'Overnight') bool? overnight,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ApprovedID') int? approvedId});
}

/// @nodoc
class __$$PersonalOverTimeItemImplCopyWithImpl<$Res>
    extends _$PersonalOverTimeItemCopyWithImpl<$Res, _$PersonalOverTimeItemImpl>
    implements _$$PersonalOverTimeItemImplCopyWith<$Res> {
  __$$PersonalOverTimeItemImplCopyWithImpl(_$PersonalOverTimeItemImpl _value,
      $Res Function(_$PersonalOverTimeItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? employeeFullName = freezed,
    Object? approvedTbp = freezed,
    Object? approvedHr = freezed,
    Object? dateRegister = freezed,
    Object? typeId = freezed,
    Object? timeStart = freezed,
    Object? endTime = freezed,
    Object? timeReality = freezed,
    Object? totalTime = freezed,
    Object? location = freezed,
    Object? locationText = freezed,
    Object? typeName = freezed,
    Object? note = freezed,
    Object? isApprovedText = freezed,
    Object? reason = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? costOvernight = freezed,
    Object? projectName = freezed,
    Object? reasonDeciline = freezed,
    Object? overnight = freezed,
    Object? isProblem = freezed,
    Object? fileName = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
    Object? projectId = freezed,
    Object? approvedId = freezed,
  }) {
    return _then(_$PersonalOverTimeItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      employeeFullName: freezed == employeeFullName
          ? _value.employeeFullName
          : employeeFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTbp: freezed == approvedTbp
          ? _value.approvedTbp
          : approvedTbp // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeId: freezed == typeId
          ? _value.typeId
          : typeId // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeReality: freezed == timeReality
          ? _value.timeReality
          : timeReality // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
      locationText: freezed == locationText
          ? _value.locationText
          : locationText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      costOvernight: freezed == costOvernight
          ? _value.costOvernight
          : costOvernight // ignore: cast_nullable_to_non_nullable
              as double?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      overnight: freezed == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalOverTimeItemImpl implements _PersonalOverTimeItem {
  const _$PersonalOverTimeItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHr,
      @JsonKey(name: 'EmployeeFullName') this.employeeFullName,
      @JsonKey(name: 'ApprovedTBP') this.approvedTbp,
      @JsonKey(name: 'ApprovedHR') this.approvedHr,
      @JsonKey(name: 'DateRegister') this.dateRegister,
      @JsonKey(name: 'TypeID') this.typeId,
      @JsonKey(name: 'TimeStart') this.timeStart,
      @JsonKey(name: 'EndTime') this.endTime,
      @JsonKey(name: 'TimeReality') this.timeReality,
      @JsonKey(name: 'TotalTime') this.totalTime,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'LocationText') this.locationText,
      @JsonKey(name: 'TypeName') this.typeName,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'CostOvernight') this.costOvernight,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'Overnight') this.overnight,
      @JsonKey(name: 'IsProblem') this.isProblem,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'ApprovedID') this.approvedId});

  factory _$PersonalOverTimeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalOverTimeItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHr;
  @override
  @JsonKey(name: 'EmployeeFullName')
  final String? employeeFullName;
  @override
  @JsonKey(name: 'ApprovedTBP')
  final String? approvedTbp;
  @override
  @JsonKey(name: 'ApprovedHR')
  final String? approvedHr;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime? dateRegister;
  @override
  @JsonKey(name: 'TypeID')
  final int? typeId;
  @override
  @JsonKey(name: 'TimeStart')
  final DateTime? timeStart;
  @override
  @JsonKey(name: 'EndTime')
  final DateTime? endTime;
  @override
  @JsonKey(name: 'TimeReality')
  final double? timeReality;
  @override
  @JsonKey(name: 'TotalTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'Location')
  final int? location;
  @override
  @JsonKey(name: 'LocationText')
  final String? locationText;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'CostOvernight')
  final double? costOvernight;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'Overnight')
  final bool? overnight;
  @override
  @JsonKey(name: 'IsProblem')
  final bool? isProblem;
  @override
  @JsonKey(name: 'FileName')
  final String? fileName;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;

  @override
  String toString() {
    return 'PersonalOverTimeItem(id: $id, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, employeeFullName: $employeeFullName, approvedTbp: $approvedTbp, approvedHr: $approvedHr, dateRegister: $dateRegister, typeId: $typeId, timeStart: $timeStart, endTime: $endTime, timeReality: $timeReality, totalTime: $totalTime, location: $location, locationText: $locationText, typeName: $typeName, note: $note, isApprovedText: $isApprovedText, reason: $reason, statusHr: $statusHr, statusTbp: $statusTbp, costOvernight: $costOvernight, projectName: $projectName, reasonDeciline: $reasonDeciline, overnight: $overnight, isProblem: $isProblem, fileName: $fileName, statusTbpText: $statusTbpText, statusHrText: $statusHrText, projectId: $projectId, approvedId: $approvedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalOverTimeItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApprovedTbp, isApprovedTbp) ||
                other.isApprovedTbp == isApprovedTbp) &&
            (identical(other.isApprovedHr, isApprovedHr) ||
                other.isApprovedHr == isApprovedHr) &&
            (identical(other.employeeFullName, employeeFullName) ||
                other.employeeFullName == employeeFullName) &&
            (identical(other.approvedTbp, approvedTbp) ||
                other.approvedTbp == approvedTbp) &&
            (identical(other.approvedHr, approvedHr) ||
                other.approvedHr == approvedHr) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.timeReality, timeReality) ||
                other.timeReality == timeReality) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.costOvernight, costOvernight) ||
                other.costOvernight == costOvernight) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.overnight, overnight) ||
                other.overnight == overnight) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isApprovedTbp,
        isApprovedHr,
        employeeFullName,
        approvedTbp,
        approvedHr,
        dateRegister,
        typeId,
        timeStart,
        endTime,
        timeReality,
        totalTime,
        location,
        locationText,
        typeName,
        note,
        isApprovedText,
        reason,
        statusHr,
        statusTbp,
        costOvernight,
        projectName,
        reasonDeciline,
        overnight,
        isProblem,
        fileName,
        statusTbpText,
        statusHrText,
        projectId,
        approvedId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalOverTimeItemImplCopyWith<_$PersonalOverTimeItemImpl>
      get copyWith =>
          __$$PersonalOverTimeItemImplCopyWithImpl<_$PersonalOverTimeItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalOverTimeItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalOverTimeItem implements PersonalOverTimeItem {
  const factory _PersonalOverTimeItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTbp,
          @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHr,
          @JsonKey(name: 'EmployeeFullName') final String? employeeFullName,
          @JsonKey(name: 'ApprovedTBP') final String? approvedTbp,
          @JsonKey(name: 'ApprovedHR') final String? approvedHr,
          @JsonKey(name: 'DateRegister') final DateTime? dateRegister,
          @JsonKey(name: 'TypeID') final int? typeId,
          @JsonKey(name: 'TimeStart') final DateTime? timeStart,
          @JsonKey(name: 'EndTime') final DateTime? endTime,
          @JsonKey(name: 'TimeReality') final double? timeReality,
          @JsonKey(name: 'TotalTime') final double? totalTime,
          @JsonKey(name: 'Location') final int? location,
          @JsonKey(name: 'LocationText') final String? locationText,
          @JsonKey(name: 'TypeName') final String? typeName,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
          @JsonKey(name: 'Reason') final String? reason,
          @JsonKey(name: 'StatusHR') final int? statusHr,
          @JsonKey(name: 'StatusTBP') final int? statusTbp,
          @JsonKey(name: 'CostOvernight') final double? costOvernight,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'Overnight') final bool? overnight,
          @JsonKey(name: 'IsProblem') final bool? isProblem,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
          @JsonKey(name: 'StatusHRText') final String? statusHrText,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'ApprovedID') final int? approvedId}) =
      _$PersonalOverTimeItemImpl;

  factory _PersonalOverTimeItem.fromJson(Map<String, dynamic> json) =
      _$PersonalOverTimeItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr;
  @override
  @JsonKey(name: 'EmployeeFullName')
  String? get employeeFullName;
  @override
  @JsonKey(name: 'ApprovedTBP')
  String? get approvedTbp;
  @override
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister;
  @override
  @JsonKey(name: 'TypeID')
  int? get typeId;
  @override
  @JsonKey(name: 'TimeStart')
  DateTime? get timeStart;
  @override
  @JsonKey(name: 'EndTime')
  DateTime? get endTime;
  @override
  @JsonKey(name: 'TimeReality')
  double? get timeReality;
  @override
  @JsonKey(name: 'TotalTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'Location')
  int? get location;
  @override
  @JsonKey(name: 'LocationText')
  String? get locationText;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'CostOvernight')
  double? get costOvernight;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'Overnight')
  bool? get overnight;
  @override
  @JsonKey(name: 'IsProblem')
  bool? get isProblem;
  @override
  @JsonKey(name: 'FileName')
  String? get fileName;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(ignore: true)
  _$$PersonalOverTimeItemImplCopyWith<_$PersonalOverTimeItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalBussinessItem _$PersonalBussinessItemFromJson(
    Map<String, dynamic> json) {
  return _PersonalBussinessItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalBussinessItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedName')
  String? get approvedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayBussiness')
  DateTime? get dayBussiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeBusiness')
  int? get typeBusiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostType')
  double? get costType => throw _privateConstructorUsedError;
  @JsonKey(name: 'VehicleID')
  int? get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'VehicleName')
  String? get vehicleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'NotChekIn')
  bool? get notChekIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'NotChekInText')
  String? get notChekInText => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkEarlyText')
  String? get workEarlyText => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostWorkEarly')
  double? get costWorkEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostOvernight')
  double? get costOvernight => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApproveText')
  String? get decilineApproveText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostVehicle')
  double? get costVehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalMoney')
  double? get totalMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Overnight')
  bool? get overnight => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProblem')
  bool? get isProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectText')
  String? get projectText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalBussinessItemCopyWith<PersonalBussinessItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalBussinessItemCopyWith<$Res> {
  factory $PersonalBussinessItemCopyWith(PersonalBussinessItem value,
          $Res Function(PersonalBussinessItem) then) =
      _$PersonalBussinessItemCopyWithImpl<$Res, PersonalBussinessItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DayBussiness') DateTime? dayBussiness,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'TypeBusiness') int? typeBusiness,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'CostType') double? costType,
      @JsonKey(name: 'VehicleID') int? vehicleId,
      @JsonKey(name: 'VehicleName') String? vehicleName,
      @JsonKey(name: 'NotChekIn') bool? notChekIn,
      @JsonKey(name: 'NotChekInText') String? notChekInText,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'WorkEarlyText') String? workEarlyText,
      @JsonKey(name: 'CostWorkEarly') double? costWorkEarly,
      @JsonKey(name: 'CostOvernight') double? costOvernight,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'DecilineApproveText') String? decilineApproveText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'CostVehicle') double? costVehicle,
      @JsonKey(name: 'TotalMoney') double? totalMoney,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'Overnight') bool? overnight,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class _$PersonalBussinessItemCopyWithImpl<$Res,
        $Val extends PersonalBussinessItem>
    implements $PersonalBussinessItemCopyWith<$Res> {
  _$PersonalBussinessItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedText = freezed,
    Object? employeeName = freezed,
    Object? approvedName = freezed,
    Object? approvedHr = freezed,
    Object? dayBussiness = freezed,
    Object? location = freezed,
    Object? typeBusiness = freezed,
    Object? typeName = freezed,
    Object? costType = freezed,
    Object? vehicleId = freezed,
    Object? vehicleName = freezed,
    Object? notChekIn = freezed,
    Object? notChekInText = freezed,
    Object? note = freezed,
    Object? workEarlyText = freezed,
    Object? costWorkEarly = freezed,
    Object? costOvernight = freezed,
    Object? decilineApprove = freezed,
    Object? decilineApproveText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? costVehicle = freezed,
    Object? totalMoney = freezed,
    Object? reasonDeciline = freezed,
    Object? createdDate = freezed,
    Object? overnight = freezed,
    Object? isProblem = freezed,
    Object? reason = freezed,
    Object? employeeId = freezed,
    Object? approvedId = freezed,
    Object? projectId = freezed,
    Object? projectText = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dayBussiness: freezed == dayBussiness
          ? _value.dayBussiness
          : dayBussiness // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeBusiness: freezed == typeBusiness
          ? _value.typeBusiness
          : typeBusiness // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      costType: freezed == costType
          ? _value.costType
          : costType // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleName: freezed == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String?,
      notChekIn: freezed == notChekIn
          ? _value.notChekIn
          : notChekIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      notChekInText: freezed == notChekInText
          ? _value.notChekInText
          : notChekInText // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      workEarlyText: freezed == workEarlyText
          ? _value.workEarlyText
          : workEarlyText // ignore: cast_nullable_to_non_nullable
              as String?,
      costWorkEarly: freezed == costWorkEarly
          ? _value.costWorkEarly
          : costWorkEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      costOvernight: freezed == costOvernight
          ? _value.costOvernight
          : costOvernight // ignore: cast_nullable_to_non_nullable
              as double?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      decilineApproveText: freezed == decilineApproveText
          ? _value.decilineApproveText
          : decilineApproveText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      costVehicle: freezed == costVehicle
          ? _value.costVehicle
          : costVehicle // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMoney: freezed == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overnight: freezed == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalBussinessItemImplCopyWith<$Res>
    implements $PersonalBussinessItemCopyWith<$Res> {
  factory _$$PersonalBussinessItemImplCopyWith(
          _$PersonalBussinessItemImpl value,
          $Res Function(_$PersonalBussinessItemImpl) then) =
      __$$PersonalBussinessItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DayBussiness') DateTime? dayBussiness,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'TypeBusiness') int? typeBusiness,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'CostType') double? costType,
      @JsonKey(name: 'VehicleID') int? vehicleId,
      @JsonKey(name: 'VehicleName') String? vehicleName,
      @JsonKey(name: 'NotChekIn') bool? notChekIn,
      @JsonKey(name: 'NotChekInText') String? notChekInText,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'WorkEarlyText') String? workEarlyText,
      @JsonKey(name: 'CostWorkEarly') double? costWorkEarly,
      @JsonKey(name: 'CostOvernight') double? costOvernight,
      @JsonKey(name: 'DecilineApprove') int? decilineApprove,
      @JsonKey(name: 'DecilineApproveText') String? decilineApproveText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'CostVehicle') double? costVehicle,
      @JsonKey(name: 'TotalMoney') double? totalMoney,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'Overnight') bool? overnight,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class __$$PersonalBussinessItemImplCopyWithImpl<$Res>
    extends _$PersonalBussinessItemCopyWithImpl<$Res,
        _$PersonalBussinessItemImpl>
    implements _$$PersonalBussinessItemImplCopyWith<$Res> {
  __$$PersonalBussinessItemImplCopyWithImpl(_$PersonalBussinessItemImpl _value,
      $Res Function(_$PersonalBussinessItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedText = freezed,
    Object? employeeName = freezed,
    Object? approvedName = freezed,
    Object? approvedHr = freezed,
    Object? dayBussiness = freezed,
    Object? location = freezed,
    Object? typeBusiness = freezed,
    Object? typeName = freezed,
    Object? costType = freezed,
    Object? vehicleId = freezed,
    Object? vehicleName = freezed,
    Object? notChekIn = freezed,
    Object? notChekInText = freezed,
    Object? note = freezed,
    Object? workEarlyText = freezed,
    Object? costWorkEarly = freezed,
    Object? costOvernight = freezed,
    Object? decilineApprove = freezed,
    Object? decilineApproveText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? costVehicle = freezed,
    Object? totalMoney = freezed,
    Object? reasonDeciline = freezed,
    Object? createdDate = freezed,
    Object? overnight = freezed,
    Object? isProblem = freezed,
    Object? reason = freezed,
    Object? employeeId = freezed,
    Object? approvedId = freezed,
    Object? projectId = freezed,
    Object? projectText = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_$PersonalBussinessItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dayBussiness: freezed == dayBussiness
          ? _value.dayBussiness
          : dayBussiness // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      typeBusiness: freezed == typeBusiness
          ? _value.typeBusiness
          : typeBusiness // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      costType: freezed == costType
          ? _value.costType
          : costType // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleName: freezed == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String?,
      notChekIn: freezed == notChekIn
          ? _value.notChekIn
          : notChekIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      notChekInText: freezed == notChekInText
          ? _value.notChekInText
          : notChekInText // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      workEarlyText: freezed == workEarlyText
          ? _value.workEarlyText
          : workEarlyText // ignore: cast_nullable_to_non_nullable
              as String?,
      costWorkEarly: freezed == costWorkEarly
          ? _value.costWorkEarly
          : costWorkEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      costOvernight: freezed == costOvernight
          ? _value.costOvernight
          : costOvernight // ignore: cast_nullable_to_non_nullable
              as double?,
      decilineApprove: freezed == decilineApprove
          ? _value.decilineApprove
          : decilineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      decilineApproveText: freezed == decilineApproveText
          ? _value.decilineApproveText
          : decilineApproveText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      costVehicle: freezed == costVehicle
          ? _value.costVehicle
          : costVehicle // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMoney: freezed == totalMoney
          ? _value.totalMoney
          : totalMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      overnight: freezed == overnight
          ? _value.overnight
          : overnight // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalBussinessItemImpl implements _PersonalBussinessItem {
  const _$PersonalBussinessItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHr,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'ApprovedName') this.approvedName,
      @JsonKey(name: 'ApprovedHR') this.approvedHr,
      @JsonKey(name: 'DayBussiness') this.dayBussiness,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'TypeBusiness') this.typeBusiness,
      @JsonKey(name: 'TypeName') this.typeName,
      @JsonKey(name: 'CostType') this.costType,
      @JsonKey(name: 'VehicleID') this.vehicleId,
      @JsonKey(name: 'VehicleName') this.vehicleName,
      @JsonKey(name: 'NotChekIn') this.notChekIn,
      @JsonKey(name: 'NotChekInText') this.notChekInText,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'WorkEarlyText') this.workEarlyText,
      @JsonKey(name: 'CostWorkEarly') this.costWorkEarly,
      @JsonKey(name: 'CostOvernight') this.costOvernight,
      @JsonKey(name: 'DecilineApprove') this.decilineApprove,
      @JsonKey(name: 'DecilineApproveText') this.decilineApproveText,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'CostVehicle') this.costVehicle,
      @JsonKey(name: 'TotalMoney') this.totalMoney,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'Overnight') this.overnight,
      @JsonKey(name: 'IsProblem') this.isProblem,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'ApprovedID') this.approvedId,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'ProjectText') this.projectText,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText});

  factory _$PersonalBussinessItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalBussinessItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  final bool? isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final bool? isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'ApprovedName')
  final String? approvedName;
  @override
  @JsonKey(name: 'ApprovedHR')
  final String? approvedHr;
  @override
  @JsonKey(name: 'DayBussiness')
  final DateTime? dayBussiness;
  @override
  @JsonKey(name: 'Location')
  final String? location;
  @override
  @JsonKey(name: 'TypeBusiness')
  final int? typeBusiness;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;
  @override
  @JsonKey(name: 'CostType')
  final double? costType;
  @override
  @JsonKey(name: 'VehicleID')
  final int? vehicleId;
  @override
  @JsonKey(name: 'VehicleName')
  final String? vehicleName;
  @override
  @JsonKey(name: 'NotChekIn')
  final bool? notChekIn;
  @override
  @JsonKey(name: 'NotChekInText')
  final String? notChekInText;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'WorkEarlyText')
  final String? workEarlyText;
  @override
  @JsonKey(name: 'CostWorkEarly')
  final double? costWorkEarly;
  @override
  @JsonKey(name: 'CostOvernight')
  final double? costOvernight;
  @override
  @JsonKey(name: 'DecilineApprove')
  final int? decilineApprove;
  @override
  @JsonKey(name: 'DecilineApproveText')
  final String? decilineApproveText;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'CostVehicle')
  final double? costVehicle;
  @override
  @JsonKey(name: 'TotalMoney')
  final double? totalMoney;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'Overnight')
  final bool? overnight;
  @override
  @JsonKey(name: 'IsProblem')
  final bool? isProblem;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'ProjectText')
  final String? projectText;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;

  @override
  String toString() {
    return 'PersonalBussinessItem(id: $id, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, isApprovedText: $isApprovedText, employeeName: $employeeName, approvedName: $approvedName, approvedHr: $approvedHr, dayBussiness: $dayBussiness, location: $location, typeBusiness: $typeBusiness, typeName: $typeName, costType: $costType, vehicleId: $vehicleId, vehicleName: $vehicleName, notChekIn: $notChekIn, notChekInText: $notChekInText, note: $note, workEarlyText: $workEarlyText, costWorkEarly: $costWorkEarly, costOvernight: $costOvernight, decilineApprove: $decilineApprove, decilineApproveText: $decilineApproveText, statusHr: $statusHr, statusTbp: $statusTbp, costVehicle: $costVehicle, totalMoney: $totalMoney, reasonDeciline: $reasonDeciline, createdDate: $createdDate, overnight: $overnight, isProblem: $isProblem, reason: $reason, employeeId: $employeeId, approvedId: $approvedId, projectId: $projectId, projectText: $projectText, statusTbpText: $statusTbpText, statusHrText: $statusHrText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalBussinessItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApprovedTbp, isApprovedTbp) ||
                other.isApprovedTbp == isApprovedTbp) &&
            (identical(other.isApprovedHr, isApprovedHr) ||
                other.isApprovedHr == isApprovedHr) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.approvedName, approvedName) ||
                other.approvedName == approvedName) &&
            (identical(other.approvedHr, approvedHr) ||
                other.approvedHr == approvedHr) &&
            (identical(other.dayBussiness, dayBussiness) ||
                other.dayBussiness == dayBussiness) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.typeBusiness, typeBusiness) ||
                other.typeBusiness == typeBusiness) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.costType, costType) ||
                other.costType == costType) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.notChekIn, notChekIn) ||
                other.notChekIn == notChekIn) &&
            (identical(other.notChekInText, notChekInText) ||
                other.notChekInText == notChekInText) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.workEarlyText, workEarlyText) ||
                other.workEarlyText == workEarlyText) &&
            (identical(other.costWorkEarly, costWorkEarly) ||
                other.costWorkEarly == costWorkEarly) &&
            (identical(other.costOvernight, costOvernight) ||
                other.costOvernight == costOvernight) &&
            (identical(other.decilineApprove, decilineApprove) ||
                other.decilineApprove == decilineApprove) &&
            (identical(other.decilineApproveText, decilineApproveText) ||
                other.decilineApproveText == decilineApproveText) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.costVehicle, costVehicle) ||
                other.costVehicle == costVehicle) &&
            (identical(other.totalMoney, totalMoney) ||
                other.totalMoney == totalMoney) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.overnight, overnight) ||
                other.overnight == overnight) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectText, projectText) ||
                other.projectText == projectText) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isApprovedTbp,
        isApprovedHr,
        isApprovedText,
        employeeName,
        approvedName,
        approvedHr,
        dayBussiness,
        location,
        typeBusiness,
        typeName,
        costType,
        vehicleId,
        vehicleName,
        notChekIn,
        notChekInText,
        note,
        workEarlyText,
        costWorkEarly,
        costOvernight,
        decilineApprove,
        decilineApproveText,
        statusHr,
        statusTbp,
        costVehicle,
        totalMoney,
        reasonDeciline,
        createdDate,
        overnight,
        isProblem,
        reason,
        employeeId,
        approvedId,
        projectId,
        projectText,
        statusTbpText,
        statusHrText
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalBussinessItemImplCopyWith<_$PersonalBussinessItemImpl>
      get copyWith => __$$PersonalBussinessItemImplCopyWithImpl<
          _$PersonalBussinessItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalBussinessItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalBussinessItem implements PersonalBussinessItem {
  const factory _PersonalBussinessItem(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'IsApprovedTBP') final bool? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') final bool? isApprovedHr,
      @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
      @JsonKey(name: 'EmployeeName') final String? employeeName,
      @JsonKey(name: 'ApprovedName') final String? approvedName,
      @JsonKey(name: 'ApprovedHR') final String? approvedHr,
      @JsonKey(name: 'DayBussiness') final DateTime? dayBussiness,
      @JsonKey(name: 'Location') final String? location,
      @JsonKey(name: 'TypeBusiness') final int? typeBusiness,
      @JsonKey(name: 'TypeName') final String? typeName,
      @JsonKey(name: 'CostType') final double? costType,
      @JsonKey(name: 'VehicleID') final int? vehicleId,
      @JsonKey(name: 'VehicleName') final String? vehicleName,
      @JsonKey(name: 'NotChekIn') final bool? notChekIn,
      @JsonKey(name: 'NotChekInText') final String? notChekInText,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'WorkEarlyText') final String? workEarlyText,
      @JsonKey(name: 'CostWorkEarly') final double? costWorkEarly,
      @JsonKey(name: 'CostOvernight') final double? costOvernight,
      @JsonKey(name: 'DecilineApprove') final int? decilineApprove,
      @JsonKey(name: 'DecilineApproveText') final String? decilineApproveText,
      @JsonKey(name: 'StatusHR') final int? statusHr,
      @JsonKey(name: 'StatusTBP') final int? statusTbp,
      @JsonKey(name: 'CostVehicle') final double? costVehicle,
      @JsonKey(name: 'TotalMoney') final double? totalMoney,
      @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'Overnight') final bool? overnight,
      @JsonKey(name: 'IsProblem') final bool? isProblem,
      @JsonKey(name: 'Reason') final String? reason,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'ApprovedID') final int? approvedId,
      @JsonKey(name: 'ProjectID') final int? projectId,
      @JsonKey(name: 'ProjectText') final String? projectText,
      @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
      @JsonKey(name: 'StatusHRText')
      final String? statusHrText}) = _$PersonalBussinessItemImpl;

  factory _PersonalBussinessItem.fromJson(Map<String, dynamic> json) =
      _$PersonalBussinessItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApprovedTBP')
  bool? get isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  bool? get isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'ApprovedName')
  String? get approvedName;
  @override
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr;
  @override
  @JsonKey(name: 'DayBussiness')
  DateTime? get dayBussiness;
  @override
  @JsonKey(name: 'Location')
  String? get location;
  @override
  @JsonKey(name: 'TypeBusiness')
  int? get typeBusiness;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;
  @override
  @JsonKey(name: 'CostType')
  double? get costType;
  @override
  @JsonKey(name: 'VehicleID')
  int? get vehicleId;
  @override
  @JsonKey(name: 'VehicleName')
  String? get vehicleName;
  @override
  @JsonKey(name: 'NotChekIn')
  bool? get notChekIn;
  @override
  @JsonKey(name: 'NotChekInText')
  String? get notChekInText;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'WorkEarlyText')
  String? get workEarlyText;
  @override
  @JsonKey(name: 'CostWorkEarly')
  double? get costWorkEarly;
  @override
  @JsonKey(name: 'CostOvernight')
  double? get costOvernight;
  @override
  @JsonKey(name: 'DecilineApprove')
  int? get decilineApprove;
  @override
  @JsonKey(name: 'DecilineApproveText')
  String? get decilineApproveText;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'CostVehicle')
  double? get costVehicle;
  @override
  @JsonKey(name: 'TotalMoney')
  double? get totalMoney;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'Overnight')
  bool? get overnight;
  @override
  @JsonKey(name: 'IsProblem')
  bool? get isProblem;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'ProjectText')
  String? get projectText;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(ignore: true)
  _$$PersonalBussinessItemImplCopyWith<_$PersonalBussinessItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalWfhItem _$PersonalWfhItemFromJson(Map<String, dynamic> json) {
  return _PersonalWfhItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalWfhItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApproved')
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedName')
  String? get approvedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateWFH')
  DateTime? get dateWfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeWFH')
  int? get timeWfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeWFHText')
  String? get timeWfhText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentWork')
  String? get contentWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalWfhItemCopyWith<PersonalWfhItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalWfhItemCopyWith<$Res> {
  factory $PersonalWfhItemCopyWith(
          PersonalWfhItem value, $Res Function(PersonalWfhItem) then) =
      _$PersonalWfhItemCopyWithImpl<$Res, PersonalWfhItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DateWFH') DateTime? dateWfh,
      @JsonKey(name: 'TimeWFH') int? timeWfh,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'TimeWFHText') String? timeWfhText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'ContentWork') String? contentWork,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class _$PersonalWfhItemCopyWithImpl<$Res, $Val extends PersonalWfhItem>
    implements $PersonalWfhItemCopyWith<$Res> {
  _$PersonalWfhItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApproved = freezed,
    Object? employeeName = freezed,
    Object? approvedName = freezed,
    Object? approvedHr = freezed,
    Object? dateWfh = freezed,
    Object? timeWfh = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isApprovedText = freezed,
    Object? timeWfhText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? reasonDeciline = freezed,
    Object? contentWork = freezed,
    Object? createdDate = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWfh: freezed == dateWfh
          ? _value.dateWfh
          : dateWfh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeWfh: freezed == timeWfh
          ? _value.timeWfh
          : timeWfh // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWfhText: freezed == timeWfhText
          ? _value.timeWfhText
          : timeWfhText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      contentWork: freezed == contentWork
          ? _value.contentWork
          : contentWork // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalWfhItemImplCopyWith<$Res>
    implements $PersonalWfhItemCopyWith<$Res> {
  factory _$$PersonalWfhItemImplCopyWith(_$PersonalWfhItemImpl value,
          $Res Function(_$PersonalWfhItemImpl) then) =
      __$$PersonalWfhItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedName') String? approvedName,
      @JsonKey(name: 'ApprovedHR') String? approvedHr,
      @JsonKey(name: 'DateWFH') DateTime? dateWfh,
      @JsonKey(name: 'TimeWFH') int? timeWfh,
      @JsonKey(name: 'Reason') String? reason,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApprovedText') String? isApprovedText,
      @JsonKey(name: 'TimeWFHText') String? timeWfhText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'ContentWork') String? contentWork,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class __$$PersonalWfhItemImplCopyWithImpl<$Res>
    extends _$PersonalWfhItemCopyWithImpl<$Res, _$PersonalWfhItemImpl>
    implements _$$PersonalWfhItemImplCopyWith<$Res> {
  __$$PersonalWfhItemImplCopyWithImpl(
      _$PersonalWfhItemImpl _value, $Res Function(_$PersonalWfhItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApproved = freezed,
    Object? employeeName = freezed,
    Object? approvedName = freezed,
    Object? approvedHr = freezed,
    Object? dateWfh = freezed,
    Object? timeWfh = freezed,
    Object? reason = freezed,
    Object? note = freezed,
    Object? isApprovedText = freezed,
    Object? timeWfhText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? reasonDeciline = freezed,
    Object? contentWork = freezed,
    Object? createdDate = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_$PersonalWfhItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedName: freezed == approvedName
          ? _value.approvedName
          : approvedName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateWfh: freezed == dateWfh
          ? _value.dateWfh
          : dateWfh // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeWfh: freezed == timeWfh
          ? _value.timeWfh
          : timeWfh // ignore: cast_nullable_to_non_nullable
              as int?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedText: freezed == isApprovedText
          ? _value.isApprovedText
          : isApprovedText // ignore: cast_nullable_to_non_nullable
              as String?,
      timeWfhText: freezed == timeWfhText
          ? _value.timeWfhText
          : timeWfhText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      contentWork: freezed == contentWork
          ? _value.contentWork
          : contentWork // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalWfhItemImpl implements _PersonalWfhItem {
  const _$PersonalWfhItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApproved') this.isApproved,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'ApprovedName') this.approvedName,
      @JsonKey(name: 'ApprovedHR') this.approvedHr,
      @JsonKey(name: 'DateWFH') this.dateWfh,
      @JsonKey(name: 'TimeWFH') this.timeWfh,
      @JsonKey(name: 'Reason') this.reason,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsApprovedText') this.isApprovedText,
      @JsonKey(name: 'TimeWFHText') this.timeWfhText,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'ContentWork') this.contentWork,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText});

  factory _$PersonalWfhItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalWfhItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApproved')
  final bool? isApproved;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'ApprovedName')
  final String? approvedName;
  @override
  @JsonKey(name: 'ApprovedHR')
  final String? approvedHr;
  @override
  @JsonKey(name: 'DateWFH')
  final DateTime? dateWfh;
  @override
  @JsonKey(name: 'TimeWFH')
  final int? timeWfh;
  @override
  @JsonKey(name: 'Reason')
  final String? reason;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsApprovedText')
  final String? isApprovedText;
  @override
  @JsonKey(name: 'TimeWFHText')
  final String? timeWfhText;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'ContentWork')
  final String? contentWork;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;

  @override
  String toString() {
    return 'PersonalWfhItem(id: $id, isApproved: $isApproved, employeeName: $employeeName, approvedName: $approvedName, approvedHr: $approvedHr, dateWfh: $dateWfh, timeWfh: $timeWfh, reason: $reason, note: $note, isApprovedText: $isApprovedText, timeWfhText: $timeWfhText, statusHr: $statusHr, statusTbp: $statusTbp, reasonDeciline: $reasonDeciline, contentWork: $contentWork, createdDate: $createdDate, statusTbpText: $statusTbpText, statusHrText: $statusHrText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalWfhItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.approvedName, approvedName) ||
                other.approvedName == approvedName) &&
            (identical(other.approvedHr, approvedHr) ||
                other.approvedHr == approvedHr) &&
            (identical(other.dateWfh, dateWfh) || other.dateWfh == dateWfh) &&
            (identical(other.timeWfh, timeWfh) || other.timeWfh == timeWfh) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isApprovedText, isApprovedText) ||
                other.isApprovedText == isApprovedText) &&
            (identical(other.timeWfhText, timeWfhText) ||
                other.timeWfhText == timeWfhText) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.contentWork, contentWork) ||
                other.contentWork == contentWork) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isApproved,
      employeeName,
      approvedName,
      approvedHr,
      dateWfh,
      timeWfh,
      reason,
      note,
      isApprovedText,
      timeWfhText,
      statusHr,
      statusTbp,
      reasonDeciline,
      contentWork,
      createdDate,
      statusTbpText,
      statusHrText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalWfhItemImplCopyWith<_$PersonalWfhItemImpl> get copyWith =>
      __$$PersonalWfhItemImplCopyWithImpl<_$PersonalWfhItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalWfhItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalWfhItem implements PersonalWfhItem {
  const factory _PersonalWfhItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'ApprovedName') final String? approvedName,
          @JsonKey(name: 'ApprovedHR') final String? approvedHr,
          @JsonKey(name: 'DateWFH') final DateTime? dateWfh,
          @JsonKey(name: 'TimeWFH') final int? timeWfh,
          @JsonKey(name: 'Reason') final String? reason,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsApprovedText') final String? isApprovedText,
          @JsonKey(name: 'TimeWFHText') final String? timeWfhText,
          @JsonKey(name: 'StatusHR') final int? statusHr,
          @JsonKey(name: 'StatusTBP') final int? statusTbp,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'ContentWork') final String? contentWork,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
          @JsonKey(name: 'StatusHRText') final String? statusHrText}) =
      _$PersonalWfhItemImpl;

  factory _PersonalWfhItem.fromJson(Map<String, dynamic> json) =
      _$PersonalWfhItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApproved')
  bool? get isApproved;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'ApprovedName')
  String? get approvedName;
  @override
  @JsonKey(name: 'ApprovedHR')
  String? get approvedHr;
  @override
  @JsonKey(name: 'DateWFH')
  DateTime? get dateWfh;
  @override
  @JsonKey(name: 'TimeWFH')
  int? get timeWfh;
  @override
  @JsonKey(name: 'Reason')
  String? get reason;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsApprovedText')
  String? get isApprovedText;
  @override
  @JsonKey(name: 'TimeWFHText')
  String? get timeWfhText;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'ContentWork')
  String? get contentWork;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(ignore: true)
  _$$PersonalWfhItemImplCopyWith<_$PersonalWfhItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalEnfItem _$PersonalEnfItemFromJson(Map<String, dynamic> json) {
  return _PersonalEnfItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalEnfItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeName')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTPName')
  String? get approvedTpName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHRName')
  String? get approvedHrName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayWork')
  DateTime? get dayWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeText')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHR')
  int? get statusHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalEnfItemCopyWith<PersonalEnfItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalEnfItemCopyWith<$Res> {
  factory $PersonalEnfItemCopyWith(
          PersonalEnfItem value, $Res Function(PersonalEnfItem) then) =
      _$PersonalEnfItemCopyWithImpl<$Res, PersonalEnfItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'ApprovedHR') int? approvedHr,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedTPName') String? approvedTpName,
      @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
      @JsonKey(name: 'DayWork') DateTime? dayWork,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class _$PersonalEnfItemCopyWithImpl<$Res, $Val extends PersonalEnfItem>
    implements $PersonalEnfItemCopyWith<$Res> {
  _$PersonalEnfItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTp = freezed,
    Object? approvedHr = freezed,
    Object? employeeName = freezed,
    Object? approvedTpName = freezed,
    Object? approvedHrName = freezed,
    Object? dayWork = freezed,
    Object? note = freezed,
    Object? type = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? typeText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? reasonDeciline = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTpName: freezed == approvedTpName
          ? _value.approvedTpName
          : approvedTpName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHrName: freezed == approvedHrName
          ? _value.approvedHrName
          : approvedHrName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayWork: freezed == dayWork
          ? _value.dayWork
          : dayWork // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalEnfItemImplCopyWith<$Res>
    implements $PersonalEnfItemCopyWith<$Res> {
  factory _$$PersonalEnfItemImplCopyWith(_$PersonalEnfItemImpl value,
          $Res Function(_$PersonalEnfItemImpl) then) =
      __$$PersonalEnfItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IsApprovedTP') bool? isApprovedTp,
      @JsonKey(name: 'ApprovedHR') int? approvedHr,
      @JsonKey(name: 'EmployeeName') String? employeeName,
      @JsonKey(name: 'ApprovedTPName') String? approvedTpName,
      @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
      @JsonKey(name: 'DayWork') DateTime? dayWork,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'IsApprovedTPText') String? isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'StatusHR') int? statusHr,
      @JsonKey(name: 'StatusTBP') int? statusTbp,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'StatusTBPText') String? statusTbpText,
      @JsonKey(name: 'StatusHRText') String? statusHrText});
}

/// @nodoc
class __$$PersonalEnfItemImplCopyWithImpl<$Res>
    extends _$PersonalEnfItemCopyWithImpl<$Res, _$PersonalEnfItemImpl>
    implements _$$PersonalEnfItemImplCopyWith<$Res> {
  __$$PersonalEnfItemImplCopyWithImpl(
      _$PersonalEnfItemImpl _value, $Res Function(_$PersonalEnfItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isApprovedTp = freezed,
    Object? approvedHr = freezed,
    Object? employeeName = freezed,
    Object? approvedTpName = freezed,
    Object? approvedHrName = freezed,
    Object? dayWork = freezed,
    Object? note = freezed,
    Object? type = freezed,
    Object? isApprovedTpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? typeText = freezed,
    Object? statusHr = freezed,
    Object? statusTbp = freezed,
    Object? reasonDeciline = freezed,
    Object? statusTbpText = freezed,
    Object? statusHrText = freezed,
  }) {
    return _then(_$PersonalEnfItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isApprovedTp: freezed == isApprovedTp
          ? _value.isApprovedTp
          : isApprovedTp // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTpName: freezed == approvedTpName
          ? _value.approvedTpName
          : approvedTpName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHrName: freezed == approvedHrName
          ? _value.approvedHrName
          : approvedHrName // ignore: cast_nullable_to_non_nullable
              as String?,
      dayWork: freezed == dayWork
          ? _value.dayWork
          : dayWork // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTpText: freezed == isApprovedTpText
          ? _value.isApprovedTpText
          : isApprovedTpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHr: freezed == statusHr
          ? _value.statusHr
          : statusHr // ignore: cast_nullable_to_non_nullable
              as int?,
      statusTbp: freezed == statusTbp
          ? _value.statusTbp
          : statusTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      statusTbpText: freezed == statusTbpText
          ? _value.statusTbpText
          : statusTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      statusHrText: freezed == statusHrText
          ? _value.statusHrText
          : statusHrText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalEnfItemImpl implements _PersonalEnfItem {
  const _$PersonalEnfItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IsApprovedTP') this.isApprovedTp,
      @JsonKey(name: 'ApprovedHR') this.approvedHr,
      @JsonKey(name: 'EmployeeName') this.employeeName,
      @JsonKey(name: 'ApprovedTPName') this.approvedTpName,
      @JsonKey(name: 'ApprovedHRName') this.approvedHrName,
      @JsonKey(name: 'DayWork') this.dayWork,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'IsApprovedTPText') this.isApprovedTpText,
      @JsonKey(name: 'IsApprovedHRText') this.isApprovedHrText,
      @JsonKey(name: 'TypeText') this.typeText,
      @JsonKey(name: 'StatusHR') this.statusHr,
      @JsonKey(name: 'StatusTBP') this.statusTbp,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'StatusTBPText') this.statusTbpText,
      @JsonKey(name: 'StatusHRText') this.statusHrText});

  factory _$PersonalEnfItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalEnfItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IsApprovedTP')
  final bool? isApprovedTp;
  @override
  @JsonKey(name: 'ApprovedHR')
  final int? approvedHr;
  @override
  @JsonKey(name: 'EmployeeName')
  final String? employeeName;
  @override
  @JsonKey(name: 'ApprovedTPName')
  final String? approvedTpName;
  @override
  @JsonKey(name: 'ApprovedHRName')
  final String? approvedHrName;
  @override
  @JsonKey(name: 'DayWork')
  final DateTime? dayWork;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  final String? isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  final String? isApprovedHrText;
  @override
  @JsonKey(name: 'TypeText')
  final String? typeText;
  @override
  @JsonKey(name: 'StatusHR')
  final int? statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  final int? statusTbp;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'StatusTBPText')
  final String? statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  final String? statusHrText;

  @override
  String toString() {
    return 'PersonalEnfItem(id: $id, isApprovedTp: $isApprovedTp, approvedHr: $approvedHr, employeeName: $employeeName, approvedTpName: $approvedTpName, approvedHrName: $approvedHrName, dayWork: $dayWork, note: $note, type: $type, isApprovedTpText: $isApprovedTpText, isApprovedHrText: $isApprovedHrText, typeText: $typeText, statusHr: $statusHr, statusTbp: $statusTbp, reasonDeciline: $reasonDeciline, statusTbpText: $statusTbpText, statusHrText: $statusHrText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalEnfItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isApprovedTp, isApprovedTp) ||
                other.isApprovedTp == isApprovedTp) &&
            (identical(other.approvedHr, approvedHr) ||
                other.approvedHr == approvedHr) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.approvedTpName, approvedTpName) ||
                other.approvedTpName == approvedTpName) &&
            (identical(other.approvedHrName, approvedHrName) ||
                other.approvedHrName == approvedHrName) &&
            (identical(other.dayWork, dayWork) || other.dayWork == dayWork) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isApprovedTpText, isApprovedTpText) ||
                other.isApprovedTpText == isApprovedTpText) &&
            (identical(other.isApprovedHrText, isApprovedHrText) ||
                other.isApprovedHrText == isApprovedHrText) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.statusHr, statusHr) ||
                other.statusHr == statusHr) &&
            (identical(other.statusTbp, statusTbp) ||
                other.statusTbp == statusTbp) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.statusTbpText, statusTbpText) ||
                other.statusTbpText == statusTbpText) &&
            (identical(other.statusHrText, statusHrText) ||
                other.statusHrText == statusHrText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isApprovedTp,
      approvedHr,
      employeeName,
      approvedTpName,
      approvedHrName,
      dayWork,
      note,
      type,
      isApprovedTpText,
      isApprovedHrText,
      typeText,
      statusHr,
      statusTbp,
      reasonDeciline,
      statusTbpText,
      statusHrText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalEnfItemImplCopyWith<_$PersonalEnfItemImpl> get copyWith =>
      __$$PersonalEnfItemImplCopyWithImpl<_$PersonalEnfItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalEnfItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalEnfItem implements PersonalEnfItem {
  const factory _PersonalEnfItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'IsApprovedTP') final bool? isApprovedTp,
          @JsonKey(name: 'ApprovedHR') final int? approvedHr,
          @JsonKey(name: 'EmployeeName') final String? employeeName,
          @JsonKey(name: 'ApprovedTPName') final String? approvedTpName,
          @JsonKey(name: 'ApprovedHRName') final String? approvedHrName,
          @JsonKey(name: 'DayWork') final DateTime? dayWork,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'Type') final int? type,
          @JsonKey(name: 'IsApprovedTPText') final String? isApprovedTpText,
          @JsonKey(name: 'IsApprovedHRText') final String? isApprovedHrText,
          @JsonKey(name: 'TypeText') final String? typeText,
          @JsonKey(name: 'StatusHR') final int? statusHr,
          @JsonKey(name: 'StatusTBP') final int? statusTbp,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'StatusTBPText') final String? statusTbpText,
          @JsonKey(name: 'StatusHRText') final String? statusHrText}) =
      _$PersonalEnfItemImpl;

  factory _PersonalEnfItem.fromJson(Map<String, dynamic> json) =
      _$PersonalEnfItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IsApprovedTP')
  bool? get isApprovedTp;
  @override
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHr;
  @override
  @JsonKey(name: 'EmployeeName')
  String? get employeeName;
  @override
  @JsonKey(name: 'ApprovedTPName')
  String? get approvedTpName;
  @override
  @JsonKey(name: 'ApprovedHRName')
  String? get approvedHrName;
  @override
  @JsonKey(name: 'DayWork')
  DateTime? get dayWork;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'IsApprovedTPText')
  String? get isApprovedTpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText;
  @override
  @JsonKey(name: 'TypeText')
  String? get typeText;
  @override
  @JsonKey(name: 'StatusHR')
  int? get statusHr;
  @override
  @JsonKey(name: 'StatusTBP')
  int? get statusTbp;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'StatusTBPText')
  String? get statusTbpText;
  @override
  @JsonKey(name: 'StatusHRText')
  String? get statusHrText;
  @override
  @JsonKey(ignore: true)
  _$$PersonalEnfItemImplCopyWith<_$PersonalEnfItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalNightShiftItem _$PersonalNightShiftItemFromJson(
    Map<String, dynamic> json) {
  return _PersonalNightShiftItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalNightShiftItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBP')
  int? get isApprovedTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHR')
  int? get isApprovedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedTBPText')
  String? get isApprovedTbpText => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTbp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHr => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedTBPName')
  String? get approvedTbpName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedHRName')
  String? get approvedHrName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double? get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkTime')
  double? get workTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'BreaksTime')
  double? get breaksTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalNightShiftItemCopyWith<PersonalNightShiftItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalNightShiftItemCopyWith<$Res> {
  factory $PersonalNightShiftItemCopyWith(PersonalNightShiftItem value,
          $Res Function(PersonalNightShiftItem) then) =
      _$PersonalNightShiftItemCopyWithImpl<$Res, PersonalNightShiftItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'IsApprovedTBP') int? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') int? isApprovedHr,
      @JsonKey(name: 'IsApprovedTBPText') String? isApprovedTbpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'ApprovedTBP') int? approvedTbp,
      @JsonKey(name: 'ApprovedHR') int? approvedHr,
      @JsonKey(name: 'ApprovedTBPName') String? approvedTbpName,
      @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'WorkTime') double? workTime,
      @JsonKey(name: 'BreaksTime') double? breaksTime});
}

/// @nodoc
class _$PersonalNightShiftItemCopyWithImpl<$Res,
        $Val extends PersonalNightShiftItem>
    implements $PersonalNightShiftItemCopyWith<$Res> {
  _$PersonalNightShiftItemCopyWithImpl(this._value, this._then);

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
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedTbpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? approvedTbp = freezed,
    Object? approvedHr = freezed,
    Object? approvedTbpName = freezed,
    Object? approvedHrName = freezed,
    Object? dateRegister = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? totalHours = freezed,
    Object? location = freezed,
    Object? note = freezed,
    Object? reasonDeciline = freezed,
    Object? departmentName = freezed,
    Object? workTime = freezed,
    Object? breaksTime = freezed,
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
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTbpText: freezed == isApprovedTbpText
          ? _value.isApprovedTbpText
          : isApprovedTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTbp: freezed == approvedTbp
          ? _value.approvedTbp
          : approvedTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTbpName: freezed == approvedTbpName
          ? _value.approvedTbpName
          : approvedTbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHrName: freezed == approvedHrName
          ? _value.approvedHrName
          : approvedHrName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as double?,
      breaksTime: freezed == breaksTime
          ? _value.breaksTime
          : breaksTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalNightShiftItemImplCopyWith<$Res>
    implements $PersonalNightShiftItemCopyWith<$Res> {
  factory _$$PersonalNightShiftItemImplCopyWith(
          _$PersonalNightShiftItemImpl value,
          $Res Function(_$PersonalNightShiftItemImpl) then) =
      __$$PersonalNightShiftItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'IsApprovedTBP') int? isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') int? isApprovedHr,
      @JsonKey(name: 'IsApprovedTBPText') String? isApprovedTbpText,
      @JsonKey(name: 'IsApprovedHRText') String? isApprovedHrText,
      @JsonKey(name: 'ApprovedTBP') int? approvedTbp,
      @JsonKey(name: 'ApprovedHR') int? approvedHr,
      @JsonKey(name: 'ApprovedTBPName') String? approvedTbpName,
      @JsonKey(name: 'ApprovedHRName') String? approvedHrName,
      @JsonKey(name: 'DateRegister') DateTime? dateRegister,
      @JsonKey(name: 'DateStart') DateTime? dateStart,
      @JsonKey(name: 'DateEnd') DateTime? dateEnd,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'WorkTime') double? workTime,
      @JsonKey(name: 'BreaksTime') double? breaksTime});
}

/// @nodoc
class __$$PersonalNightShiftItemImplCopyWithImpl<$Res>
    extends _$PersonalNightShiftItemCopyWithImpl<$Res,
        _$PersonalNightShiftItemImpl>
    implements _$$PersonalNightShiftItemImplCopyWith<$Res> {
  __$$PersonalNightShiftItemImplCopyWithImpl(
      _$PersonalNightShiftItemImpl _value,
      $Res Function(_$PersonalNightShiftItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? employeeId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? isApprovedTbp = freezed,
    Object? isApprovedHr = freezed,
    Object? isApprovedTbpText = freezed,
    Object? isApprovedHrText = freezed,
    Object? approvedTbp = freezed,
    Object? approvedHr = freezed,
    Object? approvedTbpName = freezed,
    Object? approvedHrName = freezed,
    Object? dateRegister = freezed,
    Object? dateStart = freezed,
    Object? dateEnd = freezed,
    Object? totalHours = freezed,
    Object? location = freezed,
    Object? note = freezed,
    Object? reasonDeciline = freezed,
    Object? departmentName = freezed,
    Object? workTime = freezed,
    Object? breaksTime = freezed,
  }) {
    return _then(_$PersonalNightShiftItemImpl(
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
      isApprovedTbp: freezed == isApprovedTbp
          ? _value.isApprovedTbp
          : isApprovedTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedHr: freezed == isApprovedHr
          ? _value.isApprovedHr
          : isApprovedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      isApprovedTbpText: freezed == isApprovedTbpText
          ? _value.isApprovedTbpText
          : isApprovedTbpText // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedHrText: freezed == isApprovedHrText
          ? _value.isApprovedHrText
          : isApprovedHrText // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedTbp: freezed == approvedTbp
          ? _value.approvedTbp
          : approvedTbp // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedHr: freezed == approvedHr
          ? _value.approvedHr
          : approvedHr // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedTbpName: freezed == approvedTbpName
          ? _value.approvedTbpName
          : approvedTbpName // ignore: cast_nullable_to_non_nullable
              as String?,
      approvedHrName: freezed == approvedHrName
          ? _value.approvedHrName
          : approvedHrName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRegister: freezed == dateRegister
          ? _value.dateRegister
          : dateRegister // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      reasonDeciline: freezed == reasonDeciline
          ? _value.reasonDeciline
          : reasonDeciline // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as double?,
      breaksTime: freezed == breaksTime
          ? _value.breaksTime
          : breaksTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalNightShiftItemImpl implements _PersonalNightShiftItem {
  const _$PersonalNightShiftItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'IsApprovedTBP') this.isApprovedTbp,
      @JsonKey(name: 'IsApprovedHR') this.isApprovedHr,
      @JsonKey(name: 'IsApprovedTBPText') this.isApprovedTbpText,
      @JsonKey(name: 'IsApprovedHRText') this.isApprovedHrText,
      @JsonKey(name: 'ApprovedTBP') this.approvedTbp,
      @JsonKey(name: 'ApprovedHR') this.approvedHr,
      @JsonKey(name: 'ApprovedTBPName') this.approvedTbpName,
      @JsonKey(name: 'ApprovedHRName') this.approvedHrName,
      @JsonKey(name: 'DateRegister') this.dateRegister,
      @JsonKey(name: 'DateStart') this.dateStart,
      @JsonKey(name: 'DateEnd') this.dateEnd,
      @JsonKey(name: 'TotalHours') this.totalHours,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'ReasonDeciline') this.reasonDeciline,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'WorkTime') this.workTime,
      @JsonKey(name: 'BreaksTime') this.breaksTime});

  factory _$PersonalNightShiftItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalNightShiftItemImplFromJson(json);

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
  @JsonKey(name: 'IsApprovedTBP')
  final int? isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  final int? isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedTBPText')
  final String? isApprovedTbpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  final String? isApprovedHrText;
  @override
  @JsonKey(name: 'ApprovedTBP')
  final int? approvedTbp;
  @override
  @JsonKey(name: 'ApprovedHR')
  final int? approvedHr;
  @override
  @JsonKey(name: 'ApprovedTBPName')
  final String? approvedTbpName;
  @override
  @JsonKey(name: 'ApprovedHRName')
  final String? approvedHrName;
  @override
  @JsonKey(name: 'DateRegister')
  final DateTime? dateRegister;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime? dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime? dateEnd;
  @override
  @JsonKey(name: 'TotalHours')
  final double? totalHours;
  @override
  @JsonKey(name: 'Location')
  final String? location;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'ReasonDeciline')
  final String? reasonDeciline;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'WorkTime')
  final double? workTime;
  @override
  @JsonKey(name: 'BreaksTime')
  final double? breaksTime;

  @override
  String toString() {
    return 'PersonalNightShiftItem(id: $id, employeeId: $employeeId, code: $code, fullName: $fullName, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, isApprovedTbpText: $isApprovedTbpText, isApprovedHrText: $isApprovedHrText, approvedTbp: $approvedTbp, approvedHr: $approvedHr, approvedTbpName: $approvedTbpName, approvedHrName: $approvedHrName, dateRegister: $dateRegister, dateStart: $dateStart, dateEnd: $dateEnd, totalHours: $totalHours, location: $location, note: $note, reasonDeciline: $reasonDeciline, departmentName: $departmentName, workTime: $workTime, breaksTime: $breaksTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalNightShiftItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.isApprovedTbp, isApprovedTbp) ||
                other.isApprovedTbp == isApprovedTbp) &&
            (identical(other.isApprovedHr, isApprovedHr) ||
                other.isApprovedHr == isApprovedHr) &&
            (identical(other.isApprovedTbpText, isApprovedTbpText) ||
                other.isApprovedTbpText == isApprovedTbpText) &&
            (identical(other.isApprovedHrText, isApprovedHrText) ||
                other.isApprovedHrText == isApprovedHrText) &&
            (identical(other.approvedTbp, approvedTbp) ||
                other.approvedTbp == approvedTbp) &&
            (identical(other.approvedHr, approvedHr) ||
                other.approvedHr == approvedHr) &&
            (identical(other.approvedTbpName, approvedTbpName) ||
                other.approvedTbpName == approvedTbpName) &&
            (identical(other.approvedHrName, approvedHrName) ||
                other.approvedHrName == approvedHrName) &&
            (identical(other.dateRegister, dateRegister) ||
                other.dateRegister == dateRegister) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.reasonDeciline, reasonDeciline) ||
                other.reasonDeciline == reasonDeciline) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.breaksTime, breaksTime) ||
                other.breaksTime == breaksTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        code,
        fullName,
        isApprovedTbp,
        isApprovedHr,
        isApprovedTbpText,
        isApprovedHrText,
        approvedTbp,
        approvedHr,
        approvedTbpName,
        approvedHrName,
        dateRegister,
        dateStart,
        dateEnd,
        totalHours,
        location,
        note,
        reasonDeciline,
        departmentName,
        workTime,
        breaksTime
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalNightShiftItemImplCopyWith<_$PersonalNightShiftItemImpl>
      get copyWith => __$$PersonalNightShiftItemImplCopyWithImpl<
          _$PersonalNightShiftItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalNightShiftItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalNightShiftItem implements PersonalNightShiftItem {
  const factory _PersonalNightShiftItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'IsApprovedTBP') final int? isApprovedTbp,
          @JsonKey(name: 'IsApprovedHR') final int? isApprovedHr,
          @JsonKey(name: 'IsApprovedTBPText') final String? isApprovedTbpText,
          @JsonKey(name: 'IsApprovedHRText') final String? isApprovedHrText,
          @JsonKey(name: 'ApprovedTBP') final int? approvedTbp,
          @JsonKey(name: 'ApprovedHR') final int? approvedHr,
          @JsonKey(name: 'ApprovedTBPName') final String? approvedTbpName,
          @JsonKey(name: 'ApprovedHRName') final String? approvedHrName,
          @JsonKey(name: 'DateRegister') final DateTime? dateRegister,
          @JsonKey(name: 'DateStart') final DateTime? dateStart,
          @JsonKey(name: 'DateEnd') final DateTime? dateEnd,
          @JsonKey(name: 'TotalHours') final double? totalHours,
          @JsonKey(name: 'Location') final String? location,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'WorkTime') final double? workTime,
          @JsonKey(name: 'BreaksTime') final double? breaksTime}) =
      _$PersonalNightShiftItemImpl;

  factory _PersonalNightShiftItem.fromJson(Map<String, dynamic> json) =
      _$PersonalNightShiftItemImpl.fromJson;

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
  @JsonKey(name: 'IsApprovedTBP')
  int? get isApprovedTbp;
  @override
  @JsonKey(name: 'IsApprovedHR')
  int? get isApprovedHr;
  @override
  @JsonKey(name: 'IsApprovedTBPText')
  String? get isApprovedTbpText;
  @override
  @JsonKey(name: 'IsApprovedHRText')
  String? get isApprovedHrText;
  @override
  @JsonKey(name: 'ApprovedTBP')
  int? get approvedTbp;
  @override
  @JsonKey(name: 'ApprovedHR')
  int? get approvedHr;
  @override
  @JsonKey(name: 'ApprovedTBPName')
  String? get approvedTbpName;
  @override
  @JsonKey(name: 'ApprovedHRName')
  String? get approvedHrName;
  @override
  @JsonKey(name: 'DateRegister')
  DateTime? get dateRegister;
  @override
  @JsonKey(name: 'DateStart')
  DateTime? get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime? get dateEnd;
  @override
  @JsonKey(name: 'TotalHours')
  double? get totalHours;
  @override
  @JsonKey(name: 'Location')
  String? get location;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'ReasonDeciline')
  String? get reasonDeciline;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'WorkTime')
  double? get workTime;
  @override
  @JsonKey(name: 'BreaksTime')
  double? get breaksTime;
  @override
  @JsonKey(ignore: true)
  _$$PersonalNightShiftItemImplCopyWith<_$PersonalNightShiftItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalAttendanceItem _$PersonalAttendanceItemFromJson(
    Map<String, dynamic> json) {
  return _PersonalAttendanceItem.fromJson(json);
}

/// @nodoc
mixin _$PersonalAttendanceItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckIn')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOut')
  String? get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLate')
  bool? get isLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeLate')
  double? get timeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarly')
  bool? get isEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeEarly')
  double? get timeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'AttendanceDate')
  DateTime? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DayWeek')
  String? get dayWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'Interval')
  String? get interval => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToChuc')
  String? get toChuc => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVu')
  String? get chucVu => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLunch')
  bool? get isLunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'Overtime')
  bool? get overtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bussiness')
  bool? get bussiness => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoFingerprint')
  bool? get noFingerprint => throw _privateConstructorUsedError;
  @JsonKey(name: 'OnLeave')
  bool? get onLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'WFH')
  bool? get wfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLateRegister')
  bool? get isLateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarlyRegister')
  bool? get isEarlyRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDay')
  double? get totalDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt => throw _privateConstructorUsedError;
  @JsonKey(name: 'OvertimeLate')
  int? get overtimeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OvertimeEarly')
  int? get overtimeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOverEarly')
  bool? get isOverEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOverLate')
  bool? get isOverLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeLate')
  int? get typeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeEarly')
  int? get typeEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLateActual')
  int? get isLateActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsEarlyActual')
  int? get isEarlyActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalProblem')
  int? get totalProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxIsLate')
  int? get maxIsLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxIsEarly')
  int? get maxIsEarly => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoFinger')
  int? get isNoFinger => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoCheckIn')
  int? get isNoCheckIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsNoCheckOut')
  int? get isNoCheckOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalAttendanceItemCopyWith<PersonalAttendanceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalAttendanceItemCopyWith<$Res> {
  factory $PersonalAttendanceItemCopyWith(PersonalAttendanceItem value,
          $Res Function(PersonalAttendanceItem) then) =
      _$PersonalAttendanceItemCopyWithImpl<$Res, PersonalAttendanceItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CheckIn') String? checkIn,
      @JsonKey(name: 'CheckOut') String? checkOut,
      @JsonKey(name: 'IsLate') bool? isLate,
      @JsonKey(name: 'TimeLate') double? timeLate,
      @JsonKey(name: 'IsEarly') bool? isEarly,
      @JsonKey(name: 'TimeEarly') double? timeEarly,
      @JsonKey(name: 'AttendanceDate') DateTime? attendanceDate,
      @JsonKey(name: 'DayWeek') String? dayWeek,
      @JsonKey(name: 'Interval') String? interval,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ToChuc') String? toChuc,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'IsLunch') bool? isLunch,
      @JsonKey(name: 'Overtime') bool? overtime,
      @JsonKey(name: 'Bussiness') bool? bussiness,
      @JsonKey(name: 'NoFingerprint') bool? noFingerprint,
      @JsonKey(name: 'OnLeave') bool? onLeave,
      @JsonKey(name: 'WFH') bool? wfh,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IsLateRegister') bool? isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') bool? isEarlyRegister,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'OvertimeLate') int? overtimeLate,
      @JsonKey(name: 'OvertimeEarly') int? overtimeEarly,
      @JsonKey(name: 'IsOverEarly') bool? isOverEarly,
      @JsonKey(name: 'IsOverLate') bool? isOverLate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'TypeLate') int? typeLate,
      @JsonKey(name: 'TypeEarly') int? typeEarly,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsLateActual') int? isLateActual,
      @JsonKey(name: 'IsEarlyActual') int? isEarlyActual,
      @JsonKey(name: 'TotalProblem') int? totalProblem,
      @JsonKey(name: 'MaxIsLate') int? maxIsLate,
      @JsonKey(name: 'MaxIsEarly') int? maxIsEarly,
      @JsonKey(name: 'IsNoFinger') int? isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') int? isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') int? isNoCheckOut});
}

/// @nodoc
class _$PersonalAttendanceItemCopyWithImpl<$Res,
        $Val extends PersonalAttendanceItem>
    implements $PersonalAttendanceItemCopyWith<$Res> {
  _$PersonalAttendanceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idChamCongMoi = freezed,
    Object? employeeId = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? isLate = freezed,
    Object? timeLate = freezed,
    Object? isEarly = freezed,
    Object? timeEarly = freezed,
    Object? attendanceDate = freezed,
    Object? dayWeek = freezed,
    Object? interval = freezed,
    Object? stt = freezed,
    Object? fullName = freezed,
    Object? toChuc = freezed,
    Object? chucVu = freezed,
    Object? isLunch = freezed,
    Object? overtime = freezed,
    Object? bussiness = freezed,
    Object? noFingerprint = freezed,
    Object? onLeave = freezed,
    Object? wfh = freezed,
    Object? departmentName = freezed,
    Object? isLateRegister = freezed,
    Object? isEarlyRegister = freezed,
    Object? totalDay = freezed,
    Object? holidayDay = freezed,
    Object? departmentId = freezed,
    Object? departmentStt = freezed,
    Object? overtimeLate = freezed,
    Object? overtimeEarly = freezed,
    Object? isOverEarly = freezed,
    Object? isOverLate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? typeLate = freezed,
    Object? typeEarly = freezed,
    Object? code = freezed,
    Object? isLateActual = freezed,
    Object? isEarlyActual = freezed,
    Object? totalProblem = freezed,
    Object? maxIsLate = freezed,
    Object? maxIsEarly = freezed,
    Object? isNoFinger = freezed,
    Object? isNoCheckIn = freezed,
    Object? isNoCheckOut = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: freezed == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLate: freezed == timeLate
          ? _value.timeLate
          : timeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      isEarly: freezed == isEarly
          ? _value.isEarly
          : isEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeEarly: freezed == timeEarly
          ? _value.timeEarly
          : timeEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayWeek: freezed == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      toChuc: freezed == toChuc
          ? _value.toChuc
          : toChuc // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      isLunch: freezed == isLunch
          ? _value.isLunch
          : isLunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as bool?,
      bussiness: freezed == bussiness
          ? _value.bussiness
          : bussiness // ignore: cast_nullable_to_non_nullable
              as bool?,
      noFingerprint: freezed == noFingerprint
          ? _value.noFingerprint
          : noFingerprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      onLeave: freezed == onLeave
          ? _value.onLeave
          : onLeave // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfh: freezed == wfh
          ? _value.wfh
          : wfh // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateRegister: freezed == isLateRegister
          ? _value.isLateRegister
          : isLateRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEarlyRegister: freezed == isEarlyRegister
          ? _value.isEarlyRegister
          : isEarlyRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeLate: freezed == overtimeLate
          ? _value.overtimeLate
          : overtimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeEarly: freezed == overtimeEarly
          ? _value.overtimeEarly
          : overtimeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isOverEarly: freezed == isOverEarly
          ? _value.isOverEarly
          : isOverEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOverLate: freezed == isOverLate
          ? _value.isOverLate
          : isOverLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeLate: freezed == typeLate
          ? _value.typeLate
          : typeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      typeEarly: freezed == typeEarly
          ? _value.typeEarly
          : typeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateActual: freezed == isLateActual
          ? _value.isLateActual
          : isLateActual // ignore: cast_nullable_to_non_nullable
              as int?,
      isEarlyActual: freezed == isEarlyActual
          ? _value.isEarlyActual
          : isEarlyActual // ignore: cast_nullable_to_non_nullable
              as int?,
      totalProblem: freezed == totalProblem
          ? _value.totalProblem
          : totalProblem // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsLate: freezed == maxIsLate
          ? _value.maxIsLate
          : maxIsLate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsEarly: freezed == maxIsEarly
          ? _value.maxIsEarly
          : maxIsEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoFinger: freezed == isNoFinger
          ? _value.isNoFinger
          : isNoFinger // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckIn: freezed == isNoCheckIn
          ? _value.isNoCheckIn
          : isNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckOut: freezed == isNoCheckOut
          ? _value.isNoCheckOut
          : isNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalAttendanceItemImplCopyWith<$Res>
    implements $PersonalAttendanceItemCopyWith<$Res> {
  factory _$$PersonalAttendanceItemImplCopyWith(
          _$PersonalAttendanceItemImpl value,
          $Res Function(_$PersonalAttendanceItemImpl) then) =
      __$$PersonalAttendanceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'CheckIn') String? checkIn,
      @JsonKey(name: 'CheckOut') String? checkOut,
      @JsonKey(name: 'IsLate') bool? isLate,
      @JsonKey(name: 'TimeLate') double? timeLate,
      @JsonKey(name: 'IsEarly') bool? isEarly,
      @JsonKey(name: 'TimeEarly') double? timeEarly,
      @JsonKey(name: 'AttendanceDate') DateTime? attendanceDate,
      @JsonKey(name: 'DayWeek') String? dayWeek,
      @JsonKey(name: 'Interval') String? interval,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ToChuc') String? toChuc,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'IsLunch') bool? isLunch,
      @JsonKey(name: 'Overtime') bool? overtime,
      @JsonKey(name: 'Bussiness') bool? bussiness,
      @JsonKey(name: 'NoFingerprint') bool? noFingerprint,
      @JsonKey(name: 'OnLeave') bool? onLeave,
      @JsonKey(name: 'WFH') bool? wfh,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IsLateRegister') bool? isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') bool? isEarlyRegister,
      @JsonKey(name: 'TotalDay') double? totalDay,
      @JsonKey(name: 'HolidayDay') int? holidayDay,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'OvertimeLate') int? overtimeLate,
      @JsonKey(name: 'OvertimeEarly') int? overtimeEarly,
      @JsonKey(name: 'IsOverEarly') bool? isOverEarly,
      @JsonKey(name: 'IsOverLate') bool? isOverLate,
      @JsonKey(name: 'CheckInDate') DateTime? checkInDate,
      @JsonKey(name: 'CheckOutDate') DateTime? checkOutDate,
      @JsonKey(name: 'TypeLate') int? typeLate,
      @JsonKey(name: 'TypeEarly') int? typeEarly,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsLateActual') int? isLateActual,
      @JsonKey(name: 'IsEarlyActual') int? isEarlyActual,
      @JsonKey(name: 'TotalProblem') int? totalProblem,
      @JsonKey(name: 'MaxIsLate') int? maxIsLate,
      @JsonKey(name: 'MaxIsEarly') int? maxIsEarly,
      @JsonKey(name: 'IsNoFinger') int? isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') int? isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') int? isNoCheckOut});
}

/// @nodoc
class __$$PersonalAttendanceItemImplCopyWithImpl<$Res>
    extends _$PersonalAttendanceItemCopyWithImpl<$Res,
        _$PersonalAttendanceItemImpl>
    implements _$$PersonalAttendanceItemImplCopyWith<$Res> {
  __$$PersonalAttendanceItemImplCopyWithImpl(
      _$PersonalAttendanceItemImpl _value,
      $Res Function(_$PersonalAttendanceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idChamCongMoi = freezed,
    Object? employeeId = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? isLate = freezed,
    Object? timeLate = freezed,
    Object? isEarly = freezed,
    Object? timeEarly = freezed,
    Object? attendanceDate = freezed,
    Object? dayWeek = freezed,
    Object? interval = freezed,
    Object? stt = freezed,
    Object? fullName = freezed,
    Object? toChuc = freezed,
    Object? chucVu = freezed,
    Object? isLunch = freezed,
    Object? overtime = freezed,
    Object? bussiness = freezed,
    Object? noFingerprint = freezed,
    Object? onLeave = freezed,
    Object? wfh = freezed,
    Object? departmentName = freezed,
    Object? isLateRegister = freezed,
    Object? isEarlyRegister = freezed,
    Object? totalDay = freezed,
    Object? holidayDay = freezed,
    Object? departmentId = freezed,
    Object? departmentStt = freezed,
    Object? overtimeLate = freezed,
    Object? overtimeEarly = freezed,
    Object? isOverEarly = freezed,
    Object? isOverLate = freezed,
    Object? checkInDate = freezed,
    Object? checkOutDate = freezed,
    Object? typeLate = freezed,
    Object? typeEarly = freezed,
    Object? code = freezed,
    Object? isLateActual = freezed,
    Object? isEarlyActual = freezed,
    Object? totalProblem = freezed,
    Object? maxIsLate = freezed,
    Object? maxIsEarly = freezed,
    Object? isNoFinger = freezed,
    Object? isNoCheckIn = freezed,
    Object? isNoCheckOut = freezed,
  }) {
    return _then(_$PersonalAttendanceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: freezed == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLate: freezed == timeLate
          ? _value.timeLate
          : timeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      isEarly: freezed == isEarly
          ? _value.isEarly
          : isEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeEarly: freezed == timeEarly
          ? _value.timeEarly
          : timeEarly // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayWeek: freezed == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      interval: freezed == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      toChuc: freezed == toChuc
          ? _value.toChuc
          : toChuc // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      isLunch: freezed == isLunch
          ? _value.isLunch
          : isLunch // ignore: cast_nullable_to_non_nullable
              as bool?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as bool?,
      bussiness: freezed == bussiness
          ? _value.bussiness
          : bussiness // ignore: cast_nullable_to_non_nullable
              as bool?,
      noFingerprint: freezed == noFingerprint
          ? _value.noFingerprint
          : noFingerprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      onLeave: freezed == onLeave
          ? _value.onLeave
          : onLeave // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfh: freezed == wfh
          ? _value.wfh
          : wfh // ignore: cast_nullable_to_non_nullable
              as bool?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateRegister: freezed == isLateRegister
          ? _value.isLateRegister
          : isLateRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEarlyRegister: freezed == isEarlyRegister
          ? _value.isEarlyRegister
          : isEarlyRegister // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalDay: freezed == totalDay
          ? _value.totalDay
          : totalDay // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDay: freezed == holidayDay
          ? _value.holidayDay
          : holidayDay // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeLate: freezed == overtimeLate
          ? _value.overtimeLate
          : overtimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      overtimeEarly: freezed == overtimeEarly
          ? _value.overtimeEarly
          : overtimeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isOverEarly: freezed == isOverEarly
          ? _value.isOverEarly
          : isOverEarly // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOverLate: freezed == isOverLate
          ? _value.isOverLate
          : isOverLate // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutDate: freezed == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      typeLate: freezed == typeLate
          ? _value.typeLate
          : typeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      typeEarly: freezed == typeEarly
          ? _value.typeEarly
          : typeEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isLateActual: freezed == isLateActual
          ? _value.isLateActual
          : isLateActual // ignore: cast_nullable_to_non_nullable
              as int?,
      isEarlyActual: freezed == isEarlyActual
          ? _value.isEarlyActual
          : isEarlyActual // ignore: cast_nullable_to_non_nullable
              as int?,
      totalProblem: freezed == totalProblem
          ? _value.totalProblem
          : totalProblem // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsLate: freezed == maxIsLate
          ? _value.maxIsLate
          : maxIsLate // ignore: cast_nullable_to_non_nullable
              as int?,
      maxIsEarly: freezed == maxIsEarly
          ? _value.maxIsEarly
          : maxIsEarly // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoFinger: freezed == isNoFinger
          ? _value.isNoFinger
          : isNoFinger // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckIn: freezed == isNoCheckIn
          ? _value.isNoCheckIn
          : isNoCheckIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isNoCheckOut: freezed == isNoCheckOut
          ? _value.isNoCheckOut
          : isNoCheckOut // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalAttendanceItemImpl implements _PersonalAttendanceItem {
  const _$PersonalAttendanceItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'IDChamCongMoi') this.idChamCongMoi,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'CheckIn') this.checkIn,
      @JsonKey(name: 'CheckOut') this.checkOut,
      @JsonKey(name: 'IsLate') this.isLate,
      @JsonKey(name: 'TimeLate') this.timeLate,
      @JsonKey(name: 'IsEarly') this.isEarly,
      @JsonKey(name: 'TimeEarly') this.timeEarly,
      @JsonKey(name: 'AttendanceDate') this.attendanceDate,
      @JsonKey(name: 'DayWeek') this.dayWeek,
      @JsonKey(name: 'Interval') this.interval,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'ToChuc') this.toChuc,
      @JsonKey(name: 'ChucVu') this.chucVu,
      @JsonKey(name: 'IsLunch') this.isLunch,
      @JsonKey(name: 'Overtime') this.overtime,
      @JsonKey(name: 'Bussiness') this.bussiness,
      @JsonKey(name: 'NoFingerprint') this.noFingerprint,
      @JsonKey(name: 'OnLeave') this.onLeave,
      @JsonKey(name: 'WFH') this.wfh,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'IsLateRegister') this.isLateRegister,
      @JsonKey(name: 'IsEarlyRegister') this.isEarlyRegister,
      @JsonKey(name: 'TotalDay') this.totalDay,
      @JsonKey(name: 'HolidayDay') this.holidayDay,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentSTT') this.departmentStt,
      @JsonKey(name: 'OvertimeLate') this.overtimeLate,
      @JsonKey(name: 'OvertimeEarly') this.overtimeEarly,
      @JsonKey(name: 'IsOverEarly') this.isOverEarly,
      @JsonKey(name: 'IsOverLate') this.isOverLate,
      @JsonKey(name: 'CheckInDate') this.checkInDate,
      @JsonKey(name: 'CheckOutDate') this.checkOutDate,
      @JsonKey(name: 'TypeLate') this.typeLate,
      @JsonKey(name: 'TypeEarly') this.typeEarly,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'IsLateActual') this.isLateActual,
      @JsonKey(name: 'IsEarlyActual') this.isEarlyActual,
      @JsonKey(name: 'TotalProblem') this.totalProblem,
      @JsonKey(name: 'MaxIsLate') this.maxIsLate,
      @JsonKey(name: 'MaxIsEarly') this.maxIsEarly,
      @JsonKey(name: 'IsNoFinger') this.isNoFinger,
      @JsonKey(name: 'IsNoCheckIn') this.isNoCheckIn,
      @JsonKey(name: 'IsNoCheckOut') this.isNoCheckOut});

  factory _$PersonalAttendanceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalAttendanceItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  final String? idChamCongMoi;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'CheckIn')
  final String? checkIn;
  @override
  @JsonKey(name: 'CheckOut')
  final String? checkOut;
  @override
  @JsonKey(name: 'IsLate')
  final bool? isLate;
  @override
  @JsonKey(name: 'TimeLate')
  final double? timeLate;
  @override
  @JsonKey(name: 'IsEarly')
  final bool? isEarly;
  @override
  @JsonKey(name: 'TimeEarly')
  final double? timeEarly;
  @override
  @JsonKey(name: 'AttendanceDate')
  final DateTime? attendanceDate;
  @override
  @JsonKey(name: 'DayWeek')
  final String? dayWeek;
  @override
  @JsonKey(name: 'Interval')
  final String? interval;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'ToChuc')
  final String? toChuc;
  @override
  @JsonKey(name: 'ChucVu')
  final String? chucVu;
  @override
  @JsonKey(name: 'IsLunch')
  final bool? isLunch;
  @override
  @JsonKey(name: 'Overtime')
  final bool? overtime;
  @override
  @JsonKey(name: 'Bussiness')
  final bool? bussiness;
  @override
  @JsonKey(name: 'NoFingerprint')
  final bool? noFingerprint;
  @override
  @JsonKey(name: 'OnLeave')
  final bool? onLeave;
  @override
  @JsonKey(name: 'WFH')
  final bool? wfh;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'IsLateRegister')
  final bool? isLateRegister;
  @override
  @JsonKey(name: 'IsEarlyRegister')
  final bool? isEarlyRegister;
  @override
  @JsonKey(name: 'TotalDay')
  final double? totalDay;
  @override
  @JsonKey(name: 'HolidayDay')
  final int? holidayDay;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentStt;
  @override
  @JsonKey(name: 'OvertimeLate')
  final int? overtimeLate;
  @override
  @JsonKey(name: 'OvertimeEarly')
  final int? overtimeEarly;
  @override
  @JsonKey(name: 'IsOverEarly')
  final bool? isOverEarly;
  @override
  @JsonKey(name: 'IsOverLate')
  final bool? isOverLate;
  @override
  @JsonKey(name: 'CheckInDate')
  final DateTime? checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  final DateTime? checkOutDate;
  @override
  @JsonKey(name: 'TypeLate')
  final int? typeLate;
  @override
  @JsonKey(name: 'TypeEarly')
  final int? typeEarly;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'IsLateActual')
  final int? isLateActual;
  @override
  @JsonKey(name: 'IsEarlyActual')
  final int? isEarlyActual;
  @override
  @JsonKey(name: 'TotalProblem')
  final int? totalProblem;
  @override
  @JsonKey(name: 'MaxIsLate')
  final int? maxIsLate;
  @override
  @JsonKey(name: 'MaxIsEarly')
  final int? maxIsEarly;
  @override
  @JsonKey(name: 'IsNoFinger')
  final int? isNoFinger;
  @override
  @JsonKey(name: 'IsNoCheckIn')
  final int? isNoCheckIn;
  @override
  @JsonKey(name: 'IsNoCheckOut')
  final int? isNoCheckOut;

  @override
  String toString() {
    return 'PersonalAttendanceItem(id: $id, idChamCongMoi: $idChamCongMoi, employeeId: $employeeId, checkIn: $checkIn, checkOut: $checkOut, isLate: $isLate, timeLate: $timeLate, isEarly: $isEarly, timeEarly: $timeEarly, attendanceDate: $attendanceDate, dayWeek: $dayWeek, interval: $interval, stt: $stt, fullName: $fullName, toChuc: $toChuc, chucVu: $chucVu, isLunch: $isLunch, overtime: $overtime, bussiness: $bussiness, noFingerprint: $noFingerprint, onLeave: $onLeave, wfh: $wfh, departmentName: $departmentName, isLateRegister: $isLateRegister, isEarlyRegister: $isEarlyRegister, totalDay: $totalDay, holidayDay: $holidayDay, departmentId: $departmentId, departmentStt: $departmentStt, overtimeLate: $overtimeLate, overtimeEarly: $overtimeEarly, isOverEarly: $isOverEarly, isOverLate: $isOverLate, checkInDate: $checkInDate, checkOutDate: $checkOutDate, typeLate: $typeLate, typeEarly: $typeEarly, code: $code, isLateActual: $isLateActual, isEarlyActual: $isEarlyActual, totalProblem: $totalProblem, maxIsLate: $maxIsLate, maxIsEarly: $maxIsEarly, isNoFinger: $isNoFinger, isNoCheckIn: $isNoCheckIn, isNoCheckOut: $isNoCheckOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalAttendanceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idChamCongMoi, idChamCongMoi) ||
                other.idChamCongMoi == idChamCongMoi) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.timeLate, timeLate) ||
                other.timeLate == timeLate) &&
            (identical(other.isEarly, isEarly) || other.isEarly == isEarly) &&
            (identical(other.timeEarly, timeEarly) ||
                other.timeEarly == timeEarly) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.dayWeek, dayWeek) || other.dayWeek == dayWeek) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.toChuc, toChuc) || other.toChuc == toChuc) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu) &&
            (identical(other.isLunch, isLunch) || other.isLunch == isLunch) &&
            (identical(other.overtime, overtime) ||
                other.overtime == overtime) &&
            (identical(other.bussiness, bussiness) ||
                other.bussiness == bussiness) &&
            (identical(other.noFingerprint, noFingerprint) ||
                other.noFingerprint == noFingerprint) &&
            (identical(other.onLeave, onLeave) || other.onLeave == onLeave) &&
            (identical(other.wfh, wfh) || other.wfh == wfh) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.isLateRegister, isLateRegister) ||
                other.isLateRegister == isLateRegister) &&
            (identical(other.isEarlyRegister, isEarlyRegister) ||
                other.isEarlyRegister == isEarlyRegister) &&
            (identical(other.totalDay, totalDay) ||
                other.totalDay == totalDay) &&
            (identical(other.holidayDay, holidayDay) ||
                other.holidayDay == holidayDay) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentStt, departmentStt) ||
                other.departmentStt == departmentStt) &&
            (identical(other.overtimeLate, overtimeLate) ||
                other.overtimeLate == overtimeLate) &&
            (identical(other.overtimeEarly, overtimeEarly) ||
                other.overtimeEarly == overtimeEarly) &&
            (identical(other.isOverEarly, isOverEarly) ||
                other.isOverEarly == isOverEarly) &&
            (identical(other.isOverLate, isOverLate) ||
                other.isOverLate == isOverLate) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.typeLate, typeLate) ||
                other.typeLate == typeLate) &&
            (identical(other.typeEarly, typeEarly) ||
                other.typeEarly == typeEarly) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isLateActual, isLateActual) ||
                other.isLateActual == isLateActual) &&
            (identical(other.isEarlyActual, isEarlyActual) ||
                other.isEarlyActual == isEarlyActual) &&
            (identical(other.totalProblem, totalProblem) ||
                other.totalProblem == totalProblem) &&
            (identical(other.maxIsLate, maxIsLate) ||
                other.maxIsLate == maxIsLate) &&
            (identical(other.maxIsEarly, maxIsEarly) ||
                other.maxIsEarly == maxIsEarly) &&
            (identical(other.isNoFinger, isNoFinger) ||
                other.isNoFinger == isNoFinger) &&
            (identical(other.isNoCheckIn, isNoCheckIn) ||
                other.isNoCheckIn == isNoCheckIn) &&
            (identical(other.isNoCheckOut, isNoCheckOut) ||
                other.isNoCheckOut == isNoCheckOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        idChamCongMoi,
        employeeId,
        checkIn,
        checkOut,
        isLate,
        timeLate,
        isEarly,
        timeEarly,
        attendanceDate,
        dayWeek,
        interval,
        stt,
        fullName,
        toChuc,
        chucVu,
        isLunch,
        overtime,
        bussiness,
        noFingerprint,
        onLeave,
        wfh,
        departmentName,
        isLateRegister,
        isEarlyRegister,
        totalDay,
        holidayDay,
        departmentId,
        departmentStt,
        overtimeLate,
        overtimeEarly,
        isOverEarly,
        isOverLate,
        checkInDate,
        checkOutDate,
        typeLate,
        typeEarly,
        code,
        isLateActual,
        isEarlyActual,
        totalProblem,
        maxIsLate,
        maxIsEarly,
        isNoFinger,
        isNoCheckIn,
        isNoCheckOut
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalAttendanceItemImplCopyWith<_$PersonalAttendanceItemImpl>
      get copyWith => __$$PersonalAttendanceItemImplCopyWithImpl<
          _$PersonalAttendanceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalAttendanceItemImplToJson(
      this,
    );
  }
}

abstract class _PersonalAttendanceItem implements PersonalAttendanceItem {
  const factory _PersonalAttendanceItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'IDChamCongMoi') final String? idChamCongMoi,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'CheckIn') final String? checkIn,
          @JsonKey(name: 'CheckOut') final String? checkOut,
          @JsonKey(name: 'IsLate') final bool? isLate,
          @JsonKey(name: 'TimeLate') final double? timeLate,
          @JsonKey(name: 'IsEarly') final bool? isEarly,
          @JsonKey(name: 'TimeEarly') final double? timeEarly,
          @JsonKey(name: 'AttendanceDate') final DateTime? attendanceDate,
          @JsonKey(name: 'DayWeek') final String? dayWeek,
          @JsonKey(name: 'Interval') final String? interval,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'ToChuc') final String? toChuc,
          @JsonKey(name: 'ChucVu') final String? chucVu,
          @JsonKey(name: 'IsLunch') final bool? isLunch,
          @JsonKey(name: 'Overtime') final bool? overtime,
          @JsonKey(name: 'Bussiness') final bool? bussiness,
          @JsonKey(name: 'NoFingerprint') final bool? noFingerprint,
          @JsonKey(name: 'OnLeave') final bool? onLeave,
          @JsonKey(name: 'WFH') final bool? wfh,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'IsLateRegister') final bool? isLateRegister,
          @JsonKey(name: 'IsEarlyRegister') final bool? isEarlyRegister,
          @JsonKey(name: 'TotalDay') final double? totalDay,
          @JsonKey(name: 'HolidayDay') final int? holidayDay,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentSTT') final int? departmentStt,
          @JsonKey(name: 'OvertimeLate') final int? overtimeLate,
          @JsonKey(name: 'OvertimeEarly') final int? overtimeEarly,
          @JsonKey(name: 'IsOverEarly') final bool? isOverEarly,
          @JsonKey(name: 'IsOverLate') final bool? isOverLate,
          @JsonKey(name: 'CheckInDate') final DateTime? checkInDate,
          @JsonKey(name: 'CheckOutDate') final DateTime? checkOutDate,
          @JsonKey(name: 'TypeLate') final int? typeLate,
          @JsonKey(name: 'TypeEarly') final int? typeEarly,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'IsLateActual') final int? isLateActual,
          @JsonKey(name: 'IsEarlyActual') final int? isEarlyActual,
          @JsonKey(name: 'TotalProblem') final int? totalProblem,
          @JsonKey(name: 'MaxIsLate') final int? maxIsLate,
          @JsonKey(name: 'MaxIsEarly') final int? maxIsEarly,
          @JsonKey(name: 'IsNoFinger') final int? isNoFinger,
          @JsonKey(name: 'IsNoCheckIn') final int? isNoCheckIn,
          @JsonKey(name: 'IsNoCheckOut') final int? isNoCheckOut}) =
      _$PersonalAttendanceItemImpl;

  factory _PersonalAttendanceItem.fromJson(Map<String, dynamic> json) =
      _$PersonalAttendanceItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'CheckIn')
  String? get checkIn;
  @override
  @JsonKey(name: 'CheckOut')
  String? get checkOut;
  @override
  @JsonKey(name: 'IsLate')
  bool? get isLate;
  @override
  @JsonKey(name: 'TimeLate')
  double? get timeLate;
  @override
  @JsonKey(name: 'IsEarly')
  bool? get isEarly;
  @override
  @JsonKey(name: 'TimeEarly')
  double? get timeEarly;
  @override
  @JsonKey(name: 'AttendanceDate')
  DateTime? get attendanceDate;
  @override
  @JsonKey(name: 'DayWeek')
  String? get dayWeek;
  @override
  @JsonKey(name: 'Interval')
  String? get interval;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'ToChuc')
  String? get toChuc;
  @override
  @JsonKey(name: 'ChucVu')
  String? get chucVu;
  @override
  @JsonKey(name: 'IsLunch')
  bool? get isLunch;
  @override
  @JsonKey(name: 'Overtime')
  bool? get overtime;
  @override
  @JsonKey(name: 'Bussiness')
  bool? get bussiness;
  @override
  @JsonKey(name: 'NoFingerprint')
  bool? get noFingerprint;
  @override
  @JsonKey(name: 'OnLeave')
  bool? get onLeave;
  @override
  @JsonKey(name: 'WFH')
  bool? get wfh;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'IsLateRegister')
  bool? get isLateRegister;
  @override
  @JsonKey(name: 'IsEarlyRegister')
  bool? get isEarlyRegister;
  @override
  @JsonKey(name: 'TotalDay')
  double? get totalDay;
  @override
  @JsonKey(name: 'HolidayDay')
  int? get holidayDay;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt;
  @override
  @JsonKey(name: 'OvertimeLate')
  int? get overtimeLate;
  @override
  @JsonKey(name: 'OvertimeEarly')
  int? get overtimeEarly;
  @override
  @JsonKey(name: 'IsOverEarly')
  bool? get isOverEarly;
  @override
  @JsonKey(name: 'IsOverLate')
  bool? get isOverLate;
  @override
  @JsonKey(name: 'CheckInDate')
  DateTime? get checkInDate;
  @override
  @JsonKey(name: 'CheckOutDate')
  DateTime? get checkOutDate;
  @override
  @JsonKey(name: 'TypeLate')
  int? get typeLate;
  @override
  @JsonKey(name: 'TypeEarly')
  int? get typeEarly;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'IsLateActual')
  int? get isLateActual;
  @override
  @JsonKey(name: 'IsEarlyActual')
  int? get isEarlyActual;
  @override
  @JsonKey(name: 'TotalProblem')
  int? get totalProblem;
  @override
  @JsonKey(name: 'MaxIsLate')
  int? get maxIsLate;
  @override
  @JsonKey(name: 'MaxIsEarly')
  int? get maxIsEarly;
  @override
  @JsonKey(name: 'IsNoFinger')
  int? get isNoFinger;
  @override
  @JsonKey(name: 'IsNoCheckIn')
  int? get isNoCheckIn;
  @override
  @JsonKey(name: 'IsNoCheckOut')
  int? get isNoCheckOut;
  @override
  @JsonKey(ignore: true)
  _$$PersonalAttendanceItemImplCopyWith<_$PersonalAttendanceItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalSummaryData _$PersonalSummaryDataFromJson(Map<String, dynamic> json) {
  return _PersonalSummaryData.fromJson(json);
}

/// @nodoc
mixin _$PersonalSummaryData {
  @JsonKey(name: 'dataOnLeave')
  List<PersonalLeaveItem> get dataOnLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataEarlyLate')
  List<List<PersonalEarlyLateItem>> get dataEarlyLate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dataOverTime')
  List<List<PersonalOverTimeItem>> get dataOverTime =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dataBussiness')
  List<List<PersonalBussinessItem>> get dataBussiness =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dataWFH')
  List<List<PersonalWfhItem>> get dataWfh => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataENF')
  List<List<PersonalEnfItem>> get dataEnf => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataNightShift')
  List<PersonalNightShiftItem> get dataNightShift =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalSummaryDataCopyWith<PersonalSummaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalSummaryDataCopyWith<$Res> {
  factory $PersonalSummaryDataCopyWith(
          PersonalSummaryData value, $Res Function(PersonalSummaryData) then) =
      _$PersonalSummaryDataCopyWithImpl<$Res, PersonalSummaryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dataOnLeave') List<PersonalLeaveItem> dataOnLeave,
      @JsonKey(name: 'dataEarlyLate')
      List<List<PersonalEarlyLateItem>> dataEarlyLate,
      @JsonKey(name: 'dataOverTime')
      List<List<PersonalOverTimeItem>> dataOverTime,
      @JsonKey(name: 'dataBussiness')
      List<List<PersonalBussinessItem>> dataBussiness,
      @JsonKey(name: 'dataWFH') List<List<PersonalWfhItem>> dataWfh,
      @JsonKey(name: 'dataENF') List<List<PersonalEnfItem>> dataEnf,
      @JsonKey(name: 'dataNightShift')
      List<PersonalNightShiftItem> dataNightShift});
}

/// @nodoc
class _$PersonalSummaryDataCopyWithImpl<$Res, $Val extends PersonalSummaryData>
    implements $PersonalSummaryDataCopyWith<$Res> {
  _$PersonalSummaryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataOnLeave = null,
    Object? dataEarlyLate = null,
    Object? dataOverTime = null,
    Object? dataBussiness = null,
    Object? dataWfh = null,
    Object? dataEnf = null,
    Object? dataNightShift = null,
  }) {
    return _then(_value.copyWith(
      dataOnLeave: null == dataOnLeave
          ? _value.dataOnLeave
          : dataOnLeave // ignore: cast_nullable_to_non_nullable
              as List<PersonalLeaveItem>,
      dataEarlyLate: null == dataEarlyLate
          ? _value.dataEarlyLate
          : dataEarlyLate // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalEarlyLateItem>>,
      dataOverTime: null == dataOverTime
          ? _value.dataOverTime
          : dataOverTime // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalOverTimeItem>>,
      dataBussiness: null == dataBussiness
          ? _value.dataBussiness
          : dataBussiness // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalBussinessItem>>,
      dataWfh: null == dataWfh
          ? _value.dataWfh
          : dataWfh // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalWfhItem>>,
      dataEnf: null == dataEnf
          ? _value.dataEnf
          : dataEnf // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalEnfItem>>,
      dataNightShift: null == dataNightShift
          ? _value.dataNightShift
          : dataNightShift // ignore: cast_nullable_to_non_nullable
              as List<PersonalNightShiftItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalSummaryDataImplCopyWith<$Res>
    implements $PersonalSummaryDataCopyWith<$Res> {
  factory _$$PersonalSummaryDataImplCopyWith(_$PersonalSummaryDataImpl value,
          $Res Function(_$PersonalSummaryDataImpl) then) =
      __$$PersonalSummaryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dataOnLeave') List<PersonalLeaveItem> dataOnLeave,
      @JsonKey(name: 'dataEarlyLate')
      List<List<PersonalEarlyLateItem>> dataEarlyLate,
      @JsonKey(name: 'dataOverTime')
      List<List<PersonalOverTimeItem>> dataOverTime,
      @JsonKey(name: 'dataBussiness')
      List<List<PersonalBussinessItem>> dataBussiness,
      @JsonKey(name: 'dataWFH') List<List<PersonalWfhItem>> dataWfh,
      @JsonKey(name: 'dataENF') List<List<PersonalEnfItem>> dataEnf,
      @JsonKey(name: 'dataNightShift')
      List<PersonalNightShiftItem> dataNightShift});
}

/// @nodoc
class __$$PersonalSummaryDataImplCopyWithImpl<$Res>
    extends _$PersonalSummaryDataCopyWithImpl<$Res, _$PersonalSummaryDataImpl>
    implements _$$PersonalSummaryDataImplCopyWith<$Res> {
  __$$PersonalSummaryDataImplCopyWithImpl(_$PersonalSummaryDataImpl _value,
      $Res Function(_$PersonalSummaryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataOnLeave = null,
    Object? dataEarlyLate = null,
    Object? dataOverTime = null,
    Object? dataBussiness = null,
    Object? dataWfh = null,
    Object? dataEnf = null,
    Object? dataNightShift = null,
  }) {
    return _then(_$PersonalSummaryDataImpl(
      dataOnLeave: null == dataOnLeave
          ? _value._dataOnLeave
          : dataOnLeave // ignore: cast_nullable_to_non_nullable
              as List<PersonalLeaveItem>,
      dataEarlyLate: null == dataEarlyLate
          ? _value._dataEarlyLate
          : dataEarlyLate // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalEarlyLateItem>>,
      dataOverTime: null == dataOverTime
          ? _value._dataOverTime
          : dataOverTime // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalOverTimeItem>>,
      dataBussiness: null == dataBussiness
          ? _value._dataBussiness
          : dataBussiness // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalBussinessItem>>,
      dataWfh: null == dataWfh
          ? _value._dataWfh
          : dataWfh // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalWfhItem>>,
      dataEnf: null == dataEnf
          ? _value._dataEnf
          : dataEnf // ignore: cast_nullable_to_non_nullable
              as List<List<PersonalEnfItem>>,
      dataNightShift: null == dataNightShift
          ? _value._dataNightShift
          : dataNightShift // ignore: cast_nullable_to_non_nullable
              as List<PersonalNightShiftItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalSummaryDataImpl implements _PersonalSummaryData {
  const _$PersonalSummaryDataImpl(
      {@JsonKey(name: 'dataOnLeave')
      final List<PersonalLeaveItem> dataOnLeave = const <PersonalLeaveItem>[],
      @JsonKey(name: 'dataEarlyLate')
      final List<List<PersonalEarlyLateItem>> dataEarlyLate =
          const <List<PersonalEarlyLateItem>>[],
      @JsonKey(name: 'dataOverTime')
      final List<List<PersonalOverTimeItem>> dataOverTime =
          const <List<PersonalOverTimeItem>>[],
      @JsonKey(name: 'dataBussiness')
      final List<List<PersonalBussinessItem>> dataBussiness =
          const <List<PersonalBussinessItem>>[],
      @JsonKey(name: 'dataWFH') final List<List<PersonalWfhItem>> dataWfh =
          const <List<PersonalWfhItem>>[],
      @JsonKey(name: 'dataENF') final List<List<PersonalEnfItem>> dataEnf =
          const <List<PersonalEnfItem>>[],
      @JsonKey(name: 'dataNightShift')
      final List<PersonalNightShiftItem> dataNightShift =
          const <PersonalNightShiftItem>[]})
      : _dataOnLeave = dataOnLeave,
        _dataEarlyLate = dataEarlyLate,
        _dataOverTime = dataOverTime,
        _dataBussiness = dataBussiness,
        _dataWfh = dataWfh,
        _dataEnf = dataEnf,
        _dataNightShift = dataNightShift;

  factory _$PersonalSummaryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalSummaryDataImplFromJson(json);

  final List<PersonalLeaveItem> _dataOnLeave;
  @override
  @JsonKey(name: 'dataOnLeave')
  List<PersonalLeaveItem> get dataOnLeave {
    if (_dataOnLeave is EqualUnmodifiableListView) return _dataOnLeave;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataOnLeave);
  }

  final List<List<PersonalEarlyLateItem>> _dataEarlyLate;
  @override
  @JsonKey(name: 'dataEarlyLate')
  List<List<PersonalEarlyLateItem>> get dataEarlyLate {
    if (_dataEarlyLate is EqualUnmodifiableListView) return _dataEarlyLate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataEarlyLate);
  }

  final List<List<PersonalOverTimeItem>> _dataOverTime;
  @override
  @JsonKey(name: 'dataOverTime')
  List<List<PersonalOverTimeItem>> get dataOverTime {
    if (_dataOverTime is EqualUnmodifiableListView) return _dataOverTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataOverTime);
  }

  final List<List<PersonalBussinessItem>> _dataBussiness;
  @override
  @JsonKey(name: 'dataBussiness')
  List<List<PersonalBussinessItem>> get dataBussiness {
    if (_dataBussiness is EqualUnmodifiableListView) return _dataBussiness;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataBussiness);
  }

  final List<List<PersonalWfhItem>> _dataWfh;
  @override
  @JsonKey(name: 'dataWFH')
  List<List<PersonalWfhItem>> get dataWfh {
    if (_dataWfh is EqualUnmodifiableListView) return _dataWfh;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataWfh);
  }

  final List<List<PersonalEnfItem>> _dataEnf;
  @override
  @JsonKey(name: 'dataENF')
  List<List<PersonalEnfItem>> get dataEnf {
    if (_dataEnf is EqualUnmodifiableListView) return _dataEnf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataEnf);
  }

  final List<PersonalNightShiftItem> _dataNightShift;
  @override
  @JsonKey(name: 'dataNightShift')
  List<PersonalNightShiftItem> get dataNightShift {
    if (_dataNightShift is EqualUnmodifiableListView) return _dataNightShift;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataNightShift);
  }

  @override
  String toString() {
    return 'PersonalSummaryData(dataOnLeave: $dataOnLeave, dataEarlyLate: $dataEarlyLate, dataOverTime: $dataOverTime, dataBussiness: $dataBussiness, dataWfh: $dataWfh, dataEnf: $dataEnf, dataNightShift: $dataNightShift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalSummaryDataImpl &&
            const DeepCollectionEquality()
                .equals(other._dataOnLeave, _dataOnLeave) &&
            const DeepCollectionEquality()
                .equals(other._dataEarlyLate, _dataEarlyLate) &&
            const DeepCollectionEquality()
                .equals(other._dataOverTime, _dataOverTime) &&
            const DeepCollectionEquality()
                .equals(other._dataBussiness, _dataBussiness) &&
            const DeepCollectionEquality().equals(other._dataWfh, _dataWfh) &&
            const DeepCollectionEquality().equals(other._dataEnf, _dataEnf) &&
            const DeepCollectionEquality()
                .equals(other._dataNightShift, _dataNightShift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dataOnLeave),
      const DeepCollectionEquality().hash(_dataEarlyLate),
      const DeepCollectionEquality().hash(_dataOverTime),
      const DeepCollectionEquality().hash(_dataBussiness),
      const DeepCollectionEquality().hash(_dataWfh),
      const DeepCollectionEquality().hash(_dataEnf),
      const DeepCollectionEquality().hash(_dataNightShift));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalSummaryDataImplCopyWith<_$PersonalSummaryDataImpl> get copyWith =>
      __$$PersonalSummaryDataImplCopyWithImpl<_$PersonalSummaryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalSummaryDataImplToJson(
      this,
    );
  }
}

abstract class _PersonalSummaryData implements PersonalSummaryData {
  const factory _PersonalSummaryData(
      {@JsonKey(name: 'dataOnLeave') final List<PersonalLeaveItem> dataOnLeave,
      @JsonKey(name: 'dataEarlyLate')
      final List<List<PersonalEarlyLateItem>> dataEarlyLate,
      @JsonKey(name: 'dataOverTime')
      final List<List<PersonalOverTimeItem>> dataOverTime,
      @JsonKey(name: 'dataBussiness')
      final List<List<PersonalBussinessItem>> dataBussiness,
      @JsonKey(name: 'dataWFH') final List<List<PersonalWfhItem>> dataWfh,
      @JsonKey(name: 'dataENF') final List<List<PersonalEnfItem>> dataEnf,
      @JsonKey(name: 'dataNightShift')
      final List<PersonalNightShiftItem>
          dataNightShift}) = _$PersonalSummaryDataImpl;

  factory _PersonalSummaryData.fromJson(Map<String, dynamic> json) =
      _$PersonalSummaryDataImpl.fromJson;

  @override
  @JsonKey(name: 'dataOnLeave')
  List<PersonalLeaveItem> get dataOnLeave;
  @override
  @JsonKey(name: 'dataEarlyLate')
  List<List<PersonalEarlyLateItem>> get dataEarlyLate;
  @override
  @JsonKey(name: 'dataOverTime')
  List<List<PersonalOverTimeItem>> get dataOverTime;
  @override
  @JsonKey(name: 'dataBussiness')
  List<List<PersonalBussinessItem>> get dataBussiness;
  @override
  @JsonKey(name: 'dataWFH')
  List<List<PersonalWfhItem>> get dataWfh;
  @override
  @JsonKey(name: 'dataENF')
  List<List<PersonalEnfItem>> get dataEnf;
  @override
  @JsonKey(name: 'dataNightShift')
  List<PersonalNightShiftItem> get dataNightShift;
  @override
  @JsonKey(ignore: true)
  _$$PersonalSummaryDataImplCopyWith<_$PersonalSummaryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalAttendanceEmployee _$PersonalAttendanceEmployeeFromJson(
    Map<String, dynamic> json) {
  return _PersonalAttendanceEmployee.fromJson(json);
}

/// @nodoc
mixin _$PersonalAttendanceEmployee {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi => throw _privateConstructorUsedError;
  @JsonKey(name: 'Position')
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamName')
  String? get teamName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalAttendanceEmployeeCopyWith<PersonalAttendanceEmployee>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalAttendanceEmployeeCopyWith<$Res> {
  factory $PersonalAttendanceEmployeeCopyWith(PersonalAttendanceEmployee value,
          $Res Function(PersonalAttendanceEmployee) then) =
      _$PersonalAttendanceEmployeeCopyWithImpl<$Res,
          PersonalAttendanceEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'Position') String? position,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'TeamName') String? teamName});
}

/// @nodoc
class _$PersonalAttendanceEmployeeCopyWithImpl<$Res,
        $Val extends PersonalAttendanceEmployee>
    implements $PersonalAttendanceEmployeeCopyWith<$Res> {
  _$PersonalAttendanceEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? idChamCongMoi = freezed,
    Object? position = freezed,
    Object? email = freezed,
    Object? teamName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalAttendanceEmployeeImplCopyWith<$Res>
    implements $PersonalAttendanceEmployeeCopyWith<$Res> {
  factory _$$PersonalAttendanceEmployeeImplCopyWith(
          _$PersonalAttendanceEmployeeImpl value,
          $Res Function(_$PersonalAttendanceEmployeeImpl) then) =
      __$$PersonalAttendanceEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'Position') String? position,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'TeamName') String? teamName});
}

/// @nodoc
class __$$PersonalAttendanceEmployeeImplCopyWithImpl<$Res>
    extends _$PersonalAttendanceEmployeeCopyWithImpl<$Res,
        _$PersonalAttendanceEmployeeImpl>
    implements _$$PersonalAttendanceEmployeeImplCopyWith<$Res> {
  __$$PersonalAttendanceEmployeeImplCopyWithImpl(
      _$PersonalAttendanceEmployeeImpl _value,
      $Res Function(_$PersonalAttendanceEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? departmentId = freezed,
    Object? departmentName = freezed,
    Object? idChamCongMoi = freezed,
    Object? position = freezed,
    Object? email = freezed,
    Object? teamName = freezed,
  }) {
    return _then(_$PersonalAttendanceEmployeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      teamName: freezed == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalAttendanceEmployeeImpl implements _PersonalAttendanceEmployee {
  const _$PersonalAttendanceEmployeeImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'IDChamCongMoi') this.idChamCongMoi,
      @JsonKey(name: 'Position') this.position,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'TeamName') this.teamName});

  factory _$PersonalAttendanceEmployeeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PersonalAttendanceEmployeeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  final String? idChamCongMoi;
  @override
  @JsonKey(name: 'Position')
  final String? position;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'TeamName')
  final String? teamName;

  @override
  String toString() {
    return 'PersonalAttendanceEmployee(id: $id, code: $code, fullName: $fullName, departmentId: $departmentId, departmentName: $departmentName, idChamCongMoi: $idChamCongMoi, position: $position, email: $email, teamName: $teamName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalAttendanceEmployeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.idChamCongMoi, idChamCongMoi) ||
                other.idChamCongMoi == idChamCongMoi) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, fullName, departmentId,
      departmentName, idChamCongMoi, position, email, teamName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalAttendanceEmployeeImplCopyWith<_$PersonalAttendanceEmployeeImpl>
      get copyWith => __$$PersonalAttendanceEmployeeImplCopyWithImpl<
          _$PersonalAttendanceEmployeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalAttendanceEmployeeImplToJson(
      this,
    );
  }
}

abstract class _PersonalAttendanceEmployee
    implements PersonalAttendanceEmployee {
  const factory _PersonalAttendanceEmployee(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'IDChamCongMoi') final String? idChamCongMoi,
          @JsonKey(name: 'Position') final String? position,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'TeamName') final String? teamName}) =
      _$PersonalAttendanceEmployeeImpl;

  factory _PersonalAttendanceEmployee.fromJson(Map<String, dynamic> json) =
      _$PersonalAttendanceEmployeeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi;
  @override
  @JsonKey(name: 'Position')
  String? get position;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'TeamName')
  String? get teamName;
  @override
  @JsonKey(ignore: true)
  _$$PersonalAttendanceEmployeeImplCopyWith<_$PersonalAttendanceEmployeeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
