// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OvertimeItem _$OvertimeItemFromJson(Map<String, dynamic> json) {
  return _OvertimeItem.fromJson(json);
}

/// @nodoc
mixin _$OvertimeItem {
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
  $OvertimeItemCopyWith<OvertimeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeItemCopyWith<$Res> {
  factory $OvertimeItemCopyWith(
          OvertimeItem value, $Res Function(OvertimeItem) then) =
      _$OvertimeItemCopyWithImpl<$Res, OvertimeItem>;
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
class _$OvertimeItemCopyWithImpl<$Res, $Val extends OvertimeItem>
    implements $OvertimeItemCopyWith<$Res> {
  _$OvertimeItemCopyWithImpl(this._value, this._then);

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
abstract class _$$OvertimeItemImplCopyWith<$Res>
    implements $OvertimeItemCopyWith<$Res> {
  factory _$$OvertimeItemImplCopyWith(
          _$OvertimeItemImpl value, $Res Function(_$OvertimeItemImpl) then) =
      __$$OvertimeItemImplCopyWithImpl<$Res>;
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
class __$$OvertimeItemImplCopyWithImpl<$Res>
    extends _$OvertimeItemCopyWithImpl<$Res, _$OvertimeItemImpl>
    implements _$$OvertimeItemImplCopyWith<$Res> {
  __$$OvertimeItemImplCopyWithImpl(
      _$OvertimeItemImpl _value, $Res Function(_$OvertimeItemImpl) _then)
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
    return _then(_$OvertimeItemImpl(
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
class _$OvertimeItemImpl implements _OvertimeItem {
  const _$OvertimeItemImpl(
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

  factory _$OvertimeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeItemImplFromJson(json);

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
    return 'OvertimeItem(id: $id, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, employeeFullName: $employeeFullName, approvedTbp: $approvedTbp, approvedHr: $approvedHr, dateRegister: $dateRegister, typeId: $typeId, timeStart: $timeStart, endTime: $endTime, timeReality: $timeReality, totalTime: $totalTime, location: $location, locationText: $locationText, typeName: $typeName, note: $note, isApprovedText: $isApprovedText, reason: $reason, statusHr: $statusHr, statusTbp: $statusTbp, costOvernight: $costOvernight, projectName: $projectName, reasonDeciline: $reasonDeciline, overnight: $overnight, isProblem: $isProblem, fileName: $fileName, statusTbpText: $statusTbpText, statusHrText: $statusHrText, projectId: $projectId, approvedId: $approvedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeItemImpl &&
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
  _$$OvertimeItemImplCopyWith<_$OvertimeItemImpl> get copyWith =>
      __$$OvertimeItemImplCopyWithImpl<_$OvertimeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeItemImplToJson(
      this,
    );
  }
}

abstract class _OvertimeItem implements OvertimeItem {
  const factory _OvertimeItem(
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
      @JsonKey(name: 'ApprovedID') final int? approvedId}) = _$OvertimeItemImpl;

  factory _OvertimeItem.fromJson(Map<String, dynamic> json) =
      _$OvertimeItemImpl.fromJson;

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
  _$$OvertimeItemImplCopyWith<_$OvertimeItemImpl> get copyWith =>
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

OvertimeProject _$OvertimeProjectFromJson(Map<String, dynamic> json) {
  return _OvertimeProject.fromJson(json);
}

/// @nodoc
mixin _$OvertimeProject {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
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
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactID')
  int? get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PO')
  String? get po => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectType')
  int? get projectType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ListCostID')
  int? get listCostId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanDateStart')
  DateTime? get planDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanDateEnd')
  DateTime? get planDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualDateStart')
  DateTime? get actualDateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualDateEnd')
  DateTime? get actualDateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'EU')
  String? get eu => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectManager')
  int? get projectManager => throw _privateConstructorUsedError;
  @JsonKey(name: 'CurrentState')
  String? get currentState => throw _privateConstructorUsedError;
  @JsonKey(name: 'Priotity')
  double? get priotity => throw _privateConstructorUsedError;
  @JsonKey(name: 'PODate')
  DateTime? get poDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeProject')
  int? get typeProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeProjectCopyWith<OvertimeProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeProjectCopyWith<$Res> {
  factory $OvertimeProjectCopyWith(
          OvertimeProject value, $Res Function(OvertimeProject) then) =
      _$OvertimeProjectCopyWithImpl<$Res, OvertimeProject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectShortName') String? projectShortName,
      @JsonKey(name: 'ProjectStatus') int? projectStatus,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'ContactID') int? contactId,
      @JsonKey(name: 'PO') String? po,
      @JsonKey(name: 'ProjectType') int? projectType,
      @JsonKey(name: 'ListCostID') int? listCostId,
      @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
      @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
      @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
      @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,
      @JsonKey(name: 'EU') String? eu,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'CurrentState') String? currentState,
      @JsonKey(name: 'Priotity') double? priotity,
      @JsonKey(name: 'PODate') DateTime? poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$OvertimeProjectCopyWithImpl<$Res, $Val extends OvertimeProject>
    implements $OvertimeProjectCopyWith<$Res> {
  _$OvertimeProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as bool?,
      contactId: freezed == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int?,
      po: freezed == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as int?,
      listCostId: freezed == listCostId
          ? _value.listCostId
          : listCostId // ignore: cast_nullable_to_non_nullable
              as int?,
      planDateStart: freezed == planDateStart
          ? _value.planDateStart
          : planDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planDateEnd: freezed == planDateEnd
          ? _value.planDateEnd
          : planDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDateStart: freezed == actualDateStart
          ? _value.actualDateStart
          : actualDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDateEnd: freezed == actualDateEnd
          ? _value.actualDateEnd
          : actualDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eu: freezed == eu
          ? _value.eu
          : eu // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeProjectImplCopyWith<$Res>
    implements $OvertimeProjectCopyWith<$Res> {
  factory _$$OvertimeProjectImplCopyWith(_$OvertimeProjectImpl value,
          $Res Function(_$OvertimeProjectImpl) then) =
      __$$OvertimeProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectShortName') String? projectShortName,
      @JsonKey(name: 'ProjectStatus') int? projectStatus,
      @JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsApproved') bool? isApproved,
      @JsonKey(name: 'ContactID') int? contactId,
      @JsonKey(name: 'PO') String? po,
      @JsonKey(name: 'ProjectType') int? projectType,
      @JsonKey(name: 'ListCostID') int? listCostId,
      @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
      @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
      @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
      @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,
      @JsonKey(name: 'EU') String? eu,
      @JsonKey(name: 'ProjectManager') int? projectManager,
      @JsonKey(name: 'CurrentState') String? currentState,
      @JsonKey(name: 'Priotity') double? priotity,
      @JsonKey(name: 'PODate') DateTime? poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$OvertimeProjectImplCopyWithImpl<$Res>
    extends _$OvertimeProjectCopyWithImpl<$Res, _$OvertimeProjectImpl>
    implements _$$OvertimeProjectImplCopyWith<$Res> {
  __$$OvertimeProjectImplCopyWithImpl(
      _$OvertimeProjectImpl _value, $Res Function(_$OvertimeProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
  }) {
    return _then(_$OvertimeProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as bool?,
      contactId: freezed == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int?,
      po: freezed == po
          ? _value.po
          : po // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as int?,
      listCostId: freezed == listCostId
          ? _value.listCostId
          : listCostId // ignore: cast_nullable_to_non_nullable
              as int?,
      planDateStart: freezed == planDateStart
          ? _value.planDateStart
          : planDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planDateEnd: freezed == planDateEnd
          ? _value.planDateEnd
          : planDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDateStart: freezed == actualDateStart
          ? _value.actualDateStart
          : actualDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualDateEnd: freezed == actualDateEnd
          ? _value.actualDateEnd
          : actualDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eu: freezed == eu
          ? _value.eu
          : eu // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime?,
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
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeProjectImpl implements _OvertimeProject {
  const _$OvertimeProjectImpl(
      {@JsonKey(name: 'ID') required this.id,
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
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$OvertimeProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeProjectImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  final bool? isApproved;
  @override
  @JsonKey(name: 'ContactID')
  final int? contactId;
  @override
  @JsonKey(name: 'PO')
  final String? po;
  @override
  @JsonKey(name: 'ProjectType')
  final int? projectType;
  @override
  @JsonKey(name: 'ListCostID')
  final int? listCostId;
  @override
  @JsonKey(name: 'PlanDateStart')
  final DateTime? planDateStart;
  @override
  @JsonKey(name: 'PlanDateEnd')
  final DateTime? planDateEnd;
  @override
  @JsonKey(name: 'ActualDateStart')
  final DateTime? actualDateStart;
  @override
  @JsonKey(name: 'ActualDateEnd')
  final DateTime? actualDateEnd;
  @override
  @JsonKey(name: 'EU')
  final String? eu;
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
  final DateTime? poDate;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
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
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  final int? typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'OvertimeProject(id: $id, customerId: $customerId, projectCode: $projectCode, projectName: $projectName, projectShortName: $projectShortName, projectStatus: $projectStatus, userId: $userId, userTechnicalId: $userTechnicalId, note: $note, isApproved: $isApproved, contactId: $contactId, po: $po, projectType: $projectType, listCostId: $listCostId, planDateStart: $planDateStart, planDateEnd: $planDateEnd, actualDateStart: $actualDateStart, actualDateEnd: $actualDateEnd, eu: $eu, projectManager: $projectManager, currentState: $currentState, priotity: $priotity, poDate: $poDate, endUser: $endUser, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, businessFieldId: $businessFieldId, typeProject: $typeProject, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeProjectImpl &&
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
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.po, po) || other.po == po) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.listCostId, listCostId) ||
                other.listCostId == listCostId) &&
            (identical(other.planDateStart, planDateStart) ||
                other.planDateStart == planDateStart) &&
            (identical(other.planDateEnd, planDateEnd) ||
                other.planDateEnd == planDateEnd) &&
            (identical(other.actualDateStart, actualDateStart) ||
                other.actualDateStart == actualDateStart) &&
            (identical(other.actualDateEnd, actualDateEnd) ||
                other.actualDateEnd == actualDateEnd) &&
            (identical(other.eu, eu) || other.eu == eu) &&
            (identical(other.projectManager, projectManager) ||
                other.projectManager == projectManager) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.priotity, priotity) ||
                other.priotity == priotity) &&
            (identical(other.poDate, poDate) || other.poDate == poDate) &&
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
                other.isDeleted == isDeleted));
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
        isApproved,
        contactId,
        po,
        projectType,
        listCostId,
        planDateStart,
        planDateEnd,
        actualDateStart,
        actualDateEnd,
        eu,
        projectManager,
        currentState,
        priotity,
        poDate,
        endUser,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        businessFieldId,
        typeProject,
        isDeleted
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeProjectImplCopyWith<_$OvertimeProjectImpl> get copyWith =>
      __$$OvertimeProjectImplCopyWithImpl<_$OvertimeProjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeProjectImplToJson(
      this,
    );
  }
}

abstract class _OvertimeProject implements OvertimeProject {
  const factory _OvertimeProject(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerID') final int? customerId,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProjectShortName') final String? projectShortName,
          @JsonKey(name: 'ProjectStatus') final int? projectStatus,
          @JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'UserTechnicalID') final int? userTechnicalId,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'IsApproved') final bool? isApproved,
          @JsonKey(name: 'ContactID') final int? contactId,
          @JsonKey(name: 'PO') final String? po,
          @JsonKey(name: 'ProjectType') final int? projectType,
          @JsonKey(name: 'ListCostID') final int? listCostId,
          @JsonKey(name: 'PlanDateStart') final DateTime? planDateStart,
          @JsonKey(name: 'PlanDateEnd') final DateTime? planDateEnd,
          @JsonKey(name: 'ActualDateStart') final DateTime? actualDateStart,
          @JsonKey(name: 'ActualDateEnd') final DateTime? actualDateEnd,
          @JsonKey(name: 'EU') final String? eu,
          @JsonKey(name: 'ProjectManager') final int? projectManager,
          @JsonKey(name: 'CurrentState') final String? currentState,
          @JsonKey(name: 'Priotity') final double? priotity,
          @JsonKey(name: 'PODate') final DateTime? poDate,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
          @JsonKey(name: 'TypeProject') final int? typeProject,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$OvertimeProjectImpl;

  factory _OvertimeProject.fromJson(Map<String, dynamic> json) =
      _$OvertimeProjectImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  bool? get isApproved;
  @override
  @JsonKey(name: 'ContactID')
  int? get contactId;
  @override
  @JsonKey(name: 'PO')
  String? get po;
  @override
  @JsonKey(name: 'ProjectType')
  int? get projectType;
  @override
  @JsonKey(name: 'ListCostID')
  int? get listCostId;
  @override
  @JsonKey(name: 'PlanDateStart')
  DateTime? get planDateStart;
  @override
  @JsonKey(name: 'PlanDateEnd')
  DateTime? get planDateEnd;
  @override
  @JsonKey(name: 'ActualDateStart')
  DateTime? get actualDateStart;
  @override
  @JsonKey(name: 'ActualDateEnd')
  DateTime? get actualDateEnd;
  @override
  @JsonKey(name: 'EU')
  String? get eu;
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
  DateTime? get poDate;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
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
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  int? get typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeProjectImplCopyWith<_$OvertimeProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OvertimeType _$OvertimeTypeFromJson(Map<String, dynamic> json) {
  return _OvertimeType.fromJson(json);
}

/// @nodoc
mixin _$OvertimeType {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeCode')
  String? get typeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Ratio')
  double? get ratio => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cost')
  double? get cost => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeTypeCopyWith<OvertimeType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeTypeCopyWith<$Res> {
  factory $OvertimeTypeCopyWith(
          OvertimeType value, $Res Function(OvertimeType) then) =
      _$OvertimeTypeCopyWithImpl<$Res, OvertimeType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'TypeCode') String? typeCode,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Ratio') double? ratio,
      @JsonKey(name: 'Cost') double? cost,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$OvertimeTypeCopyWithImpl<$Res, $Val extends OvertimeType>
    implements $OvertimeTypeCopyWith<$Res> {
  _$OvertimeTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeCode = freezed,
    Object? type = freezed,
    Object? ratio = freezed,
    Object? cost = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeCode: freezed == typeCode
          ? _value.typeCode
          : typeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ratio: freezed == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$OvertimeTypeImplCopyWith<$Res>
    implements $OvertimeTypeCopyWith<$Res> {
  factory _$$OvertimeTypeImplCopyWith(
          _$OvertimeTypeImpl value, $Res Function(_$OvertimeTypeImpl) then) =
      __$$OvertimeTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'TypeCode') String? typeCode,
      @JsonKey(name: 'Type') String? type,
      @JsonKey(name: 'Ratio') double? ratio,
      @JsonKey(name: 'Cost') double? cost,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$OvertimeTypeImplCopyWithImpl<$Res>
    extends _$OvertimeTypeCopyWithImpl<$Res, _$OvertimeTypeImpl>
    implements _$$OvertimeTypeImplCopyWith<$Res> {
  __$$OvertimeTypeImplCopyWithImpl(
      _$OvertimeTypeImpl _value, $Res Function(_$OvertimeTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeCode = freezed,
    Object? type = freezed,
    Object? ratio = freezed,
    Object? cost = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? note = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$OvertimeTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      typeCode: freezed == typeCode
          ? _value.typeCode
          : typeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      ratio: freezed == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$OvertimeTypeImpl implements _OvertimeType {
  const _$OvertimeTypeImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'TypeCode') this.typeCode,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'Ratio') this.ratio,
      @JsonKey(name: 'Cost') this.cost,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$OvertimeTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeTypeImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'TypeCode')
  final String? typeCode;
  @override
  @JsonKey(name: 'Type')
  final String? type;
  @override
  @JsonKey(name: 'Ratio')
  final double? ratio;
  @override
  @JsonKey(name: 'Cost')
  final double? cost;
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
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'OvertimeType(id: $id, typeCode: $typeCode, type: $type, ratio: $ratio, cost: $cost, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, note: $note, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.typeCode, typeCode) ||
                other.typeCode == typeCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, typeCode, type, ratio, cost,
      createdDate, createdBy, updatedDate, updatedBy, note, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeTypeImplCopyWith<_$OvertimeTypeImpl> get copyWith =>
      __$$OvertimeTypeImplCopyWithImpl<_$OvertimeTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeTypeImplToJson(
      this,
    );
  }
}

abstract class _OvertimeType implements OvertimeType {
  const factory _OvertimeType(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'TypeCode') final String? typeCode,
      @JsonKey(name: 'Type') final String? type,
      @JsonKey(name: 'Ratio') final double? ratio,
      @JsonKey(name: 'Cost') final double? cost,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted}) = _$OvertimeTypeImpl;

  factory _OvertimeType.fromJson(Map<String, dynamic> json) =
      _$OvertimeTypeImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'TypeCode')
  String? get typeCode;
  @override
  @JsonKey(name: 'Type')
  String? get type;
  @override
  @JsonKey(name: 'Ratio')
  double? get ratio;
  @override
  @JsonKey(name: 'Cost')
  double? get cost;
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
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeTypeImplCopyWith<_$OvertimeTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OvertimeDetailItem _$OvertimeDetailItemFromJson(Map<String, dynamic> json) {
  return _OvertimeDetailItem.fromJson(json);
}

/// @nodoc
mixin _$OvertimeDetailItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedID')
  int? get approvedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApprove')
  int? get declineApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'CostOvertime')
  double? get costOvertime => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonHREdit')
  String? get reasonHrEdit => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBgd => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBgdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBgd => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSeniorApproved')
  bool? get isSeniorApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedSeniorID')
  int? get approvedSeniorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApprovedSenitor')
  DateTime? get dateApprovedSenitor => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonDecilineSenior')
  String? get reasonDecilineSenior => throw _privateConstructorUsedError;
  @JsonKey(name: 'DecilineApproveSenior')
  int? get declineApproveSenior => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeDetailItemCopyWith<OvertimeDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeDetailItemCopyWith<$Res> {
  factory $OvertimeDetailItemCopyWith(
          OvertimeDetailItem value, $Res Function(OvertimeDetailItem) then) =
      _$OvertimeDetailItemCopyWithImpl<$Res, OvertimeDetailItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DecilineApprove') int? declineApprove,
      @JsonKey(name: 'CostOvertime') double? costOvertime,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'ReasonHREdit') String? reasonHrEdit,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBgd,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBgdId,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBgd,
      @JsonKey(name: 'IsSeniorApproved') bool? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorId,
      @JsonKey(name: 'DateApprovedSenitor') DateTime? dateApprovedSenitor,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
      @JsonKey(name: 'DecilineApproveSenior') int? declineApproveSenior});
}

