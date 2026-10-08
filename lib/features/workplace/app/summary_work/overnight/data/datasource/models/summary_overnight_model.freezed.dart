// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_overnight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryOvernightItem _$SummaryOvernightItemFromJson(Map<String, dynamic> json) {
  return _SummaryOvernightItem.fromJson(json);
}

/// @nodoc
mixin _$SummaryOvernightItem {
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
  String? get dateRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  String? get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  String? get dateEnd => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProblem')
  bool? get isProblem => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkTime')
  double? get workTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'BreaksTime')
  double? get breaksTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryOvernightItemCopyWith<SummaryOvernightItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryOvernightItemCopyWith<$Res> {
  factory $SummaryOvernightItemCopyWith(SummaryOvernightItem value,
          $Res Function(SummaryOvernightItem) then) =
      _$SummaryOvernightItemCopyWithImpl<$Res, SummaryOvernightItem>;
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
      @JsonKey(name: 'DateRegister') String? dateRegister,
      @JsonKey(name: 'DateStart') String? dateStart,
      @JsonKey(name: 'DateEnd') String? dateEnd,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'WorkTime') double? workTime,
      @JsonKey(name: 'BreaksTime') double? breaksTime});
}

/// @nodoc
class _$SummaryOvernightItemCopyWithImpl<$Res,
        $Val extends SummaryOvernightItem>
    implements $SummaryOvernightItemCopyWith<$Res> {
  _$SummaryOvernightItemCopyWithImpl(this._value, this._then);

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
    Object? departmentId = freezed,
    Object? rowNum = freezed,
    Object? isProblem = freezed,
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
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String?,
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
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$SummaryOvernightItemImplCopyWith<$Res>
    implements $SummaryOvernightItemCopyWith<$Res> {
  factory _$$SummaryOvernightItemImplCopyWith(_$SummaryOvernightItemImpl value,
          $Res Function(_$SummaryOvernightItemImpl) then) =
      __$$SummaryOvernightItemImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'DateRegister') String? dateRegister,
      @JsonKey(name: 'DateStart') String? dateStart,
      @JsonKey(name: 'DateEnd') String? dateEnd,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'IsProblem') bool? isProblem,
      @JsonKey(name: 'WorkTime') double? workTime,
      @JsonKey(name: 'BreaksTime') double? breaksTime});
}

/// @nodoc
class __$$SummaryOvernightItemImplCopyWithImpl<$Res>
    extends _$SummaryOvernightItemCopyWithImpl<$Res, _$SummaryOvernightItemImpl>
    implements _$$SummaryOvernightItemImplCopyWith<$Res> {
  __$$SummaryOvernightItemImplCopyWithImpl(_$SummaryOvernightItemImpl _value,
      $Res Function(_$SummaryOvernightItemImpl) _then)
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
    Object? departmentId = freezed,
    Object? rowNum = freezed,
    Object? isProblem = freezed,
    Object? workTime = freezed,
    Object? breaksTime = freezed,
  }) {
    return _then(_$SummaryOvernightItemImpl(
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
              as String?,
      dateStart: freezed == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String?,
      dateEnd: freezed == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String?,
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
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      isProblem: freezed == isProblem
          ? _value.isProblem
          : isProblem // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$SummaryOvernightItemImpl implements _SummaryOvernightItem {
  const _$SummaryOvernightItemImpl(
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
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'RowNum') this.rowNum,
      @JsonKey(name: 'IsProblem') this.isProblem,
      @JsonKey(name: 'WorkTime') this.workTime,
      @JsonKey(name: 'BreaksTime') this.breaksTime});

  factory _$SummaryOvernightItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryOvernightItemImplFromJson(json);

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
  final String? dateRegister;
  @override
  @JsonKey(name: 'DateStart')
  final String? dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final String? dateEnd;
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
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;
  @override
  @JsonKey(name: 'IsProblem')
  final bool? isProblem;
  @override
  @JsonKey(name: 'WorkTime')
  final double? workTime;
  @override
  @JsonKey(name: 'BreaksTime')
  final double? breaksTime;

  @override
  String toString() {
    return 'SummaryOvernightItem(id: $id, employeeId: $employeeId, code: $code, fullName: $fullName, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, isApprovedTbpText: $isApprovedTbpText, isApprovedHrText: $isApprovedHrText, approvedTbp: $approvedTbp, approvedHr: $approvedHr, approvedTbpName: $approvedTbpName, approvedHrName: $approvedHrName, dateRegister: $dateRegister, dateStart: $dateStart, dateEnd: $dateEnd, totalHours: $totalHours, location: $location, note: $note, reasonDeciline: $reasonDeciline, departmentName: $departmentName, departmentId: $departmentId, rowNum: $rowNum, isProblem: $isProblem, workTime: $workTime, breaksTime: $breaksTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryOvernightItemImpl &&
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
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum) &&
            (identical(other.isProblem, isProblem) ||
                other.isProblem == isProblem) &&
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
        departmentId,
        rowNum,
        isProblem,
        workTime,
        breaksTime
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryOvernightItemImplCopyWith<_$SummaryOvernightItemImpl>
      get copyWith =>
          __$$SummaryOvernightItemImplCopyWithImpl<_$SummaryOvernightItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryOvernightItemImplToJson(
      this,
    );
  }
}