/// @nodoc
class _$OvertimeDetailItemCopyWithImpl<$Res, $Val extends OvertimeDetailItem>
    implements $OvertimeDetailItemCopyWith<$Res> {
  _$OvertimeDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
    Object? projectItemId = freezed,
    Object? approvedId = freezed,
    Object? employeeId = freezed,
    Object? declineApprove = freezed,
    Object? costOvertime = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? reasonHrEdit = freezed,
    Object? isApprovedBgd = freezed,
    Object? approvedBgdId = freezed,
    Object? dateApprovedBgd = freezed,
    Object? isSeniorApproved = freezed,
    Object? approvedSeniorId = freezed,
    Object? dateApprovedSenitor = freezed,
    Object? isDeleted = freezed,
    Object? reasonDecilineSenior = freezed,
    Object? declineApproveSenior = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      declineApprove: freezed == declineApprove
          ? _value.declineApprove
          : declineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      costOvertime: freezed == costOvertime
          ? _value.costOvertime
          : costOvertime // ignore: cast_nullable_to_non_nullable
              as double?,
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
      reasonHrEdit: freezed == reasonHrEdit
          ? _value.reasonHrEdit
          : reasonHrEdit // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBgd: freezed == isApprovedBgd
          ? _value.isApprovedBgd
          : isApprovedBgd // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBgdId: freezed == approvedBgdId
          ? _value.approvedBgdId
          : approvedBgdId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedBgd: freezed == dateApprovedBgd
          ? _value.dateApprovedBgd
          : dateApprovedBgd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSeniorApproved: freezed == isSeniorApproved
          ? _value.isSeniorApproved
          : isSeniorApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedSeniorId: freezed == approvedSeniorId
          ? _value.approvedSeniorId
          : approvedSeniorId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedSenitor: freezed == dateApprovedSenitor
          ? _value.dateApprovedSenitor
          : dateApprovedSenitor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      reasonDecilineSenior: freezed == reasonDecilineSenior
          ? _value.reasonDecilineSenior
          : reasonDecilineSenior // ignore: cast_nullable_to_non_nullable
              as String?,
      declineApproveSenior: freezed == declineApproveSenior
          ? _value.declineApproveSenior
          : declineApproveSenior // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeDetailItemImplCopyWith<$Res>
    implements $OvertimeDetailItemCopyWith<$Res> {
  factory _$$OvertimeDetailItemImplCopyWith(_$OvertimeDetailItemImpl value,
          $Res Function(_$OvertimeDetailItemImpl) then) =
      __$$OvertimeDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'ApprovedID') int? approvedId,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DecilineApprove') int? declineApprove,
      @JsonKey(name: 'CostOvertime') double? costOvertime,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'ReasonHREdit') String? reasonHrEdit,
      @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBgd,
      @JsonKey(name: 'ApprovedBGDID') int? approvedBgdId,
      @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBgd,
      @JsonKey(name: 'IsSeniorApproved') bool? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorId,
      @JsonKey(name: 'DateApprovedSenitor') DateTime? dateApprovedSenitor,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
      @JsonKey(name: 'DecilineApproveSenior') int? declineApproveSenior});
}

/// @nodoc
class __$$OvertimeDetailItemImplCopyWithImpl<$Res>
    extends _$OvertimeDetailItemCopyWithImpl<$Res, _$OvertimeDetailItemImpl>
    implements _$$OvertimeDetailItemImplCopyWith<$Res> {
  __$$OvertimeDetailItemImplCopyWithImpl(_$OvertimeDetailItemImpl _value,
      $Res Function(_$OvertimeDetailItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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
    Object? projectItemId = freezed,
    Object? approvedId = freezed,
    Object? employeeId = freezed,
    Object? declineApprove = freezed,
    Object? costOvertime = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? reasonHrEdit = freezed,
    Object? isApprovedBgd = freezed,
    Object? approvedBgdId = freezed,
    Object? dateApprovedBgd = freezed,
    Object? isSeniorApproved = freezed,
    Object? approvedSeniorId = freezed,
    Object? dateApprovedSenitor = freezed,
    Object? isDeleted = freezed,
    Object? reasonDecilineSenior = freezed,
    Object? declineApproveSenior = freezed,
  }) {
    return _then(_$OvertimeDetailItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      approvedId: freezed == approvedId
          ? _value.approvedId
          : approvedId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      declineApprove: freezed == declineApprove
          ? _value.declineApprove
          : declineApprove // ignore: cast_nullable_to_non_nullable
              as int?,
      costOvertime: freezed == costOvertime
          ? _value.costOvertime
          : costOvertime // ignore: cast_nullable_to_non_nullable
              as double?,
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
      reasonHrEdit: freezed == reasonHrEdit
          ? _value.reasonHrEdit
          : reasonHrEdit // ignore: cast_nullable_to_non_nullable
              as String?,
      isApprovedBgd: freezed == isApprovedBgd
          ? _value.isApprovedBgd
          : isApprovedBgd // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBgdId: freezed == approvedBgdId
          ? _value.approvedBgdId
          : approvedBgdId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedBgd: freezed == dateApprovedBgd
          ? _value.dateApprovedBgd
          : dateApprovedBgd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSeniorApproved: freezed == isSeniorApproved
          ? _value.isSeniorApproved
          : isSeniorApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedSeniorId: freezed == approvedSeniorId
          ? _value.approvedSeniorId
          : approvedSeniorId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateApprovedSenitor: freezed == dateApprovedSenitor
          ? _value.dateApprovedSenitor
          : dateApprovedSenitor // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      reasonDecilineSenior: freezed == reasonDecilineSenior
          ? _value.reasonDecilineSenior
          : reasonDecilineSenior // ignore: cast_nullable_to_non_nullable
              as String?,
      declineApproveSenior: freezed == declineApproveSenior
          ? _value.declineApproveSenior
          : declineApproveSenior // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeDetailItemImpl implements _OvertimeDetailItem {
  const _$OvertimeDetailItemImpl(
      {@JsonKey(name: 'ID') this.id,
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
      @JsonKey(name: 'ProjectItemID') this.projectItemId,
      @JsonKey(name: 'ApprovedID') this.approvedId,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DecilineApprove') this.declineApprove,
      @JsonKey(name: 'CostOvertime') this.costOvertime,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'ReasonHREdit') this.reasonHrEdit,
      @JsonKey(name: 'IsApprovedBGD') this.isApprovedBgd,
      @JsonKey(name: 'ApprovedBGDID') this.approvedBgdId,
      @JsonKey(name: 'DateApprovedBGD') this.dateApprovedBgd,
      @JsonKey(name: 'IsSeniorApproved') this.isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') this.approvedSeniorId,
      @JsonKey(name: 'DateApprovedSenitor') this.dateApprovedSenitor,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'ReasonDecilineSenior') this.reasonDecilineSenior,
      @JsonKey(name: 'DecilineApproveSenior') this.declineApproveSenior});

  factory _$OvertimeDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeDetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
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
  @JsonKey(name: 'ProjectItemID')
  final int? projectItemId;
  @override
  @JsonKey(name: 'ApprovedID')
  final int? approvedId;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DecilineApprove')
  final int? declineApprove;
  @override
  @JsonKey(name: 'CostOvertime')
  final double? costOvertime;
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
  @JsonKey(name: 'ReasonHREdit')
  final String? reasonHrEdit;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  final bool? isApprovedBgd;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  final int? approvedBgdId;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  final DateTime? dateApprovedBgd;
  @override
  @JsonKey(name: 'IsSeniorApproved')
  final bool? isSeniorApproved;
  @override
  @JsonKey(name: 'ApprovedSeniorID')
  final int? approvedSeniorId;
  @override
  @JsonKey(name: 'DateApprovedSenitor')
  final DateTime? dateApprovedSenitor;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'ReasonDecilineSenior')
  final String? reasonDecilineSenior;
  @override
  @JsonKey(name: 'DecilineApproveSenior')
  final int? declineApproveSenior;

  @override
  String toString() {
    return 'OvertimeDetailItem(id: $id, isApprovedTbp: $isApprovedTbp, isApprovedHr: $isApprovedHr, employeeFullName: $employeeFullName, approvedTbp: $approvedTbp, approvedHr: $approvedHr, dateRegister: $dateRegister, typeId: $typeId, timeStart: $timeStart, endTime: $endTime, timeReality: $timeReality, totalTime: $totalTime, location: $location, locationText: $locationText, typeName: $typeName, note: $note, isApprovedText: $isApprovedText, reason: $reason, statusHr: $statusHr, statusTbp: $statusTbp, costOvernight: $costOvernight, projectName: $projectName, reasonDeciline: $reasonDeciline, overnight: $overnight, isProblem: $isProblem, fileName: $fileName, statusTbpText: $statusTbpText, statusHrText: $statusHrText, projectId: $projectId, projectItemId: $projectItemId, approvedId: $approvedId, employeeId: $employeeId, declineApprove: $declineApprove, costOvertime: $costOvertime, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, reasonHrEdit: $reasonHrEdit, isApprovedBgd: $isApprovedBgd, approvedBgdId: $approvedBgdId, dateApprovedBgd: $dateApprovedBgd, isSeniorApproved: $isSeniorApproved, approvedSeniorId: $approvedSeniorId, dateApprovedSenitor: $dateApprovedSenitor, isDeleted: $isDeleted, reasonDecilineSenior: $reasonDecilineSenior, declineApproveSenior: $declineApproveSenior)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeDetailItemImpl &&
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
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.approvedId, approvedId) ||
                other.approvedId == approvedId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.declineApprove, declineApprove) ||
                other.declineApprove == declineApprove) &&
            (identical(other.costOvertime, costOvertime) ||
                other.costOvertime == costOvertime) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.reasonHrEdit, reasonHrEdit) ||
                other.reasonHrEdit == reasonHrEdit) &&
            (identical(other.isApprovedBgd, isApprovedBgd) ||
                other.isApprovedBgd == isApprovedBgd) &&
            (identical(other.approvedBgdId, approvedBgdId) ||
                other.approvedBgdId == approvedBgdId) &&
            (identical(other.dateApprovedBgd, dateApprovedBgd) ||
                other.dateApprovedBgd == dateApprovedBgd) &&
            (identical(other.isSeniorApproved, isSeniorApproved) ||
                other.isSeniorApproved == isSeniorApproved) &&
            (identical(other.approvedSeniorId, approvedSeniorId) ||
                other.approvedSeniorId == approvedSeniorId) &&
            (identical(other.dateApprovedSenitor, dateApprovedSenitor) ||
                other.dateApprovedSenitor == dateApprovedSenitor) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.reasonDecilineSenior, reasonDecilineSenior) ||
                other.reasonDecilineSenior == reasonDecilineSenior) &&
            (identical(other.declineApproveSenior, declineApproveSenior) ||
                other.declineApproveSenior == declineApproveSenior));
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
        projectItemId,
        approvedId,
        employeeId,
        declineApprove,
        costOvertime,
        createdDate,
        createdBy,
        updatedDate,
        updatedBy,
        reasonHrEdit,
        isApprovedBgd,
        approvedBgdId,
        dateApprovedBgd,
        isSeniorApproved,
        approvedSeniorId,
        dateApprovedSenitor,
        isDeleted,
        reasonDecilineSenior,
        declineApproveSenior
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeDetailItemImplCopyWith<_$OvertimeDetailItemImpl> get copyWith =>
      __$$OvertimeDetailItemImplCopyWithImpl<_$OvertimeDetailItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeDetailItemImplToJson(
      this,
    );
  }
}