abstract class _SummaryOvernightItem implements SummaryOvernightItem {
  const factory _SummaryOvernightItem(
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
          @JsonKey(name: 'DateRegister') final String? dateRegister,
          @JsonKey(name: 'DateStart') final String? dateStart,
          @JsonKey(name: 'DateEnd') final String? dateEnd,
          @JsonKey(name: 'TotalHours') final double? totalHours,
          @JsonKey(name: 'Location') final String? location,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'ReasonDeciline') final String? reasonDeciline,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'RowNum') final int? rowNum,
          @JsonKey(name: 'IsProblem') final bool? isProblem,
          @JsonKey(name: 'WorkTime') final double? workTime,
          @JsonKey(name: 'BreaksTime') final double? breaksTime}) =
      _$SummaryOvernightItemImpl;

  factory _SummaryOvernightItem.fromJson(Map<String, dynamic> json) =
      _$SummaryOvernightItemImpl.fromJson;

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
  String? get dateRegister;
  @override
  @JsonKey(name: 'DateStart')
  String? get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  String? get dateEnd;
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
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  @JsonKey(name: 'IsProblem')
  bool? get isProblem;
  @override
  @JsonKey(name: 'WorkTime')
  double? get workTime;
  @override
  @JsonKey(name: 'BreaksTime')
  double? get breaksTime;
  @override
  @JsonKey(ignore: true)
  _$$SummaryOvernightItemImplCopyWith<_$SummaryOvernightItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SummaryOvernightDepartment _$SummaryOvernightDepartmentFromJson(
    Map<String, dynamic> json) {
  return _SummaryOvernightDepartment.fromJson(json);
}

/// @nodoc
mixin _$SummaryOvernightDepartment {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'HeadofDepartment')
  int? get headOfDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsShowHotline')
  bool? get isShowHotline => throw _privateConstructorUsedError;
  @JsonKey(name: 'PId')
  String? get pId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int? get parentID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummaryOvernightDepartmentCopyWith<SummaryOvernightDepartment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryOvernightDepartmentCopyWith<$Res> {
  factory $SummaryOvernightDepartmentCopyWith(SummaryOvernightDepartment value,
          $Res Function(SummaryOvernightDepartment) then) =
      _$SummaryOvernightDepartmentCopyWithImpl<$Res,
          SummaryOvernightDepartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headOfDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentID});
}