abstract class _OvertimeDetailItem implements OvertimeDetailItem {
  const factory _OvertimeDetailItem(
      {@JsonKey(name: 'ID') final int? id,
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
      @JsonKey(name: 'ProjectItemID') final int? projectItemId,
      @JsonKey(name: 'ApprovedID') final int? approvedId,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'DecilineApprove') final int? declineApprove,
      @JsonKey(name: 'CostOvertime') final double? costOvertime,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'ReasonHREdit') final String? reasonHrEdit,
      @JsonKey(name: 'IsApprovedBGD') final bool? isApprovedBgd,
      @JsonKey(name: 'ApprovedBGDID') final int? approvedBgdId,
      @JsonKey(name: 'DateApprovedBGD') final DateTime? dateApprovedBgd,
      @JsonKey(name: 'IsSeniorApproved') final bool? isSeniorApproved,
      @JsonKey(name: 'ApprovedSeniorID') final int? approvedSeniorId,
      @JsonKey(name: 'DateApprovedSenitor') final DateTime? dateApprovedSenitor,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'ReasonDecilineSenior') final String? reasonDecilineSenior,
      @JsonKey(name: 'DecilineApproveSenior')
      final int? declineApproveSenior}) = _$OvertimeDetailItemImpl;

  factory _OvertimeDetailItem.fromJson(Map<String, dynamic> json) =
      _$OvertimeDetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
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
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId;
  @override
  @JsonKey(name: 'ApprovedID')
  int? get approvedId;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DecilineApprove')
  int? get declineApprove;
  @override
  @JsonKey(name: 'CostOvertime')
  double? get costOvertime;
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
  @JsonKey(name: 'ReasonHREdit')
  String? get reasonHrEdit;
  @override
  @JsonKey(name: 'IsApprovedBGD')
  bool? get isApprovedBgd;
  @override
  @JsonKey(name: 'ApprovedBGDID')
  int? get approvedBgdId;
  @override
  @JsonKey(name: 'DateApprovedBGD')
  DateTime? get dateApprovedBgd;
  @override
  @JsonKey(name: 'IsSeniorApproved')
  bool? get isSeniorApproved;
  @override
  @JsonKey(name: 'ApprovedSeniorID')
  int? get approvedSeniorId;
  @override
  @JsonKey(name: 'DateApprovedSenitor')
  DateTime? get dateApprovedSenitor;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'ReasonDecilineSenior')
  String? get reasonDecilineSenior;
  @override
  @JsonKey(name: 'DecilineApproveSenior')
  int? get declineApproveSenior;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeDetailItemImplCopyWith<_$OvertimeDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OvertimeProjectItemLink _$OvertimeProjectItemLinkFromJson(
    Map<String, dynamic> json) {
  return _OvertimeProjectItemLink.fromJson(json);
}