/// @nodoc
class _$SummaryOvernightDepartmentCopyWithImpl<$Res,
        $Val extends SummaryOvernightDepartment>
    implements $SummaryOvernightDepartmentCopyWith<$Res> {
  _$SummaryOvernightDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? headOfDepartment = freezed,
    Object? isShowHotline = freezed,
    Object? pId = freezed,
    Object? stt = freezed,
    Object? isDeleted = freezed,
    Object? parentID = freezed,
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
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      headOfDepartment: freezed == headOfDepartment
          ? _value.headOfDepartment
          : headOfDepartment // ignore: cast_nullable_to_non_nullable
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
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryOvernightDepartmentImplCopyWith<$Res>
    implements $SummaryOvernightDepartmentCopyWith<$Res> {
  factory _$$SummaryOvernightDepartmentImplCopyWith(
          _$SummaryOvernightDepartmentImpl value,
          $Res Function(_$SummaryOvernightDepartmentImpl) then) =
      __$$SummaryOvernightDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headOfDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ParentID') int? parentID});
}

/// @nodoc
class __$$SummaryOvernightDepartmentImplCopyWithImpl<$Res>
    extends _$SummaryOvernightDepartmentCopyWithImpl<$Res,
        _$SummaryOvernightDepartmentImpl>
    implements _$$SummaryOvernightDepartmentImplCopyWith<$Res> {
  __$$SummaryOvernightDepartmentImplCopyWithImpl(
      _$SummaryOvernightDepartmentImpl _value,
      $Res Function(_$SummaryOvernightDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? headOfDepartment = freezed,
    Object? isShowHotline = freezed,
    Object? pId = freezed,
    Object? stt = freezed,
    Object? isDeleted = freezed,
    Object? parentID = freezed,
  }) {
    return _then(_$SummaryOvernightDepartmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      headOfDepartment: freezed == headOfDepartment
          ? _value.headOfDepartment
          : headOfDepartment // ignore: cast_nullable_to_non_nullable
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
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryOvernightDepartmentImpl implements _SummaryOvernightDepartment {
  const _$SummaryOvernightDepartmentImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'HeadofDepartment') this.headOfDepartment,
      @JsonKey(name: 'IsShowHotline') this.isShowHotline,
      @JsonKey(name: 'PId') this.pId,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'ParentID') this.parentID});

  factory _$SummaryOvernightDepartmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SummaryOvernightDepartmentImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  final String? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'HeadofDepartment')
  final int? headOfDepartment;
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
  final int? parentID;

  @override
  String toString() {
    return 'SummaryOvernightDepartment(id: $id, code: $code, name: $name, description: $description, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, status: $status, email: $email, headOfDepartment: $headOfDepartment, isShowHotline: $isShowHotline, pId: $pId, stt: $stt, isDeleted: $isDeleted, parentID: $parentID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryOvernightDepartmentImpl &&
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
            (identical(other.headOfDepartment, headOfDepartment) ||
                other.headOfDepartment == headOfDepartment) &&
            (identical(other.isShowHotline, isShowHotline) ||
                other.isShowHotline == isShowHotline) &&
            (identical(other.pId, pId) || other.pId == pId) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID));
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
      headOfDepartment,
      isShowHotline,
      pId,
      stt,
      isDeleted,
      parentID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryOvernightDepartmentImplCopyWith<_$SummaryOvernightDepartmentImpl>
      get copyWith => __$$SummaryOvernightDepartmentImplCopyWithImpl<
          _$SummaryOvernightDepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryOvernightDepartmentImplToJson(
      this,
    );
  }
}

abstract class _SummaryOvernightDepartment
    implements SummaryOvernightDepartment {
  const factory _SummaryOvernightDepartment(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'HeadofDepartment') final int? headOfDepartment,
          @JsonKey(name: 'IsShowHotline') final bool? isShowHotline,
          @JsonKey(name: 'PId') final String? pId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'ParentID') final int? parentID}) =
      _$SummaryOvernightDepartmentImpl;

  factory _SummaryOvernightDepartment.fromJson(Map<String, dynamic> json) =
      _$SummaryOvernightDepartmentImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  String? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'HeadofDepartment')
  int? get headOfDepartment;
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
  int? get parentID;
  @override
  @JsonKey(ignore: true)
  _$$SummaryOvernightDepartmentImplCopyWith<_$SummaryOvernightDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