/// @nodoc
mixin _$OvertimeProjectItemLink {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeOvertimeID')
  int? get employeeOvertimeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeProjectItemLinkCopyWith<OvertimeProjectItemLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeProjectItemLinkCopyWith<$Res> {
  factory $OvertimeProjectItemLinkCopyWith(OvertimeProjectItemLink value,
          $Res Function(OvertimeProjectItemLink) then) =
      _$OvertimeProjectItemLinkCopyWithImpl<$Res, OvertimeProjectItemLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class _$OvertimeProjectItemLinkCopyWithImpl<$Res,
        $Val extends OvertimeProjectItemLink>
    implements $OvertimeProjectItemLinkCopyWith<$Res> {
  _$OvertimeProjectItemLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeOvertimeId = freezed,
    Object? projectItemId = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeOvertimeId: freezed == employeeOvertimeId
          ? _value.employeeOvertimeId
          : employeeOvertimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeProjectItemLinkImplCopyWith<$Res>
    implements $OvertimeProjectItemLinkCopyWith<$Res> {
  factory _$$OvertimeProjectItemLinkImplCopyWith(
          _$OvertimeProjectItemLinkImpl value,
          $Res Function(_$OvertimeProjectItemLinkImpl) then) =
      __$$OvertimeProjectItemLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy});
}

/// @nodoc
class __$$OvertimeProjectItemLinkImplCopyWithImpl<$Res>
    extends _$OvertimeProjectItemLinkCopyWithImpl<$Res,
        _$OvertimeProjectItemLinkImpl>
    implements _$$OvertimeProjectItemLinkImplCopyWith<$Res> {
  __$$OvertimeProjectItemLinkImplCopyWithImpl(
      _$OvertimeProjectItemLinkImpl _value,
      $Res Function(_$OvertimeProjectItemLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeOvertimeId = freezed,
    Object? projectItemId = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$OvertimeProjectItemLinkImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeOvertimeId: freezed == employeeOvertimeId
          ? _value.employeeOvertimeId
          : employeeOvertimeId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeProjectItemLinkImpl implements _OvertimeProjectItemLink {
  const _$OvertimeProjectItemLinkImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeOvertimeID') this.employeeOvertimeId,
      @JsonKey(name: 'ProjectItemID') this.projectItemId,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy});

  factory _$OvertimeProjectItemLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeProjectItemLinkImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeOvertimeID')
  final int? employeeOvertimeId;
  @override
  @JsonKey(name: 'ProjectItemID')
  final int? projectItemId;
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
  String toString() {
    return 'OvertimeProjectItemLink(id: $id, employeeOvertimeId: $employeeOvertimeId, projectItemId: $projectItemId, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeProjectItemLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeOvertimeId, employeeOvertimeId) ||
                other.employeeOvertimeId == employeeOvertimeId) &&
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, employeeOvertimeId,
      projectItemId, createdDate, createdBy, updatedDate, updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeProjectItemLinkImplCopyWith<_$OvertimeProjectItemLinkImpl>
      get copyWith => __$$OvertimeProjectItemLinkImplCopyWithImpl<
          _$OvertimeProjectItemLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeProjectItemLinkImplToJson(
      this,
    );
  }
}

abstract class _OvertimeProjectItemLink implements OvertimeProjectItemLink {
  const factory _OvertimeProjectItemLink(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeOvertimeID') final int? employeeOvertimeId,
          @JsonKey(name: 'ProjectItemID') final int? projectItemId,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy}) =
      _$OvertimeProjectItemLinkImpl;

  factory _OvertimeProjectItemLink.fromJson(Map<String, dynamic> json) =
      _$OvertimeProjectItemLinkImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeOvertimeID')
  int? get employeeOvertimeId;
  @override
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId;
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
  @JsonKey(ignore: true)
  _$$OvertimeProjectItemLinkImplCopyWith<_$OvertimeProjectItemLinkImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OvertimeFileItem _$OvertimeFileItemFromJson(Map<String, dynamic> json) {
  return _OvertimeFileItem.fromJson(json);
}

/// @nodoc
mixin _$OvertimeFileItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeOvertimeID')
  int? get employeeOvertimeId => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeFileItemCopyWith<OvertimeFileItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeFileItemCopyWith<$Res> {
  factory $OvertimeFileItemCopyWith(
          OvertimeFileItem value, $Res Function(OvertimeFileItem) then) =
      _$OvertimeFileItemCopyWithImpl<$Res, OvertimeFileItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$OvertimeFileItemCopyWithImpl<$Res, $Val extends OvertimeFileItem>
    implements $OvertimeFileItemCopyWith<$Res> {
  _$OvertimeFileItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeOvertimeId = freezed,
    Object? fileName = freezed,
    Object? originPath = freezed,
    Object? serverPath = freezed,
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
      employeeOvertimeId: freezed == employeeOvertimeId
          ? _value.employeeOvertimeId
          : employeeOvertimeId // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeFileItemImplCopyWith<$Res>
    implements $OvertimeFileItemCopyWith<$Res> {
  factory _$$OvertimeFileItemImplCopyWith(_$OvertimeFileItemImpl value,
          $Res Function(_$OvertimeFileItemImpl) then) =
      __$$OvertimeFileItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
      @JsonKey(name: 'FileName') String? fileName,
      @JsonKey(name: 'OriginPath') String? originPath,
      @JsonKey(name: 'ServerPath') String? serverPath,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$OvertimeFileItemImplCopyWithImpl<$Res>
    extends _$OvertimeFileItemCopyWithImpl<$Res, _$OvertimeFileItemImpl>
    implements _$$OvertimeFileItemImplCopyWith<$Res> {
  __$$OvertimeFileItemImplCopyWithImpl(_$OvertimeFileItemImpl _value,
      $Res Function(_$OvertimeFileItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeOvertimeId = freezed,
    Object? fileName = freezed,
    Object? originPath = freezed,
    Object? serverPath = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$OvertimeFileItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeOvertimeId: freezed == employeeOvertimeId
          ? _value.employeeOvertimeId
          : employeeOvertimeId // ignore: cast_nullable_to_non_nullable
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeFileItemImpl implements _OvertimeFileItem {
  const _$OvertimeFileItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeOvertimeID') this.employeeOvertimeId,
      @JsonKey(name: 'FileName') this.fileName,
      @JsonKey(name: 'OriginPath') this.originPath,
      @JsonKey(name: 'ServerPath') this.serverPath,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$OvertimeFileItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeFileItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeOvertimeID')
  final int? employeeOvertimeId;
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
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'OvertimeFileItem(id: $id, employeeOvertimeId: $employeeOvertimeId, fileName: $fileName, originPath: $originPath, serverPath: $serverPath, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeFileItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeOvertimeId, employeeOvertimeId) ||
                other.employeeOvertimeId == employeeOvertimeId) &&
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
                other.updatedDate == updatedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeOvertimeId,
      fileName,
      originPath,
      serverPath,
      createdBy,
      createdDate,
      updatedBy,
      updatedDate,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeFileItemImplCopyWith<_$OvertimeFileItemImpl> get copyWith =>
      __$$OvertimeFileItemImplCopyWithImpl<_$OvertimeFileItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeFileItemImplToJson(
      this,
    );
  }
}

abstract class _OvertimeFileItem implements OvertimeFileItem {
  const factory _OvertimeFileItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeOvertimeID') final int? employeeOvertimeId,
          @JsonKey(name: 'FileName') final String? fileName,
          @JsonKey(name: 'OriginPath') final String? originPath,
          @JsonKey(name: 'ServerPath') final String? serverPath,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$OvertimeFileItemImpl;

  factory _OvertimeFileItem.fromJson(Map<String, dynamic> json) =
      _$OvertimeFileItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeOvertimeID')
  int? get employeeOvertimeId;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeFileItemImplCopyWith<_$OvertimeFileItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OvertimeDetailResponse _$OvertimeDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _OvertimeDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$OvertimeDetailResponse {
  @JsonKey(name: 'employeeOverTime')
  OvertimeDetailItem? get employeeOvertime =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'overTimeFile')
  OvertimeFileItem? get overTimeFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'overTimeProjectItem')
  OvertimeProjectItemLink? get overTimeProjectItem =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeDetailResponseCopyWith<OvertimeDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeDetailResponseCopyWith<$Res> {
  factory $OvertimeDetailResponseCopyWith(OvertimeDetailResponse value,
          $Res Function(OvertimeDetailResponse) then) =
      _$OvertimeDetailResponseCopyWithImpl<$Res, OvertimeDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'employeeOverTime') OvertimeDetailItem? employeeOvertime,
      @JsonKey(name: 'overTimeFile') OvertimeFileItem? overTimeFile,
      @JsonKey(name: 'overTimeProjectItem')
      OvertimeProjectItemLink? overTimeProjectItem});

  $OvertimeDetailItemCopyWith<$Res>? get employeeOvertime;
  $OvertimeFileItemCopyWith<$Res>? get overTimeFile;
  $OvertimeProjectItemLinkCopyWith<$Res>? get overTimeProjectItem;
}

/// @nodoc
class _$OvertimeDetailResponseCopyWithImpl<$Res,
        $Val extends OvertimeDetailResponse>
    implements $OvertimeDetailResponseCopyWith<$Res> {
  _$OvertimeDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeOvertime = freezed,
    Object? overTimeFile = freezed,
    Object? overTimeProjectItem = freezed,
  }) {
    return _then(_value.copyWith(
      employeeOvertime: freezed == employeeOvertime
          ? _value.employeeOvertime
          : employeeOvertime // ignore: cast_nullable_to_non_nullable
              as OvertimeDetailItem?,
      overTimeFile: freezed == overTimeFile
          ? _value.overTimeFile
          : overTimeFile // ignore: cast_nullable_to_non_nullable
              as OvertimeFileItem?,
      overTimeProjectItem: freezed == overTimeProjectItem
          ? _value.overTimeProjectItem
          : overTimeProjectItem // ignore: cast_nullable_to_non_nullable
              as OvertimeProjectItemLink?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OvertimeDetailItemCopyWith<$Res>? get employeeOvertime {
    if (_value.employeeOvertime == null) {
      return null;
    }

    return $OvertimeDetailItemCopyWith<$Res>(_value.employeeOvertime!, (value) {
      return _then(_value.copyWith(employeeOvertime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OvertimeFileItemCopyWith<$Res>? get overTimeFile {
    if (_value.overTimeFile == null) {
      return null;
    }

    return $OvertimeFileItemCopyWith<$Res>(_value.overTimeFile!, (value) {
      return _then(_value.copyWith(overTimeFile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OvertimeProjectItemLinkCopyWith<$Res>? get overTimeProjectItem {
    if (_value.overTimeProjectItem == null) {
      return null;
    }

    return $OvertimeProjectItemLinkCopyWith<$Res>(_value.overTimeProjectItem!,
        (value) {
      return _then(_value.copyWith(overTimeProjectItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OvertimeDetailResponseImplCopyWith<$Res>
    implements $OvertimeDetailResponseCopyWith<$Res> {
  factory _$$OvertimeDetailResponseImplCopyWith(
          _$OvertimeDetailResponseImpl value,
          $Res Function(_$OvertimeDetailResponseImpl) then) =
      __$$OvertimeDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'employeeOverTime') OvertimeDetailItem? employeeOvertime,
      @JsonKey(name: 'overTimeFile') OvertimeFileItem? overTimeFile,
      @JsonKey(name: 'overTimeProjectItem')
      OvertimeProjectItemLink? overTimeProjectItem});

  @override
  $OvertimeDetailItemCopyWith<$Res>? get employeeOvertime;
  @override
  $OvertimeFileItemCopyWith<$Res>? get overTimeFile;
  @override
  $OvertimeProjectItemLinkCopyWith<$Res>? get overTimeProjectItem;
}

/// @nodoc
class __$$OvertimeDetailResponseImplCopyWithImpl<$Res>
    extends _$OvertimeDetailResponseCopyWithImpl<$Res,
        _$OvertimeDetailResponseImpl>
    implements _$$OvertimeDetailResponseImplCopyWith<$Res> {
  __$$OvertimeDetailResponseImplCopyWithImpl(
      _$OvertimeDetailResponseImpl _value,
      $Res Function(_$OvertimeDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeOvertime = freezed,
    Object? overTimeFile = freezed,
    Object? overTimeProjectItem = freezed,
  }) {
    return _then(_$OvertimeDetailResponseImpl(
      employeeOvertime: freezed == employeeOvertime
          ? _value.employeeOvertime
          : employeeOvertime // ignore: cast_nullable_to_non_nullable
              as OvertimeDetailItem?,
      overTimeFile: freezed == overTimeFile
          ? _value.overTimeFile
          : overTimeFile // ignore: cast_nullable_to_non_nullable
              as OvertimeFileItem?,
      overTimeProjectItem: freezed == overTimeProjectItem
          ? _value.overTimeProjectItem
          : overTimeProjectItem // ignore: cast_nullable_to_non_nullable
              as OvertimeProjectItemLink?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeDetailResponseImpl implements _OvertimeDetailResponse {
  const _$OvertimeDetailResponseImpl(
      {@JsonKey(name: 'employeeOverTime') this.employeeOvertime,
      @JsonKey(name: 'overTimeFile') this.overTimeFile,
      @JsonKey(name: 'overTimeProjectItem') this.overTimeProjectItem});

  factory _$OvertimeDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'employeeOverTime')
  final OvertimeDetailItem? employeeOvertime;
  @override
  @JsonKey(name: 'overTimeFile')
  final OvertimeFileItem? overTimeFile;
  @override
  @JsonKey(name: 'overTimeProjectItem')
  final OvertimeProjectItemLink? overTimeProjectItem;

  @override
  String toString() {
    return 'OvertimeDetailResponse(employeeOvertime: $employeeOvertime, overTimeFile: $overTimeFile, overTimeProjectItem: $overTimeProjectItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeDetailResponseImpl &&
            (identical(other.employeeOvertime, employeeOvertime) ||
                other.employeeOvertime == employeeOvertime) &&
            (identical(other.overTimeFile, overTimeFile) ||
                other.overTimeFile == overTimeFile) &&
            (identical(other.overTimeProjectItem, overTimeProjectItem) ||
                other.overTimeProjectItem == overTimeProjectItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, employeeOvertime, overTimeFile, overTimeProjectItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeDetailResponseImplCopyWith<_$OvertimeDetailResponseImpl>
      get copyWith => __$$OvertimeDetailResponseImplCopyWithImpl<
          _$OvertimeDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _OvertimeDetailResponse implements OvertimeDetailResponse {
  const factory _OvertimeDetailResponse(
          {@JsonKey(name: 'employeeOverTime')
          final OvertimeDetailItem? employeeOvertime,
          @JsonKey(name: 'overTimeFile') final OvertimeFileItem? overTimeFile,
          @JsonKey(name: 'overTimeProjectItem')
          final OvertimeProjectItemLink? overTimeProjectItem}) =
      _$OvertimeDetailResponseImpl;

  factory _OvertimeDetailResponse.fromJson(Map<String, dynamic> json) =
      _$OvertimeDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'employeeOverTime')
  OvertimeDetailItem? get employeeOvertime;
  @override
  @JsonKey(name: 'overTimeFile')
  OvertimeFileItem? get overTimeFile;
  @override
  @JsonKey(name: 'overTimeProjectItem')
  OvertimeProjectItemLink? get overTimeProjectItem;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeDetailResponseImplCopyWith<_$OvertimeDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OvertimeProjectItem _$OvertimeProjectItemFromJson(Map<String, dynamic> json) {
  return _OvertimeProjectItem.fromJson(json);
}

/// @nodoc
mixin _$OvertimeProjectItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String? get mission => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentageActual')
  double? get percentageActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanStartDate')
  DateTime? get planStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanEndDate')
  DateTime? get planEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsCheckedToday')
  int? get isCheckedToday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OvertimeProjectItemCopyWith<OvertimeProjectItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeProjectItemCopyWith<$Res> {
  factory $OvertimeProjectItemCopyWith(
          OvertimeProjectItem value, $Res Function(OvertimeProjectItem) then) =
      _$OvertimeProjectItemCopyWithImpl<$Res, OvertimeProjectItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
      @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'IsCheckedToday') int? isCheckedToday});
}

/// @nodoc
class _$OvertimeProjectItemCopyWithImpl<$Res, $Val extends OvertimeProjectItem>
    implements $OvertimeProjectItemCopyWith<$Res> {
  _$OvertimeProjectItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? mission = freezed,
    Object? percentageActual = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? employeeId = freezed,
    Object? isCheckedToday = freezed,
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
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      percentageActual: freezed == percentageActual
          ? _value.percentageActual
          : percentageActual // ignore: cast_nullable_to_non_nullable
              as double?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as double?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isCheckedToday: freezed == isCheckedToday
          ? _value.isCheckedToday
          : isCheckedToday // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeProjectItemImplCopyWith<$Res>
    implements $OvertimeProjectItemCopyWith<$Res> {
  factory _$$OvertimeProjectItemImplCopyWith(_$OvertimeProjectItemImpl value,
          $Res Function(_$OvertimeProjectItemImpl) then) =
      __$$OvertimeProjectItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
      @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'IsCheckedToday') int? isCheckedToday});
}

/// @nodoc
class __$$OvertimeProjectItemImplCopyWithImpl<$Res>
    extends _$OvertimeProjectItemCopyWithImpl<$Res, _$OvertimeProjectItemImpl>
    implements _$$OvertimeProjectItemImplCopyWith<$Res> {
  __$$OvertimeProjectItemImplCopyWithImpl(_$OvertimeProjectItemImpl _value,
      $Res Function(_$OvertimeProjectItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = freezed,
    Object? mission = freezed,
    Object? percentageActual = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? employeeId = freezed,
    Object? isCheckedToday = freezed,
  }) {
    return _then(_$OvertimeProjectItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      percentageActual: freezed == percentageActual
          ? _value.percentageActual
          : percentageActual // ignore: cast_nullable_to_non_nullable
              as double?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as double?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isCheckedToday: freezed == isCheckedToday
          ? _value.isCheckedToday
          : isCheckedToday // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeProjectItemImpl implements _OvertimeProjectItem {
  const _$OvertimeProjectItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Mission') this.mission,
      @JsonKey(name: 'PercentageActual') this.percentageActual,
      @JsonKey(name: 'PlanStartDate') this.planStartDate,
      @JsonKey(name: 'PlanEndDate') this.planEndDate,
      @JsonKey(name: 'TotalDayPlan') this.totalDayPlan,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'IsCheckedToday') this.isCheckedToday});

  factory _$OvertimeProjectItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeProjectItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Mission')
  final String? mission;
  @override
  @JsonKey(name: 'PercentageActual')
  final double? percentageActual;
  @override
  @JsonKey(name: 'PlanStartDate')
  final DateTime? planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  final DateTime? planEndDate;
  @override
  @JsonKey(name: 'TotalDayPlan')
  final double? totalDayPlan;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'IsCheckedToday')
  final int? isCheckedToday;

  @override
  String toString() {
    return 'OvertimeProjectItem(id: $id, code: $code, mission: $mission, percentageActual: $percentageActual, planStartDate: $planStartDate, planEndDate: $planEndDate, totalDayPlan: $totalDayPlan, employeeId: $employeeId, isCheckedToday: $isCheckedToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeProjectItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.percentageActual, percentageActual) ||
                other.percentageActual == percentageActual) &&
            (identical(other.planStartDate, planStartDate) ||
                other.planStartDate == planStartDate) &&
            (identical(other.planEndDate, planEndDate) ||
                other.planEndDate == planEndDate) &&
            (identical(other.totalDayPlan, totalDayPlan) ||
                other.totalDayPlan == totalDayPlan) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.isCheckedToday, isCheckedToday) ||
                other.isCheckedToday == isCheckedToday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      mission,
      percentageActual,
      planStartDate,
      planEndDate,
      totalDayPlan,
      employeeId,
      isCheckedToday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeProjectItemImplCopyWith<_$OvertimeProjectItemImpl> get copyWith =>
      __$$OvertimeProjectItemImplCopyWithImpl<_$OvertimeProjectItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeProjectItemImplToJson(
      this,
    );
  }
}

abstract class _OvertimeProjectItem implements OvertimeProjectItem {
  const factory _OvertimeProjectItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'Mission') final String? mission,
          @JsonKey(name: 'PercentageActual') final double? percentageActual,
          @JsonKey(name: 'PlanStartDate') final DateTime? planStartDate,
          @JsonKey(name: 'PlanEndDate') final DateTime? planEndDate,
          @JsonKey(name: 'TotalDayPlan') final double? totalDayPlan,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'IsCheckedToday') final int? isCheckedToday}) =
      _$OvertimeProjectItemImpl;

  factory _OvertimeProjectItem.fromJson(Map<String, dynamic> json) =
      _$OvertimeProjectItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Mission')
  String? get mission;
  @override
  @JsonKey(name: 'PercentageActual')
  double? get percentageActual;
  @override
  @JsonKey(name: 'PlanStartDate')
  DateTime? get planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  DateTime? get planEndDate;
  @override
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'IsCheckedToday')
  int? get isCheckedToday;
  @override
  @JsonKey(ignore: true)
  _$$OvertimeProjectItemImplCopyWith<_$OvertimeProjectItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FillApproverItem _$FillApproverItemFromJson(Map<String, dynamic> json) {
  return _FillApproverItem.fromJson(json);
}

/// @nodoc
mixin _$FillApproverItem {
  @JsonKey(name: 'ApproveID')
  int get approveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FillApproverItemCopyWith<FillApproverItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FillApproverItemCopyWith<$Res> {
  factory $FillApproverItemCopyWith(
          FillApproverItem value, $Res Function(FillApproverItem) then) =
      _$FillApproverItemCopyWithImpl<$Res, FillApproverItem>;
  @useResult
  $Res call({@JsonKey(name: 'ApproveID') int approveId});
}

/// @nodoc
class _$FillApproverItemCopyWithImpl<$Res, $Val extends FillApproverItem>
    implements $FillApproverItemCopyWith<$Res> {
  _$FillApproverItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approveId = null,
  }) {
    return _then(_value.copyWith(
      approveId: null == approveId
          ? _value.approveId
          : approveId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FillApproverItemImplCopyWith<$Res>
    implements $FillApproverItemCopyWith<$Res> {
  factory _$$FillApproverItemImplCopyWith(_$FillApproverItemImpl value,
          $Res Function(_$FillApproverItemImpl) then) =
      __$$FillApproverItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'ApproveID') int approveId});
}

/// @nodoc
class __$$FillApproverItemImplCopyWithImpl<$Res>
    extends _$FillApproverItemCopyWithImpl<$Res, _$FillApproverItemImpl>
    implements _$$FillApproverItemImplCopyWith<$Res> {
  __$$FillApproverItemImplCopyWithImpl(_$FillApproverItemImpl _value,
      $Res Function(_$FillApproverItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approveId = null,
  }) {
    return _then(_$FillApproverItemImpl(
      approveId: null == approveId
          ? _value.approveId
          : approveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FillApproverItemImpl implements _FillApproverItem {
  const _$FillApproverItemImpl(
      {@JsonKey(name: 'ApproveID') required this.approveId});

  factory _$FillApproverItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FillApproverItemImplFromJson(json);

  @override
  @JsonKey(name: 'ApproveID')
  final int approveId;

  @override
  String toString() {
    return 'FillApproverItem(approveId: $approveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FillApproverItemImpl &&
            (identical(other.approveId, approveId) ||
                other.approveId == approveId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, approveId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FillApproverItemImplCopyWith<_$FillApproverItemImpl> get copyWith =>
      __$$FillApproverItemImplCopyWithImpl<_$FillApproverItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FillApproverItemImplToJson(
      this,
    );
  }
}

abstract class _FillApproverItem implements FillApproverItem {
  const factory _FillApproverItem(
          {@JsonKey(name: 'ApproveID') required final int approveId}) =
      _$FillApproverItemImpl;

  factory _FillApproverItem.fromJson(Map<String, dynamic> json) =
      _$FillApproverItemImpl.fromJson;

  @override
  @JsonKey(name: 'ApproveID')
  int get approveId;
  @override
  @JsonKey(ignore: true)
  _$$FillApproverItemImplCopyWith<_$FillApproverItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
