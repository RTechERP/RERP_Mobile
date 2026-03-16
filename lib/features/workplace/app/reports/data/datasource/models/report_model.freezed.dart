// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) {
  return _ReportRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportRequest {
  @JsonKey(name: 'DateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'TeamID')
  String get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Keyword')
  String get keyword => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  String get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportRequestCopyWith<ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportRequestCopyWith<$Res> {
  factory $ReportRequestCopyWith(
          ReportRequest value, $Res Function(ReportRequest) then) =
      _$ReportRequestCopyWithImpl<$Res, ReportRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'TeamID') String teamId,
      @JsonKey(name: 'UserID') String userId,
      @JsonKey(name: 'Keyword') String keyword,
      @JsonKey(name: 'DepartmentID') String departmentId});
}

/// @nodoc
class _$ReportRequestCopyWithImpl<$Res, $Val extends ReportRequest>
    implements $ReportRequestCopyWith<$Res> {
  _$ReportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? teamId = null,
    Object? userId = null,
    Object? keyword = null,
    Object? departmentId = null,
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
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportRequestImplCopyWith<$Res>
    implements $ReportRequestCopyWith<$Res> {
  factory _$$ReportRequestImplCopyWith(
          _$ReportRequestImpl value, $Res Function(_$ReportRequestImpl) then) =
      __$$ReportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'TeamID') String teamId,
      @JsonKey(name: 'UserID') String userId,
      @JsonKey(name: 'Keyword') String keyword,
      @JsonKey(name: 'DepartmentID') String departmentId});
}

/// @nodoc
class __$$ReportRequestImplCopyWithImpl<$Res>
    extends _$ReportRequestCopyWithImpl<$Res, _$ReportRequestImpl>
    implements _$$ReportRequestImplCopyWith<$Res> {
  __$$ReportRequestImplCopyWithImpl(
      _$ReportRequestImpl _value, $Res Function(_$ReportRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? teamId = null,
    Object? userId = null,
    Object? keyword = null,
    Object? departmentId = null,
  }) {
    return _then(_$ReportRequestImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportRequestImpl implements _ReportRequest {
  const _$ReportRequestImpl(
      {@JsonKey(name: 'DateStart') required this.dateStart,
      @JsonKey(name: 'DateEnd') required this.dateEnd,
      @JsonKey(name: 'TeamID') required this.teamId,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'Keyword') required this.keyword,
      @JsonKey(name: 'DepartmentID') required this.departmentId});

  factory _$ReportRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportRequestImplFromJson(json);

  @override
  @JsonKey(name: 'DateStart')
  final DateTime dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime dateEnd;
  @override
  @JsonKey(name: 'TeamID')
  final String teamId;
  @override
  @JsonKey(name: 'UserID')
  final String userId;
  @override
  @JsonKey(name: 'Keyword')
  final String keyword;
  @override
  @JsonKey(name: 'DepartmentID')
  final String departmentId;

  @override
  String toString() {
    return 'ReportRequest(dateStart: $dateStart, dateEnd: $dateEnd, teamId: $teamId, userId: $userId, keyword: $keyword, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportRequestImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateStart, dateEnd, teamId, userId, keyword, departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportRequestImplCopyWith<_$ReportRequestImpl> get copyWith =>
      __$$ReportRequestImplCopyWithImpl<_$ReportRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportRequestImplToJson(
      this,
    );
  }
}

abstract class _ReportRequest implements ReportRequest {
  const factory _ReportRequest(
          {@JsonKey(name: 'DateStart') required final DateTime dateStart,
          @JsonKey(name: 'DateEnd') required final DateTime dateEnd,
          @JsonKey(name: 'TeamID') required final String teamId,
          @JsonKey(name: 'UserID') required final String userId,
          @JsonKey(name: 'Keyword') required final String keyword,
          @JsonKey(name: 'DepartmentID') required final String departmentId}) =
      _$ReportRequestImpl;

  factory _ReportRequest.fromJson(Map<String, dynamic> json) =
      _$ReportRequestImpl.fromJson;

  @override
  @JsonKey(name: 'DateStart')
  DateTime get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd;
  @override
  @JsonKey(name: 'TeamID')
  String get teamId;
  @override
  @JsonKey(name: 'UserID')
  String get userId;
  @override
  @JsonKey(name: 'Keyword')
  String get keyword;
  @override
  @JsonKey(name: 'DepartmentID')
  String get departmentId;
  @override
  @JsonKey(ignore: true)
  _$$ReportRequestImplCopyWith<_$ReportRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) {
  return _ReportResponse.fromJson(json);
}

/// @nodoc
mixin _$ReportResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectText')
  String? get projectText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String? get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String? get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeText')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionName')
  String get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String get mission => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemCode')
  String get projectItemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemName')
  String? get projectItemName =>
      throw _privateConstructorUsedError; // 🔧 thêm field
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentComplete')
  double get percentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDate')
  DateTime? get holidayDate => throw _privateConstructorUsedError;

  /// ⚠️ API trả "" → nên để String? rồi tự parse khi cần
  @JsonKey(name: 'PlanStartDate')
  String? get planStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanEndDate')
  String? get planEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualStartDate')
  String? get actualStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualEndDate')
  String? get actualEndDate => throw _privateConstructorUsedError;

  /// API trả 0.0
  @JsonKey(name: 'TotalDayPlan')
  int? get totalDayPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayActual')
  int? get totalDayActual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportResponseCopyWith<ReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportResponseCopyWith<$Res> {
  factory $ReportResponseCopyWith(
          ReportResponse value, $Res Function(ReportResponse) then) =
      _$ReportResponseCopyWithImpl<$Res, ReportResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'PositionName') String positionName,
      @JsonKey(name: 'Mission') String mission,
      @JsonKey(name: 'ProjectItemCode') String projectItemCode,
      @JsonKey(name: 'ProjectItemName') String? projectItemName,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'PercentComplete') double percentComplete,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
      @JsonKey(name: 'PlanStartDate') String? planStartDate,
      @JsonKey(name: 'PlanEndDate') String? planEndDate,
      @JsonKey(name: 'ActualStartDate') String? actualStartDate,
      @JsonKey(name: 'ActualEndDate') String? actualEndDate,
      @JsonKey(name: 'TotalDayPlan') int? totalDayPlan,
      @JsonKey(name: 'TotalDayActual') int? totalDayActual});
}

/// @nodoc
class _$ReportResponseCopyWithImpl<$Res, $Val extends ReportResponse>
    implements $ReportResponseCopyWith<$Res> {
  _$ReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? fullName = null,
    Object? userId = null,
    Object? dateReport = null,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectText = freezed,
    Object? totalHours = null,
    Object? results = null,
    Object? planNextDay = null,
    Object? backlog = freezed,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? positionName = null,
    Object? mission = null,
    Object? projectItemCode = null,
    Object? projectItemName = freezed,
    Object? content = null,
    Object? percentComplete = null,
    Object? totalHourOT = freezed,
    Object? holidayDate = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? totalDayActual = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      mission: null == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemCode: null == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemName: freezed == projectItemName
          ? _value.projectItemName
          : projectItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as double,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportResponseImplCopyWith<$Res>
    implements $ReportResponseCopyWith<$Res> {
  factory _$$ReportResponseImplCopyWith(_$ReportResponseImpl value,
          $Res Function(_$ReportResponseImpl) then) =
      __$$ReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'PositionName') String positionName,
      @JsonKey(name: 'Mission') String mission,
      @JsonKey(name: 'ProjectItemCode') String projectItemCode,
      @JsonKey(name: 'ProjectItemName') String? projectItemName,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'PercentComplete') double percentComplete,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'HolidayDate') DateTime? holidayDate,
      @JsonKey(name: 'PlanStartDate') String? planStartDate,
      @JsonKey(name: 'PlanEndDate') String? planEndDate,
      @JsonKey(name: 'ActualStartDate') String? actualStartDate,
      @JsonKey(name: 'ActualEndDate') String? actualEndDate,
      @JsonKey(name: 'TotalDayPlan') int? totalDayPlan,
      @JsonKey(name: 'TotalDayActual') int? totalDayActual});
}

/// @nodoc
class __$$ReportResponseImplCopyWithImpl<$Res>
    extends _$ReportResponseCopyWithImpl<$Res, _$ReportResponseImpl>
    implements _$$ReportResponseImplCopyWith<$Res> {
  __$$ReportResponseImplCopyWithImpl(
      _$ReportResponseImpl _value, $Res Function(_$ReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? fullName = null,
    Object? userId = null,
    Object? dateReport = null,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectText = freezed,
    Object? totalHours = null,
    Object? results = null,
    Object? planNextDay = null,
    Object? backlog = freezed,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? positionName = null,
    Object? mission = null,
    Object? projectItemCode = null,
    Object? projectItemName = freezed,
    Object? content = null,
    Object? percentComplete = null,
    Object? totalHourOT = freezed,
    Object? holidayDate = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? totalDayActual = freezed,
  }) {
    return _then(_$ReportResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: null == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String,
      mission: null == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemCode: null == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemName: freezed == projectItemName
          ? _value.projectItemName
          : projectItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as double,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportResponseImpl implements _ReportResponse {
  const _$ReportResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'FullName') required this.fullName,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectText') this.projectText,
      @JsonKey(name: 'TotalHours') required this.totalHours,
      @JsonKey(name: 'Results') required this.results,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Backlog') this.backlog,
      @JsonKey(name: 'Problem') this.problem,
      @JsonKey(name: 'ProblemSolve') this.problemSolve,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'TypeText') this.typeText,
      @JsonKey(name: 'PositionName') required this.positionName,
      @JsonKey(name: 'Mission') required this.mission,
      @JsonKey(name: 'ProjectItemCode') required this.projectItemCode,
      @JsonKey(name: 'ProjectItemName') this.projectItemName,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'PercentComplete') required this.percentComplete,
      @JsonKey(name: 'TotalHourOT') this.totalHourOT,
      @JsonKey(name: 'HolidayDate') this.holidayDate,
      @JsonKey(name: 'PlanStartDate') this.planStartDate,
      @JsonKey(name: 'PlanEndDate') this.planEndDate,
      @JsonKey(name: 'ActualStartDate') this.actualStartDate,
      @JsonKey(name: 'ActualEndDate') this.actualEndDate,
      @JsonKey(name: 'TotalDayPlan') this.totalDayPlan,
      @JsonKey(name: 'TotalDayActual') this.totalDayActual});

  factory _$ReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'FullName')
  final String fullName;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ProjectText')
  final String? projectText;
  @override
  @JsonKey(name: 'TotalHours')
  final double totalHours;
  @override
  @JsonKey(name: 'Results')
  final String results;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Backlog')
  final String? backlog;
  @override
  @JsonKey(name: 'Problem')
  final String? problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String? problemSolve;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'TypeText')
  final String? typeText;
  @override
  @JsonKey(name: 'PositionName')
  final String positionName;
  @override
  @JsonKey(name: 'Mission')
  final String mission;
  @override
  @JsonKey(name: 'ProjectItemCode')
  final String projectItemCode;
  @override
  @JsonKey(name: 'ProjectItemName')
  final String? projectItemName;
// 🔧 thêm field
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'PercentComplete')
  final double percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  final double? totalHourOT;
  @override
  @JsonKey(name: 'HolidayDate')
  final DateTime? holidayDate;

  /// ⚠️ API trả "" → nên để String? rồi tự parse khi cần
  @override
  @JsonKey(name: 'PlanStartDate')
  final String? planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  final String? planEndDate;
  @override
  @JsonKey(name: 'ActualStartDate')
  final String? actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  final String? actualEndDate;

  /// API trả 0.0
  @override
  @JsonKey(name: 'TotalDayPlan')
  final int? totalDayPlan;
  @override
  @JsonKey(name: 'TotalDayActual')
  final int? totalDayActual;

  @override
  String toString() {
    return 'ReportResponse(id: $id, code: $code, fullName: $fullName, userId: $userId, dateReport: $dateReport, projectCode: $projectCode, projectName: $projectName, projectText: $projectText, totalHours: $totalHours, results: $results, planNextDay: $planNextDay, backlog: $backlog, problem: $problem, problemSolve: $problemSolve, note: $note, createdDate: $createdDate, type: $type, typeText: $typeText, positionName: $positionName, mission: $mission, projectItemCode: $projectItemCode, projectItemName: $projectItemName, content: $content, percentComplete: $percentComplete, totalHourOT: $totalHourOT, holidayDate: $holidayDate, planStartDate: $planStartDate, planEndDate: $planEndDate, actualStartDate: $actualStartDate, actualEndDate: $actualEndDate, totalDayPlan: $totalDayPlan, totalDayActual: $totalDayActual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectText, projectText) ||
                other.projectText == projectText) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.projectItemCode, projectItemCode) ||
                other.projectItemCode == projectItemCode) &&
            (identical(other.projectItemName, projectItemName) ||
                other.projectItemName == projectItemName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.holidayDate, holidayDate) ||
                other.holidayDate == holidayDate) &&
            (identical(other.planStartDate, planStartDate) ||
                other.planStartDate == planStartDate) &&
            (identical(other.planEndDate, planEndDate) ||
                other.planEndDate == planEndDate) &&
            (identical(other.actualStartDate, actualStartDate) ||
                other.actualStartDate == actualStartDate) &&
            (identical(other.actualEndDate, actualEndDate) ||
                other.actualEndDate == actualEndDate) &&
            (identical(other.totalDayPlan, totalDayPlan) ||
                other.totalDayPlan == totalDayPlan) &&
            (identical(other.totalDayActual, totalDayActual) ||
                other.totalDayActual == totalDayActual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        code,
        fullName,
        userId,
        dateReport,
        projectCode,
        projectName,
        projectText,
        totalHours,
        results,
        planNextDay,
        backlog,
        problem,
        problemSolve,
        note,
        createdDate,
        type,
        typeText,
        positionName,
        mission,
        projectItemCode,
        projectItemName,
        content,
        percentComplete,
        totalHourOT,
        holidayDate,
        planStartDate,
        planEndDate,
        actualStartDate,
        actualEndDate,
        totalDayPlan,
        totalDayActual
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportResponseImplCopyWith<_$ReportResponseImpl> get copyWith =>
      __$$ReportResponseImplCopyWithImpl<_$ReportResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportResponseImplToJson(
      this,
    );
  }
}

abstract class _ReportResponse implements ReportResponse {
  const factory _ReportResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Code') required final String code,
      @JsonKey(name: 'FullName') required final String fullName,
      @JsonKey(name: 'UserID') required final int userId,
      @JsonKey(name: 'DateReport') required final String dateReport,
      @JsonKey(name: 'ProjectCode') final String? projectCode,
      @JsonKey(name: 'ProjectName') final String? projectName,
      @JsonKey(name: 'ProjectText') final String? projectText,
      @JsonKey(name: 'TotalHours') required final double totalHours,
      @JsonKey(name: 'Results') required final String results,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Backlog') final String? backlog,
      @JsonKey(name: 'Problem') final String? problem,
      @JsonKey(name: 'ProblemSolve') final String? problemSolve,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'Type') final int? type,
      @JsonKey(name: 'TypeText') final String? typeText,
      @JsonKey(name: 'PositionName') required final String positionName,
      @JsonKey(name: 'Mission') required final String mission,
      @JsonKey(name: 'ProjectItemCode') required final String projectItemCode,
      @JsonKey(name: 'ProjectItemName') final String? projectItemName,
      @JsonKey(name: 'Content') required final String content,
      @JsonKey(name: 'PercentComplete') required final double percentComplete,
      @JsonKey(name: 'TotalHourOT') final double? totalHourOT,
      @JsonKey(name: 'HolidayDate') final DateTime? holidayDate,
      @JsonKey(name: 'PlanStartDate') final String? planStartDate,
      @JsonKey(name: 'PlanEndDate') final String? planEndDate,
      @JsonKey(name: 'ActualStartDate') final String? actualStartDate,
      @JsonKey(name: 'ActualEndDate') final String? actualEndDate,
      @JsonKey(name: 'TotalDayPlan') final int? totalDayPlan,
      @JsonKey(name: 'TotalDayActual')
      final int? totalDayActual}) = _$ReportResponseImpl;

  factory _ReportResponse.fromJson(Map<String, dynamic> json) =
      _$ReportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'FullName')
  String get fullName;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ProjectText')
  String? get projectText;
  @override
  @JsonKey(name: 'TotalHours')
  double get totalHours;
  @override
  @JsonKey(name: 'Results')
  String get results;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Backlog')
  String? get backlog;
  @override
  @JsonKey(name: 'Problem')
  String? get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'TypeText')
  String? get typeText;
  @override
  @JsonKey(name: 'PositionName')
  String get positionName;
  @override
  @JsonKey(name: 'Mission')
  String get mission;
  @override
  @JsonKey(name: 'ProjectItemCode')
  String get projectItemCode;
  @override
  @JsonKey(name: 'ProjectItemName')
  String? get projectItemName;
  @override // 🔧 thêm field
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'PercentComplete')
  double get percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT;
  @override
  @JsonKey(name: 'HolidayDate')
  DateTime? get holidayDate;
  @override

  /// ⚠️ API trả "" → nên để String? rồi tự parse khi cần
  @JsonKey(name: 'PlanStartDate')
  String? get planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  String? get planEndDate;
  @override
  @JsonKey(name: 'ActualStartDate')
  String? get actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  String? get actualEndDate;
  @override

  /// API trả 0.0
  @JsonKey(name: 'TotalDayPlan')
  int? get totalDayPlan;
  @override
  @JsonKey(name: 'TotalDayActual')
  int? get totalDayActual;
  @override
  @JsonKey(ignore: true)
  _$$ReportResponseImplCopyWith<_$ReportResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DepartResponse _$DepartResponseFromJson(Map<String, dynamic> json) {
  return _DepartResponse.fromJson(json);
}

/// @nodoc
mixin _$DepartResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
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
  int? get headOfDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsShowHotline')
  bool? get isShowHotline => throw _privateConstructorUsedError;
  @JsonKey(name: 'PId')
  String? get pId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepartResponseCopyWith<DepartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartResponseCopyWith<$Res> {
  factory $DepartResponseCopyWith(
          DepartResponse value, $Res Function(DepartResponse) then) =
      _$DepartResponseCopyWithImpl<$Res, DepartResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headOfDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$DepartResponseCopyWithImpl<$Res, $Val extends DepartResponse>
    implements $DepartResponseCopyWith<$Res> {
  _$DepartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartResponseImplCopyWith<$Res>
    implements $DepartResponseCopyWith<$Res> {
  factory _$$DepartResponseImplCopyWith(_$DepartResponseImpl value,
          $Res Function(_$DepartResponseImpl) then) =
      __$$DepartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'HeadofDepartment') int? headOfDepartment,
      @JsonKey(name: 'IsShowHotline') bool? isShowHotline,
      @JsonKey(name: 'PId') String? pId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$DepartResponseImplCopyWithImpl<$Res>
    extends _$DepartResponseCopyWithImpl<$Res, _$DepartResponseImpl>
    implements _$$DepartResponseImplCopyWith<$Res> {
  __$$DepartResponseImplCopyWithImpl(
      _$DepartResponseImpl _value, $Res Function(_$DepartResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
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
  }) {
    return _then(_$DepartResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartResponseImpl implements _DepartResponse {
  const _$DepartResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'Name') required this.name,
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
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$DepartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'Name')
  final String name;
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
  String toString() {
    return 'DepartResponse(id: $id, code: $code, name: $name, description: $description, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, status: $status, email: $email, headOfDepartment: $headOfDepartment, isShowHotline: $isShowHotline, pId: $pId, stt: $stt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartResponseImpl &&
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
                other.isDeleted == isDeleted));
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
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartResponseImplCopyWith<_$DepartResponseImpl> get copyWith =>
      __$$DepartResponseImplCopyWithImpl<_$DepartResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartResponseImplToJson(
      this,
    );
  }
}

abstract class _DepartResponse implements DepartResponse {
  const factory _DepartResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') required final String code,
          @JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'Email') final String? email,
          @JsonKey(name: 'HeadofDepartment') final int? headOfDepartment,
          @JsonKey(name: 'IsShowHotline') final bool? isShowHotline,
          @JsonKey(name: 'PId') final String? pId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$DepartResponseImpl;

  factory _DepartResponse.fromJson(Map<String, dynamic> json) =
      _$DepartResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'Name')
  String get name;
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
  @JsonKey(ignore: true)
  _$$DepartResponseImplCopyWith<_$DepartResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StaffResponse _$StaffResponseFromJson(Map<String, dynamic> json) {
  return _StaffResponse.fromJson(json);
}

/// @nodoc
mixin _$StaffResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChuVuID')
  int? get chucVuId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AnhCBNV')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVuHD')
  String? get chucVuHd => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVu')
  String? get chucVu => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DvBHXH')
  String? get dvBhxh => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiaDiemLamViec')
  String? get diaDiemLamViec => throw _privateConstructorUsedError;
  @JsonKey(name: 'BirthOfDate')
  DateTime? get birthOfDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoiSinh')
  String? get noiSinh => throw _privateConstructorUsedError;
  @JsonKey(name: 'GioiTinh')
  int? get gioiTinh => throw _privateConstructorUsedError;
  @JsonKey(name: 'GioiTinhText')
  String? get gioiTinhText => throw _privateConstructorUsedError;
  @JsonKey(name: 'DanToc')
  String? get danToc => throw _privateConstructorUsedError;
  @JsonKey(name: 'TonGiao')
  String? get tonGiao => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuocTich')
  String? get quocTich => throw _privateConstructorUsedError;
  @JsonKey(name: 'TinhTrangHonNhan')
  String? get tinhTrangHonNhan => throw _privateConstructorUsedError;
  @JsonKey(name: 'DcThuongTru')
  String? get dcThuongTru => throw _privateConstructorUsedError;
  @JsonKey(name: 'DcTamTru')
  String? get dcTamTru => throw _privateConstructorUsedError;
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmailCaNhan')
  String? get emailCaNhan => throw _privateConstructorUsedError;
  @JsonKey(name: 'SDTCongTy')
  String? get sdtCongTy => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmailCongTy')
  String? get emailCongTy => throw _privateConstructorUsedError;
  @JsonKey(name: 'NguoiLienHeKhiCan')
  String? get nguoiLienHeKhiCan => throw _privateConstructorUsedError;
  @JsonKey(name: 'MoiQuanHe')
  String? get moiQuanHe => throw _privateConstructorUsedError;
  @JsonKey(name: 'SDTNguoiThan')
  String? get sdtNguoiThan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffResponseCopyWith<StaffResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffResponseCopyWith<$Res> {
  factory $StaffResponseCopyWith(
          StaffResponse value, $Res Function(StaffResponse) then) =
      _$StaffResponseCopyWithImpl<$Res, StaffResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
      @JsonKey(name: 'ChuVuID') int? chucVuId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'AnhCBNV') String? avatarUrl,
      @JsonKey(name: 'ChucVuHD') String? chucVuHd,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DvBHXH') String? dvBhxh,
      @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
      @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
      @JsonKey(name: 'NoiSinh') String? noiSinh,
      @JsonKey(name: 'GioiTinh') int? gioiTinh,
      @JsonKey(name: 'GioiTinhText') String? gioiTinhText,
      @JsonKey(name: 'DanToc') String? danToc,
      @JsonKey(name: 'TonGiao') String? tonGiao,
      @JsonKey(name: 'QuocTich') String? quocTich,
      @JsonKey(name: 'TinhTrangHonNhan') String? tinhTrangHonNhan,
      @JsonKey(name: 'DcThuongTru') String? dcThuongTru,
      @JsonKey(name: 'DcTamTru') String? dcTamTru,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
      @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
      @JsonKey(name: 'SDTCongTy') String? sdtCongTy,
      @JsonKey(name: 'EmailCongTy') String? emailCongTy,
      @JsonKey(name: 'NguoiLienHeKhiCan') String? nguoiLienHeKhiCan,
      @JsonKey(name: 'MoiQuanHe') String? moiQuanHe,
      @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan});
}

/// @nodoc
class _$StaffResponseCopyWithImpl<$Res, $Val extends StaffResponse>
    implements $StaffResponseCopyWith<$Res> {
  _$StaffResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? departmentId = null,
    Object? status = freezed,
    Object? chucVuHdId = freezed,
    Object? chucVuId = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? idChamCongMoi = freezed,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? chucVuHd = freezed,
    Object? chucVu = freezed,
    Object? departmentStt = freezed,
    Object? departmentName = freezed,
    Object? dvBhxh = freezed,
    Object? diaDiemLamViec = freezed,
    Object? birthOfDate = freezed,
    Object? noiSinh = freezed,
    Object? gioiTinh = freezed,
    Object? gioiTinhText = freezed,
    Object? danToc = freezed,
    Object? tonGiao = freezed,
    Object? quocTich = freezed,
    Object? tinhTrangHonNhan = freezed,
    Object? dcThuongTru = freezed,
    Object? dcTamTru = freezed,
    Object? sdtCaNhan = freezed,
    Object? emailCaNhan = freezed,
    Object? sdtCongTy = freezed,
    Object? emailCongTy = freezed,
    Object? nguoiLienHeKhiCan = freezed,
    Object? moiQuanHe = freezed,
    Object? sdtNguoiThan = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuHdId: freezed == chucVuHdId
          ? _value.chucVuHdId
          : chucVuHdId // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuId: freezed == chucVuId
          ? _value.chucVuId
          : chucVuId // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVuHd: freezed == chucVuHd
          ? _value.chucVuHd
          : chucVuHd // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      dvBhxh: freezed == dvBhxh
          ? _value.dvBhxh
          : dvBhxh // ignore: cast_nullable_to_non_nullable
              as String?,
      diaDiemLamViec: freezed == diaDiemLamViec
          ? _value.diaDiemLamViec
          : diaDiemLamViec // ignore: cast_nullable_to_non_nullable
              as String?,
      birthOfDate: freezed == birthOfDate
          ? _value.birthOfDate
          : birthOfDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noiSinh: freezed == noiSinh
          ? _value.noiSinh
          : noiSinh // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as int?,
      gioiTinhText: freezed == gioiTinhText
          ? _value.gioiTinhText
          : gioiTinhText // ignore: cast_nullable_to_non_nullable
              as String?,
      danToc: freezed == danToc
          ? _value.danToc
          : danToc // ignore: cast_nullable_to_non_nullable
              as String?,
      tonGiao: freezed == tonGiao
          ? _value.tonGiao
          : tonGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      quocTich: freezed == quocTich
          ? _value.quocTich
          : quocTich // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhTrangHonNhan: freezed == tinhTrangHonNhan
          ? _value.tinhTrangHonNhan
          : tinhTrangHonNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      dcThuongTru: freezed == dcThuongTru
          ? _value.dcThuongTru
          : dcThuongTru // ignore: cast_nullable_to_non_nullable
              as String?,
      dcTamTru: freezed == dcTamTru
          ? _value.dcTamTru
          : dcTamTru // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      emailCaNhan: freezed == emailCaNhan
          ? _value.emailCaNhan
          : emailCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCongTy: freezed == sdtCongTy
          ? _value.sdtCongTy
          : sdtCongTy // ignore: cast_nullable_to_non_nullable
              as String?,
      emailCongTy: freezed == emailCongTy
          ? _value.emailCongTy
          : emailCongTy // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiLienHeKhiCan: freezed == nguoiLienHeKhiCan
          ? _value.nguoiLienHeKhiCan
          : nguoiLienHeKhiCan // ignore: cast_nullable_to_non_nullable
              as String?,
      moiQuanHe: freezed == moiQuanHe
          ? _value.moiQuanHe
          : moiQuanHe // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtNguoiThan: freezed == sdtNguoiThan
          ? _value.sdtNguoiThan
          : sdtNguoiThan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffResponseImplCopyWith<$Res>
    implements $StaffResponseCopyWith<$Res> {
  factory _$$StaffResponseImplCopyWith(
          _$StaffResponseImpl value, $Res Function(_$StaffResponseImpl) then) =
      __$$StaffResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'DepartmentID') int departmentId,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
      @JsonKey(name: 'ChuVuID') int? chucVuId,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
      @JsonKey(name: 'FullName') String fullName,
      @JsonKey(name: 'AnhCBNV') String? avatarUrl,
      @JsonKey(name: 'ChucVuHD') String? chucVuHd,
      @JsonKey(name: 'ChucVu') String? chucVu,
      @JsonKey(name: 'DepartmentSTT') int? departmentStt,
      @JsonKey(name: 'DepartmentName') String? departmentName,
      @JsonKey(name: 'DvBHXH') String? dvBhxh,
      @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
      @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
      @JsonKey(name: 'NoiSinh') String? noiSinh,
      @JsonKey(name: 'GioiTinh') int? gioiTinh,
      @JsonKey(name: 'GioiTinhText') String? gioiTinhText,
      @JsonKey(name: 'DanToc') String? danToc,
      @JsonKey(name: 'TonGiao') String? tonGiao,
      @JsonKey(name: 'QuocTich') String? quocTich,
      @JsonKey(name: 'TinhTrangHonNhan') String? tinhTrangHonNhan,
      @JsonKey(name: 'DcThuongTru') String? dcThuongTru,
      @JsonKey(name: 'DcTamTru') String? dcTamTru,
      @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
      @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
      @JsonKey(name: 'SDTCongTy') String? sdtCongTy,
      @JsonKey(name: 'EmailCongTy') String? emailCongTy,
      @JsonKey(name: 'NguoiLienHeKhiCan') String? nguoiLienHeKhiCan,
      @JsonKey(name: 'MoiQuanHe') String? moiQuanHe,
      @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan});
}

/// @nodoc
class __$$StaffResponseImplCopyWithImpl<$Res>
    extends _$StaffResponseCopyWithImpl<$Res, _$StaffResponseImpl>
    implements _$$StaffResponseImplCopyWith<$Res> {
  __$$StaffResponseImplCopyWithImpl(
      _$StaffResponseImpl _value, $Res Function(_$StaffResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? departmentId = null,
    Object? status = freezed,
    Object? chucVuHdId = freezed,
    Object? chucVuId = freezed,
    Object? stt = freezed,
    Object? code = freezed,
    Object? idChamCongMoi = freezed,
    Object? fullName = null,
    Object? avatarUrl = freezed,
    Object? chucVuHd = freezed,
    Object? chucVu = freezed,
    Object? departmentStt = freezed,
    Object? departmentName = freezed,
    Object? dvBhxh = freezed,
    Object? diaDiemLamViec = freezed,
    Object? birthOfDate = freezed,
    Object? noiSinh = freezed,
    Object? gioiTinh = freezed,
    Object? gioiTinhText = freezed,
    Object? danToc = freezed,
    Object? tonGiao = freezed,
    Object? quocTich = freezed,
    Object? tinhTrangHonNhan = freezed,
    Object? dcThuongTru = freezed,
    Object? dcTamTru = freezed,
    Object? sdtCaNhan = freezed,
    Object? emailCaNhan = freezed,
    Object? sdtCongTy = freezed,
    Object? emailCongTy = freezed,
    Object? nguoiLienHeKhiCan = freezed,
    Object? moiQuanHe = freezed,
    Object? sdtNguoiThan = freezed,
  }) {
    return _then(_$StaffResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuHdId: freezed == chucVuHdId
          ? _value.chucVuHdId
          : chucVuHdId // ignore: cast_nullable_to_non_nullable
              as int?,
      chucVuId: freezed == chucVuId
          ? _value.chucVuId
          : chucVuId // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      idChamCongMoi: freezed == idChamCongMoi
          ? _value.idChamCongMoi
          : idChamCongMoi // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVuHd: freezed == chucVuHd
          ? _value.chucVuHd
          : chucVuHd // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: freezed == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentStt: freezed == departmentStt
          ? _value.departmentStt
          : departmentStt // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      dvBhxh: freezed == dvBhxh
          ? _value.dvBhxh
          : dvBhxh // ignore: cast_nullable_to_non_nullable
              as String?,
      diaDiemLamViec: freezed == diaDiemLamViec
          ? _value.diaDiemLamViec
          : diaDiemLamViec // ignore: cast_nullable_to_non_nullable
              as String?,
      birthOfDate: freezed == birthOfDate
          ? _value.birthOfDate
          : birthOfDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      noiSinh: freezed == noiSinh
          ? _value.noiSinh
          : noiSinh // ignore: cast_nullable_to_non_nullable
              as String?,
      gioiTinh: freezed == gioiTinh
          ? _value.gioiTinh
          : gioiTinh // ignore: cast_nullable_to_non_nullable
              as int?,
      gioiTinhText: freezed == gioiTinhText
          ? _value.gioiTinhText
          : gioiTinhText // ignore: cast_nullable_to_non_nullable
              as String?,
      danToc: freezed == danToc
          ? _value.danToc
          : danToc // ignore: cast_nullable_to_non_nullable
              as String?,
      tonGiao: freezed == tonGiao
          ? _value.tonGiao
          : tonGiao // ignore: cast_nullable_to_non_nullable
              as String?,
      quocTich: freezed == quocTich
          ? _value.quocTich
          : quocTich // ignore: cast_nullable_to_non_nullable
              as String?,
      tinhTrangHonNhan: freezed == tinhTrangHonNhan
          ? _value.tinhTrangHonNhan
          : tinhTrangHonNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      dcThuongTru: freezed == dcThuongTru
          ? _value.dcThuongTru
          : dcThuongTru // ignore: cast_nullable_to_non_nullable
              as String?,
      dcTamTru: freezed == dcTamTru
          ? _value.dcTamTru
          : dcTamTru // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCaNhan: freezed == sdtCaNhan
          ? _value.sdtCaNhan
          : sdtCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      emailCaNhan: freezed == emailCaNhan
          ? _value.emailCaNhan
          : emailCaNhan // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtCongTy: freezed == sdtCongTy
          ? _value.sdtCongTy
          : sdtCongTy // ignore: cast_nullable_to_non_nullable
              as String?,
      emailCongTy: freezed == emailCongTy
          ? _value.emailCongTy
          : emailCongTy // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiLienHeKhiCan: freezed == nguoiLienHeKhiCan
          ? _value.nguoiLienHeKhiCan
          : nguoiLienHeKhiCan // ignore: cast_nullable_to_non_nullable
              as String?,
      moiQuanHe: freezed == moiQuanHe
          ? _value.moiQuanHe
          : moiQuanHe // ignore: cast_nullable_to_non_nullable
              as String?,
      sdtNguoiThan: freezed == sdtNguoiThan
          ? _value.sdtNguoiThan
          : sdtNguoiThan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffResponseImpl implements _StaffResponse {
  const _$StaffResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'DepartmentID') required this.departmentId,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'ChucVuHDID') this.chucVuHdId,
      @JsonKey(name: 'ChuVuID') this.chucVuId,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'IDChamCongMoi') this.idChamCongMoi,
      @JsonKey(name: 'FullName') required this.fullName,
      @JsonKey(name: 'AnhCBNV') this.avatarUrl,
      @JsonKey(name: 'ChucVuHD') this.chucVuHd,
      @JsonKey(name: 'ChucVu') this.chucVu,
      @JsonKey(name: 'DepartmentSTT') this.departmentStt,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'DvBHXH') this.dvBhxh,
      @JsonKey(name: 'DiaDiemLamViec') this.diaDiemLamViec,
      @JsonKey(name: 'BirthOfDate') this.birthOfDate,
      @JsonKey(name: 'NoiSinh') this.noiSinh,
      @JsonKey(name: 'GioiTinh') this.gioiTinh,
      @JsonKey(name: 'GioiTinhText') this.gioiTinhText,
      @JsonKey(name: 'DanToc') this.danToc,
      @JsonKey(name: 'TonGiao') this.tonGiao,
      @JsonKey(name: 'QuocTich') this.quocTich,
      @JsonKey(name: 'TinhTrangHonNhan') this.tinhTrangHonNhan,
      @JsonKey(name: 'DcThuongTru') this.dcThuongTru,
      @JsonKey(name: 'DcTamTru') this.dcTamTru,
      @JsonKey(name: 'SDTCaNhan') this.sdtCaNhan,
      @JsonKey(name: 'EmailCaNhan') this.emailCaNhan,
      @JsonKey(name: 'SDTCongTy') this.sdtCongTy,
      @JsonKey(name: 'EmailCongTy') this.emailCongTy,
      @JsonKey(name: 'NguoiLienHeKhiCan') this.nguoiLienHeKhiCan,
      @JsonKey(name: 'MoiQuanHe') this.moiQuanHe,
      @JsonKey(name: 'SDTNguoiThan') this.sdtNguoiThan});

  factory _$StaffResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'DepartmentID')
  final int departmentId;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'ChucVuHDID')
  final int? chucVuHdId;
  @override
  @JsonKey(name: 'ChuVuID')
  final int? chucVuId;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  final String? idChamCongMoi;
  @override
  @JsonKey(name: 'FullName')
  final String fullName;
  @override
  @JsonKey(name: 'AnhCBNV')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'ChucVuHD')
  final String? chucVuHd;
  @override
  @JsonKey(name: 'ChucVu')
  final String? chucVu;
  @override
  @JsonKey(name: 'DepartmentSTT')
  final int? departmentStt;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'DvBHXH')
  final String? dvBhxh;
  @override
  @JsonKey(name: 'DiaDiemLamViec')
  final String? diaDiemLamViec;
  @override
  @JsonKey(name: 'BirthOfDate')
  final DateTime? birthOfDate;
  @override
  @JsonKey(name: 'NoiSinh')
  final String? noiSinh;
  @override
  @JsonKey(name: 'GioiTinh')
  final int? gioiTinh;
  @override
  @JsonKey(name: 'GioiTinhText')
  final String? gioiTinhText;
  @override
  @JsonKey(name: 'DanToc')
  final String? danToc;
  @override
  @JsonKey(name: 'TonGiao')
  final String? tonGiao;
  @override
  @JsonKey(name: 'QuocTich')
  final String? quocTich;
  @override
  @JsonKey(name: 'TinhTrangHonNhan')
  final String? tinhTrangHonNhan;
  @override
  @JsonKey(name: 'DcThuongTru')
  final String? dcThuongTru;
  @override
  @JsonKey(name: 'DcTamTru')
  final String? dcTamTru;
  @override
  @JsonKey(name: 'SDTCaNhan')
  final String? sdtCaNhan;
  @override
  @JsonKey(name: 'EmailCaNhan')
  final String? emailCaNhan;
  @override
  @JsonKey(name: 'SDTCongTy')
  final String? sdtCongTy;
  @override
  @JsonKey(name: 'EmailCongTy')
  final String? emailCongTy;
  @override
  @JsonKey(name: 'NguoiLienHeKhiCan')
  final String? nguoiLienHeKhiCan;
  @override
  @JsonKey(name: 'MoiQuanHe')
  final String? moiQuanHe;
  @override
  @JsonKey(name: 'SDTNguoiThan')
  final String? sdtNguoiThan;

  @override
  String toString() {
    return 'StaffResponse(id: $id, userId: $userId, departmentId: $departmentId, status: $status, chucVuHdId: $chucVuHdId, chucVuId: $chucVuId, stt: $stt, code: $code, idChamCongMoi: $idChamCongMoi, fullName: $fullName, avatarUrl: $avatarUrl, chucVuHd: $chucVuHd, chucVu: $chucVu, departmentStt: $departmentStt, departmentName: $departmentName, dvBhxh: $dvBhxh, diaDiemLamViec: $diaDiemLamViec, birthOfDate: $birthOfDate, noiSinh: $noiSinh, gioiTinh: $gioiTinh, gioiTinhText: $gioiTinhText, danToc: $danToc, tonGiao: $tonGiao, quocTich: $quocTich, tinhTrangHonNhan: $tinhTrangHonNhan, dcThuongTru: $dcThuongTru, dcTamTru: $dcTamTru, sdtCaNhan: $sdtCaNhan, emailCaNhan: $emailCaNhan, sdtCongTy: $sdtCongTy, emailCongTy: $emailCongTy, nguoiLienHeKhiCan: $nguoiLienHeKhiCan, moiQuanHe: $moiQuanHe, sdtNguoiThan: $sdtNguoiThan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.chucVuHdId, chucVuHdId) ||
                other.chucVuHdId == chucVuHdId) &&
            (identical(other.chucVuId, chucVuId) ||
                other.chucVuId == chucVuId) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.idChamCongMoi, idChamCongMoi) ||
                other.idChamCongMoi == idChamCongMoi) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.chucVuHd, chucVuHd) ||
                other.chucVuHd == chucVuHd) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu) &&
            (identical(other.departmentStt, departmentStt) ||
                other.departmentStt == departmentStt) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.dvBhxh, dvBhxh) || other.dvBhxh == dvBhxh) &&
            (identical(other.diaDiemLamViec, diaDiemLamViec) ||
                other.diaDiemLamViec == diaDiemLamViec) &&
            (identical(other.birthOfDate, birthOfDate) ||
                other.birthOfDate == birthOfDate) &&
            (identical(other.noiSinh, noiSinh) || other.noiSinh == noiSinh) &&
            (identical(other.gioiTinh, gioiTinh) ||
                other.gioiTinh == gioiTinh) &&
            (identical(other.gioiTinhText, gioiTinhText) ||
                other.gioiTinhText == gioiTinhText) &&
            (identical(other.danToc, danToc) || other.danToc == danToc) &&
            (identical(other.tonGiao, tonGiao) || other.tonGiao == tonGiao) &&
            (identical(other.quocTich, quocTich) ||
                other.quocTich == quocTich) &&
            (identical(other.tinhTrangHonNhan, tinhTrangHonNhan) ||
                other.tinhTrangHonNhan == tinhTrangHonNhan) &&
            (identical(other.dcThuongTru, dcThuongTru) ||
                other.dcThuongTru == dcThuongTru) &&
            (identical(other.dcTamTru, dcTamTru) ||
                other.dcTamTru == dcTamTru) &&
            (identical(other.sdtCaNhan, sdtCaNhan) ||
                other.sdtCaNhan == sdtCaNhan) &&
            (identical(other.emailCaNhan, emailCaNhan) ||
                other.emailCaNhan == emailCaNhan) &&
            (identical(other.sdtCongTy, sdtCongTy) ||
                other.sdtCongTy == sdtCongTy) &&
            (identical(other.emailCongTy, emailCongTy) ||
                other.emailCongTy == emailCongTy) &&
            (identical(other.nguoiLienHeKhiCan, nguoiLienHeKhiCan) ||
                other.nguoiLienHeKhiCan == nguoiLienHeKhiCan) &&
            (identical(other.moiQuanHe, moiQuanHe) ||
                other.moiQuanHe == moiQuanHe) &&
            (identical(other.sdtNguoiThan, sdtNguoiThan) ||
                other.sdtNguoiThan == sdtNguoiThan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        departmentId,
        status,
        chucVuHdId,
        chucVuId,
        stt,
        code,
        idChamCongMoi,
        fullName,
        avatarUrl,
        chucVuHd,
        chucVu,
        departmentStt,
        departmentName,
        dvBhxh,
        diaDiemLamViec,
        birthOfDate,
        noiSinh,
        gioiTinh,
        gioiTinhText,
        danToc,
        tonGiao,
        quocTich,
        tinhTrangHonNhan,
        dcThuongTru,
        dcTamTru,
        sdtCaNhan,
        emailCaNhan,
        sdtCongTy,
        emailCongTy,
        nguoiLienHeKhiCan,
        moiQuanHe,
        sdtNguoiThan
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffResponseImplCopyWith<_$StaffResponseImpl> get copyWith =>
      __$$StaffResponseImplCopyWithImpl<_$StaffResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffResponseImplToJson(
      this,
    );
  }
}

abstract class _StaffResponse implements StaffResponse {
  const factory _StaffResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'UserID') required final int userId,
          @JsonKey(name: 'DepartmentID') required final int departmentId,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'ChucVuHDID') final int? chucVuHdId,
          @JsonKey(name: 'ChuVuID') final int? chucVuId,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'IDChamCongMoi') final String? idChamCongMoi,
          @JsonKey(name: 'FullName') required final String fullName,
          @JsonKey(name: 'AnhCBNV') final String? avatarUrl,
          @JsonKey(name: 'ChucVuHD') final String? chucVuHd,
          @JsonKey(name: 'ChucVu') final String? chucVu,
          @JsonKey(name: 'DepartmentSTT') final int? departmentStt,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'DvBHXH') final String? dvBhxh,
          @JsonKey(name: 'DiaDiemLamViec') final String? diaDiemLamViec,
          @JsonKey(name: 'BirthOfDate') final DateTime? birthOfDate,
          @JsonKey(name: 'NoiSinh') final String? noiSinh,
          @JsonKey(name: 'GioiTinh') final int? gioiTinh,
          @JsonKey(name: 'GioiTinhText') final String? gioiTinhText,
          @JsonKey(name: 'DanToc') final String? danToc,
          @JsonKey(name: 'TonGiao') final String? tonGiao,
          @JsonKey(name: 'QuocTich') final String? quocTich,
          @JsonKey(name: 'TinhTrangHonNhan') final String? tinhTrangHonNhan,
          @JsonKey(name: 'DcThuongTru') final String? dcThuongTru,
          @JsonKey(name: 'DcTamTru') final String? dcTamTru,
          @JsonKey(name: 'SDTCaNhan') final String? sdtCaNhan,
          @JsonKey(name: 'EmailCaNhan') final String? emailCaNhan,
          @JsonKey(name: 'SDTCongTy') final String? sdtCongTy,
          @JsonKey(name: 'EmailCongTy') final String? emailCongTy,
          @JsonKey(name: 'NguoiLienHeKhiCan') final String? nguoiLienHeKhiCan,
          @JsonKey(name: 'MoiQuanHe') final String? moiQuanHe,
          @JsonKey(name: 'SDTNguoiThan') final String? sdtNguoiThan}) =
      _$StaffResponseImpl;

  factory _StaffResponse.fromJson(Map<String, dynamic> json) =
      _$StaffResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'DepartmentID')
  int get departmentId;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHdId;
  @override
  @JsonKey(name: 'ChuVuID')
  int? get chucVuId;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'IDChamCongMoi')
  String? get idChamCongMoi;
  @override
  @JsonKey(name: 'FullName')
  String get fullName;
  @override
  @JsonKey(name: 'AnhCBNV')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'ChucVuHD')
  String? get chucVuHd;
  @override
  @JsonKey(name: 'ChucVu')
  String? get chucVu;
  @override
  @JsonKey(name: 'DepartmentSTT')
  int? get departmentStt;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'DvBHXH')
  String? get dvBhxh;
  @override
  @JsonKey(name: 'DiaDiemLamViec')
  String? get diaDiemLamViec;
  @override
  @JsonKey(name: 'BirthOfDate')
  DateTime? get birthOfDate;
  @override
  @JsonKey(name: 'NoiSinh')
  String? get noiSinh;
  @override
  @JsonKey(name: 'GioiTinh')
  int? get gioiTinh;
  @override
  @JsonKey(name: 'GioiTinhText')
  String? get gioiTinhText;
  @override
  @JsonKey(name: 'DanToc')
  String? get danToc;
  @override
  @JsonKey(name: 'TonGiao')
  String? get tonGiao;
  @override
  @JsonKey(name: 'QuocTich')
  String? get quocTich;
  @override
  @JsonKey(name: 'TinhTrangHonNhan')
  String? get tinhTrangHonNhan;
  @override
  @JsonKey(name: 'DcThuongTru')
  String? get dcThuongTru;
  @override
  @JsonKey(name: 'DcTamTru')
  String? get dcTamTru;
  @override
  @JsonKey(name: 'SDTCaNhan')
  String? get sdtCaNhan;
  @override
  @JsonKey(name: 'EmailCaNhan')
  String? get emailCaNhan;
  @override
  @JsonKey(name: 'SDTCongTy')
  String? get sdtCongTy;
  @override
  @JsonKey(name: 'EmailCongTy')
  String? get emailCongTy;
  @override
  @JsonKey(name: 'NguoiLienHeKhiCan')
  String? get nguoiLienHeKhiCan;
  @override
  @JsonKey(name: 'MoiQuanHe')
  String? get moiQuanHe;
  @override
  @JsonKey(name: 'SDTNguoiThan')
  String? get sdtNguoiThan;
  @override
  @JsonKey(ignore: true)
  _$$StaffResponseImplCopyWith<_$StaffResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) {
  return _TeamResponse.fromJson(json);
}

/// @nodoc
mixin _$TeamResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'LeaderID')
  int? get leaderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentID')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Leader')
  String? get leader => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeName')
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamResponseCopyWith<TeamResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamResponseCopyWith<$Res> {
  factory $TeamResponseCopyWith(
          TeamResponse value, $Res Function(TeamResponse) then) =
      _$TeamResponseCopyWithImpl<$Res, TeamResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'LeaderID') int? leaderId,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'ParentID') int? parentId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
      @JsonKey(name: 'Leader') String? leader,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class _$TeamResponseCopyWithImpl<$Res, $Val extends TeamResponse>
    implements $TeamResponseCopyWith<$Res> {
  _$TeamResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leaderId = freezed,
    Object? departmentId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? projectTypeId = freezed,
    Object? leader = freezed,
    Object? typeName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      leaderId: freezed == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      leader: freezed == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamResponseImplCopyWith<$Res>
    implements $TeamResponseCopyWith<$Res> {
  factory _$$TeamResponseImplCopyWith(
          _$TeamResponseImpl value, $Res Function(_$TeamResponseImpl) then) =
      __$$TeamResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'LeaderID') int? leaderId,
      @JsonKey(name: 'DepartmentID') int? departmentId,
      @JsonKey(name: 'ParentID') int? parentId,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
      @JsonKey(name: 'Leader') String? leader,
      @JsonKey(name: 'TypeName') String? typeName,
      @JsonKey(name: 'DepartmentName') String? departmentName});
}

/// @nodoc
class __$$TeamResponseImplCopyWithImpl<$Res>
    extends _$TeamResponseCopyWithImpl<$Res, _$TeamResponseImpl>
    implements _$$TeamResponseImplCopyWith<$Res> {
  __$$TeamResponseImplCopyWithImpl(
      _$TeamResponseImpl _value, $Res Function(_$TeamResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? leaderId = freezed,
    Object? departmentId = freezed,
    Object? parentId = freezed,
    Object? name = null,
    Object? projectTypeId = freezed,
    Object? leader = freezed,
    Object? typeName = freezed,
    Object? departmentName = freezed,
  }) {
    return _then(_$TeamResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      leaderId: freezed == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeId: freezed == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      leader: freezed == leader
          ? _value.leader
          : leader // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
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
class _$TeamResponseImpl implements _TeamResponse {
  const _$TeamResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'LeaderID') this.leaderId,
      @JsonKey(name: 'DepartmentID') this.departmentId,
      @JsonKey(name: 'ParentID') this.parentId,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'ProjectTypeID') this.projectTypeId,
      @JsonKey(name: 'Leader') this.leader,
      @JsonKey(name: 'TypeName') this.typeName,
      @JsonKey(name: 'DepartmentName') this.departmentName});

  factory _$TeamResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'LeaderID')
  final int? leaderId;
  @override
  @JsonKey(name: 'DepartmentID')
  final int? departmentId;
  @override
  @JsonKey(name: 'ParentID')
  final int? parentId;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'ProjectTypeID')
  final int? projectTypeId;
  @override
  @JsonKey(name: 'Leader')
  final String? leader;
  @override
  @JsonKey(name: 'TypeName')
  final String? typeName;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;

  @override
  String toString() {
    return 'TeamResponse(id: $id, leaderId: $leaderId, departmentId: $departmentId, parentId: $parentId, name: $name, projectTypeId: $projectTypeId, leader: $leader, typeName: $typeName, departmentName: $departmentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leaderId, leaderId) ||
                other.leaderId == leaderId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId) &&
            (identical(other.leader, leader) || other.leader == leader) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, leaderId, departmentId,
      parentId, name, projectTypeId, leader, typeName, departmentName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamResponseImplCopyWith<_$TeamResponseImpl> get copyWith =>
      __$$TeamResponseImplCopyWithImpl<_$TeamResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamResponseImplToJson(
      this,
    );
  }
}

abstract class _TeamResponse implements TeamResponse {
  const factory _TeamResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'LeaderID') final int? leaderId,
          @JsonKey(name: 'DepartmentID') final int? departmentId,
          @JsonKey(name: 'ParentID') final int? parentId,
          @JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'ProjectTypeID') final int? projectTypeId,
          @JsonKey(name: 'Leader') final String? leader,
          @JsonKey(name: 'TypeName') final String? typeName,
          @JsonKey(name: 'DepartmentName') final String? departmentName}) =
      _$TeamResponseImpl;

  factory _TeamResponse.fromJson(Map<String, dynamic> json) =
      _$TeamResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'LeaderID')
  int? get leaderId;
  @override
  @JsonKey(name: 'DepartmentID')
  int? get departmentId;
  @override
  @JsonKey(name: 'ParentID')
  int? get parentId;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'ProjectTypeID')
  int? get projectTypeId;
  @override
  @JsonKey(name: 'Leader')
  String? get leader;
  @override
  @JsonKey(name: 'TypeName')
  String? get typeName;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(ignore: true)
  _$$TeamResponseImplCopyWith<_$TeamResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) {
  return _ProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String get projectName => throw _privateConstructorUsedError;
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
  double? get priority => throw _privateConstructorUsedError;
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
  $ProjectResponseCopyWith<ProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectResponseCopyWith<$Res> {
  factory $ProjectResponseCopyWith(
          ProjectResponse value, $Res Function(ProjectResponse) then) =
      _$ProjectResponseCopyWithImpl<$Res, ProjectResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
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
      @JsonKey(name: 'Priotity') double? priority,
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
class _$ProjectResponseCopyWithImpl<$Res, $Val extends ProjectResponse>
    implements $ProjectResponseCopyWith<$Res> {
  _$ProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = freezed,
    Object? projectCode = null,
    Object? projectName = null,
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
    Object? priority = freezed,
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
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
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
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ProjectResponseImplCopyWith<$Res>
    implements $ProjectResponseCopyWith<$Res> {
  factory _$$ProjectResponseImplCopyWith(_$ProjectResponseImpl value,
          $Res Function(_$ProjectResponseImpl) then) =
      __$$ProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int? customerId,
      @JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
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
      @JsonKey(name: 'Priotity') double? priority,
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
class __$$ProjectResponseImplCopyWithImpl<$Res>
    extends _$ProjectResponseCopyWithImpl<$Res, _$ProjectResponseImpl>
    implements _$$ProjectResponseImplCopyWith<$Res> {
  __$$ProjectResponseImplCopyWithImpl(
      _$ProjectResponseImpl _value, $Res Function(_$ProjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = freezed,
    Object? projectCode = null,
    Object? projectName = null,
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
    Object? priority = freezed,
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
    return _then(_$ProjectResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
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
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
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
class _$ProjectResponseImpl implements _ProjectResponse {
  const _$ProjectResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerID') this.customerId,
      @JsonKey(name: 'ProjectCode') required this.projectCode,
      @JsonKey(name: 'ProjectName') required this.projectName,
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
      @JsonKey(name: 'Priotity') this.priority,
      @JsonKey(name: 'PODate') this.poDate,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'TypeProject') this.typeProject,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$ProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  final String projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String projectName;
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
  final double? priority;
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
    return 'ProjectResponse(id: $id, customerId: $customerId, projectCode: $projectCode, projectName: $projectName, projectShortName: $projectShortName, projectStatus: $projectStatus, userId: $userId, userTechnicalId: $userTechnicalId, note: $note, isApproved: $isApproved, contactId: $contactId, po: $po, projectType: $projectType, listCostId: $listCostId, planDateStart: $planDateStart, planDateEnd: $planDateEnd, actualDateStart: $actualDateStart, actualDateEnd: $actualDateEnd, eu: $eu, projectManager: $projectManager, currentState: $currentState, priority: $priority, poDate: $poDate, endUser: $endUser, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, businessFieldId: $businessFieldId, typeProject: $typeProject, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectResponseImpl &&
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
            (identical(other.priority, priority) ||
                other.priority == priority) &&
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
        priority,
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
  _$$ProjectResponseImplCopyWith<_$ProjectResponseImpl> get copyWith =>
      __$$ProjectResponseImplCopyWithImpl<_$ProjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectResponseImplToJson(
      this,
    );
  }
}

abstract class _ProjectResponse implements ProjectResponse {
  const factory _ProjectResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerID') final int? customerId,
          @JsonKey(name: 'ProjectCode') required final String projectCode,
          @JsonKey(name: 'ProjectName') required final String projectName,
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
          @JsonKey(name: 'Priotity') final double? priority,
          @JsonKey(name: 'PODate') final DateTime? poDate,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
          @JsonKey(name: 'TypeProject') final int? typeProject,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$ProjectResponseImpl;

  factory _ProjectResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  String get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String get projectName;
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
  double? get priority;
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
  _$$ProjectResponseImplCopyWith<_$ProjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectItemResponse _$ProjectItemResponseFromJson(Map<String, dynamic> json) {
  return _ProjectItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectItemResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String? get mission => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentageActual')
  double? get percentageActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanStartDate')
  DateTime? get planStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanEndDate')
  DateTime? get planEndDate => throw _privateConstructorUsedError;

  /// BE trả double (3.0)
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectItemResponseCopyWith<ProjectItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectItemResponseCopyWith<$Res> {
  factory $ProjectItemResponseCopyWith(
          ProjectItemResponse value, $Res Function(ProjectItemResponse) then) =
      _$ProjectItemResponseCopyWithImpl<$Res, ProjectItemResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
      @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'EmployeeID') int? employeeId});
}

/// @nodoc
class _$ProjectItemResponseCopyWithImpl<$Res, $Val extends ProjectItemResponse>
    implements $ProjectItemResponseCopyWith<$Res> {
  _$ProjectItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? mission = freezed,
    Object? percentageActual = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectItemResponseImplCopyWith<$Res>
    implements $ProjectItemResponseCopyWith<$Res> {
  factory _$$ProjectItemResponseImplCopyWith(_$ProjectItemResponseImpl value,
          $Res Function(_$ProjectItemResponseImpl) then) =
      __$$ProjectItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
      @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'EmployeeID') int? employeeId});
}

/// @nodoc
class __$$ProjectItemResponseImplCopyWithImpl<$Res>
    extends _$ProjectItemResponseCopyWithImpl<$Res, _$ProjectItemResponseImpl>
    implements _$$ProjectItemResponseImplCopyWith<$Res> {
  __$$ProjectItemResponseImplCopyWithImpl(_$ProjectItemResponseImpl _value,
      $Res Function(_$ProjectItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? mission = freezed,
    Object? percentageActual = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? employeeId = freezed,
  }) {
    return _then(_$ProjectItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectItemResponseImpl implements _ProjectItemResponse {
  const _$ProjectItemResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'Mission') this.mission,
      @JsonKey(name: 'PercentageActual') this.percentageActual,
      @JsonKey(name: 'PlanStartDate') this.planStartDate,
      @JsonKey(name: 'PlanEndDate') this.planEndDate,
      @JsonKey(name: 'TotalDayPlan') this.totalDayPlan,
      @JsonKey(name: 'EmployeeID') this.employeeId});

  factory _$ProjectItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectItemResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Code')
  final String code;
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

  /// BE trả double (3.0)
  @override
  @JsonKey(name: 'TotalDayPlan')
  final double? totalDayPlan;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;

  @override
  String toString() {
    return 'ProjectItemResponse(id: $id, code: $code, mission: $mission, percentageActual: $percentageActual, planStartDate: $planStartDate, planEndDate: $planEndDate, totalDayPlan: $totalDayPlan, employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectItemResponseImpl &&
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
                other.employeeId == employeeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, mission,
      percentageActual, planStartDate, planEndDate, totalDayPlan, employeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectItemResponseImplCopyWith<_$ProjectItemResponseImpl> get copyWith =>
      __$$ProjectItemResponseImplCopyWithImpl<_$ProjectItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectItemResponseImplToJson(
      this,
    );
  }
}

abstract class _ProjectItemResponse implements ProjectItemResponse {
  const factory _ProjectItemResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Code') required final String code,
          @JsonKey(name: 'Mission') final String? mission,
          @JsonKey(name: 'PercentageActual') final double? percentageActual,
          @JsonKey(name: 'PlanStartDate') final DateTime? planStartDate,
          @JsonKey(name: 'PlanEndDate') final DateTime? planEndDate,
          @JsonKey(name: 'TotalDayPlan') final double? totalDayPlan,
          @JsonKey(name: 'EmployeeID') final int? employeeId}) =
      _$ProjectItemResponseImpl;

  factory _ProjectItemResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectItemResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Code')
  String get code;
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

  /// BE trả double (3.0)
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(ignore: true)
  _$$ProjectItemResponseImplCopyWith<_$ProjectItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveReportTechRequest _$SaveReportTechRequestFromJson(
    Map<String, dynamic> json) {
  return _SaveReportTechRequest.fromJson(json);
}

/// @nodoc
mixin _$SaveReportTechRequest {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String? get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool? get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String? get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeleteFlag')
  int? get deleteFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterID')
  int? get masterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldProjectID')
  int? get oldProjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentComplete')
  double get percentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String? get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportLate')
  int? get reportLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusResult')
  int? get statusResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentageActual')
  double? get percentageActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double? get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserReport')
  int? get userReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkPlanDetailID')
  int? get workPlanDetailId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveReportTechRequestCopyWith<SaveReportTechRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveReportTechRequestCopyWith<$Res> {
  factory $SaveReportTechRequestCopyWith(SaveReportTechRequest value,
          $Res Function(SaveReportTechRequest) then) =
      _$SaveReportTechRequestCopyWithImpl<$Res, SaveReportTechRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Confirm') bool? confirm,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'DeleteFlag') int? deleteFlag,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'MasterID') int? masterId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'OldProjectID') int? oldProjectId,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'PercentComplete') double percentComplete,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ReportLate') int? reportLate,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'StatusResult') int? statusResult,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'UserReport') int? userReport,
      @JsonKey(name: 'WorkPlanDetailID') int? workPlanDetailId});
}

/// @nodoc
class _$SaveReportTechRequestCopyWithImpl<$Res,
        $Val extends SaveReportTechRequest>
    implements $SaveReportTechRequestCopyWith<$Res> {
  _$SaveReportTechRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backlog = freezed,
    Object? confirm = freezed,
    Object? content = freezed,
    Object? dateReport = freezed,
    Object? deleteFlag = freezed,
    Object? location = freezed,
    Object? masterId = freezed,
    Object? note = freezed,
    Object? oldProjectId = freezed,
    Object? projectItemId = freezed,
    Object? percentComplete = null,
    Object? planNextDay = null,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? projectId = freezed,
    Object? reportLate = freezed,
    Object? results = freezed,
    Object? statusResult = freezed,
    Object? percentageActual = freezed,
    Object? totalHourOT = freezed,
    Object? totalHours = freezed,
    Object? type = freezed,
    Object? userReport = freezed,
    Object? workPlanDetailId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      confirm: freezed == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteFlag: freezed == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      oldProjectId: freezed == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as double,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      reportLate: freezed == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      statusResult: freezed == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int?,
      percentageActual: freezed == percentageActual
          ? _value.percentageActual
          : percentageActual // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      userReport: freezed == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int?,
      workPlanDetailId: freezed == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveReportTechRequestImplCopyWith<$Res>
    implements $SaveReportTechRequestCopyWith<$Res> {
  factory _$$SaveReportTechRequestImplCopyWith(
          _$SaveReportTechRequestImpl value,
          $Res Function(_$SaveReportTechRequestImpl) then) =
      __$$SaveReportTechRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Confirm') bool? confirm,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'DeleteFlag') int? deleteFlag,
      @JsonKey(name: 'Location') String? location,
      @JsonKey(name: 'MasterID') int? masterId,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'OldProjectID') int? oldProjectId,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'PercentComplete') double percentComplete,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'ReportLate') int? reportLate,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'StatusResult') int? statusResult,
      @JsonKey(name: 'PercentageActual') double? percentageActual,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'UserReport') int? userReport,
      @JsonKey(name: 'WorkPlanDetailID') int? workPlanDetailId});
}

/// @nodoc
class __$$SaveReportTechRequestImplCopyWithImpl<$Res>
    extends _$SaveReportTechRequestCopyWithImpl<$Res,
        _$SaveReportTechRequestImpl>
    implements _$$SaveReportTechRequestImplCopyWith<$Res> {
  __$$SaveReportTechRequestImplCopyWithImpl(_$SaveReportTechRequestImpl _value,
      $Res Function(_$SaveReportTechRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backlog = freezed,
    Object? confirm = freezed,
    Object? content = freezed,
    Object? dateReport = freezed,
    Object? deleteFlag = freezed,
    Object? location = freezed,
    Object? masterId = freezed,
    Object? note = freezed,
    Object? oldProjectId = freezed,
    Object? projectItemId = freezed,
    Object? percentComplete = null,
    Object? planNextDay = null,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? projectId = freezed,
    Object? reportLate = freezed,
    Object? results = freezed,
    Object? statusResult = freezed,
    Object? percentageActual = freezed,
    Object? totalHourOT = freezed,
    Object? totalHours = freezed,
    Object? type = freezed,
    Object? userReport = freezed,
    Object? workPlanDetailId = freezed,
  }) {
    return _then(_$SaveReportTechRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      confirm: freezed == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteFlag: freezed == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      oldProjectId: freezed == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as double,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      reportLate: freezed == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      statusResult: freezed == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int?,
      percentageActual: freezed == percentageActual
          ? _value.percentageActual
          : percentageActual // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      userReport: freezed == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int?,
      workPlanDetailId: freezed == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveReportTechRequestImpl implements _SaveReportTechRequest {
  const _$SaveReportTechRequestImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Backlog') this.backlog,
      @JsonKey(name: 'Confirm') this.confirm,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'DateReport') this.dateReport,
      @JsonKey(name: 'DeleteFlag') this.deleteFlag,
      @JsonKey(name: 'Location') this.location,
      @JsonKey(name: 'MasterID') this.masterId,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'OldProjectID') this.oldProjectId,
      @JsonKey(name: 'ProjectItemID') this.projectItemId,
      @JsonKey(name: 'PercentComplete') required this.percentComplete,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Problem') this.problem,
      @JsonKey(name: 'ProblemSolve') this.problemSolve,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'ReportLate') this.reportLate,
      @JsonKey(name: 'Results') this.results,
      @JsonKey(name: 'StatusResult') this.statusResult,
      @JsonKey(name: 'PercentageActual') this.percentageActual,
      @JsonKey(name: 'TotalHourOT') this.totalHourOT,
      @JsonKey(name: 'TotalHours') this.totalHours,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'UserReport') this.userReport,
      @JsonKey(name: 'WorkPlanDetailID') this.workPlanDetailId});

  factory _$SaveReportTechRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveReportTechRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Backlog')
  final String? backlog;
  @override
  @JsonKey(name: 'Confirm')
  final bool? confirm;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'DateReport')
  final String? dateReport;
  @override
  @JsonKey(name: 'DeleteFlag')
  final int? deleteFlag;
  @override
  @JsonKey(name: 'Location')
  final String? location;
  @override
  @JsonKey(name: 'MasterID')
  final int? masterId;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'OldProjectID')
  final int? oldProjectId;
  @override
  @JsonKey(name: 'ProjectItemID')
  final int? projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  final double percentComplete;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Problem')
  final String? problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String? problemSolve;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'ReportLate')
  final int? reportLate;
  @override
  @JsonKey(name: 'Results')
  final String? results;
  @override
  @JsonKey(name: 'StatusResult')
  final int? statusResult;
  @override
  @JsonKey(name: 'PercentageActual')
  final double? percentageActual;
  @override
  @JsonKey(name: 'TotalHourOT')
  final double? totalHourOT;
  @override
  @JsonKey(name: 'TotalHours')
  final double? totalHours;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'UserReport')
  final int? userReport;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  final int? workPlanDetailId;

  @override
  String toString() {
    return 'SaveReportTechRequest(id: $id, backlog: $backlog, confirm: $confirm, content: $content, dateReport: $dateReport, deleteFlag: $deleteFlag, location: $location, masterId: $masterId, note: $note, oldProjectId: $oldProjectId, projectItemId: $projectItemId, percentComplete: $percentComplete, planNextDay: $planNextDay, problem: $problem, problemSolve: $problemSolve, projectId: $projectId, reportLate: $reportLate, results: $results, statusResult: $statusResult, percentageActual: $percentageActual, totalHourOT: $totalHourOT, totalHours: $totalHours, type: $type, userReport: $userReport, workPlanDetailId: $workPlanDetailId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveReportTechRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.oldProjectId, oldProjectId) ||
                other.oldProjectId == oldProjectId) &&
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.reportLate, reportLate) ||
                other.reportLate == reportLate) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.statusResult, statusResult) ||
                other.statusResult == statusResult) &&
            (identical(other.percentageActual, percentageActual) ||
                other.percentageActual == percentageActual) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userReport, userReport) ||
                other.userReport == userReport) &&
            (identical(other.workPlanDetailId, workPlanDetailId) ||
                other.workPlanDetailId == workPlanDetailId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        backlog,
        confirm,
        content,
        dateReport,
        deleteFlag,
        location,
        masterId,
        note,
        oldProjectId,
        projectItemId,
        percentComplete,
        planNextDay,
        problem,
        problemSolve,
        projectId,
        reportLate,
        results,
        statusResult,
        percentageActual,
        totalHourOT,
        totalHours,
        type,
        userReport,
        workPlanDetailId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveReportTechRequestImplCopyWith<_$SaveReportTechRequestImpl>
      get copyWith => __$$SaveReportTechRequestImplCopyWithImpl<
          _$SaveReportTechRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveReportTechRequestImplToJson(
      this,
    );
  }
}

abstract class _SaveReportTechRequest implements SaveReportTechRequest {
  const factory _SaveReportTechRequest(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Backlog') final String? backlog,
      @JsonKey(name: 'Confirm') final bool? confirm,
      @JsonKey(name: 'Content') final String? content,
      @JsonKey(name: 'DateReport') final String? dateReport,
      @JsonKey(name: 'DeleteFlag') final int? deleteFlag,
      @JsonKey(name: 'Location') final String? location,
      @JsonKey(name: 'MasterID') final int? masterId,
      @JsonKey(name: 'Note') final String? note,
      @JsonKey(name: 'OldProjectID') final int? oldProjectId,
      @JsonKey(name: 'ProjectItemID') final int? projectItemId,
      @JsonKey(name: 'PercentComplete') required final double percentComplete,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Problem') final String? problem,
      @JsonKey(name: 'ProblemSolve') final String? problemSolve,
      @JsonKey(name: 'ProjectID') final int? projectId,
      @JsonKey(name: 'ReportLate') final int? reportLate,
      @JsonKey(name: 'Results') final String? results,
      @JsonKey(name: 'StatusResult') final int? statusResult,
      @JsonKey(name: 'PercentageActual') final double? percentageActual,
      @JsonKey(name: 'TotalHourOT') final double? totalHourOT,
      @JsonKey(name: 'TotalHours') final double? totalHours,
      @JsonKey(name: 'Type') final int? type,
      @JsonKey(name: 'UserReport') final int? userReport,
      @JsonKey(name: 'WorkPlanDetailID')
      final int? workPlanDetailId}) = _$SaveReportTechRequestImpl;

  factory _SaveReportTechRequest.fromJson(Map<String, dynamic> json) =
      _$SaveReportTechRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Backlog')
  String? get backlog;
  @override
  @JsonKey(name: 'Confirm')
  bool? get confirm;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'DateReport')
  String? get dateReport;
  @override
  @JsonKey(name: 'DeleteFlag')
  int? get deleteFlag;
  @override
  @JsonKey(name: 'Location')
  String? get location;
  @override
  @JsonKey(name: 'MasterID')
  int? get masterId;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'OldProjectID')
  int? get oldProjectId;
  @override
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  double get percentComplete;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Problem')
  String? get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'ReportLate')
  int? get reportLate;
  @override
  @JsonKey(name: 'Results')
  String? get results;
  @override
  @JsonKey(name: 'StatusResult')
  int? get statusResult;
  @override
  @JsonKey(name: 'PercentageActual')
  double? get percentageActual;
  @override
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT;
  @override
  @JsonKey(name: 'TotalHours')
  double? get totalHours;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'UserReport')
  int? get userReport;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  int? get workPlanDetailId;
  @override
  @JsonKey(ignore: true)
  _$$SaveReportTechRequestImplCopyWith<_$SaveReportTechRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SendMailRequestModel _$SendMailRequestModelFromJson(Map<String, dynamic> json) {
  return _SendMailRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendMailRequestModel {
  @JsonKey(name: 'Body')
  String get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMailRequestModelCopyWith<SendMailRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMailRequestModelCopyWith<$Res> {
  factory $SendMailRequestModelCopyWith(SendMailRequestModel value,
          $Res Function(SendMailRequestModel) then) =
      _$SendMailRequestModelCopyWithImpl<$Res, SendMailRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Body') String body,
      @JsonKey(name: 'DateReport') String dateReport});
}

/// @nodoc
class _$SendMailRequestModelCopyWithImpl<$Res,
        $Val extends SendMailRequestModel>
    implements $SendMailRequestModelCopyWith<$Res> {
  _$SendMailRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? dateReport = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMailRequestModelImplCopyWith<$Res>
    implements $SendMailRequestModelCopyWith<$Res> {
  factory _$$SendMailRequestModelImplCopyWith(_$SendMailRequestModelImpl value,
          $Res Function(_$SendMailRequestModelImpl) then) =
      __$$SendMailRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Body') String body,
      @JsonKey(name: 'DateReport') String dateReport});
}

/// @nodoc
class __$$SendMailRequestModelImplCopyWithImpl<$Res>
    extends _$SendMailRequestModelCopyWithImpl<$Res, _$SendMailRequestModelImpl>
    implements _$$SendMailRequestModelImplCopyWith<$Res> {
  __$$SendMailRequestModelImplCopyWithImpl(_$SendMailRequestModelImpl _value,
      $Res Function(_$SendMailRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? dateReport = null,
  }) {
    return _then(_$SendMailRequestModelImpl(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMailRequestModelImpl implements _SendMailRequestModel {
  const _$SendMailRequestModelImpl(
      {@JsonKey(name: 'Body') required this.body,
      @JsonKey(name: 'DateReport') required this.dateReport});

  factory _$SendMailRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMailRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'Body')
  final String body;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;

  @override
  String toString() {
    return 'SendMailRequestModel(body: $body, dateReport: $dateReport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMailRequestModelImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, body, dateReport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMailRequestModelImplCopyWith<_$SendMailRequestModelImpl>
      get copyWith =>
          __$$SendMailRequestModelImplCopyWithImpl<_$SendMailRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMailRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SendMailRequestModel implements SendMailRequestModel {
  const factory _SendMailRequestModel(
          {@JsonKey(name: 'Body') required final String body,
          @JsonKey(name: 'DateReport') required final String dateReport}) =
      _$SendMailRequestModelImpl;

  factory _SendMailRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendMailRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'Body')
  String get body;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(ignore: true)
  _$$SendMailRequestModelImplCopyWith<_$SendMailRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailReportResponse _$DetailReportResponseFromJson(Map<String, dynamic> json) {
  return _DetailReportResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailReportResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterID')
  int get masterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserReport')
  int get userReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportLate')
  int get reportLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldProjectID')
  int get oldProjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusResult')
  int get statusResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkPlanDetailID')
  int get workPlanDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemID')
  int get projectItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentComplete')
  int get percentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHourOT')
  double get totalHourOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailReportResponseCopyWith<DetailReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailReportResponseCopyWith<$Res> {
  factory $DetailReportResponseCopyWith(DetailReportResponse value,
          $Res Function(DetailReportResponse) then) =
      _$DetailReportResponseCopyWithImpl<$Res, DetailReportResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MasterID') int masterId,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectID') int projectId,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'Type') int type,
      @JsonKey(name: 'ReportLate') int reportLate,
      @JsonKey(name: 'OldProjectID') int oldProjectId,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'StatusResult') int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'ProjectItemID') int projectItemId,
      @JsonKey(name: 'PercentComplete') int percentComplete,
      @JsonKey(name: 'TotalHourOT') double totalHourOT,
      @JsonKey(name: 'Location') String location});
}

/// @nodoc
class _$DetailReportResponseCopyWithImpl<$Res,
        $Val extends DetailReportResponse>
    implements $DetailReportResponseCopyWith<$Res> {
  _$DetailReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterId = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? projectId = null,
    Object? content = null,
    Object? results = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? confirm = null,
    Object? backlog = null,
    Object? deleteFlag = null,
    Object? createdDate = null,
    Object? type = null,
    Object? reportLate = null,
    Object? oldProjectId = null,
    Object? totalHours = null,
    Object? statusResult = null,
    Object? workPlanDetailId = null,
    Object? createdBy = null,
    Object? updatedDate = null,
    Object? updatedBy = null,
    Object? projectItemId = null,
    Object? percentComplete = null,
    Object? totalHourOT = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      reportLate: null == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int,
      oldProjectId: null == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      statusResult: null == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int,
      workPlanDetailId: null == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemId: null == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int,
      totalHourOT: null == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailReportResponseImplCopyWith<$Res>
    implements $DetailReportResponseCopyWith<$Res> {
  factory _$$DetailReportResponseImplCopyWith(_$DetailReportResponseImpl value,
          $Res Function(_$DetailReportResponseImpl) then) =
      __$$DetailReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MasterID') int masterId,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectID') int projectId,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'Type') int type,
      @JsonKey(name: 'ReportLate') int reportLate,
      @JsonKey(name: 'OldProjectID') int oldProjectId,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'StatusResult') int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'ProjectItemID') int projectItemId,
      @JsonKey(name: 'PercentComplete') int percentComplete,
      @JsonKey(name: 'TotalHourOT') double totalHourOT,
      @JsonKey(name: 'Location') String location});
}

/// @nodoc
class __$$DetailReportResponseImplCopyWithImpl<$Res>
    extends _$DetailReportResponseCopyWithImpl<$Res, _$DetailReportResponseImpl>
    implements _$$DetailReportResponseImplCopyWith<$Res> {
  __$$DetailReportResponseImplCopyWithImpl(_$DetailReportResponseImpl _value,
      $Res Function(_$DetailReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterId = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? projectId = null,
    Object? content = null,
    Object? results = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? confirm = null,
    Object? backlog = null,
    Object? deleteFlag = null,
    Object? createdDate = null,
    Object? type = null,
    Object? reportLate = null,
    Object? oldProjectId = null,
    Object? totalHours = null,
    Object? statusResult = null,
    Object? workPlanDetailId = null,
    Object? createdBy = null,
    Object? updatedDate = null,
    Object? updatedBy = null,
    Object? projectItemId = null,
    Object? percentComplete = null,
    Object? totalHourOT = null,
    Object? location = null,
  }) {
    return _then(_$DetailReportResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      reportLate: null == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int,
      oldProjectId: null == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      statusResult: null == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int,
      workPlanDetailId: null == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemId: null == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int,
      percentComplete: null == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int,
      totalHourOT: null == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailReportResponseImpl implements _DetailReportResponse {
  const _$DetailReportResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'MasterID') required this.masterId,
      @JsonKey(name: 'UserReport') required this.userReport,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'ProjectID') required this.projectId,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'Results') required this.results,
      @JsonKey(name: 'Problem') required this.problem,
      @JsonKey(name: 'ProblemSolve') required this.problemSolve,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Note') required this.note,
      @JsonKey(name: 'Confirm') required this.confirm,
      @JsonKey(name: 'Backlog') required this.backlog,
      @JsonKey(name: 'DeleteFlag') required this.deleteFlag,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'Type') required this.type,
      @JsonKey(name: 'ReportLate') required this.reportLate,
      @JsonKey(name: 'OldProjectID') required this.oldProjectId,
      @JsonKey(name: 'TotalHours') required this.totalHours,
      @JsonKey(name: 'StatusResult') required this.statusResult,
      @JsonKey(name: 'WorkPlanDetailID') required this.workPlanDetailId,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'UpdatedDate') required this.updatedDate,
      @JsonKey(name: 'UpdatedBy') required this.updatedBy,
      @JsonKey(name: 'ProjectItemID') required this.projectItemId,
      @JsonKey(name: 'PercentComplete') required this.percentComplete,
      @JsonKey(name: 'TotalHourOT') required this.totalHourOT,
      @JsonKey(name: 'Location') required this.location});

  factory _$DetailReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailReportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'MasterID')
  final int masterId;
  @override
  @JsonKey(name: 'UserReport')
  final int userReport;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'ProjectID')
  final int projectId;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'Results')
  final String results;
  @override
  @JsonKey(name: 'Problem')
  final String problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String note;
  @override
  @JsonKey(name: 'Confirm')
  final bool confirm;
  @override
  @JsonKey(name: 'Backlog')
  final String backlog;
  @override
  @JsonKey(name: 'DeleteFlag')
  final int deleteFlag;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'Type')
  final int type;
  @override
  @JsonKey(name: 'ReportLate')
  final int reportLate;
  @override
  @JsonKey(name: 'OldProjectID')
  final int oldProjectId;
  @override
  @JsonKey(name: 'TotalHours')
  final double totalHours;
  @override
  @JsonKey(name: 'StatusResult')
  final int statusResult;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  final int workPlanDetailId;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String updatedBy;
  @override
  @JsonKey(name: 'ProjectItemID')
  final int projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  final int percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  final double totalHourOT;
  @override
  @JsonKey(name: 'Location')
  final String location;

  @override
  String toString() {
    return 'DetailReportResponse(id: $id, masterId: $masterId, userReport: $userReport, dateReport: $dateReport, projectId: $projectId, content: $content, results: $results, problem: $problem, problemSolve: $problemSolve, planNextDay: $planNextDay, note: $note, confirm: $confirm, backlog: $backlog, deleteFlag: $deleteFlag, createdDate: $createdDate, type: $type, reportLate: $reportLate, oldProjectId: $oldProjectId, totalHours: $totalHours, statusResult: $statusResult, workPlanDetailId: $workPlanDetailId, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, projectItemId: $projectItemId, percentComplete: $percentComplete, totalHourOT: $totalHourOT, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.userReport, userReport) ||
                other.userReport == userReport) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reportLate, reportLate) ||
                other.reportLate == reportLate) &&
            (identical(other.oldProjectId, oldProjectId) ||
                other.oldProjectId == oldProjectId) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.statusResult, statusResult) ||
                other.statusResult == statusResult) &&
            (identical(other.workPlanDetailId, workPlanDetailId) ||
                other.workPlanDetailId == workPlanDetailId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        masterId,
        userReport,
        dateReport,
        projectId,
        content,
        results,
        problem,
        problemSolve,
        planNextDay,
        note,
        confirm,
        backlog,
        deleteFlag,
        createdDate,
        type,
        reportLate,
        oldProjectId,
        totalHours,
        statusResult,
        workPlanDetailId,
        createdBy,
        updatedDate,
        updatedBy,
        projectItemId,
        percentComplete,
        totalHourOT,
        location
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailReportResponseImplCopyWith<_$DetailReportResponseImpl>
      get copyWith =>
          __$$DetailReportResponseImplCopyWithImpl<_$DetailReportResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailReportResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailReportResponse implements DetailReportResponse {
  const factory _DetailReportResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'MasterID') required final int masterId,
      @JsonKey(name: 'UserReport') required final int userReport,
      @JsonKey(name: 'DateReport') required final String dateReport,
      @JsonKey(name: 'ProjectID') required final int projectId,
      @JsonKey(name: 'Content') required final String content,
      @JsonKey(name: 'Results') required final String results,
      @JsonKey(name: 'Problem') required final String problem,
      @JsonKey(name: 'ProblemSolve') required final String problemSolve,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Note') required final String note,
      @JsonKey(name: 'Confirm') required final bool confirm,
      @JsonKey(name: 'Backlog') required final String backlog,
      @JsonKey(name: 'DeleteFlag') required final int deleteFlag,
      @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
      @JsonKey(name: 'Type') required final int type,
      @JsonKey(name: 'ReportLate') required final int reportLate,
      @JsonKey(name: 'OldProjectID') required final int oldProjectId,
      @JsonKey(name: 'TotalHours') required final double totalHours,
      @JsonKey(name: 'StatusResult') required final int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') required final int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') required final String createdBy,
      @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') required final String updatedBy,
      @JsonKey(name: 'ProjectItemID') required final int projectItemId,
      @JsonKey(name: 'PercentComplete') required final int percentComplete,
      @JsonKey(name: 'TotalHourOT') required final double totalHourOT,
      @JsonKey(name: 'Location')
      required final String location}) = _$DetailReportResponseImpl;

  factory _DetailReportResponse.fromJson(Map<String, dynamic> json) =
      _$DetailReportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'MasterID')
  int get masterId;
  @override
  @JsonKey(name: 'UserReport')
  int get userReport;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'ProjectID')
  int get projectId;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'Results')
  String get results;
  @override
  @JsonKey(name: 'Problem')
  String get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String get note;
  @override
  @JsonKey(name: 'Confirm')
  bool get confirm;
  @override
  @JsonKey(name: 'Backlog')
  String get backlog;
  @override
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'Type')
  int get type;
  @override
  @JsonKey(name: 'ReportLate')
  int get reportLate;
  @override
  @JsonKey(name: 'OldProjectID')
  int get oldProjectId;
  @override
  @JsonKey(name: 'TotalHours')
  double get totalHours;
  @override
  @JsonKey(name: 'StatusResult')
  int get statusResult;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  int get workPlanDetailId;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy;
  @override
  @JsonKey(name: 'ProjectItemID')
  int get projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  int get percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  double get totalHourOT;
  @override
  @JsonKey(name: 'Location')
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$DetailReportResponseImplCopyWith<_$DetailReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailReportNullResponse _$DetailReportNullResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailReportNullResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailReportNullResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterID')
  int get masterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserReport')
  int get userReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportLate')
  int get reportLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldProjectID')
  int get oldProjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusResult')
  int get statusResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkPlanDetailID')
  int get workPlanDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentComplete')
  int? get percentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHourOT')
  double get totalHourOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'Location')
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailReportNullResponseCopyWith<DetailReportNullResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailReportNullResponseCopyWith<$Res> {
  factory $DetailReportNullResponseCopyWith(DetailReportNullResponse value,
          $Res Function(DetailReportNullResponse) then) =
      _$DetailReportNullResponseCopyWithImpl<$Res, DetailReportNullResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MasterID') int masterId,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectID') int projectId,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'Type') int type,
      @JsonKey(name: 'ReportLate') int reportLate,
      @JsonKey(name: 'OldProjectID') int oldProjectId,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'StatusResult') int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'PercentComplete') int? percentComplete,
      @JsonKey(name: 'TotalHourOT') double totalHourOT,
      @JsonKey(name: 'Location') String location});
}

/// @nodoc
class _$DetailReportNullResponseCopyWithImpl<$Res,
        $Val extends DetailReportNullResponse>
    implements $DetailReportNullResponseCopyWith<$Res> {
  _$DetailReportNullResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterId = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? projectId = null,
    Object? content = null,
    Object? results = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? confirm = null,
    Object? backlog = null,
    Object? deleteFlag = null,
    Object? createdDate = null,
    Object? type = null,
    Object? reportLate = null,
    Object? oldProjectId = null,
    Object? totalHours = null,
    Object? statusResult = null,
    Object? workPlanDetailId = null,
    Object? createdBy = null,
    Object? updatedDate = null,
    Object? updatedBy = null,
    Object? projectItemId = freezed,
    Object? percentComplete = freezed,
    Object? totalHourOT = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      reportLate: null == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int,
      oldProjectId: null == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      statusResult: null == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int,
      workPlanDetailId: null == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      percentComplete: freezed == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      totalHourOT: null == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailReportNullResponseImplCopyWith<$Res>
    implements $DetailReportNullResponseCopyWith<$Res> {
  factory _$$DetailReportNullResponseImplCopyWith(
          _$DetailReportNullResponseImpl value,
          $Res Function(_$DetailReportNullResponseImpl) then) =
      __$$DetailReportNullResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MasterID') int masterId,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'ProjectID') int projectId,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'Type') int type,
      @JsonKey(name: 'ReportLate') int reportLate,
      @JsonKey(name: 'OldProjectID') int oldProjectId,
      @JsonKey(name: 'TotalHours') double totalHours,
      @JsonKey(name: 'StatusResult') int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'ProjectItemID') int? projectItemId,
      @JsonKey(name: 'PercentComplete') int? percentComplete,
      @JsonKey(name: 'TotalHourOT') double totalHourOT,
      @JsonKey(name: 'Location') String location});
}

/// @nodoc
class __$$DetailReportNullResponseImplCopyWithImpl<$Res>
    extends _$DetailReportNullResponseCopyWithImpl<$Res,
        _$DetailReportNullResponseImpl>
    implements _$$DetailReportNullResponseImplCopyWith<$Res> {
  __$$DetailReportNullResponseImplCopyWithImpl(
      _$DetailReportNullResponseImpl _value,
      $Res Function(_$DetailReportNullResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? masterId = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? projectId = null,
    Object? content = null,
    Object? results = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? confirm = null,
    Object? backlog = null,
    Object? deleteFlag = null,
    Object? createdDate = null,
    Object? type = null,
    Object? reportLate = null,
    Object? oldProjectId = null,
    Object? totalHours = null,
    Object? statusResult = null,
    Object? workPlanDetailId = null,
    Object? createdBy = null,
    Object? updatedDate = null,
    Object? updatedBy = null,
    Object? projectItemId = freezed,
    Object? percentComplete = freezed,
    Object? totalHourOT = null,
    Object? location = null,
  }) {
    return _then(_$DetailReportNullResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      reportLate: null == reportLate
          ? _value.reportLate
          : reportLate // ignore: cast_nullable_to_non_nullable
              as int,
      oldProjectId: null == oldProjectId
          ? _value.oldProjectId
          : oldProjectId // ignore: cast_nullable_to_non_nullable
              as int,
      totalHours: null == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double,
      statusResult: null == statusResult
          ? _value.statusResult
          : statusResult // ignore: cast_nullable_to_non_nullable
              as int,
      workPlanDetailId: null == workPlanDetailId
          ? _value.workPlanDetailId
          : workPlanDetailId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemId: freezed == projectItemId
          ? _value.projectItemId
          : projectItemId // ignore: cast_nullable_to_non_nullable
              as int?,
      percentComplete: freezed == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      totalHourOT: null == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailReportNullResponseImpl implements _DetailReportNullResponse {
  const _$DetailReportNullResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'MasterID') required this.masterId,
      @JsonKey(name: 'UserReport') required this.userReport,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'ProjectID') required this.projectId,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'Results') required this.results,
      @JsonKey(name: 'Problem') required this.problem,
      @JsonKey(name: 'ProblemSolve') required this.problemSolve,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Note') required this.note,
      @JsonKey(name: 'Confirm') required this.confirm,
      @JsonKey(name: 'Backlog') required this.backlog,
      @JsonKey(name: 'DeleteFlag') required this.deleteFlag,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'Type') required this.type,
      @JsonKey(name: 'ReportLate') required this.reportLate,
      @JsonKey(name: 'OldProjectID') required this.oldProjectId,
      @JsonKey(name: 'TotalHours') required this.totalHours,
      @JsonKey(name: 'StatusResult') required this.statusResult,
      @JsonKey(name: 'WorkPlanDetailID') required this.workPlanDetailId,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'UpdatedDate') required this.updatedDate,
      @JsonKey(name: 'UpdatedBy') required this.updatedBy,
      @JsonKey(name: 'ProjectItemID') this.projectItemId,
      @JsonKey(name: 'PercentComplete') this.percentComplete,
      @JsonKey(name: 'TotalHourOT') required this.totalHourOT,
      @JsonKey(name: 'Location') required this.location});

  factory _$DetailReportNullResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailReportNullResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'MasterID')
  final int masterId;
  @override
  @JsonKey(name: 'UserReport')
  final int userReport;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'ProjectID')
  final int projectId;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'Results')
  final String results;
  @override
  @JsonKey(name: 'Problem')
  final String problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String note;
  @override
  @JsonKey(name: 'Confirm')
  final bool confirm;
  @override
  @JsonKey(name: 'Backlog')
  final String backlog;
  @override
  @JsonKey(name: 'DeleteFlag')
  final int deleteFlag;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'Type')
  final int type;
  @override
  @JsonKey(name: 'ReportLate')
  final int reportLate;
  @override
  @JsonKey(name: 'OldProjectID')
  final int oldProjectId;
  @override
  @JsonKey(name: 'TotalHours')
  final double totalHours;
  @override
  @JsonKey(name: 'StatusResult')
  final int statusResult;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  final int workPlanDetailId;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String updatedBy;
  @override
  @JsonKey(name: 'ProjectItemID')
  final int? projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  final int? percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  final double totalHourOT;
  @override
  @JsonKey(name: 'Location')
  final String location;

  @override
  String toString() {
    return 'DetailReportNullResponse(id: $id, masterId: $masterId, userReport: $userReport, dateReport: $dateReport, projectId: $projectId, content: $content, results: $results, problem: $problem, problemSolve: $problemSolve, planNextDay: $planNextDay, note: $note, confirm: $confirm, backlog: $backlog, deleteFlag: $deleteFlag, createdDate: $createdDate, type: $type, reportLate: $reportLate, oldProjectId: $oldProjectId, totalHours: $totalHours, statusResult: $statusResult, workPlanDetailId: $workPlanDetailId, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, projectItemId: $projectItemId, percentComplete: $percentComplete, totalHourOT: $totalHourOT, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailReportNullResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.userReport, userReport) ||
                other.userReport == userReport) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.reportLate, reportLate) ||
                other.reportLate == reportLate) &&
            (identical(other.oldProjectId, oldProjectId) ||
                other.oldProjectId == oldProjectId) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.statusResult, statusResult) ||
                other.statusResult == statusResult) &&
            (identical(other.workPlanDetailId, workPlanDetailId) ||
                other.workPlanDetailId == workPlanDetailId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.projectItemId, projectItemId) ||
                other.projectItemId == projectItemId) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        masterId,
        userReport,
        dateReport,
        projectId,
        content,
        results,
        problem,
        problemSolve,
        planNextDay,
        note,
        confirm,
        backlog,
        deleteFlag,
        createdDate,
        type,
        reportLate,
        oldProjectId,
        totalHours,
        statusResult,
        workPlanDetailId,
        createdBy,
        updatedDate,
        updatedBy,
        projectItemId,
        percentComplete,
        totalHourOT,
        location
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailReportNullResponseImplCopyWith<_$DetailReportNullResponseImpl>
      get copyWith => __$$DetailReportNullResponseImplCopyWithImpl<
          _$DetailReportNullResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailReportNullResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailReportNullResponse implements DetailReportNullResponse {
  const factory _DetailReportNullResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'MasterID') required final int masterId,
      @JsonKey(name: 'UserReport') required final int userReport,
      @JsonKey(name: 'DateReport') required final String dateReport,
      @JsonKey(name: 'ProjectID') required final int projectId,
      @JsonKey(name: 'Content') required final String content,
      @JsonKey(name: 'Results') required final String results,
      @JsonKey(name: 'Problem') required final String problem,
      @JsonKey(name: 'ProblemSolve') required final String problemSolve,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Note') required final String note,
      @JsonKey(name: 'Confirm') required final bool confirm,
      @JsonKey(name: 'Backlog') required final String backlog,
      @JsonKey(name: 'DeleteFlag') required final int deleteFlag,
      @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
      @JsonKey(name: 'Type') required final int type,
      @JsonKey(name: 'ReportLate') required final int reportLate,
      @JsonKey(name: 'OldProjectID') required final int oldProjectId,
      @JsonKey(name: 'TotalHours') required final double totalHours,
      @JsonKey(name: 'StatusResult') required final int statusResult,
      @JsonKey(name: 'WorkPlanDetailID') required final int workPlanDetailId,
      @JsonKey(name: 'CreatedBy') required final String createdBy,
      @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate,
      @JsonKey(name: 'UpdatedBy') required final String updatedBy,
      @JsonKey(name: 'ProjectItemID') final int? projectItemId,
      @JsonKey(name: 'PercentComplete') final int? percentComplete,
      @JsonKey(name: 'TotalHourOT') required final double totalHourOT,
      @JsonKey(name: 'Location')
      required final String location}) = _$DetailReportNullResponseImpl;

  factory _DetailReportNullResponse.fromJson(Map<String, dynamic> json) =
      _$DetailReportNullResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'MasterID')
  int get masterId;
  @override
  @JsonKey(name: 'UserReport')
  int get userReport;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'ProjectID')
  int get projectId;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'Results')
  String get results;
  @override
  @JsonKey(name: 'Problem')
  String get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String get note;
  @override
  @JsonKey(name: 'Confirm')
  bool get confirm;
  @override
  @JsonKey(name: 'Backlog')
  String get backlog;
  @override
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'Type')
  int get type;
  @override
  @JsonKey(name: 'ReportLate')
  int get reportLate;
  @override
  @JsonKey(name: 'OldProjectID')
  int get oldProjectId;
  @override
  @JsonKey(name: 'TotalHours')
  double get totalHours;
  @override
  @JsonKey(name: 'StatusResult')
  int get statusResult;
  @override
  @JsonKey(name: 'WorkPlanDetailID')
  int get workPlanDetailId;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy;
  @override
  @JsonKey(name: 'ProjectItemID')
  int? get projectItemId;
  @override
  @JsonKey(name: 'PercentComplete')
  int? get percentComplete;
  @override
  @JsonKey(name: 'TotalHourOT')
  double get totalHourOT;
  @override
  @JsonKey(name: 'Location')
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$DetailReportNullResponseImplCopyWith<_$DetailReportNullResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CopyRequest _$CopyRequestFromJson(Map<String, dynamic> json) {
  return _CopyRequest.fromJson(json);
}

/// @nodoc
mixin _$CopyRequest {
  @JsonKey(name: 'dateStart')
  String get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateEnd')
  String get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id')
  int get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'keyword')
  String get keyword => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'departmentid')
  int get departmentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CopyRequestCopyWith<CopyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyRequestCopyWith<$Res> {
  factory $CopyRequestCopyWith(
          CopyRequest value, $Res Function(CopyRequest) then) =
      _$CopyRequestCopyWithImpl<$Res, CopyRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dateStart') String dateStart,
      @JsonKey(name: 'dateEnd') String dateEnd,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'keyword') String keyword,
      @JsonKey(name: 'userid') int userId,
      @JsonKey(name: 'departmentid') int departmentId});
}

/// @nodoc
class _$CopyRequestCopyWithImpl<$Res, $Val extends CopyRequest>
    implements $CopyRequestCopyWith<$Res> {
  _$CopyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? teamId = null,
    Object? keyword = null,
    Object? userId = null,
    Object? departmentId = null,
  }) {
    return _then(_value.copyWith(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CopyRequestImplCopyWith<$Res>
    implements $CopyRequestCopyWith<$Res> {
  factory _$$CopyRequestImplCopyWith(
          _$CopyRequestImpl value, $Res Function(_$CopyRequestImpl) then) =
      __$$CopyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dateStart') String dateStart,
      @JsonKey(name: 'dateEnd') String dateEnd,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'keyword') String keyword,
      @JsonKey(name: 'userid') int userId,
      @JsonKey(name: 'departmentid') int departmentId});
}

/// @nodoc
class __$$CopyRequestImplCopyWithImpl<$Res>
    extends _$CopyRequestCopyWithImpl<$Res, _$CopyRequestImpl>
    implements _$$CopyRequestImplCopyWith<$Res> {
  __$$CopyRequestImplCopyWithImpl(
      _$CopyRequestImpl _value, $Res Function(_$CopyRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? teamId = null,
    Object? keyword = null,
    Object? userId = null,
    Object? departmentId = null,
  }) {
    return _then(_$CopyRequestImpl(
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CopyRequestImpl implements _CopyRequest {
  const _$CopyRequestImpl(
      {@JsonKey(name: 'dateStart') required this.dateStart,
      @JsonKey(name: 'dateEnd') required this.dateEnd,
      @JsonKey(name: 'team_id') required this.teamId,
      @JsonKey(name: 'keyword') required this.keyword,
      @JsonKey(name: 'userid') required this.userId,
      @JsonKey(name: 'departmentid') required this.departmentId});

  factory _$CopyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyRequestImplFromJson(json);

  @override
  @JsonKey(name: 'dateStart')
  final String dateStart;
  @override
  @JsonKey(name: 'dateEnd')
  final String dateEnd;
  @override
  @JsonKey(name: 'team_id')
  final int teamId;
  @override
  @JsonKey(name: 'keyword')
  final String keyword;
  @override
  @JsonKey(name: 'userid')
  final int userId;
  @override
  @JsonKey(name: 'departmentid')
  final int departmentId;

  @override
  String toString() {
    return 'CopyRequest(dateStart: $dateStart, dateEnd: $dateEnd, teamId: $teamId, keyword: $keyword, userId: $userId, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyRequestImpl &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateStart, dateEnd, teamId, keyword, userId, departmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyRequestImplCopyWith<_$CopyRequestImpl> get copyWith =>
      __$$CopyRequestImplCopyWithImpl<_$CopyRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyRequestImplToJson(
      this,
    );
  }
}

abstract class _CopyRequest implements CopyRequest {
  const factory _CopyRequest(
          {@JsonKey(name: 'dateStart') required final String dateStart,
          @JsonKey(name: 'dateEnd') required final String dateEnd,
          @JsonKey(name: 'team_id') required final int teamId,
          @JsonKey(name: 'keyword') required final String keyword,
          @JsonKey(name: 'userid') required final int userId,
          @JsonKey(name: 'departmentid') required final int departmentId}) =
      _$CopyRequestImpl;

  factory _CopyRequest.fromJson(Map<String, dynamic> json) =
      _$CopyRequestImpl.fromJson;

  @override
  @JsonKey(name: 'dateStart')
  String get dateStart;
  @override
  @JsonKey(name: 'dateEnd')
  String get dateEnd;
  @override
  @JsonKey(name: 'team_id')
  int get teamId;
  @override
  @JsonKey(name: 'keyword')
  String get keyword;
  @override
  @JsonKey(name: 'userid')
  int get userId;
  @override
  @JsonKey(name: 'departmentid')
  int get departmentId;
  @override
  @JsonKey(ignore: true)
  _$$CopyRequestImplCopyWith<_$CopyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CopyResponse _$CopyResponseFromJson(Map<String, dynamic> json) {
  return _CopyResponse.fromJson(json);
}

/// @nodoc
mixin _$CopyResponse {
  @JsonKey(name: 'ProjectCode')
  String get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemCode')
  String get projectItemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String get mission =>
      throw _privateConstructorUsedError; // Nội dung công việc
  @JsonKey(name: 'Results')
  String get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CopyResponseCopyWith<CopyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyResponseCopyWith<$Res> {
  factory $CopyResponseCopyWith(
          CopyResponse value, $Res Function(CopyResponse) then) =
      _$CopyResponseCopyWithImpl<$Res, CopyResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
      @JsonKey(name: 'ProjectItemCode') String projectItemCode,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Mission') String mission,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note});
}

/// @nodoc
class _$CopyResponseCopyWithImpl<$Res, $Val extends CopyResponse>
    implements $CopyResponseCopyWith<$Res> {
  _$CopyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectItemCode = null,
    Object? dateReport = null,
    Object? mission = null,
    Object? results = null,
    Object? backlog = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemCode: null == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      mission: null == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CopyResponseImplCopyWith<$Res>
    implements $CopyResponseCopyWith<$Res> {
  factory _$$CopyResponseImplCopyWith(
          _$CopyResponseImpl value, $Res Function(_$CopyResponseImpl) then) =
      __$$CopyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
      @JsonKey(name: 'ProjectItemCode') String projectItemCode,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Mission') String mission,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'Problem') String problem,
      @JsonKey(name: 'ProblemSolve') String problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note});
}

/// @nodoc
class __$$CopyResponseImplCopyWithImpl<$Res>
    extends _$CopyResponseCopyWithImpl<$Res, _$CopyResponseImpl>
    implements _$$CopyResponseImplCopyWith<$Res> {
  __$$CopyResponseImplCopyWithImpl(
      _$CopyResponseImpl _value, $Res Function(_$CopyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectItemCode = null,
    Object? dateReport = null,
    Object? mission = null,
    Object? results = null,
    Object? backlog = null,
    Object? problem = null,
    Object? problemSolve = null,
    Object? planNextDay = null,
    Object? note = null,
  }) {
    return _then(_$CopyResponseImpl(
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectItemCode: null == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      mission: null == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      problem: null == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String,
      problemSolve: null == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CopyResponseImpl implements _CopyResponse {
  const _$CopyResponseImpl(
      {@JsonKey(name: 'ProjectCode') required this.projectCode,
      @JsonKey(name: 'ProjectName') required this.projectName,
      @JsonKey(name: 'ProjectItemCode') required this.projectItemCode,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'Mission') required this.mission,
      @JsonKey(name: 'Results') required this.results,
      @JsonKey(name: 'Backlog') required this.backlog,
      @JsonKey(name: 'Problem') required this.problem,
      @JsonKey(name: 'ProblemSolve') required this.problemSolve,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Note') required this.note});

  factory _$CopyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ProjectCode')
  final String projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String projectName;
  @override
  @JsonKey(name: 'ProjectItemCode')
  final String projectItemCode;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'Mission')
  final String mission;
// Nội dung công việc
  @override
  @JsonKey(name: 'Results')
  final String results;
  @override
  @JsonKey(name: 'Backlog')
  final String backlog;
  @override
  @JsonKey(name: 'Problem')
  final String problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String note;

  @override
  String toString() {
    return 'CopyResponse(projectCode: $projectCode, projectName: $projectName, projectItemCode: $projectItemCode, dateReport: $dateReport, mission: $mission, results: $results, backlog: $backlog, problem: $problem, problemSolve: $problemSolve, planNextDay: $planNextDay, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyResponseImpl &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectItemCode, projectItemCode) ||
                other.projectItemCode == projectItemCode) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectCode,
      projectName,
      projectItemCode,
      dateReport,
      mission,
      results,
      backlog,
      problem,
      problemSolve,
      planNextDay,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyResponseImplCopyWith<_$CopyResponseImpl> get copyWith =>
      __$$CopyResponseImplCopyWithImpl<_$CopyResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyResponseImplToJson(
      this,
    );
  }
}

abstract class _CopyResponse implements CopyResponse {
  const factory _CopyResponse(
      {@JsonKey(name: 'ProjectCode') required final String projectCode,
      @JsonKey(name: 'ProjectName') required final String projectName,
      @JsonKey(name: 'ProjectItemCode') required final String projectItemCode,
      @JsonKey(name: 'DateReport') required final String dateReport,
      @JsonKey(name: 'Mission') required final String mission,
      @JsonKey(name: 'Results') required final String results,
      @JsonKey(name: 'Backlog') required final String backlog,
      @JsonKey(name: 'Problem') required final String problem,
      @JsonKey(name: 'ProblemSolve') required final String problemSolve,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Note') required final String note}) = _$CopyResponseImpl;

  factory _CopyResponse.fromJson(Map<String, dynamic> json) =
      _$CopyResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ProjectCode')
  String get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String get projectName;
  @override
  @JsonKey(name: 'ProjectItemCode')
  String get projectItemCode;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'Mission')
  String get mission;
  @override // Nội dung công việc
  @JsonKey(name: 'Results')
  String get results;
  @override
  @JsonKey(name: 'Backlog')
  String get backlog;
  @override
  @JsonKey(name: 'Problem')
  String get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String get problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$CopyResponseImplCopyWith<_$CopyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CopyNullResponse _$CopyNullResponseFromJson(Map<String, dynamic> json) {
  return _CopyNullResponse.fromJson(json);
}

/// @nodoc
mixin _$CopyNullResponse {
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemCode')
  String? get projectItemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String? get mission => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String? get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CopyNullResponseCopyWith<CopyNullResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CopyNullResponseCopyWith<$Res> {
  factory $CopyNullResponseCopyWith(
          CopyNullResponse value, $Res Function(CopyNullResponse) then) =
      _$CopyNullResponseCopyWithImpl<$Res, CopyNullResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectItemCode') String? projectItemCode,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note});
}

/// @nodoc
class _$CopyNullResponseCopyWithImpl<$Res, $Val extends CopyNullResponse>
    implements $CopyNullResponseCopyWith<$Res> {
  _$CopyNullResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectItemCode = freezed,
    Object? dateReport = null,
    Object? mission = freezed,
    Object? results = freezed,
    Object? backlog = null,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? planNextDay = null,
    Object? note = null,
  }) {
    return _then(_value.copyWith(
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectItemCode: freezed == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CopyNullResponseImplCopyWith<$Res>
    implements $CopyNullResponseCopyWith<$Res> {
  factory _$$CopyNullResponseImplCopyWith(_$CopyNullResponseImpl value,
          $Res Function(_$CopyNullResponseImpl) then) =
      __$$CopyNullResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectItemCode') String? projectItemCode,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'Backlog') String backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note});
}

/// @nodoc
class __$$CopyNullResponseImplCopyWithImpl<$Res>
    extends _$CopyNullResponseCopyWithImpl<$Res, _$CopyNullResponseImpl>
    implements _$$CopyNullResponseImplCopyWith<$Res> {
  __$$CopyNullResponseImplCopyWithImpl(_$CopyNullResponseImpl _value,
      $Res Function(_$CopyNullResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectItemCode = freezed,
    Object? dateReport = null,
    Object? mission = freezed,
    Object? results = freezed,
    Object? backlog = null,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? planNextDay = null,
    Object? note = null,
  }) {
    return _then(_$CopyNullResponseImpl(
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectItemCode: freezed == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: null == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CopyNullResponseImpl implements _CopyNullResponse {
  const _$CopyNullResponseImpl(
      {@JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectItemCode') this.projectItemCode,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'Mission') this.mission,
      @JsonKey(name: 'Results') this.results,
      @JsonKey(name: 'Backlog') required this.backlog,
      @JsonKey(name: 'Problem') this.problem,
      @JsonKey(name: 'ProblemSolve') this.problemSolve,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Note') required this.note});

  factory _$CopyNullResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CopyNullResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ProjectItemCode')
  final String? projectItemCode;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'Mission')
  final String? mission;
  @override
  @JsonKey(name: 'Results')
  final String? results;
  @override
  @JsonKey(name: 'Backlog')
  final String backlog;
  @override
  @JsonKey(name: 'Problem')
  final String? problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String? problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String note;

  @override
  String toString() {
    return 'CopyNullResponse(projectCode: $projectCode, projectName: $projectName, projectItemCode: $projectItemCode, dateReport: $dateReport, mission: $mission, results: $results, backlog: $backlog, problem: $problem, problemSolve: $problemSolve, planNextDay: $planNextDay, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyNullResponseImpl &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectItemCode, projectItemCode) ||
                other.projectItemCode == projectItemCode) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectCode,
      projectName,
      projectItemCode,
      dateReport,
      mission,
      results,
      backlog,
      problem,
      problemSolve,
      planNextDay,
      note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyNullResponseImplCopyWith<_$CopyNullResponseImpl> get copyWith =>
      __$$CopyNullResponseImplCopyWithImpl<_$CopyNullResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CopyNullResponseImplToJson(
      this,
    );
  }
}

abstract class _CopyNullResponse implements CopyNullResponse {
  const factory _CopyNullResponse(
          {@JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProjectItemCode') final String? projectItemCode,
          @JsonKey(name: 'DateReport') required final String dateReport,
          @JsonKey(name: 'Mission') final String? mission,
          @JsonKey(name: 'Results') final String? results,
          @JsonKey(name: 'Backlog') required final String backlog,
          @JsonKey(name: 'Problem') final String? problem,
          @JsonKey(name: 'ProblemSolve') final String? problemSolve,
          @JsonKey(name: 'PlanNextDay') required final String planNextDay,
          @JsonKey(name: 'Note') required final String note}) =
      _$CopyNullResponseImpl;

  factory _CopyNullResponse.fromJson(Map<String, dynamic> json) =
      _$CopyNullResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ProjectItemCode')
  String? get projectItemCode;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'Mission')
  String? get mission;
  @override
  @JsonKey(name: 'Results')
  String? get results;
  @override
  @JsonKey(name: 'Backlog')
  String get backlog;
  @override
  @JsonKey(name: 'Problem')
  String? get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String get note;
  @override
  @JsonKey(ignore: true)
  _$$CopyNullResponseImplCopyWith<_$CopyNullResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketingFileRequest _$MarketingFileRequestFromJson(Map<String, dynamic> json) {
  return _MarketingFileRequest.fromJson(json);
}

/// @nodoc
mixin _$MarketingFileRequest {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileNameOrigin')
  String get fileNameOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'OriginPath')
  String get originPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'Extension')
  String get extension => throw _privateConstructorUsedError;
  @JsonKey(name: 'PathServer')
  String get pathServer => throw _privateConstructorUsedError;
  @JsonKey(name: 'DailyReportID')
  int get dailyReportId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingFileRequestCopyWith<MarketingFileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingFileRequestCopyWith<$Res> {
  factory $MarketingFileRequestCopyWith(MarketingFileRequest value,
          $Res Function(MarketingFileRequest) then) =
      _$MarketingFileRequestCopyWithImpl<$Res, MarketingFileRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'FileNameOrigin') String fileNameOrigin,
      @JsonKey(name: 'OriginPath') String originPath,
      @JsonKey(name: 'Extension') String extension,
      @JsonKey(name: 'PathServer') String pathServer,
      @JsonKey(name: 'DailyReportID') int dailyReportId});
}

/// @nodoc
class _$MarketingFileRequestCopyWithImpl<$Res,
        $Val extends MarketingFileRequest>
    implements $MarketingFileRequestCopyWith<$Res> {
  _$MarketingFileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileNameOrigin = null,
    Object? originPath = null,
    Object? extension = null,
    Object? pathServer = null,
    Object? dailyReportId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileNameOrigin: null == fileNameOrigin
          ? _value.fileNameOrigin
          : fileNameOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      originPath: null == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      pathServer: null == pathServer
          ? _value.pathServer
          : pathServer // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportId: null == dailyReportId
          ? _value.dailyReportId
          : dailyReportId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingFileRequestImplCopyWith<$Res>
    implements $MarketingFileRequestCopyWith<$Res> {
  factory _$$MarketingFileRequestImplCopyWith(_$MarketingFileRequestImpl value,
          $Res Function(_$MarketingFileRequestImpl) then) =
      __$$MarketingFileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'FileNameOrigin') String fileNameOrigin,
      @JsonKey(name: 'OriginPath') String originPath,
      @JsonKey(name: 'Extension') String extension,
      @JsonKey(name: 'PathServer') String pathServer,
      @JsonKey(name: 'DailyReportID') int dailyReportId});
}

/// @nodoc
class __$$MarketingFileRequestImplCopyWithImpl<$Res>
    extends _$MarketingFileRequestCopyWithImpl<$Res, _$MarketingFileRequestImpl>
    implements _$$MarketingFileRequestImplCopyWith<$Res> {
  __$$MarketingFileRequestImplCopyWithImpl(_$MarketingFileRequestImpl _value,
      $Res Function(_$MarketingFileRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileNameOrigin = null,
    Object? originPath = null,
    Object? extension = null,
    Object? pathServer = null,
    Object? dailyReportId = null,
  }) {
    return _then(_$MarketingFileRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileNameOrigin: null == fileNameOrigin
          ? _value.fileNameOrigin
          : fileNameOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      originPath: null == originPath
          ? _value.originPath
          : originPath // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      pathServer: null == pathServer
          ? _value.pathServer
          : pathServer // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportId: null == dailyReportId
          ? _value.dailyReportId
          : dailyReportId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketingFileRequestImpl implements _MarketingFileRequest {
  const _$MarketingFileRequestImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'FileName') required this.fileName,
      @JsonKey(name: 'FileNameOrigin') required this.fileNameOrigin,
      @JsonKey(name: 'OriginPath') required this.originPath,
      @JsonKey(name: 'Extension') required this.extension,
      @JsonKey(name: 'PathServer') required this.pathServer,
      @JsonKey(name: 'DailyReportID') required this.dailyReportId});

  factory _$MarketingFileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingFileRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'FileName')
  final String fileName;
  @override
  @JsonKey(name: 'FileNameOrigin')
  final String fileNameOrigin;
  @override
  @JsonKey(name: 'OriginPath')
  final String originPath;
  @override
  @JsonKey(name: 'Extension')
  final String extension;
  @override
  @JsonKey(name: 'PathServer')
  final String pathServer;
  @override
  @JsonKey(name: 'DailyReportID')
  final int dailyReportId;

  @override
  String toString() {
    return 'MarketingFileRequest(id: $id, fileName: $fileName, fileNameOrigin: $fileNameOrigin, originPath: $originPath, extension: $extension, pathServer: $pathServer, dailyReportId: $dailyReportId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingFileRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileNameOrigin, fileNameOrigin) ||
                other.fileNameOrigin == fileNameOrigin) &&
            (identical(other.originPath, originPath) ||
                other.originPath == originPath) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.pathServer, pathServer) ||
                other.pathServer == pathServer) &&
            (identical(other.dailyReportId, dailyReportId) ||
                other.dailyReportId == dailyReportId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, fileNameOrigin,
      originPath, extension, pathServer, dailyReportId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingFileRequestImplCopyWith<_$MarketingFileRequestImpl>
      get copyWith =>
          __$$MarketingFileRequestImplCopyWithImpl<_$MarketingFileRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingFileRequestImplToJson(
      this,
    );
  }
}

abstract class _MarketingFileRequest implements MarketingFileRequest {
  const factory _MarketingFileRequest(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'FileName') required final String fileName,
          @JsonKey(name: 'FileNameOrigin') required final String fileNameOrigin,
          @JsonKey(name: 'OriginPath') required final String originPath,
          @JsonKey(name: 'Extension') required final String extension,
          @JsonKey(name: 'PathServer') required final String pathServer,
          @JsonKey(name: 'DailyReportID') required final int dailyReportId}) =
      _$MarketingFileRequestImpl;

  factory _MarketingFileRequest.fromJson(Map<String, dynamic> json) =
      _$MarketingFileRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'FileName')
  String get fileName;
  @override
  @JsonKey(name: 'FileNameOrigin')
  String get fileNameOrigin;
  @override
  @JsonKey(name: 'OriginPath')
  String get originPath;
  @override
  @JsonKey(name: 'Extension')
  String get extension;
  @override
  @JsonKey(name: 'PathServer')
  String get pathServer;
  @override
  @JsonKey(name: 'DailyReportID')
  int get dailyReportId;
  @override
  @JsonKey(ignore: true)
  _$$MarketingFileRequestImplCopyWith<_$MarketingFileRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MarketingRequest _$MarketingRequestFromJson(Map<String, dynamic> json) {
  return _MarketingRequest.fromJson(json);
}

/// @nodoc
mixin _$MarketingRequest {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserReport')
  int get userReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'dailyReportMarketingFiles')
  List<MarketingFileRequest> get dailyReportMarketingFiles =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deletedFileID')
  List<int> get deletedFileId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingRequestCopyWith<MarketingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingRequestCopyWith<$Res> {
  factory $MarketingRequestCopyWith(
          MarketingRequest value, $Res Function(MarketingRequest) then) =
      _$MarketingRequestCopyWithImpl<$Res, MarketingRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'dailyReportMarketingFiles')
      List<MarketingFileRequest> dailyReportMarketingFiles,
      @JsonKey(name: 'deletedFileID') List<int> deletedFileId});
}

/// @nodoc
class _$MarketingRequestCopyWithImpl<$Res, $Val extends MarketingRequest>
    implements $MarketingRequestCopyWith<$Res> {
  _$MarketingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? content = null,
    Object? results = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? dailyReportMarketingFiles = null,
    Object? deletedFileId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportMarketingFiles: null == dailyReportMarketingFiles
          ? _value.dailyReportMarketingFiles
          : dailyReportMarketingFiles // ignore: cast_nullable_to_non_nullable
              as List<MarketingFileRequest>,
      deletedFileId: null == deletedFileId
          ? _value.deletedFileId
          : deletedFileId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingRequestImplCopyWith<$Res>
    implements $MarketingRequestCopyWith<$Res> {
  factory _$$MarketingRequestImplCopyWith(_$MarketingRequestImpl value,
          $Res Function(_$MarketingRequestImpl) then) =
      __$$MarketingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'UserReport') int userReport,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'Results') String results,
      @JsonKey(name: 'PlanNextDay') String planNextDay,
      @JsonKey(name: 'Note') String note,
      @JsonKey(name: 'dailyReportMarketingFiles')
      List<MarketingFileRequest> dailyReportMarketingFiles,
      @JsonKey(name: 'deletedFileID') List<int> deletedFileId});
}

/// @nodoc
class __$$MarketingRequestImplCopyWithImpl<$Res>
    extends _$MarketingRequestCopyWithImpl<$Res, _$MarketingRequestImpl>
    implements _$$MarketingRequestImplCopyWith<$Res> {
  __$$MarketingRequestImplCopyWithImpl(_$MarketingRequestImpl _value,
      $Res Function(_$MarketingRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userReport = null,
    Object? dateReport = null,
    Object? content = null,
    Object? results = null,
    Object? planNextDay = null,
    Object? note = null,
    Object? dailyReportMarketingFiles = null,
    Object? deletedFileId = null,
  }) {
    return _then(_$MarketingRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userReport: null == userReport
          ? _value.userReport
          : userReport // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String,
      planNextDay: null == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportMarketingFiles: null == dailyReportMarketingFiles
          ? _value._dailyReportMarketingFiles
          : dailyReportMarketingFiles // ignore: cast_nullable_to_non_nullable
              as List<MarketingFileRequest>,
      deletedFileId: null == deletedFileId
          ? _value._deletedFileId
          : deletedFileId // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketingRequestImpl implements _MarketingRequest {
  const _$MarketingRequestImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'UserReport') required this.userReport,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'Results') required this.results,
      @JsonKey(name: 'PlanNextDay') required this.planNextDay,
      @JsonKey(name: 'Note') required this.note,
      @JsonKey(name: 'dailyReportMarketingFiles')
      required final List<MarketingFileRequest> dailyReportMarketingFiles,
      @JsonKey(name: 'deletedFileID') required final List<int> deletedFileId})
      : _dailyReportMarketingFiles = dailyReportMarketingFiles,
        _deletedFileId = deletedFileId;

  factory _$MarketingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'UserReport')
  final int userReport;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'Results')
  final String results;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String note;
  final List<MarketingFileRequest> _dailyReportMarketingFiles;
  @override
  @JsonKey(name: 'dailyReportMarketingFiles')
  List<MarketingFileRequest> get dailyReportMarketingFiles {
    if (_dailyReportMarketingFiles is EqualUnmodifiableListView)
      return _dailyReportMarketingFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyReportMarketingFiles);
  }

  final List<int> _deletedFileId;
  @override
  @JsonKey(name: 'deletedFileID')
  List<int> get deletedFileId {
    if (_deletedFileId is EqualUnmodifiableListView) return _deletedFileId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedFileId);
  }

  @override
  String toString() {
    return 'MarketingRequest(id: $id, userReport: $userReport, dateReport: $dateReport, content: $content, results: $results, planNextDay: $planNextDay, note: $note, dailyReportMarketingFiles: $dailyReportMarketingFiles, deletedFileId: $deletedFileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userReport, userReport) ||
                other.userReport == userReport) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(
                other._dailyReportMarketingFiles, _dailyReportMarketingFiles) &&
            const DeepCollectionEquality()
                .equals(other._deletedFileId, _deletedFileId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userReport,
      dateReport,
      content,
      results,
      planNextDay,
      note,
      const DeepCollectionEquality().hash(_dailyReportMarketingFiles),
      const DeepCollectionEquality().hash(_deletedFileId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingRequestImplCopyWith<_$MarketingRequestImpl> get copyWith =>
      __$$MarketingRequestImplCopyWithImpl<_$MarketingRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingRequestImplToJson(
      this,
    );
  }
}

abstract class _MarketingRequest implements MarketingRequest {
  const factory _MarketingRequest(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'UserReport') required final int userReport,
      @JsonKey(name: 'DateReport') required final String dateReport,
      @JsonKey(name: 'Content') required final String content,
      @JsonKey(name: 'Results') required final String results,
      @JsonKey(name: 'PlanNextDay') required final String planNextDay,
      @JsonKey(name: 'Note') required final String note,
      @JsonKey(name: 'dailyReportMarketingFiles')
      required final List<MarketingFileRequest> dailyReportMarketingFiles,
      @JsonKey(name: 'deletedFileID')
      required final List<int> deletedFileId}) = _$MarketingRequestImpl;

  factory _MarketingRequest.fromJson(Map<String, dynamic> json) =
      _$MarketingRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'UserReport')
  int get userReport;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'Results')
  String get results;
  @override
  @JsonKey(name: 'PlanNextDay')
  String get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String get note;
  @override
  @JsonKey(name: 'dailyReportMarketingFiles')
  List<MarketingFileRequest> get dailyReportMarketingFiles;
  @override
  @JsonKey(name: 'deletedFileID')
  List<int> get deletedFileId;
  @override
  @JsonKey(ignore: true)
  _$$MarketingRequestImplCopyWith<_$MarketingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) {
  return _UploadFileResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponse {
  @JsonKey(name: 'OriginalFileName')
  String get originalFileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SavedFileName')
  String get savedFileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilePath')
  String get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileSize')
  int get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentType')
  String get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'UploadTime')
  DateTime get uploadTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFileResponseCopyWith<UploadFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseCopyWith<$Res> {
  factory $UploadFileResponseCopyWith(
          UploadFileResponse value, $Res Function(UploadFileResponse) then) =
      _$UploadFileResponseCopyWithImpl<$Res, UploadFileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OriginalFileName') String originalFileName,
      @JsonKey(name: 'SavedFileName') String savedFileName,
      @JsonKey(name: 'FilePath') String filePath,
      @JsonKey(name: 'FileSize') int fileSize,
      @JsonKey(name: 'ContentType') String contentType,
      @JsonKey(name: 'UploadTime') DateTime uploadTime});
}

/// @nodoc
class _$UploadFileResponseCopyWithImpl<$Res, $Val extends UploadFileResponse>
    implements $UploadFileResponseCopyWith<$Res> {
  _$UploadFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalFileName = null,
    Object? savedFileName = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? contentType = null,
    Object? uploadTime = null,
  }) {
    return _then(_value.copyWith(
      originalFileName: null == originalFileName
          ? _value.originalFileName
          : originalFileName // ignore: cast_nullable_to_non_nullable
              as String,
      savedFileName: null == savedFileName
          ? _value.savedFileName
          : savedFileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFileResponseImplCopyWith<$Res>
    implements $UploadFileResponseCopyWith<$Res> {
  factory _$$UploadFileResponseImplCopyWith(_$UploadFileResponseImpl value,
          $Res Function(_$UploadFileResponseImpl) then) =
      __$$UploadFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OriginalFileName') String originalFileName,
      @JsonKey(name: 'SavedFileName') String savedFileName,
      @JsonKey(name: 'FilePath') String filePath,
      @JsonKey(name: 'FileSize') int fileSize,
      @JsonKey(name: 'ContentType') String contentType,
      @JsonKey(name: 'UploadTime') DateTime uploadTime});
}

/// @nodoc
class __$$UploadFileResponseImplCopyWithImpl<$Res>
    extends _$UploadFileResponseCopyWithImpl<$Res, _$UploadFileResponseImpl>
    implements _$$UploadFileResponseImplCopyWith<$Res> {
  __$$UploadFileResponseImplCopyWithImpl(_$UploadFileResponseImpl _value,
      $Res Function(_$UploadFileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalFileName = null,
    Object? savedFileName = null,
    Object? filePath = null,
    Object? fileSize = null,
    Object? contentType = null,
    Object? uploadTime = null,
  }) {
    return _then(_$UploadFileResponseImpl(
      originalFileName: null == originalFileName
          ? _value.originalFileName
          : originalFileName // ignore: cast_nullable_to_non_nullable
              as String,
      savedFileName: null == savedFileName
          ? _value.savedFileName
          : savedFileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      uploadTime: null == uploadTime
          ? _value.uploadTime
          : uploadTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseImpl implements _UploadFileResponse {
  const _$UploadFileResponseImpl(
      {@JsonKey(name: 'OriginalFileName') required this.originalFileName,
      @JsonKey(name: 'SavedFileName') required this.savedFileName,
      @JsonKey(name: 'FilePath') required this.filePath,
      @JsonKey(name: 'FileSize') required this.fileSize,
      @JsonKey(name: 'ContentType') required this.contentType,
      @JsonKey(name: 'UploadTime') required this.uploadTime});

  factory _$UploadFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseImplFromJson(json);

  @override
  @JsonKey(name: 'OriginalFileName')
  final String originalFileName;
  @override
  @JsonKey(name: 'SavedFileName')
  final String savedFileName;
  @override
  @JsonKey(name: 'FilePath')
  final String filePath;
  @override
  @JsonKey(name: 'FileSize')
  final int fileSize;
  @override
  @JsonKey(name: 'ContentType')
  final String contentType;
  @override
  @JsonKey(name: 'UploadTime')
  final DateTime uploadTime;

  @override
  String toString() {
    return 'UploadFileResponse(originalFileName: $originalFileName, savedFileName: $savedFileName, filePath: $filePath, fileSize: $fileSize, contentType: $contentType, uploadTime: $uploadTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseImpl &&
            (identical(other.originalFileName, originalFileName) ||
                other.originalFileName == originalFileName) &&
            (identical(other.savedFileName, savedFileName) ||
                other.savedFileName == savedFileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.uploadTime, uploadTime) ||
                other.uploadTime == uploadTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, originalFileName, savedFileName,
      filePath, fileSize, contentType, uploadTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      __$$UploadFileResponseImplCopyWithImpl<_$UploadFileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadFileResponse implements UploadFileResponse {
  const factory _UploadFileResponse(
          {@JsonKey(name: 'OriginalFileName')
          required final String originalFileName,
          @JsonKey(name: 'SavedFileName') required final String savedFileName,
          @JsonKey(name: 'FilePath') required final String filePath,
          @JsonKey(name: 'FileSize') required final int fileSize,
          @JsonKey(name: 'ContentType') required final String contentType,
          @JsonKey(name: 'UploadTime') required final DateTime uploadTime}) =
      _$UploadFileResponseImpl;

  factory _UploadFileResponse.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseImpl.fromJson;

  @override
  @JsonKey(name: 'OriginalFileName')
  String get originalFileName;
  @override
  @JsonKey(name: 'SavedFileName')
  String get savedFileName;
  @override
  @JsonKey(name: 'FilePath')
  String get filePath;
  @override
  @JsonKey(name: 'FileSize')
  int get fileSize;
  @override
  @JsonKey(name: 'ContentType')
  String get contentType;
  @override
  @JsonKey(name: 'UploadTime')
  DateTime get uploadTime;
  @override
  @JsonKey(ignore: true)
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailMarketingReportResponse _$DetailMarketingReportResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailMarketingReportResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailMarketingReportResponse {
  @JsonKey(name: 'dailyData')
  DetailMarketingDailyData get dailyData => throw _privateConstructorUsedError;
  @JsonKey(name: 'dailyFileData')
  List<MarketingDailyFile> get dailyFileData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailMarketingReportResponseCopyWith<DetailMarketingReportResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMarketingReportResponseCopyWith<$Res> {
  factory $DetailMarketingReportResponseCopyWith(
          DetailMarketingReportResponse value,
          $Res Function(DetailMarketingReportResponse) then) =
      _$DetailMarketingReportResponseCopyWithImpl<$Res,
          DetailMarketingReportResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dailyData') DetailMarketingDailyData dailyData,
      @JsonKey(name: 'dailyFileData') List<MarketingDailyFile> dailyFileData});

  $DetailMarketingDailyDataCopyWith<$Res> get dailyData;
}

/// @nodoc
class _$DetailMarketingReportResponseCopyWithImpl<$Res,
        $Val extends DetailMarketingReportResponse>
    implements $DetailMarketingReportResponseCopyWith<$Res> {
  _$DetailMarketingReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyData = null,
    Object? dailyFileData = null,
  }) {
    return _then(_value.copyWith(
      dailyData: null == dailyData
          ? _value.dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as DetailMarketingDailyData,
      dailyFileData: null == dailyFileData
          ? _value.dailyFileData
          : dailyFileData // ignore: cast_nullable_to_non_nullable
              as List<MarketingDailyFile>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailMarketingDailyDataCopyWith<$Res> get dailyData {
    return $DetailMarketingDailyDataCopyWith<$Res>(_value.dailyData, (value) {
      return _then(_value.copyWith(dailyData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailMarketingReportResponseImplCopyWith<$Res>
    implements $DetailMarketingReportResponseCopyWith<$Res> {
  factory _$$DetailMarketingReportResponseImplCopyWith(
          _$DetailMarketingReportResponseImpl value,
          $Res Function(_$DetailMarketingReportResponseImpl) then) =
      __$$DetailMarketingReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dailyData') DetailMarketingDailyData dailyData,
      @JsonKey(name: 'dailyFileData') List<MarketingDailyFile> dailyFileData});

  @override
  $DetailMarketingDailyDataCopyWith<$Res> get dailyData;
}

/// @nodoc
class __$$DetailMarketingReportResponseImplCopyWithImpl<$Res>
    extends _$DetailMarketingReportResponseCopyWithImpl<$Res,
        _$DetailMarketingReportResponseImpl>
    implements _$$DetailMarketingReportResponseImplCopyWith<$Res> {
  __$$DetailMarketingReportResponseImplCopyWithImpl(
      _$DetailMarketingReportResponseImpl _value,
      $Res Function(_$DetailMarketingReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyData = null,
    Object? dailyFileData = null,
  }) {
    return _then(_$DetailMarketingReportResponseImpl(
      dailyData: null == dailyData
          ? _value.dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as DetailMarketingDailyData,
      dailyFileData: null == dailyFileData
          ? _value._dailyFileData
          : dailyFileData // ignore: cast_nullable_to_non_nullable
              as List<MarketingDailyFile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailMarketingReportResponseImpl
    implements _DetailMarketingReportResponse {
  const _$DetailMarketingReportResponseImpl(
      {@JsonKey(name: 'dailyData') required this.dailyData,
      @JsonKey(name: 'dailyFileData')
      required final List<MarketingDailyFile> dailyFileData})
      : _dailyFileData = dailyFileData;

  factory _$DetailMarketingReportResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailMarketingReportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'dailyData')
  final DetailMarketingDailyData dailyData;
  final List<MarketingDailyFile> _dailyFileData;
  @override
  @JsonKey(name: 'dailyFileData')
  List<MarketingDailyFile> get dailyFileData {
    if (_dailyFileData is EqualUnmodifiableListView) return _dailyFileData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyFileData);
  }

  @override
  String toString() {
    return 'DetailMarketingReportResponse(dailyData: $dailyData, dailyFileData: $dailyFileData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMarketingReportResponseImpl &&
            (identical(other.dailyData, dailyData) ||
                other.dailyData == dailyData) &&
            const DeepCollectionEquality()
                .equals(other._dailyFileData, _dailyFileData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dailyData,
      const DeepCollectionEquality().hash(_dailyFileData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailMarketingReportResponseImplCopyWith<
          _$DetailMarketingReportResponseImpl>
      get copyWith => __$$DetailMarketingReportResponseImplCopyWithImpl<
          _$DetailMarketingReportResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailMarketingReportResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailMarketingReportResponse
    implements DetailMarketingReportResponse {
  const factory _DetailMarketingReportResponse(
          {@JsonKey(name: 'dailyData')
          required final DetailMarketingDailyData dailyData,
          @JsonKey(name: 'dailyFileData')
          required final List<MarketingDailyFile> dailyFileData}) =
      _$DetailMarketingReportResponseImpl;

  factory _DetailMarketingReportResponse.fromJson(Map<String, dynamic> json) =
      _$DetailMarketingReportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'dailyData')
  DetailMarketingDailyData get dailyData;
  @override
  @JsonKey(name: 'dailyFileData')
  List<MarketingDailyFile> get dailyFileData;
  @override
  @JsonKey(ignore: true)
  _$$DetailMarketingReportResponseImplCopyWith<
          _$DetailMarketingReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailMarketingDailyData _$DetailMarketingDailyDataFromJson(
    Map<String, dynamic> json) {
  return _DetailMarketingDailyData.fromJson(json);
}

/// @nodoc
mixin _$DetailMarketingDailyData {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String? get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String? get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserReport')
  int? get employeeID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailMarketingDailyDataCopyWith<DetailMarketingDailyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMarketingDailyDataCopyWith<$Res> {
  factory $DetailMarketingDailyDataCopyWith(DetailMarketingDailyData value,
          $Res Function(DetailMarketingDailyData) then) =
      _$DetailMarketingDailyDataCopyWithImpl<$Res, DetailMarketingDailyData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'PlanNextDay') String? planNextDay,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'UserReport') int? employeeID});
}

/// @nodoc
class _$DetailMarketingDailyDataCopyWithImpl<$Res,
        $Val extends DetailMarketingDailyData>
    implements $DetailMarketingDailyDataCopyWith<$Res> {
  _$DetailMarketingDailyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateReport = freezed,
    Object? content = freezed,
    Object? results = freezed,
    Object? planNextDay = freezed,
    Object? note = freezed,
    Object? employeeID = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: freezed == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeID: freezed == employeeID
          ? _value.employeeID
          : employeeID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailMarketingDailyDataImplCopyWith<$Res>
    implements $DetailMarketingDailyDataCopyWith<$Res> {
  factory _$$DetailMarketingDailyDataImplCopyWith(
          _$DetailMarketingDailyDataImpl value,
          $Res Function(_$DetailMarketingDailyDataImpl) then) =
      __$$DetailMarketingDailyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'PlanNextDay') String? planNextDay,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'UserReport') int? employeeID});
}

/// @nodoc
class __$$DetailMarketingDailyDataImplCopyWithImpl<$Res>
    extends _$DetailMarketingDailyDataCopyWithImpl<$Res,
        _$DetailMarketingDailyDataImpl>
    implements _$$DetailMarketingDailyDataImplCopyWith<$Res> {
  __$$DetailMarketingDailyDataImplCopyWithImpl(
      _$DetailMarketingDailyDataImpl _value,
      $Res Function(_$DetailMarketingDailyDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dateReport = freezed,
    Object? content = freezed,
    Object? results = freezed,
    Object? planNextDay = freezed,
    Object? note = freezed,
    Object? employeeID = freezed,
  }) {
    return _then(_$DetailMarketingDailyDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: freezed == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeID: freezed == employeeID
          ? _value.employeeID
          : employeeID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailMarketingDailyDataImpl implements _DetailMarketingDailyData {
  const _$DetailMarketingDailyDataImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'DateReport') this.dateReport,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'Results') this.results,
      @JsonKey(name: 'PlanNextDay') this.planNextDay,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'UserReport') this.employeeID});

  factory _$DetailMarketingDailyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailMarketingDailyDataImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'DateReport')
  final String? dateReport;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'Results')
  final String? results;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String? planNextDay;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'UserReport')
  final int? employeeID;

  @override
  String toString() {
    return 'DetailMarketingDailyData(id: $id, dateReport: $dateReport, content: $content, results: $results, planNextDay: $planNextDay, note: $note, employeeID: $employeeID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMarketingDailyDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.employeeID, employeeID) ||
                other.employeeID == employeeID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateReport, content, results,
      planNextDay, note, employeeID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailMarketingDailyDataImplCopyWith<_$DetailMarketingDailyDataImpl>
      get copyWith => __$$DetailMarketingDailyDataImplCopyWithImpl<
          _$DetailMarketingDailyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailMarketingDailyDataImplToJson(
      this,
    );
  }
}

abstract class _DetailMarketingDailyData implements DetailMarketingDailyData {
  const factory _DetailMarketingDailyData(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'DateReport') final String? dateReport,
          @JsonKey(name: 'Content') final String? content,
          @JsonKey(name: 'Results') final String? results,
          @JsonKey(name: 'PlanNextDay') final String? planNextDay,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'UserReport') final int? employeeID}) =
      _$DetailMarketingDailyDataImpl;

  factory _DetailMarketingDailyData.fromJson(Map<String, dynamic> json) =
      _$DetailMarketingDailyDataImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'DateReport')
  String? get dateReport;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'Results')
  String? get results;
  @override
  @JsonKey(name: 'PlanNextDay')
  String? get planNextDay;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'UserReport')
  int? get employeeID;
  @override
  @JsonKey(ignore: true)
  _$$DetailMarketingDailyDataImplCopyWith<_$DetailMarketingDailyDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MarketingDailyFile _$MarketingDailyFileFromJson(Map<String, dynamic> json) {
  return _MarketingDailyFile.fromJson(json);
}

/// @nodoc
mixin _$MarketingDailyFile {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FileName')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DailyReportID')
  int get dailyReportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PathServer')
  String get pathServer => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingDailyFileCopyWith<MarketingDailyFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingDailyFileCopyWith<$Res> {
  factory $MarketingDailyFileCopyWith(
          MarketingDailyFile value, $Res Function(MarketingDailyFile) then) =
      _$MarketingDailyFileCopyWithImpl<$Res, MarketingDailyFile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'DailyReportID') int dailyReportId,
      @JsonKey(name: 'PathServer') String pathServer,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class _$MarketingDailyFileCopyWithImpl<$Res, $Val extends MarketingDailyFile>
    implements $MarketingDailyFileCopyWith<$Res> {
  _$MarketingDailyFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? dailyReportId = null,
    Object? pathServer = null,
    Object? isDeleted = null,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportId: null == dailyReportId
          ? _value.dailyReportId
          : dailyReportId // ignore: cast_nullable_to_non_nullable
              as int,
      pathServer: null == pathServer
          ? _value.pathServer
          : pathServer // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingDailyFileImplCopyWith<$Res>
    implements $MarketingDailyFileCopyWith<$Res> {
  factory _$$MarketingDailyFileImplCopyWith(_$MarketingDailyFileImpl value,
          $Res Function(_$MarketingDailyFileImpl) then) =
      __$$MarketingDailyFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FileName') String fileName,
      @JsonKey(name: 'DailyReportID') int dailyReportId,
      @JsonKey(name: 'PathServer') String pathServer,
      @JsonKey(name: 'IsDeleted') bool isDeleted,
      @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'CreatedDate') DateTime? createdDate});
}

/// @nodoc
class __$$MarketingDailyFileImplCopyWithImpl<$Res>
    extends _$MarketingDailyFileCopyWithImpl<$Res, _$MarketingDailyFileImpl>
    implements _$$MarketingDailyFileImplCopyWith<$Res> {
  __$$MarketingDailyFileImplCopyWithImpl(_$MarketingDailyFileImpl _value,
      $Res Function(_$MarketingDailyFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? dailyReportId = null,
    Object? pathServer = null,
    Object? isDeleted = null,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$MarketingDailyFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      dailyReportId: null == dailyReportId
          ? _value.dailyReportId
          : dailyReportId // ignore: cast_nullable_to_non_nullable
              as int,
      pathServer: null == pathServer
          ? _value.pathServer
          : pathServer // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
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
class _$MarketingDailyFileImpl implements _MarketingDailyFile {
  const _$MarketingDailyFileImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'FileName') required this.fileName,
      @JsonKey(name: 'DailyReportID') required this.dailyReportId,
      @JsonKey(name: 'PathServer') required this.pathServer,
      @JsonKey(name: 'IsDeleted') required this.isDeleted,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'CreatedDate') this.createdDate});

  factory _$MarketingDailyFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingDailyFileImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'FileName')
  final String fileName;
  @override
  @JsonKey(name: 'DailyReportID')
  final int dailyReportId;
  @override
  @JsonKey(name: 'PathServer')
  final String pathServer;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool isDeleted;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;

  @override
  String toString() {
    return 'MarketingDailyFile(id: $id, fileName: $fileName, dailyReportId: $dailyReportId, pathServer: $pathServer, isDeleted: $isDeleted, updatedDate: $updatedDate, createdBy: $createdBy, updatedBy: $updatedBy, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingDailyFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.dailyReportId, dailyReportId) ||
                other.dailyReportId == dailyReportId) &&
            (identical(other.pathServer, pathServer) ||
                other.pathServer == pathServer) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileName, dailyReportId,
      pathServer, isDeleted, updatedDate, createdBy, updatedBy, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingDailyFileImplCopyWith<_$MarketingDailyFileImpl> get copyWith =>
      __$$MarketingDailyFileImplCopyWithImpl<_$MarketingDailyFileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingDailyFileImplToJson(
      this,
    );
  }
}

abstract class _MarketingDailyFile implements MarketingDailyFile {
  const factory _MarketingDailyFile(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'FileName') required final String fileName,
          @JsonKey(name: 'DailyReportID') required final int dailyReportId,
          @JsonKey(name: 'PathServer') required final String pathServer,
          @JsonKey(name: 'IsDeleted') required final bool isDeleted,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate}) =
      _$MarketingDailyFileImpl;

  factory _MarketingDailyFile.fromJson(Map<String, dynamic> json) =
      _$MarketingDailyFileImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'FileName')
  String get fileName;
  @override
  @JsonKey(name: 'DailyReportID')
  int get dailyReportId;
  @override
  @JsonKey(name: 'PathServer')
  String get pathServer;
  @override
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$MarketingDailyFileImplCopyWith<_$MarketingDailyFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportLXCPRequest _$ReportLXCPRequestFromJson(Map<String, dynamic> json) {
  return _ReportLXCPRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportLXCPRequest {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeActual')
  int? get timeActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformanceActual')
  double? get performanceActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'Percentage')
  double? get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'KmNumber')
  int? get kmNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLate')
  int? get totalLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTimeLate')
  int? get totalTimeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'Propose')
  String? get propose => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportLXCPRequestCopyWith<ReportLXCPRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportLXCPRequestCopyWith<$Res> {
  factory $ReportLXCPRequestCopyWith(
          ReportLXCPRequest value, $Res Function(ReportLXCPRequest) then) =
      _$ReportLXCPRequestCopyWithImpl<$Res, ReportLXCPRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') int? timeActual,
      @JsonKey(name: 'PerformanceActual') double? performanceActual,
      @JsonKey(name: 'Percentage') double? percentage,
      @JsonKey(name: 'KmNumber') int? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') int? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$ReportLXCPRequestCopyWithImpl<$Res, $Val extends ReportLXCPRequest>
    implements $ReportLXCPRequestCopyWith<$Res> {
  _$ReportLXCPRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = null,
    Object? dateReport = null,
    Object? filmManagementDetailId = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      filmManagementDetailId: freezed == filmManagementDetailId
          ? _value.filmManagementDetailId
          : filmManagementDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportLXCPRequestImplCopyWith<$Res>
    implements $ReportLXCPRequestCopyWith<$Res> {
  factory _$$ReportLXCPRequestImplCopyWith(_$ReportLXCPRequestImpl value,
          $Res Function(_$ReportLXCPRequestImpl) then) =
      __$$ReportLXCPRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int employeeId,
      @JsonKey(name: 'DateReport') String dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') int? timeActual,
      @JsonKey(name: 'PerformanceActual') double? performanceActual,
      @JsonKey(name: 'Percentage') double? percentage,
      @JsonKey(name: 'KmNumber') int? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') int? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$ReportLXCPRequestImplCopyWithImpl<$Res>
    extends _$ReportLXCPRequestCopyWithImpl<$Res, _$ReportLXCPRequestImpl>
    implements _$$ReportLXCPRequestImplCopyWith<$Res> {
  __$$ReportLXCPRequestImplCopyWithImpl(_$ReportLXCPRequestImpl _value,
      $Res Function(_$ReportLXCPRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = null,
    Object? dateReport = null,
    Object? filmManagementDetailId = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$ReportLXCPRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateReport: null == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String,
      filmManagementDetailId: freezed == filmManagementDetailId
          ? _value.filmManagementDetailId
          : filmManagementDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
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
class _$ReportLXCPRequestImpl implements _ReportLXCPRequest {
  const _$ReportLXCPRequestImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') required this.employeeId,
      @JsonKey(name: 'DateReport') required this.dateReport,
      @JsonKey(name: 'FilmManagementDetailID') this.filmManagementDetailId,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'TimeActual') this.timeActual,
      @JsonKey(name: 'PerformanceActual') this.performanceActual,
      @JsonKey(name: 'Percentage') this.percentage,
      @JsonKey(name: 'KmNumber') this.kmNumber,
      @JsonKey(name: 'TotalLate') this.totalLate,
      @JsonKey(name: 'TotalTimeLate') this.totalTimeLate,
      @JsonKey(name: 'ReasonLate') this.reasonLate,
      @JsonKey(name: 'StatusVehicle') this.statusVehicle,
      @JsonKey(name: 'Propose') this.propose,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$ReportLXCPRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportLXCPRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int employeeId;
  @override
  @JsonKey(name: 'DateReport')
  final String dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  final int? filmManagementDetailId;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'TimeActual')
  final int? timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  final double? performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  final double? percentage;
  @override
  @JsonKey(name: 'KmNumber')
  final int? kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  final int? totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  final int? totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  final String? reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  final String? statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  final String? propose;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'ReportLXCPRequest(id: $id, employeeId: $employeeId, dateReport: $dateReport, filmManagementDetailId: $filmManagementDetailId, quantity: $quantity, timeActual: $timeActual, performanceActual: $performanceActual, percentage: $percentage, kmNumber: $kmNumber, totalLate: $totalLate, totalTimeLate: $totalTimeLate, reasonLate: $reasonLate, statusVehicle: $statusVehicle, propose: $propose, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportLXCPRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.filmManagementDetailId, filmManagementDetailId) ||
                other.filmManagementDetailId == filmManagementDetailId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.timeActual, timeActual) ||
                other.timeActual == timeActual) &&
            (identical(other.performanceActual, performanceActual) ||
                other.performanceActual == performanceActual) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.kmNumber, kmNumber) ||
                other.kmNumber == kmNumber) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.totalTimeLate, totalTimeLate) ||
                other.totalTimeLate == totalTimeLate) &&
            (identical(other.reasonLate, reasonLate) ||
                other.reasonLate == reasonLate) &&
            (identical(other.statusVehicle, statusVehicle) ||
                other.statusVehicle == statusVehicle) &&
            (identical(other.propose, propose) || other.propose == propose) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      employeeId,
      dateReport,
      filmManagementDetailId,
      quantity,
      timeActual,
      performanceActual,
      percentage,
      kmNumber,
      totalLate,
      totalTimeLate,
      reasonLate,
      statusVehicle,
      propose,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportLXCPRequestImplCopyWith<_$ReportLXCPRequestImpl> get copyWith =>
      __$$ReportLXCPRequestImplCopyWithImpl<_$ReportLXCPRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportLXCPRequestImplToJson(
      this,
    );
  }
}

abstract class _ReportLXCPRequest implements ReportLXCPRequest {
  const factory _ReportLXCPRequest(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') required final int employeeId,
          @JsonKey(name: 'DateReport') required final String dateReport,
          @JsonKey(name: 'FilmManagementDetailID')
          final int? filmManagementDetailId,
          @JsonKey(name: 'Quantity') final int? quantity,
          @JsonKey(name: 'TimeActual') final int? timeActual,
          @JsonKey(name: 'PerformanceActual') final double? performanceActual,
          @JsonKey(name: 'Percentage') final double? percentage,
          @JsonKey(name: 'KmNumber') final int? kmNumber,
          @JsonKey(name: 'TotalLate') final int? totalLate,
          @JsonKey(name: 'TotalTimeLate') final int? totalTimeLate,
          @JsonKey(name: 'ReasonLate') final String? reasonLate,
          @JsonKey(name: 'StatusVehicle') final String? statusVehicle,
          @JsonKey(name: 'Propose') final String? propose,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$ReportLXCPRequestImpl;

  factory _ReportLXCPRequest.fromJson(Map<String, dynamic> json) =
      _$ReportLXCPRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int get employeeId;
  @override
  @JsonKey(name: 'DateReport')
  String get dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailId;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'TimeActual')
  int? get timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  double? get performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  double? get percentage;
  @override
  @JsonKey(name: 'KmNumber')
  int? get kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  int? get totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  int? get totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  String? get propose;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$ReportLXCPRequestImplCopyWith<_$ReportLXCPRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportLXCPResponse _$ReportLXCPResponseFromJson(Map<String, dynamic> json) {
  return _ReportLXCPResponse.fromJson(json);
}

/// @nodoc
mixin _$ReportLXCPResponse {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ReportLXCPData? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportLXCPResponseCopyWith<ReportLXCPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportLXCPResponseCopyWith<$Res> {
  factory $ReportLXCPResponseCopyWith(
          ReportLXCPResponse value, $Res Function(ReportLXCPResponse) then) =
      _$ReportLXCPResponseCopyWithImpl<$Res, ReportLXCPResponse>;
  @useResult
  $Res call(
      {int? status, String? message, ReportLXCPData? data, String? error});

  $ReportLXCPDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReportLXCPResponseCopyWithImpl<$Res, $Val extends ReportLXCPResponse>
    implements $ReportLXCPResponseCopyWith<$Res> {
  _$ReportLXCPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReportLXCPData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportLXCPDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReportLXCPDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReportLXCPResponseImplCopyWith<$Res>
    implements $ReportLXCPResponseCopyWith<$Res> {
  factory _$$ReportLXCPResponseImplCopyWith(_$ReportLXCPResponseImpl value,
          $Res Function(_$ReportLXCPResponseImpl) then) =
      __$$ReportLXCPResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status, String? message, ReportLXCPData? data, String? error});

  @override
  $ReportLXCPDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ReportLXCPResponseImplCopyWithImpl<$Res>
    extends _$ReportLXCPResponseCopyWithImpl<$Res, _$ReportLXCPResponseImpl>
    implements _$$ReportLXCPResponseImplCopyWith<$Res> {
  __$$ReportLXCPResponseImplCopyWithImpl(_$ReportLXCPResponseImpl _value,
      $Res Function(_$ReportLXCPResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ReportLXCPResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReportLXCPData?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportLXCPResponseImpl implements _ReportLXCPResponse {
  const _$ReportLXCPResponseImpl(
      {this.status, this.message, this.data, this.error});

  factory _$ReportLXCPResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportLXCPResponseImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  final ReportLXCPData? data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ReportLXCPResponse(status: $status, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportLXCPResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportLXCPResponseImplCopyWith<_$ReportLXCPResponseImpl> get copyWith =>
      __$$ReportLXCPResponseImplCopyWithImpl<_$ReportLXCPResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportLXCPResponseImplToJson(
      this,
    );
  }
}

abstract class _ReportLXCPResponse implements ReportLXCPResponse {
  const factory _ReportLXCPResponse(
      {final int? status,
      final String? message,
      final ReportLXCPData? data,
      final String? error}) = _$ReportLXCPResponseImpl;

  factory _ReportLXCPResponse.fromJson(Map<String, dynamic> json) =
      _$ReportLXCPResponseImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  ReportLXCPData? get data;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ReportLXCPResponseImplCopyWith<_$ReportLXCPResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportLXCPData _$ReportLXCPDataFromJson(Map<String, dynamic> json) {
  return _ReportLXCPData.fromJson(json);
}

/// @nodoc
mixin _$ReportLXCPData {
  List<TechnicalReport> get technical => throw _privateConstructorUsedError;
  List<HrReportItem> get dataFilm => throw _privateConstructorUsedError;
  List<HrReportItem> get dataDriver => throw _privateConstructorUsedError;
  List<HrReportItem> get hrAll => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportLXCPDataCopyWith<ReportLXCPData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportLXCPDataCopyWith<$Res> {
  factory $ReportLXCPDataCopyWith(
          ReportLXCPData value, $Res Function(ReportLXCPData) then) =
      _$ReportLXCPDataCopyWithImpl<$Res, ReportLXCPData>;
  @useResult
  $Res call(
      {List<TechnicalReport> technical,
      List<HrReportItem> dataFilm,
      List<HrReportItem> dataDriver,
      List<HrReportItem> hrAll});
}

/// @nodoc
class _$ReportLXCPDataCopyWithImpl<$Res, $Val extends ReportLXCPData>
    implements $ReportLXCPDataCopyWith<$Res> {
  _$ReportLXCPDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? technical = null,
    Object? dataFilm = null,
    Object? dataDriver = null,
    Object? hrAll = null,
  }) {
    return _then(_value.copyWith(
      technical: null == technical
          ? _value.technical
          : technical // ignore: cast_nullable_to_non_nullable
              as List<TechnicalReport>,
      dataFilm: null == dataFilm
          ? _value.dataFilm
          : dataFilm // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
      dataDriver: null == dataDriver
          ? _value.dataDriver
          : dataDriver // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
      hrAll: null == hrAll
          ? _value.hrAll
          : hrAll // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportLXCPDataImplCopyWith<$Res>
    implements $ReportLXCPDataCopyWith<$Res> {
  factory _$$ReportLXCPDataImplCopyWith(_$ReportLXCPDataImpl value,
          $Res Function(_$ReportLXCPDataImpl) then) =
      __$$ReportLXCPDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TechnicalReport> technical,
      List<HrReportItem> dataFilm,
      List<HrReportItem> dataDriver,
      List<HrReportItem> hrAll});
}

/// @nodoc
class __$$ReportLXCPDataImplCopyWithImpl<$Res>
    extends _$ReportLXCPDataCopyWithImpl<$Res, _$ReportLXCPDataImpl>
    implements _$$ReportLXCPDataImplCopyWith<$Res> {
  __$$ReportLXCPDataImplCopyWithImpl(
      _$ReportLXCPDataImpl _value, $Res Function(_$ReportLXCPDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? technical = null,
    Object? dataFilm = null,
    Object? dataDriver = null,
    Object? hrAll = null,
  }) {
    return _then(_$ReportLXCPDataImpl(
      technical: null == technical
          ? _value._technical
          : technical // ignore: cast_nullable_to_non_nullable
              as List<TechnicalReport>,
      dataFilm: null == dataFilm
          ? _value._dataFilm
          : dataFilm // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
      dataDriver: null == dataDriver
          ? _value._dataDriver
          : dataDriver // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
      hrAll: null == hrAll
          ? _value._hrAll
          : hrAll // ignore: cast_nullable_to_non_nullable
              as List<HrReportItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportLXCPDataImpl implements _ReportLXCPData {
  const _$ReportLXCPDataImpl(
      {final List<TechnicalReport> technical = const [],
      final List<HrReportItem> dataFilm = const [],
      final List<HrReportItem> dataDriver = const [],
      final List<HrReportItem> hrAll = const []})
      : _technical = technical,
        _dataFilm = dataFilm,
        _dataDriver = dataDriver,
        _hrAll = hrAll;

  factory _$ReportLXCPDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportLXCPDataImplFromJson(json);

  final List<TechnicalReport> _technical;
  @override
  @JsonKey()
  List<TechnicalReport> get technical {
    if (_technical is EqualUnmodifiableListView) return _technical;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_technical);
  }

  final List<HrReportItem> _dataFilm;
  @override
  @JsonKey()
  List<HrReportItem> get dataFilm {
    if (_dataFilm is EqualUnmodifiableListView) return _dataFilm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataFilm);
  }

  final List<HrReportItem> _dataDriver;
  @override
  @JsonKey()
  List<HrReportItem> get dataDriver {
    if (_dataDriver is EqualUnmodifiableListView) return _dataDriver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataDriver);
  }

  final List<HrReportItem> _hrAll;
  @override
  @JsonKey()
  List<HrReportItem> get hrAll {
    if (_hrAll is EqualUnmodifiableListView) return _hrAll;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hrAll);
  }

  @override
  String toString() {
    return 'ReportLXCPData(technical: $technical, dataFilm: $dataFilm, dataDriver: $dataDriver, hrAll: $hrAll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportLXCPDataImpl &&
            const DeepCollectionEquality()
                .equals(other._technical, _technical) &&
            const DeepCollectionEquality().equals(other._dataFilm, _dataFilm) &&
            const DeepCollectionEquality()
                .equals(other._dataDriver, _dataDriver) &&
            const DeepCollectionEquality().equals(other._hrAll, _hrAll));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_technical),
      const DeepCollectionEquality().hash(_dataFilm),
      const DeepCollectionEquality().hash(_dataDriver),
      const DeepCollectionEquality().hash(_hrAll));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportLXCPDataImplCopyWith<_$ReportLXCPDataImpl> get copyWith =>
      __$$ReportLXCPDataImplCopyWithImpl<_$ReportLXCPDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportLXCPDataImplToJson(
      this,
    );
  }
}

abstract class _ReportLXCPData implements ReportLXCPData {
  const factory _ReportLXCPData(
      {final List<TechnicalReport> technical,
      final List<HrReportItem> dataFilm,
      final List<HrReportItem> dataDriver,
      final List<HrReportItem> hrAll}) = _$ReportLXCPDataImpl;

  factory _ReportLXCPData.fromJson(Map<String, dynamic> json) =
      _$ReportLXCPDataImpl.fromJson;

  @override
  List<TechnicalReport> get technical;
  @override
  List<HrReportItem> get dataFilm;
  @override
  List<HrReportItem> get dataDriver;
  @override
  List<HrReportItem> get hrAll;
  @override
  @JsonKey(ignore: true)
  _$$ReportLXCPDataImplCopyWith<_$ReportLXCPDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TechnicalReport _$TechnicalReportFromJson(Map<String, dynamic> json) {
  return _TechnicalReport.fromJson(json);
}

/// @nodoc
mixin _$TechnicalReport {
  @JsonKey(name: 'UserID')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool? get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String? get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectText')
  String? get projectText => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHours')
  double? get totalHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'Results')
  String? get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNextDay')
  String? get planNextDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'Backlog')
  String? get backlog => throw _privateConstructorUsedError;
  @JsonKey(name: 'Problem')
  String? get problem => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeText')
  String? get typeText => throw _privateConstructorUsedError;
  @JsonKey(name: 'PositionName')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mission')
  String? get mission => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemCode')
  String? get projectItemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'PercentComplete')
  int? get percentComplete => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectItemName')
  String? get projectItemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT => throw _privateConstructorUsedError;
  @JsonKey(name: 'HolidayDate')
  String? get holidayDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanStartDate')
  String? get planStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanEndDate')
  String? get planEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualStartDate')
  String? get actualStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ActualEndDate')
  String? get actualEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalDayActual')
  double? get totalDayActual => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TechnicalReportCopyWith<TechnicalReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicalReportCopyWith<$Res> {
  factory $TechnicalReportCopyWith(
          TechnicalReport value, $Res Function(TechnicalReport) then) =
      _$TechnicalReportCopyWithImpl<$Res, TechnicalReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Confirm') bool? confirm,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'PlanNextDay') String? planNextDay,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'ProjectItemCode') String? projectItemCode,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'PercentComplete') int? percentComplete,
      @JsonKey(name: 'ProjectItemName') String? projectItemName,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'HolidayDate') String? holidayDate,
      @JsonKey(name: 'PlanStartDate') String? planStartDate,
      @JsonKey(name: 'PlanEndDate') String? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'ActualStartDate') String? actualStartDate,
      @JsonKey(name: 'ActualEndDate') String? actualEndDate,
      @JsonKey(name: 'TotalDayActual') double? totalDayActual});
}

/// @nodoc
class _$TechnicalReportCopyWithImpl<$Res, $Val extends TechnicalReport>
    implements $TechnicalReportCopyWith<$Res> {
  _$TechnicalReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? confirm = freezed,
    Object? id = freezed,
    Object? dateReport = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectText = freezed,
    Object? totalHours = freezed,
    Object? results = freezed,
    Object? planNextDay = freezed,
    Object? backlog = freezed,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? positionName = freezed,
    Object? mission = freezed,
    Object? projectItemCode = freezed,
    Object? content = freezed,
    Object? percentComplete = freezed,
    Object? projectItemName = freezed,
    Object? totalHourOT = freezed,
    Object? holidayDate = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? totalDayActual = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      confirm: freezed == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: freezed == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      projectItemCode: freezed == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      percentComplete: freezed == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemName: freezed == projectItemName
          ? _value.projectItemName
          : projectItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as double?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TechnicalReportImplCopyWith<$Res>
    implements $TechnicalReportCopyWith<$Res> {
  factory _$$TechnicalReportImplCopyWith(_$TechnicalReportImpl value,
          $Res Function(_$TechnicalReportImpl) then) =
      __$$TechnicalReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserID') int? userId,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'Confirm') bool? confirm,
      @JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'ProjectText') String? projectText,
      @JsonKey(name: 'TotalHours') double? totalHours,
      @JsonKey(name: 'Results') String? results,
      @JsonKey(name: 'PlanNextDay') String? planNextDay,
      @JsonKey(name: 'Backlog') String? backlog,
      @JsonKey(name: 'Problem') String? problem,
      @JsonKey(name: 'ProblemSolve') String? problemSolve,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'Type') int? type,
      @JsonKey(name: 'TypeText') String? typeText,
      @JsonKey(name: 'PositionName') String? positionName,
      @JsonKey(name: 'Mission') String? mission,
      @JsonKey(name: 'ProjectItemCode') String? projectItemCode,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'PercentComplete') int? percentComplete,
      @JsonKey(name: 'ProjectItemName') String? projectItemName,
      @JsonKey(name: 'TotalHourOT') double? totalHourOT,
      @JsonKey(name: 'HolidayDate') String? holidayDate,
      @JsonKey(name: 'PlanStartDate') String? planStartDate,
      @JsonKey(name: 'PlanEndDate') String? planEndDate,
      @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
      @JsonKey(name: 'ActualStartDate') String? actualStartDate,
      @JsonKey(name: 'ActualEndDate') String? actualEndDate,
      @JsonKey(name: 'TotalDayActual') double? totalDayActual});
}

/// @nodoc
class __$$TechnicalReportImplCopyWithImpl<$Res>
    extends _$TechnicalReportCopyWithImpl<$Res, _$TechnicalReportImpl>
    implements _$$TechnicalReportImplCopyWith<$Res> {
  __$$TechnicalReportImplCopyWithImpl(
      _$TechnicalReportImpl _value, $Res Function(_$TechnicalReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? code = freezed,
    Object? fullName = freezed,
    Object? confirm = freezed,
    Object? id = freezed,
    Object? dateReport = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? projectText = freezed,
    Object? totalHours = freezed,
    Object? results = freezed,
    Object? planNextDay = freezed,
    Object? backlog = freezed,
    Object? problem = freezed,
    Object? problemSolve = freezed,
    Object? note = freezed,
    Object? createdDate = freezed,
    Object? type = freezed,
    Object? typeText = freezed,
    Object? positionName = freezed,
    Object? mission = freezed,
    Object? projectItemCode = freezed,
    Object? content = freezed,
    Object? percentComplete = freezed,
    Object? projectItemName = freezed,
    Object? totalHourOT = freezed,
    Object? holidayDate = freezed,
    Object? planStartDate = freezed,
    Object? planEndDate = freezed,
    Object? totalDayPlan = freezed,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
    Object? totalDayActual = freezed,
  }) {
    return _then(_$TechnicalReportImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      confirm: freezed == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectText: freezed == projectText
          ? _value.projectText
          : projectText // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHours: freezed == totalHours
          ? _value.totalHours
          : totalHours // ignore: cast_nullable_to_non_nullable
              as double?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as String?,
      planNextDay: freezed == planNextDay
          ? _value.planNextDay
          : planNextDay // ignore: cast_nullable_to_non_nullable
              as String?,
      backlog: freezed == backlog
          ? _value.backlog
          : backlog // ignore: cast_nullable_to_non_nullable
              as String?,
      problem: freezed == problem
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as String?,
      problemSolve: freezed == problemSolve
          ? _value.problemSolve
          : problemSolve // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      typeText: freezed == typeText
          ? _value.typeText
          : typeText // ignore: cast_nullable_to_non_nullable
              as String?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      mission: freezed == mission
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as String?,
      projectItemCode: freezed == projectItemCode
          ? _value.projectItemCode
          : projectItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      percentComplete: freezed == percentComplete
          ? _value.percentComplete
          : percentComplete // ignore: cast_nullable_to_non_nullable
              as int?,
      projectItemName: freezed == projectItemName
          ? _value.projectItemName
          : projectItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalHourOT: freezed == totalHourOT
          ? _value.totalHourOT
          : totalHourOT // ignore: cast_nullable_to_non_nullable
              as double?,
      holidayDate: freezed == holidayDate
          ? _value.holidayDate
          : holidayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planStartDate: freezed == planStartDate
          ? _value.planStartDate
          : planStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      planEndDate: freezed == planEndDate
          ? _value.planEndDate
          : planEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayPlan: freezed == totalDayPlan
          ? _value.totalDayPlan
          : totalDayPlan // ignore: cast_nullable_to_non_nullable
              as double?,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalDayActual: freezed == totalDayActual
          ? _value.totalDayActual
          : totalDayActual // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnicalReportImpl implements _TechnicalReport {
  const _$TechnicalReportImpl(
      {@JsonKey(name: 'UserID') this.userId,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'Confirm') this.confirm,
      @JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'DateReport') this.dateReport,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'ProjectText') this.projectText,
      @JsonKey(name: 'TotalHours') this.totalHours,
      @JsonKey(name: 'Results') this.results,
      @JsonKey(name: 'PlanNextDay') this.planNextDay,
      @JsonKey(name: 'Backlog') this.backlog,
      @JsonKey(name: 'Problem') this.problem,
      @JsonKey(name: 'ProblemSolve') this.problemSolve,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'Type') this.type,
      @JsonKey(name: 'TypeText') this.typeText,
      @JsonKey(name: 'PositionName') this.positionName,
      @JsonKey(name: 'Mission') this.mission,
      @JsonKey(name: 'ProjectItemCode') this.projectItemCode,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'PercentComplete') this.percentComplete,
      @JsonKey(name: 'ProjectItemName') this.projectItemName,
      @JsonKey(name: 'TotalHourOT') this.totalHourOT,
      @JsonKey(name: 'HolidayDate') this.holidayDate,
      @JsonKey(name: 'PlanStartDate') this.planStartDate,
      @JsonKey(name: 'PlanEndDate') this.planEndDate,
      @JsonKey(name: 'TotalDayPlan') this.totalDayPlan,
      @JsonKey(name: 'ActualStartDate') this.actualStartDate,
      @JsonKey(name: 'ActualEndDate') this.actualEndDate,
      @JsonKey(name: 'TotalDayActual') this.totalDayActual});

  factory _$TechnicalReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnicalReportImplFromJson(json);

  @override
  @JsonKey(name: 'UserID')
  final int? userId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'Confirm')
  final bool? confirm;
  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'DateReport')
  final String? dateReport;
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'ProjectText')
  final String? projectText;
  @override
  @JsonKey(name: 'TotalHours')
  final double? totalHours;
  @override
  @JsonKey(name: 'Results')
  final String? results;
  @override
  @JsonKey(name: 'PlanNextDay')
  final String? planNextDay;
  @override
  @JsonKey(name: 'Backlog')
  final String? backlog;
  @override
  @JsonKey(name: 'Problem')
  final String? problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  final String? problemSolve;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'Type')
  final int? type;
  @override
  @JsonKey(name: 'TypeText')
  final String? typeText;
  @override
  @JsonKey(name: 'PositionName')
  final String? positionName;
  @override
  @JsonKey(name: 'Mission')
  final String? mission;
  @override
  @JsonKey(name: 'ProjectItemCode')
  final String? projectItemCode;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'PercentComplete')
  final int? percentComplete;
  @override
  @JsonKey(name: 'ProjectItemName')
  final String? projectItemName;
  @override
  @JsonKey(name: 'TotalHourOT')
  final double? totalHourOT;
  @override
  @JsonKey(name: 'HolidayDate')
  final String? holidayDate;
  @override
  @JsonKey(name: 'PlanStartDate')
  final String? planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  final String? planEndDate;
  @override
  @JsonKey(name: 'TotalDayPlan')
  final double? totalDayPlan;
  @override
  @JsonKey(name: 'ActualStartDate')
  final String? actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  final String? actualEndDate;
  @override
  @JsonKey(name: 'TotalDayActual')
  final double? totalDayActual;

  @override
  String toString() {
    return 'TechnicalReport(userId: $userId, code: $code, fullName: $fullName, confirm: $confirm, id: $id, dateReport: $dateReport, projectCode: $projectCode, projectName: $projectName, projectText: $projectText, totalHours: $totalHours, results: $results, planNextDay: $planNextDay, backlog: $backlog, problem: $problem, problemSolve: $problemSolve, note: $note, createdDate: $createdDate, type: $type, typeText: $typeText, positionName: $positionName, mission: $mission, projectItemCode: $projectItemCode, content: $content, percentComplete: $percentComplete, projectItemName: $projectItemName, totalHourOT: $totalHourOT, holidayDate: $holidayDate, planStartDate: $planStartDate, planEndDate: $planEndDate, totalDayPlan: $totalDayPlan, actualStartDate: $actualStartDate, actualEndDate: $actualEndDate, totalDayActual: $totalDayActual)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnicalReportImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectText, projectText) ||
                other.projectText == projectText) &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.planNextDay, planNextDay) ||
                other.planNextDay == planNextDay) &&
            (identical(other.backlog, backlog) || other.backlog == backlog) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.problemSolve, problemSolve) ||
                other.problemSolve == problemSolve) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeText, typeText) ||
                other.typeText == typeText) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.mission, mission) || other.mission == mission) &&
            (identical(other.projectItemCode, projectItemCode) ||
                other.projectItemCode == projectItemCode) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.percentComplete, percentComplete) ||
                other.percentComplete == percentComplete) &&
            (identical(other.projectItemName, projectItemName) ||
                other.projectItemName == projectItemName) &&
            (identical(other.totalHourOT, totalHourOT) ||
                other.totalHourOT == totalHourOT) &&
            (identical(other.holidayDate, holidayDate) ||
                other.holidayDate == holidayDate) &&
            (identical(other.planStartDate, planStartDate) ||
                other.planStartDate == planStartDate) &&
            (identical(other.planEndDate, planEndDate) ||
                other.planEndDate == planEndDate) &&
            (identical(other.totalDayPlan, totalDayPlan) ||
                other.totalDayPlan == totalDayPlan) &&
            (identical(other.actualStartDate, actualStartDate) ||
                other.actualStartDate == actualStartDate) &&
            (identical(other.actualEndDate, actualEndDate) ||
                other.actualEndDate == actualEndDate) &&
            (identical(other.totalDayActual, totalDayActual) ||
                other.totalDayActual == totalDayActual));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        code,
        fullName,
        confirm,
        id,
        dateReport,
        projectCode,
        projectName,
        projectText,
        totalHours,
        results,
        planNextDay,
        backlog,
        problem,
        problemSolve,
        note,
        createdDate,
        type,
        typeText,
        positionName,
        mission,
        projectItemCode,
        content,
        percentComplete,
        projectItemName,
        totalHourOT,
        holidayDate,
        planStartDate,
        planEndDate,
        totalDayPlan,
        actualStartDate,
        actualEndDate,
        totalDayActual
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnicalReportImplCopyWith<_$TechnicalReportImpl> get copyWith =>
      __$$TechnicalReportImplCopyWithImpl<_$TechnicalReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnicalReportImplToJson(
      this,
    );
  }
}

abstract class _TechnicalReport implements TechnicalReport {
  const factory _TechnicalReport(
          {@JsonKey(name: 'UserID') final int? userId,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'Confirm') final bool? confirm,
          @JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'DateReport') final String? dateReport,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'ProjectText') final String? projectText,
          @JsonKey(name: 'TotalHours') final double? totalHours,
          @JsonKey(name: 'Results') final String? results,
          @JsonKey(name: 'PlanNextDay') final String? planNextDay,
          @JsonKey(name: 'Backlog') final String? backlog,
          @JsonKey(name: 'Problem') final String? problem,
          @JsonKey(name: 'ProblemSolve') final String? problemSolve,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'Type') final int? type,
          @JsonKey(name: 'TypeText') final String? typeText,
          @JsonKey(name: 'PositionName') final String? positionName,
          @JsonKey(name: 'Mission') final String? mission,
          @JsonKey(name: 'ProjectItemCode') final String? projectItemCode,
          @JsonKey(name: 'Content') final String? content,
          @JsonKey(name: 'PercentComplete') final int? percentComplete,
          @JsonKey(name: 'ProjectItemName') final String? projectItemName,
          @JsonKey(name: 'TotalHourOT') final double? totalHourOT,
          @JsonKey(name: 'HolidayDate') final String? holidayDate,
          @JsonKey(name: 'PlanStartDate') final String? planStartDate,
          @JsonKey(name: 'PlanEndDate') final String? planEndDate,
          @JsonKey(name: 'TotalDayPlan') final double? totalDayPlan,
          @JsonKey(name: 'ActualStartDate') final String? actualStartDate,
          @JsonKey(name: 'ActualEndDate') final String? actualEndDate,
          @JsonKey(name: 'TotalDayActual') final double? totalDayActual}) =
      _$TechnicalReportImpl;

  factory _TechnicalReport.fromJson(Map<String, dynamic> json) =
      _$TechnicalReportImpl.fromJson;

  @override
  @JsonKey(name: 'UserID')
  int? get userId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'Confirm')
  bool? get confirm;
  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'DateReport')
  String? get dateReport;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'ProjectText')
  String? get projectText;
  @override
  @JsonKey(name: 'TotalHours')
  double? get totalHours;
  @override
  @JsonKey(name: 'Results')
  String? get results;
  @override
  @JsonKey(name: 'PlanNextDay')
  String? get planNextDay;
  @override
  @JsonKey(name: 'Backlog')
  String? get backlog;
  @override
  @JsonKey(name: 'Problem')
  String? get problem;
  @override
  @JsonKey(name: 'ProblemSolve')
  String? get problemSolve;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'Type')
  int? get type;
  @override
  @JsonKey(name: 'TypeText')
  String? get typeText;
  @override
  @JsonKey(name: 'PositionName')
  String? get positionName;
  @override
  @JsonKey(name: 'Mission')
  String? get mission;
  @override
  @JsonKey(name: 'ProjectItemCode')
  String? get projectItemCode;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'PercentComplete')
  int? get percentComplete;
  @override
  @JsonKey(name: 'ProjectItemName')
  String? get projectItemName;
  @override
  @JsonKey(name: 'TotalHourOT')
  double? get totalHourOT;
  @override
  @JsonKey(name: 'HolidayDate')
  String? get holidayDate;
  @override
  @JsonKey(name: 'PlanStartDate')
  String? get planStartDate;
  @override
  @JsonKey(name: 'PlanEndDate')
  String? get planEndDate;
  @override
  @JsonKey(name: 'TotalDayPlan')
  double? get totalDayPlan;
  @override
  @JsonKey(name: 'ActualStartDate')
  String? get actualStartDate;
  @override
  @JsonKey(name: 'ActualEndDate')
  String? get actualEndDate;
  @override
  @JsonKey(name: 'TotalDayActual')
  double? get totalDayActual;
  @override
  @JsonKey(ignore: true)
  _$$TechnicalReportImplCopyWith<_$TechnicalReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HrReportItem _$HrReportItemFromJson(Map<String, dynamic> json) {
  return _HrReportItem.fromJson(json);
}

/// @nodoc
mixin _$HrReportItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String? get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeActual')
  int? get timeActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformanceActual')
  int? get performanceActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'Percentage')
  int? get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'KmNumber')
  int? get kmNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLate')
  int? get totalLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTimeLate')
  int? get totalTimeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'Propose')
  String? get propose => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformanceAVG')
  double? get performanceAVG => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkContent')
  String? get workContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilmName')
  String? get filmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitName')
  String? get unitName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHdId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HrReportItemCopyWith<HrReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HrReportItemCopyWith<$Res> {
  factory $HrReportItemCopyWith(
          HrReportItem value, $Res Function(HrReportItem) then) =
      _$HrReportItemCopyWithImpl<$Res, HrReportItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') int? timeActual,
      @JsonKey(name: 'PerformanceActual') int? performanceActual,
      @JsonKey(name: 'Percentage') int? percentage,
      @JsonKey(name: 'KmNumber') int? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') int? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'PerformanceAVG') double? performanceAVG,
      @JsonKey(name: 'WorkContent') String? workContent,
      @JsonKey(name: 'FilmName') String? filmName,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHdId});
}

/// @nodoc
class _$HrReportItemCopyWithImpl<$Res, $Val extends HrReportItem>
    implements $HrReportItemCopyWith<$Res> {
  _$HrReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? dateReport = freezed,
    Object? filmManagementDetailId = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? performanceAVG = freezed,
    Object? workContent = freezed,
    Object? filmName = freezed,
    Object? unitName = freezed,
    Object? fullName = freezed,
    Object? chucVuHdId = freezed,
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
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      filmManagementDetailId: freezed == filmManagementDetailId
          ? _value.filmManagementDetailId
          : filmManagementDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      performanceAVG: freezed == performanceAVG
          ? _value.performanceAVG
          : performanceAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      workContent: freezed == workContent
          ? _value.workContent
          : workContent // ignore: cast_nullable_to_non_nullable
              as String?,
      filmName: freezed == filmName
          ? _value.filmName
          : filmName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVuHdId: freezed == chucVuHdId
          ? _value.chucVuHdId
          : chucVuHdId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HrReportItemImplCopyWith<$Res>
    implements $HrReportItemCopyWith<$Res> {
  factory _$$HrReportItemImplCopyWith(
          _$HrReportItemImpl value, $Res Function(_$HrReportItemImpl) then) =
      __$$HrReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeId,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailId,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') int? timeActual,
      @JsonKey(name: 'PerformanceActual') int? performanceActual,
      @JsonKey(name: 'Percentage') int? percentage,
      @JsonKey(name: 'KmNumber') int? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') int? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'PerformanceAVG') double? performanceAVG,
      @JsonKey(name: 'WorkContent') String? workContent,
      @JsonKey(name: 'FilmName') String? filmName,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'ChucVuHDID') int? chucVuHdId});
}

/// @nodoc
class __$$HrReportItemImplCopyWithImpl<$Res>
    extends _$HrReportItemCopyWithImpl<$Res, _$HrReportItemImpl>
    implements _$$HrReportItemImplCopyWith<$Res> {
  __$$HrReportItemImplCopyWithImpl(
      _$HrReportItemImpl _value, $Res Function(_$HrReportItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? dateReport = freezed,
    Object? filmManagementDetailId = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? performanceAVG = freezed,
    Object? workContent = freezed,
    Object? filmName = freezed,
    Object? unitName = freezed,
    Object? fullName = freezed,
    Object? chucVuHdId = freezed,
  }) {
    return _then(_$HrReportItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      filmManagementDetailId: freezed == filmManagementDetailId
          ? _value.filmManagementDetailId
          : filmManagementDetailId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      performanceAVG: freezed == performanceAVG
          ? _value.performanceAVG
          : performanceAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      workContent: freezed == workContent
          ? _value.workContent
          : workContent // ignore: cast_nullable_to_non_nullable
              as String?,
      filmName: freezed == filmName
          ? _value.filmName
          : filmName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVuHdId: freezed == chucVuHdId
          ? _value.chucVuHdId
          : chucVuHdId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HrReportItemImpl implements _HrReportItem {
  const _$HrReportItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'DateReport') this.dateReport,
      @JsonKey(name: 'FilmManagementDetailID') this.filmManagementDetailId,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'TimeActual') this.timeActual,
      @JsonKey(name: 'PerformanceActual') this.performanceActual,
      @JsonKey(name: 'Percentage') this.percentage,
      @JsonKey(name: 'KmNumber') this.kmNumber,
      @JsonKey(name: 'TotalLate') this.totalLate,
      @JsonKey(name: 'TotalTimeLate') this.totalTimeLate,
      @JsonKey(name: 'ReasonLate') this.reasonLate,
      @JsonKey(name: 'StatusVehicle') this.statusVehicle,
      @JsonKey(name: 'Propose') this.propose,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'PerformanceAVG') this.performanceAVG,
      @JsonKey(name: 'WorkContent') this.workContent,
      @JsonKey(name: 'FilmName') this.filmName,
      @JsonKey(name: 'UnitName') this.unitName,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'ChucVuHDID') this.chucVuHdId});

  factory _$HrReportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HrReportItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'DateReport')
  final String? dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  final int? filmManagementDetailId;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'TimeActual')
  final int? timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  final int? performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  final int? percentage;
  @override
  @JsonKey(name: 'KmNumber')
  final int? kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  final int? totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  final int? totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  final String? reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  final String? statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  final String? propose;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'PerformanceAVG')
  final double? performanceAVG;
  @override
  @JsonKey(name: 'WorkContent')
  final String? workContent;
  @override
  @JsonKey(name: 'FilmName')
  final String? filmName;
  @override
  @JsonKey(name: 'UnitName')
  final String? unitName;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'ChucVuHDID')
  final int? chucVuHdId;

  @override
  String toString() {
    return 'HrReportItem(id: $id, employeeId: $employeeId, dateReport: $dateReport, filmManagementDetailId: $filmManagementDetailId, quantity: $quantity, timeActual: $timeActual, performanceActual: $performanceActual, percentage: $percentage, kmNumber: $kmNumber, totalLate: $totalLate, totalTimeLate: $totalTimeLate, reasonLate: $reasonLate, statusVehicle: $statusVehicle, propose: $propose, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted, performanceAVG: $performanceAVG, workContent: $workContent, filmName: $filmName, unitName: $unitName, fullName: $fullName, chucVuHdId: $chucVuHdId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HrReportItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.filmManagementDetailId, filmManagementDetailId) ||
                other.filmManagementDetailId == filmManagementDetailId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.timeActual, timeActual) ||
                other.timeActual == timeActual) &&
            (identical(other.performanceActual, performanceActual) ||
                other.performanceActual == performanceActual) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.kmNumber, kmNumber) ||
                other.kmNumber == kmNumber) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.totalTimeLate, totalTimeLate) ||
                other.totalTimeLate == totalTimeLate) &&
            (identical(other.reasonLate, reasonLate) ||
                other.reasonLate == reasonLate) &&
            (identical(other.statusVehicle, statusVehicle) ||
                other.statusVehicle == statusVehicle) &&
            (identical(other.propose, propose) || other.propose == propose) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.performanceAVG, performanceAVG) ||
                other.performanceAVG == performanceAVG) &&
            (identical(other.workContent, workContent) ||
                other.workContent == workContent) &&
            (identical(other.filmName, filmName) ||
                other.filmName == filmName) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.chucVuHdId, chucVuHdId) ||
                other.chucVuHdId == chucVuHdId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        dateReport,
        filmManagementDetailId,
        quantity,
        timeActual,
        performanceActual,
        percentage,
        kmNumber,
        totalLate,
        totalTimeLate,
        reasonLate,
        statusVehicle,
        propose,
        createdDate,
        createdBy,
        updatedDate,
        updatedBy,
        isDeleted,
        performanceAVG,
        workContent,
        filmName,
        unitName,
        fullName,
        chucVuHdId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HrReportItemImplCopyWith<_$HrReportItemImpl> get copyWith =>
      __$$HrReportItemImplCopyWithImpl<_$HrReportItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HrReportItemImplToJson(
      this,
    );
  }
}

abstract class _HrReportItem implements HrReportItem {
  const factory _HrReportItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'EmployeeID') final int? employeeId,
      @JsonKey(name: 'DateReport') final String? dateReport,
      @JsonKey(name: 'FilmManagementDetailID')
      final int? filmManagementDetailId,
      @JsonKey(name: 'Quantity') final int? quantity,
      @JsonKey(name: 'TimeActual') final int? timeActual,
      @JsonKey(name: 'PerformanceActual') final int? performanceActual,
      @JsonKey(name: 'Percentage') final int? percentage,
      @JsonKey(name: 'KmNumber') final int? kmNumber,
      @JsonKey(name: 'TotalLate') final int? totalLate,
      @JsonKey(name: 'TotalTimeLate') final int? totalTimeLate,
      @JsonKey(name: 'ReasonLate') final String? reasonLate,
      @JsonKey(name: 'StatusVehicle') final String? statusVehicle,
      @JsonKey(name: 'Propose') final String? propose,
      @JsonKey(name: 'CreatedDate') final String? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final String? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'PerformanceAVG') final double? performanceAVG,
      @JsonKey(name: 'WorkContent') final String? workContent,
      @JsonKey(name: 'FilmName') final String? filmName,
      @JsonKey(name: 'UnitName') final String? unitName,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'ChucVuHDID') final int? chucVuHdId}) = _$HrReportItemImpl;

  factory _HrReportItem.fromJson(Map<String, dynamic> json) =
      _$HrReportItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'DateReport')
  String? get dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailId;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'TimeActual')
  int? get timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  int? get performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  int? get percentage;
  @override
  @JsonKey(name: 'KmNumber')
  int? get kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  int? get totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  int? get totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  String? get propose;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'PerformanceAVG')
  double? get performanceAVG;
  @override
  @JsonKey(name: 'WorkContent')
  String? get workContent;
  @override
  @JsonKey(name: 'FilmName')
  String? get filmName;
  @override
  @JsonKey(name: 'UnitName')
  String? get unitName;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'ChucVuHDID')
  int? get chucVuHdId;
  @override
  @JsonKey(ignore: true)
  _$$HrReportItemImplCopyWith<_$HrReportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FilmDetailResponse _$FilmDetailResponseFromJson(Map<String, dynamic> json) {
  return _FilmDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$FilmDetailResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilmManagementID')
  int? get filmManagementID => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitID')
  int? get unitID => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformanceAVG')
  double? get performanceAVG => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkContent')
  String? get workContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitName')
  String? get unitName => throw _privateConstructorUsedError;
  @JsonKey(name: 'WorkContent1')
  String? get workContent1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestResult')
  bool? get requestResult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilmDetailResponseCopyWith<FilmDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilmDetailResponseCopyWith<$Res> {
  factory $FilmDetailResponseCopyWith(
          FilmDetailResponse value, $Res Function(FilmDetailResponse) then) =
      _$FilmDetailResponseCopyWithImpl<$Res, FilmDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FilmManagementID') int? filmManagementID,
      @JsonKey(name: 'UnitID') int? unitID,
      @JsonKey(name: 'PerformanceAVG') double? performanceAVG,
      @JsonKey(name: 'WorkContent') String? workContent,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'WorkContent1') String? workContent1,
      @JsonKey(name: 'RequestResult') bool? requestResult});
}

/// @nodoc
class _$FilmDetailResponseCopyWithImpl<$Res, $Val extends FilmDetailResponse>
    implements $FilmDetailResponseCopyWith<$Res> {
  _$FilmDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? filmManagementID = freezed,
    Object? unitID = freezed,
    Object? performanceAVG = freezed,
    Object? workContent = freezed,
    Object? isDeleted = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? unitName = freezed,
    Object? workContent1 = freezed,
    Object? requestResult = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      filmManagementID: freezed == filmManagementID
          ? _value.filmManagementID
          : filmManagementID // ignore: cast_nullable_to_non_nullable
              as int?,
      unitID: freezed == unitID
          ? _value.unitID
          : unitID // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceAVG: freezed == performanceAVG
          ? _value.performanceAVG
          : performanceAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      workContent: freezed == workContent
          ? _value.workContent
          : workContent // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      workContent1: freezed == workContent1
          ? _value.workContent1
          : workContent1 // ignore: cast_nullable_to_non_nullable
              as String?,
      requestResult: freezed == requestResult
          ? _value.requestResult
          : requestResult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilmDetailResponseImplCopyWith<$Res>
    implements $FilmDetailResponseCopyWith<$Res> {
  factory _$$FilmDetailResponseImplCopyWith(_$FilmDetailResponseImpl value,
          $Res Function(_$FilmDetailResponseImpl) then) =
      __$$FilmDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'STT') int? stt,
      @JsonKey(name: 'FilmManagementID') int? filmManagementID,
      @JsonKey(name: 'UnitID') int? unitID,
      @JsonKey(name: 'PerformanceAVG') double? performanceAVG,
      @JsonKey(name: 'WorkContent') String? workContent,
      @JsonKey(name: 'IsDeleted') bool? isDeleted,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'UnitName') String? unitName,
      @JsonKey(name: 'WorkContent1') String? workContent1,
      @JsonKey(name: 'RequestResult') bool? requestResult});
}

/// @nodoc
class __$$FilmDetailResponseImplCopyWithImpl<$Res>
    extends _$FilmDetailResponseCopyWithImpl<$Res, _$FilmDetailResponseImpl>
    implements _$$FilmDetailResponseImplCopyWith<$Res> {
  __$$FilmDetailResponseImplCopyWithImpl(_$FilmDetailResponseImpl _value,
      $Res Function(_$FilmDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? stt = freezed,
    Object? filmManagementID = freezed,
    Object? unitID = freezed,
    Object? performanceAVG = freezed,
    Object? workContent = freezed,
    Object? isDeleted = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? unitName = freezed,
    Object? workContent1 = freezed,
    Object? requestResult = freezed,
  }) {
    return _then(_$FilmDetailResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
      filmManagementID: freezed == filmManagementID
          ? _value.filmManagementID
          : filmManagementID // ignore: cast_nullable_to_non_nullable
              as int?,
      unitID: freezed == unitID
          ? _value.unitID
          : unitID // ignore: cast_nullable_to_non_nullable
              as int?,
      performanceAVG: freezed == performanceAVG
          ? _value.performanceAVG
          : performanceAVG // ignore: cast_nullable_to_non_nullable
              as double?,
      workContent: freezed == workContent
          ? _value.workContent
          : workContent // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
      workContent1: freezed == workContent1
          ? _value.workContent1
          : workContent1 // ignore: cast_nullable_to_non_nullable
              as String?,
      requestResult: freezed == requestResult
          ? _value.requestResult
          : requestResult // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilmDetailResponseImpl implements _FilmDetailResponse {
  const _$FilmDetailResponseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'STT') this.stt,
      @JsonKey(name: 'FilmManagementID') this.filmManagementID,
      @JsonKey(name: 'UnitID') this.unitID,
      @JsonKey(name: 'PerformanceAVG') this.performanceAVG,
      @JsonKey(name: 'WorkContent') this.workContent,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UnitName') this.unitName,
      @JsonKey(name: 'WorkContent1') this.workContent1,
      @JsonKey(name: 'RequestResult') this.requestResult});

  factory _$FilmDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilmDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'STT')
  final int? stt;
  @override
  @JsonKey(name: 'FilmManagementID')
  final int? filmManagementID;
  @override
  @JsonKey(name: 'UnitID')
  final int? unitID;
  @override
  @JsonKey(name: 'PerformanceAVG')
  final double? performanceAVG;
  @override
  @JsonKey(name: 'WorkContent')
  final String? workContent;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UnitName')
  final String? unitName;
  @override
  @JsonKey(name: 'WorkContent1')
  final String? workContent1;
  @override
  @JsonKey(name: 'RequestResult')
  final bool? requestResult;

  @override
  String toString() {
    return 'FilmDetailResponse(id: $id, stt: $stt, filmManagementID: $filmManagementID, unitID: $unitID, performanceAVG: $performanceAVG, workContent: $workContent, isDeleted: $isDeleted, createdDate: $createdDate, updatedDate: $updatedDate, createdBy: $createdBy, updatedBy: $updatedBy, unitName: $unitName, workContent1: $workContent1, requestResult: $requestResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilmDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.filmManagementID, filmManagementID) ||
                other.filmManagementID == filmManagementID) &&
            (identical(other.unitID, unitID) || other.unitID == unitID) &&
            (identical(other.performanceAVG, performanceAVG) ||
                other.performanceAVG == performanceAVG) &&
            (identical(other.workContent, workContent) ||
                other.workContent == workContent) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName) &&
            (identical(other.workContent1, workContent1) ||
                other.workContent1 == workContent1) &&
            (identical(other.requestResult, requestResult) ||
                other.requestResult == requestResult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stt,
      filmManagementID,
      unitID,
      performanceAVG,
      workContent,
      isDeleted,
      createdDate,
      updatedDate,
      createdBy,
      updatedBy,
      unitName,
      workContent1,
      requestResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilmDetailResponseImplCopyWith<_$FilmDetailResponseImpl> get copyWith =>
      __$$FilmDetailResponseImplCopyWithImpl<_$FilmDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilmDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _FilmDetailResponse implements FilmDetailResponse {
  const factory _FilmDetailResponse(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'STT') final int? stt,
          @JsonKey(name: 'FilmManagementID') final int? filmManagementID,
          @JsonKey(name: 'UnitID') final int? unitID,
          @JsonKey(name: 'PerformanceAVG') final double? performanceAVG,
          @JsonKey(name: 'WorkContent') final String? workContent,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'UnitName') final String? unitName,
          @JsonKey(name: 'WorkContent1') final String? workContent1,
          @JsonKey(name: 'RequestResult') final bool? requestResult}) =
      _$FilmDetailResponseImpl;

  factory _FilmDetailResponse.fromJson(Map<String, dynamic> json) =
      _$FilmDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(name: 'FilmManagementID')
  int? get filmManagementID;
  @override
  @JsonKey(name: 'UnitID')
  int? get unitID;
  @override
  @JsonKey(name: 'PerformanceAVG')
  double? get performanceAVG;
  @override
  @JsonKey(name: 'WorkContent')
  String? get workContent;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UnitName')
  String? get unitName;
  @override
  @JsonKey(name: 'WorkContent1')
  String? get workContent1;
  @override
  @JsonKey(name: 'RequestResult')
  bool? get requestResult;
  @override
  @JsonKey(ignore: true)
  _$$FilmDetailResponseImplCopyWith<_$FilmDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailLXCPReportResponse _$DetailLXCPReportResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailLXCPReportResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailLXCPReportResponse {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeID => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateReport')
  String? get dateReport => throw _privateConstructorUsedError;
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'TimeActual')
  double? get timeActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'PerformanceActual')
  double? get performanceActual => throw _privateConstructorUsedError;
  @JsonKey(name: 'Percentage')
  double? get percentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'KmNumber')
  double? get kmNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalLate')
  int? get totalLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalTimeLate')
  double? get totalTimeLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'Propose')
  String? get propose => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailLXCPReportResponseCopyWith<DetailLXCPReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailLXCPReportResponseCopyWith<$Res> {
  factory $DetailLXCPReportResponseCopyWith(DetailLXCPReportResponse value,
          $Res Function(DetailLXCPReportResponse) then) =
      _$DetailLXCPReportResponseCopyWithImpl<$Res, DetailLXCPReportResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeID,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailID,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') double? timeActual,
      @JsonKey(name: 'PerformanceActual') double? performanceActual,
      @JsonKey(name: 'Percentage') double? percentage,
      @JsonKey(name: 'KmNumber') double? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') double? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$DetailLXCPReportResponseCopyWithImpl<$Res,
        $Val extends DetailLXCPReportResponse>
    implements $DetailLXCPReportResponseCopyWith<$Res> {
  _$DetailLXCPReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeID = freezed,
    Object? dateReport = freezed,
    Object? filmManagementDetailID = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeID: freezed == employeeID
          ? _value.employeeID
          : employeeID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      filmManagementDetailID: freezed == filmManagementDetailID
          ? _value.filmManagementDetailID
          : filmManagementDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as double?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as double?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailLXCPReportResponseImplCopyWith<$Res>
    implements $DetailLXCPReportResponseCopyWith<$Res> {
  factory _$$DetailLXCPReportResponseImplCopyWith(
          _$DetailLXCPReportResponseImpl value,
          $Res Function(_$DetailLXCPReportResponseImpl) then) =
      __$$DetailLXCPReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'EmployeeID') int? employeeID,
      @JsonKey(name: 'DateReport') String? dateReport,
      @JsonKey(name: 'FilmManagementDetailID') int? filmManagementDetailID,
      @JsonKey(name: 'Quantity') int? quantity,
      @JsonKey(name: 'TimeActual') double? timeActual,
      @JsonKey(name: 'PerformanceActual') double? performanceActual,
      @JsonKey(name: 'Percentage') double? percentage,
      @JsonKey(name: 'KmNumber') double? kmNumber,
      @JsonKey(name: 'TotalLate') int? totalLate,
      @JsonKey(name: 'TotalTimeLate') double? totalTimeLate,
      @JsonKey(name: 'ReasonLate') String? reasonLate,
      @JsonKey(name: 'StatusVehicle') String? statusVehicle,
      @JsonKey(name: 'Propose') String? propose,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$DetailLXCPReportResponseImplCopyWithImpl<$Res>
    extends _$DetailLXCPReportResponseCopyWithImpl<$Res,
        _$DetailLXCPReportResponseImpl>
    implements _$$DetailLXCPReportResponseImplCopyWith<$Res> {
  __$$DetailLXCPReportResponseImplCopyWithImpl(
      _$DetailLXCPReportResponseImpl _value,
      $Res Function(_$DetailLXCPReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeID = freezed,
    Object? dateReport = freezed,
    Object? filmManagementDetailID = freezed,
    Object? quantity = freezed,
    Object? timeActual = freezed,
    Object? performanceActual = freezed,
    Object? percentage = freezed,
    Object? kmNumber = freezed,
    Object? totalLate = freezed,
    Object? totalTimeLate = freezed,
    Object? reasonLate = freezed,
    Object? statusVehicle = freezed,
    Object? propose = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$DetailLXCPReportResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeID: freezed == employeeID
          ? _value.employeeID
          : employeeID // ignore: cast_nullable_to_non_nullable
              as int?,
      dateReport: freezed == dateReport
          ? _value.dateReport
          : dateReport // ignore: cast_nullable_to_non_nullable
              as String?,
      filmManagementDetailID: freezed == filmManagementDetailID
          ? _value.filmManagementDetailID
          : filmManagementDetailID // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      timeActual: freezed == timeActual
          ? _value.timeActual
          : timeActual // ignore: cast_nullable_to_non_nullable
              as double?,
      performanceActual: freezed == performanceActual
          ? _value.performanceActual
          : performanceActual // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      kmNumber: freezed == kmNumber
          ? _value.kmNumber
          : kmNumber // ignore: cast_nullable_to_non_nullable
              as double?,
      totalLate: freezed == totalLate
          ? _value.totalLate
          : totalLate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTimeLate: freezed == totalTimeLate
          ? _value.totalTimeLate
          : totalTimeLate // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonLate: freezed == reasonLate
          ? _value.reasonLate
          : reasonLate // ignore: cast_nullable_to_non_nullable
              as String?,
      statusVehicle: freezed == statusVehicle
          ? _value.statusVehicle
          : statusVehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      propose: freezed == propose
          ? _value.propose
          : propose // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
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
class _$DetailLXCPReportResponseImpl implements _DetailLXCPReportResponse {
  const _$DetailLXCPReportResponseImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeID,
      @JsonKey(name: 'DateReport') this.dateReport,
      @JsonKey(name: 'FilmManagementDetailID') this.filmManagementDetailID,
      @JsonKey(name: 'Quantity') this.quantity,
      @JsonKey(name: 'TimeActual') this.timeActual,
      @JsonKey(name: 'PerformanceActual') this.performanceActual,
      @JsonKey(name: 'Percentage') this.percentage,
      @JsonKey(name: 'KmNumber') this.kmNumber,
      @JsonKey(name: 'TotalLate') this.totalLate,
      @JsonKey(name: 'TotalTimeLate') this.totalTimeLate,
      @JsonKey(name: 'ReasonLate') this.reasonLate,
      @JsonKey(name: 'StatusVehicle') this.statusVehicle,
      @JsonKey(name: 'Propose') this.propose,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$DetailLXCPReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailLXCPReportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeID;
  @override
  @JsonKey(name: 'DateReport')
  final String? dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  final int? filmManagementDetailID;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'TimeActual')
  final double? timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  final double? performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  final double? percentage;
  @override
  @JsonKey(name: 'KmNumber')
  final double? kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  final int? totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  final double? totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  final String? reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  final String? statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  final String? propose;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'DetailLXCPReportResponse(id: $id, employeeID: $employeeID, dateReport: $dateReport, filmManagementDetailID: $filmManagementDetailID, quantity: $quantity, timeActual: $timeActual, performanceActual: $performanceActual, percentage: $percentage, kmNumber: $kmNumber, totalLate: $totalLate, totalTimeLate: $totalTimeLate, reasonLate: $reasonLate, statusVehicle: $statusVehicle, propose: $propose, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLXCPReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeID, employeeID) ||
                other.employeeID == employeeID) &&
            (identical(other.dateReport, dateReport) ||
                other.dateReport == dateReport) &&
            (identical(other.filmManagementDetailID, filmManagementDetailID) ||
                other.filmManagementDetailID == filmManagementDetailID) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.timeActual, timeActual) ||
                other.timeActual == timeActual) &&
            (identical(other.performanceActual, performanceActual) ||
                other.performanceActual == performanceActual) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.kmNumber, kmNumber) ||
                other.kmNumber == kmNumber) &&
            (identical(other.totalLate, totalLate) ||
                other.totalLate == totalLate) &&
            (identical(other.totalTimeLate, totalTimeLate) ||
                other.totalTimeLate == totalTimeLate) &&
            (identical(other.reasonLate, reasonLate) ||
                other.reasonLate == reasonLate) &&
            (identical(other.statusVehicle, statusVehicle) ||
                other.statusVehicle == statusVehicle) &&
            (identical(other.propose, propose) || other.propose == propose) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeID,
        dateReport,
        filmManagementDetailID,
        quantity,
        timeActual,
        performanceActual,
        percentage,
        kmNumber,
        totalLate,
        totalTimeLate,
        reasonLate,
        statusVehicle,
        propose,
        createdDate,
        createdBy,
        updatedDate,
        updatedBy,
        isDeleted
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLXCPReportResponseImplCopyWith<_$DetailLXCPReportResponseImpl>
      get copyWith => __$$DetailLXCPReportResponseImplCopyWithImpl<
          _$DetailLXCPReportResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailLXCPReportResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailLXCPReportResponse implements DetailLXCPReportResponse {
  const factory _DetailLXCPReportResponse(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeID,
          @JsonKey(name: 'DateReport') final String? dateReport,
          @JsonKey(name: 'FilmManagementDetailID')
          final int? filmManagementDetailID,
          @JsonKey(name: 'Quantity') final int? quantity,
          @JsonKey(name: 'TimeActual') final double? timeActual,
          @JsonKey(name: 'PerformanceActual') final double? performanceActual,
          @JsonKey(name: 'Percentage') final double? percentage,
          @JsonKey(name: 'KmNumber') final double? kmNumber,
          @JsonKey(name: 'TotalLate') final int? totalLate,
          @JsonKey(name: 'TotalTimeLate') final double? totalTimeLate,
          @JsonKey(name: 'ReasonLate') final String? reasonLate,
          @JsonKey(name: 'StatusVehicle') final String? statusVehicle,
          @JsonKey(name: 'Propose') final String? propose,
          @JsonKey(name: 'CreatedDate') final String? createdDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedDate') final String? updatedDate,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$DetailLXCPReportResponseImpl;

  factory _DetailLXCPReportResponse.fromJson(Map<String, dynamic> json) =
      _$DetailLXCPReportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeID;
  @override
  @JsonKey(name: 'DateReport')
  String? get dateReport;
  @override
  @JsonKey(name: 'FilmManagementDetailID')
  int? get filmManagementDetailID;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'TimeActual')
  double? get timeActual;
  @override
  @JsonKey(name: 'PerformanceActual')
  double? get performanceActual;
  @override
  @JsonKey(name: 'Percentage')
  double? get percentage;
  @override
  @JsonKey(name: 'KmNumber')
  double? get kmNumber;
  @override
  @JsonKey(name: 'TotalLate')
  int? get totalLate;
  @override
  @JsonKey(name: 'TotalTimeLate')
  double? get totalTimeLate;
  @override
  @JsonKey(name: 'ReasonLate')
  String? get reasonLate;
  @override
  @JsonKey(name: 'StatusVehicle')
  String? get statusVehicle;
  @override
  @JsonKey(name: 'Propose')
  String? get propose;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$DetailLXCPReportResponseImplCopyWith<_$DetailLXCPReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailSaleReportResponse _$DetailSaleReportResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailSaleReportResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailSaleReportResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContacID')
  int get contacId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'Telesale')
  int? get telesale => throw _privateConstructorUsedError;
  @JsonKey(name: 'Visit')
  int? get visit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Demo')
  int? get demo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  String? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemBacklog')
  String? get problemBacklog => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNext')
  String? get planNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'BigAccount')
  bool get bigAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupType')
  int get groupType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserLoginID')
  int? get userLoginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductOfCustomer')
  String? get productOfCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestOfCustomer')
  String? get requestOfCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmBaseID')
  int? get firmBaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeBaseID')
  int? get projectTypeBaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleOpportunity')
  bool? get saleOpportunity => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailSaleReportResponseCopyWith<DetailSaleReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailSaleReportResponseCopyWith<$Res> {
  factory $DetailSaleReportResponseCopyWith(DetailSaleReportResponse value,
          $Res Function(DetailSaleReportResponse) then) =
      _$DetailSaleReportResponseCopyWithImpl<$Res, DetailSaleReportResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'ContacID') int contacId,
      @JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'Telesale') int? telesale,
      @JsonKey(name: 'Visit') int? visit,
      @JsonKey(name: 'Demo') int? demo,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'ProblemBacklog') String? problemBacklog,
      @JsonKey(name: 'PlanNext') String? planNext,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'BigAccount') bool bigAccount,
      @JsonKey(name: 'GroupType') int groupType,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'UserLoginID') int? userLoginId,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'Month') int month,
      @JsonKey(name: 'Year') int year,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'ProductOfCustomer') String? productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') String? requestOfCustomer,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FirmBaseID') int? firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') int? projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') bool? saleOpportunity,
      @JsonKey(name: 'WarehouseID') int? warehouseId});
}

/// @nodoc
class _$DetailSaleReportResponseCopyWithImpl<$Res,
        $Val extends DetailSaleReportResponse>
    implements $DetailSaleReportResponseCopyWith<$Res> {
  _$DetailSaleReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? userId = null,
    Object? contacId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? telesale = freezed,
    Object? visit = freezed,
    Object? demo = freezed,
    Object? result = freezed,
    Object? problemBacklog = freezed,
    Object? planNext = freezed,
    Object? note = freezed,
    Object? bigAccount = null,
    Object? groupType = null,
    Object? content = null,
    Object? userLoginId = freezed,
    Object? createdDate = null,
    Object? createdBy = null,
    Object? month = null,
    Object? year = null,
    Object? endUser = freezed,
    Object? deleteFlag = null,
    Object? confirm = null,
    Object? productOfCustomer = freezed,
    Object? requestOfCustomer = freezed,
    Object? projectId = freezed,
    Object? firmBaseId = freezed,
    Object? projectTypeBaseId = freezed,
    Object? saleOpportunity = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      contacId: null == contacId
          ? _value.contacId
          : contacId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      telesale: freezed == telesale
          ? _value.telesale
          : telesale // ignore: cast_nullable_to_non_nullable
              as int?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      problemBacklog: freezed == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String?,
      planNext: freezed == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      bigAccount: null == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      groupType: null == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userLoginId: freezed == userLoginId
          ? _value.userLoginId
          : userLoginId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      productOfCustomer: freezed == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      requestOfCustomer: freezed == requestOfCustomer
          ? _value.requestOfCustomer
          : requestOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      firmBaseId: freezed == firmBaseId
          ? _value.firmBaseId
          : firmBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectTypeBaseId: freezed == projectTypeBaseId
          ? _value.projectTypeBaseId
          : projectTypeBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleOpportunity: freezed == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailSaleReportResponseImplCopyWith<$Res>
    implements $DetailSaleReportResponseCopyWith<$Res> {
  factory _$$DetailSaleReportResponseImplCopyWith(
          _$DetailSaleReportResponseImpl value,
          $Res Function(_$DetailSaleReportResponseImpl) then) =
      __$$DetailSaleReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'ContacID') int contacId,
      @JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'Telesale') int? telesale,
      @JsonKey(name: 'Visit') int? visit,
      @JsonKey(name: 'Demo') int? demo,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'ProblemBacklog') String? problemBacklog,
      @JsonKey(name: 'PlanNext') String? planNext,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'BigAccount') bool bigAccount,
      @JsonKey(name: 'GroupType') int groupType,
      @JsonKey(name: 'Content') String content,
      @JsonKey(name: 'UserLoginID') int? userLoginId,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'Month') int month,
      @JsonKey(name: 'Year') int year,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'ProductOfCustomer') String? productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') String? requestOfCustomer,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FirmBaseID') int? firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') int? projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') bool? saleOpportunity,
      @JsonKey(name: 'WarehouseID') int? warehouseId});
}

/// @nodoc
class __$$DetailSaleReportResponseImplCopyWithImpl<$Res>
    extends _$DetailSaleReportResponseCopyWithImpl<$Res,
        _$DetailSaleReportResponseImpl>
    implements _$$DetailSaleReportResponseImplCopyWith<$Res> {
  __$$DetailSaleReportResponseImplCopyWithImpl(
      _$DetailSaleReportResponseImpl _value,
      $Res Function(_$DetailSaleReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? userId = null,
    Object? contacId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? telesale = freezed,
    Object? visit = freezed,
    Object? demo = freezed,
    Object? result = freezed,
    Object? problemBacklog = freezed,
    Object? planNext = freezed,
    Object? note = freezed,
    Object? bigAccount = null,
    Object? groupType = null,
    Object? content = null,
    Object? userLoginId = freezed,
    Object? createdDate = null,
    Object? createdBy = null,
    Object? month = null,
    Object? year = null,
    Object? endUser = freezed,
    Object? deleteFlag = null,
    Object? confirm = null,
    Object? productOfCustomer = freezed,
    Object? requestOfCustomer = freezed,
    Object? projectId = freezed,
    Object? firmBaseId = freezed,
    Object? projectTypeBaseId = freezed,
    Object? saleOpportunity = freezed,
    Object? warehouseId = freezed,
  }) {
    return _then(_$DetailSaleReportResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      contacId: null == contacId
          ? _value.contacId
          : contacId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      telesale: freezed == telesale
          ? _value.telesale
          : telesale // ignore: cast_nullable_to_non_nullable
              as int?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      problemBacklog: freezed == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String?,
      planNext: freezed == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      bigAccount: null == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      groupType: null == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userLoginId: freezed == userLoginId
          ? _value.userLoginId
          : userLoginId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      productOfCustomer: freezed == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      requestOfCustomer: freezed == requestOfCustomer
          ? _value.requestOfCustomer
          : requestOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      firmBaseId: freezed == firmBaseId
          ? _value.firmBaseId
          : firmBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectTypeBaseId: freezed == projectTypeBaseId
          ? _value.projectTypeBaseId
          : projectTypeBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleOpportunity: freezed == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailSaleReportResponseImpl implements _DetailSaleReportResponse {
  const _$DetailSaleReportResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerID') required this.customerId,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'ContacID') required this.contacId,
      @JsonKey(name: 'DateStart') required this.dateStart,
      @JsonKey(name: 'DateEnd') required this.dateEnd,
      @JsonKey(name: 'Telesale') this.telesale,
      @JsonKey(name: 'Visit') this.visit,
      @JsonKey(name: 'Demo') this.demo,
      @JsonKey(name: 'Result') this.result,
      @JsonKey(name: 'ProblemBacklog') this.problemBacklog,
      @JsonKey(name: 'PlanNext') this.planNext,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'BigAccount') required this.bigAccount,
      @JsonKey(name: 'GroupType') required this.groupType,
      @JsonKey(name: 'Content') required this.content,
      @JsonKey(name: 'UserLoginID') this.userLoginId,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'Month') required this.month,
      @JsonKey(name: 'Year') required this.year,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'DeleteFlag') required this.deleteFlag,
      @JsonKey(name: 'Confirm') required this.confirm,
      @JsonKey(name: 'ProductOfCustomer') this.productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') this.requestOfCustomer,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'FirmBaseID') this.firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') this.projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') this.saleOpportunity,
      @JsonKey(name: 'WarehouseID') this.warehouseId});

  factory _$DetailSaleReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailSaleReportResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerID')
  final int customerId;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'ContacID')
  final int contacId;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime dateEnd;
  @override
  @JsonKey(name: 'Telesale')
  final int? telesale;
  @override
  @JsonKey(name: 'Visit')
  final int? visit;
  @override
  @JsonKey(name: 'Demo')
  final int? demo;
  @override
  @JsonKey(name: 'Result')
  final String? result;
  @override
  @JsonKey(name: 'ProblemBacklog')
  final String? problemBacklog;
  @override
  @JsonKey(name: 'PlanNext')
  final String? planNext;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'BigAccount')
  final bool bigAccount;
  @override
  @JsonKey(name: 'GroupType')
  final int groupType;
  @override
  @JsonKey(name: 'Content')
  final String content;
  @override
  @JsonKey(name: 'UserLoginID')
  final int? userLoginId;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'Month')
  final int month;
  @override
  @JsonKey(name: 'Year')
  final int year;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
  @override
  @JsonKey(name: 'DeleteFlag')
  final int deleteFlag;
  @override
  @JsonKey(name: 'Confirm')
  final bool confirm;
  @override
  @JsonKey(name: 'ProductOfCustomer')
  final String? productOfCustomer;
  @override
  @JsonKey(name: 'RequestOfCustomer')
  final String? requestOfCustomer;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'FirmBaseID')
  final int? firmBaseId;
  @override
  @JsonKey(name: 'ProjectTypeBaseID')
  final int? projectTypeBaseId;
  @override
  @JsonKey(name: 'SaleOpportunity')
  final bool? saleOpportunity;
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;

  @override
  String toString() {
    return 'DetailSaleReportResponse(id: $id, customerId: $customerId, userId: $userId, contacId: $contacId, dateStart: $dateStart, dateEnd: $dateEnd, telesale: $telesale, visit: $visit, demo: $demo, result: $result, problemBacklog: $problemBacklog, planNext: $planNext, note: $note, bigAccount: $bigAccount, groupType: $groupType, content: $content, userLoginId: $userLoginId, createdDate: $createdDate, createdBy: $createdBy, month: $month, year: $year, endUser: $endUser, deleteFlag: $deleteFlag, confirm: $confirm, productOfCustomer: $productOfCustomer, requestOfCustomer: $requestOfCustomer, projectId: $projectId, firmBaseId: $firmBaseId, projectTypeBaseId: $projectTypeBaseId, saleOpportunity: $saleOpportunity, warehouseId: $warehouseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailSaleReportResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contacId, contacId) ||
                other.contacId == contacId) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.telesale, telesale) ||
                other.telesale == telesale) &&
            (identical(other.visit, visit) || other.visit == visit) &&
            (identical(other.demo, demo) || other.demo == demo) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.problemBacklog, problemBacklog) ||
                other.problemBacklog == problemBacklog) &&
            (identical(other.planNext, planNext) ||
                other.planNext == planNext) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.bigAccount, bigAccount) ||
                other.bigAccount == bigAccount) &&
            (identical(other.groupType, groupType) ||
                other.groupType == groupType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userLoginId, userLoginId) ||
                other.userLoginId == userLoginId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.endUser, endUser) || other.endUser == endUser) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.productOfCustomer, productOfCustomer) ||
                other.productOfCustomer == productOfCustomer) &&
            (identical(other.requestOfCustomer, requestOfCustomer) ||
                other.requestOfCustomer == requestOfCustomer) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.firmBaseId, firmBaseId) ||
                other.firmBaseId == firmBaseId) &&
            (identical(other.projectTypeBaseId, projectTypeBaseId) ||
                other.projectTypeBaseId == projectTypeBaseId) &&
            (identical(other.saleOpportunity, saleOpportunity) ||
                other.saleOpportunity == saleOpportunity) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        customerId,
        userId,
        contacId,
        dateStart,
        dateEnd,
        telesale,
        visit,
        demo,
        result,
        problemBacklog,
        planNext,
        note,
        bigAccount,
        groupType,
        content,
        userLoginId,
        createdDate,
        createdBy,
        month,
        year,
        endUser,
        deleteFlag,
        confirm,
        productOfCustomer,
        requestOfCustomer,
        projectId,
        firmBaseId,
        projectTypeBaseId,
        saleOpportunity,
        warehouseId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailSaleReportResponseImplCopyWith<_$DetailSaleReportResponseImpl>
      get copyWith => __$$DetailSaleReportResponseImplCopyWithImpl<
          _$DetailSaleReportResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailSaleReportResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailSaleReportResponse implements DetailSaleReportResponse {
  const factory _DetailSaleReportResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerID') required final int customerId,
          @JsonKey(name: 'UserID') required final int userId,
          @JsonKey(name: 'ContacID') required final int contacId,
          @JsonKey(name: 'DateStart') required final DateTime dateStart,
          @JsonKey(name: 'DateEnd') required final DateTime dateEnd,
          @JsonKey(name: 'Telesale') final int? telesale,
          @JsonKey(name: 'Visit') final int? visit,
          @JsonKey(name: 'Demo') final int? demo,
          @JsonKey(name: 'Result') final String? result,
          @JsonKey(name: 'ProblemBacklog') final String? problemBacklog,
          @JsonKey(name: 'PlanNext') final String? planNext,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'BigAccount') required final bool bigAccount,
          @JsonKey(name: 'GroupType') required final int groupType,
          @JsonKey(name: 'Content') required final String content,
          @JsonKey(name: 'UserLoginID') final int? userLoginId,
          @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
          @JsonKey(name: 'CreatedBy') required final String createdBy,
          @JsonKey(name: 'Month') required final int month,
          @JsonKey(name: 'Year') required final int year,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'DeleteFlag') required final int deleteFlag,
          @JsonKey(name: 'Confirm') required final bool confirm,
          @JsonKey(name: 'ProductOfCustomer') final String? productOfCustomer,
          @JsonKey(name: 'RequestOfCustomer') final String? requestOfCustomer,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'FirmBaseID') final int? firmBaseId,
          @JsonKey(name: 'ProjectTypeBaseID') final int? projectTypeBaseId,
          @JsonKey(name: 'SaleOpportunity') final bool? saleOpportunity,
          @JsonKey(name: 'WarehouseID') final int? warehouseId}) =
      _$DetailSaleReportResponseImpl;

  factory _DetailSaleReportResponse.fromJson(Map<String, dynamic> json) =
      _$DetailSaleReportResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerID')
  int get customerId;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'ContacID')
  int get contacId;
  @override
  @JsonKey(name: 'DateStart')
  DateTime get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd;
  @override
  @JsonKey(name: 'Telesale')
  int? get telesale;
  @override
  @JsonKey(name: 'Visit')
  int? get visit;
  @override
  @JsonKey(name: 'Demo')
  int? get demo;
  @override
  @JsonKey(name: 'Result')
  String? get result;
  @override
  @JsonKey(name: 'ProblemBacklog')
  String? get problemBacklog;
  @override
  @JsonKey(name: 'PlanNext')
  String? get planNext;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'BigAccount')
  bool get bigAccount;
  @override
  @JsonKey(name: 'GroupType')
  int get groupType;
  @override
  @JsonKey(name: 'Content')
  String get content;
  @override
  @JsonKey(name: 'UserLoginID')
  int? get userLoginId;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'Month')
  int get month;
  @override
  @JsonKey(name: 'Year')
  int get year;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
  @override
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag;
  @override
  @JsonKey(name: 'Confirm')
  bool get confirm;
  @override
  @JsonKey(name: 'ProductOfCustomer')
  String? get productOfCustomer;
  @override
  @JsonKey(name: 'RequestOfCustomer')
  String? get requestOfCustomer;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'FirmBaseID')
  int? get firmBaseId;
  @override
  @JsonKey(name: 'ProjectTypeBaseID')
  int? get projectTypeBaseId;
  @override
  @JsonKey(name: 'SaleOpportunity')
  bool? get saleOpportunity;
  @override
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(ignore: true)
  _$$DetailSaleReportResponseImplCopyWith<_$DetailSaleReportResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaleProjectResponse _$SaleProjectResponseFromJson(Map<String, dynamic> json) {
  return _SaleProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$SaleProjectResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectShortName')
  String get projectShortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectStatus')
  int get projectStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserTechnicalID')
  int? get userTechnicalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String get note => throw _privateConstructorUsedError;
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
  int? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'PODate')
  DateTime? get poDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TypeProject')
  int? get typeProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleProjectResponseCopyWith<SaleProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleProjectResponseCopyWith<$Res> {
  factory $SaleProjectResponseCopyWith(
          SaleProjectResponse value, $Res Function(SaleProjectResponse) then) =
      _$SaleProjectResponseCopyWithImpl<$Res, SaleProjectResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
      @JsonKey(name: 'ProjectShortName') String projectShortName,
      @JsonKey(name: 'ProjectStatus') int projectStatus,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'Note') String note,
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
      @JsonKey(name: 'Priotity') int? priority,
      @JsonKey(name: 'PODate') DateTime? poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool isDeleted});
}

/// @nodoc
class _$SaleProjectResponseCopyWithImpl<$Res, $Val extends SaleProjectResponse>
    implements $SaleProjectResponseCopyWith<$Res> {
  _$SaleProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectShortName = null,
    Object? projectStatus = null,
    Object? userId = null,
    Object? userTechnicalId = freezed,
    Object? note = null,
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
    Object? priority = freezed,
    Object? poDate = freezed,
    Object? endUser = freezed,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? updatedBy = null,
    Object? updatedDate = null,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectShortName: null == projectShortName
          ? _value.projectShortName
          : projectShortName // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatus: null == projectStatus
          ? _value.projectStatus
          : projectStatus // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userTechnicalId: freezed == userTechnicalId
          ? _value.userTechnicalId
          : userTechnicalId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
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
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeProject: freezed == typeProject
          ? _value.typeProject
          : typeProject // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleProjectResponseImplCopyWith<$Res>
    implements $SaleProjectResponseCopyWith<$Res> {
  factory _$$SaleProjectResponseImplCopyWith(_$SaleProjectResponseImpl value,
          $Res Function(_$SaleProjectResponseImpl) then) =
      __$$SaleProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'ProjectCode') String projectCode,
      @JsonKey(name: 'ProjectName') String projectName,
      @JsonKey(name: 'ProjectShortName') String projectShortName,
      @JsonKey(name: 'ProjectStatus') int projectStatus,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
      @JsonKey(name: 'Note') String note,
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
      @JsonKey(name: 'Priotity') int? priority,
      @JsonKey(name: 'PODate') DateTime? poDate,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate,
      @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
      @JsonKey(name: 'TypeProject') int? typeProject,
      @JsonKey(name: 'IsDeleted') bool isDeleted});
}

/// @nodoc
class __$$SaleProjectResponseImplCopyWithImpl<$Res>
    extends _$SaleProjectResponseCopyWithImpl<$Res, _$SaleProjectResponseImpl>
    implements _$$SaleProjectResponseImplCopyWith<$Res> {
  __$$SaleProjectResponseImplCopyWithImpl(_$SaleProjectResponseImpl _value,
      $Res Function(_$SaleProjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? projectCode = null,
    Object? projectName = null,
    Object? projectShortName = null,
    Object? projectStatus = null,
    Object? userId = null,
    Object? userTechnicalId = freezed,
    Object? note = null,
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
    Object? priority = freezed,
    Object? poDate = freezed,
    Object? endUser = freezed,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? updatedBy = null,
    Object? updatedDate = null,
    Object? businessFieldId = freezed,
    Object? typeProject = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_$SaleProjectResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      projectCode: null == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectShortName: null == projectShortName
          ? _value.projectShortName
          : projectShortName // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatus: null == projectStatus
          ? _value.projectStatus
          : projectStatus // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userTechnicalId: freezed == userTechnicalId
          ? _value.userTechnicalId
          : userTechnicalId // ignore: cast_nullable_to_non_nullable
              as int?,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
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
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      poDate: freezed == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      businessFieldId: freezed == businessFieldId
          ? _value.businessFieldId
          : businessFieldId // ignore: cast_nullable_to_non_nullable
              as int?,
      typeProject: freezed == typeProject
          ? _value.typeProject
          : typeProject // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleProjectResponseImpl implements _SaleProjectResponse {
  const _$SaleProjectResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerID') required this.customerId,
      @JsonKey(name: 'ProjectCode') required this.projectCode,
      @JsonKey(name: 'ProjectName') required this.projectName,
      @JsonKey(name: 'ProjectShortName') required this.projectShortName,
      @JsonKey(name: 'ProjectStatus') required this.projectStatus,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'UserTechnicalID') this.userTechnicalId,
      @JsonKey(name: 'Note') required this.note,
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
      @JsonKey(name: 'Priotity') this.priority,
      @JsonKey(name: 'PODate') this.poDate,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'UpdatedBy') required this.updatedBy,
      @JsonKey(name: 'UpdatedDate') required this.updatedDate,
      @JsonKey(name: 'BusinessFieldID') this.businessFieldId,
      @JsonKey(name: 'TypeProject') this.typeProject,
      @JsonKey(name: 'IsDeleted') required this.isDeleted});

  factory _$SaleProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleProjectResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerID')
  final int customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  final String projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String projectName;
  @override
  @JsonKey(name: 'ProjectShortName')
  final String projectShortName;
  @override
  @JsonKey(name: 'ProjectStatus')
  final int projectStatus;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'UserTechnicalID')
  final int? userTechnicalId;
  @override
  @JsonKey(name: 'Note')
  final String note;
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
  final int? priority;
  @override
  @JsonKey(name: 'PODate')
  final DateTime? poDate;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;
  @override
  @JsonKey(name: 'BusinessFieldID')
  final int? businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  final int? typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool isDeleted;

  @override
  String toString() {
    return 'SaleProjectResponse(id: $id, customerId: $customerId, projectCode: $projectCode, projectName: $projectName, projectShortName: $projectShortName, projectStatus: $projectStatus, userId: $userId, userTechnicalId: $userTechnicalId, note: $note, isApproved: $isApproved, contactId: $contactId, po: $po, projectType: $projectType, listCostId: $listCostId, planDateStart: $planDateStart, planDateEnd: $planDateEnd, actualDateStart: $actualDateStart, actualDateEnd: $actualDateEnd, eu: $eu, projectManager: $projectManager, currentState: $currentState, priority: $priority, poDate: $poDate, endUser: $endUser, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, businessFieldId: $businessFieldId, typeProject: $typeProject, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleProjectResponseImpl &&
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
            (identical(other.priority, priority) ||
                other.priority == priority) &&
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
        priority,
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
  _$$SaleProjectResponseImplCopyWith<_$SaleProjectResponseImpl> get copyWith =>
      __$$SaleProjectResponseImplCopyWithImpl<_$SaleProjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleProjectResponseImplToJson(
      this,
    );
  }
}

abstract class _SaleProjectResponse implements SaleProjectResponse {
  const factory _SaleProjectResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'CustomerID') required final int customerId,
      @JsonKey(name: 'ProjectCode') required final String projectCode,
      @JsonKey(name: 'ProjectName') required final String projectName,
      @JsonKey(name: 'ProjectShortName') required final String projectShortName,
      @JsonKey(name: 'ProjectStatus') required final int projectStatus,
      @JsonKey(name: 'UserID') required final int userId,
      @JsonKey(name: 'UserTechnicalID') final int? userTechnicalId,
      @JsonKey(name: 'Note') required final String note,
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
      @JsonKey(name: 'Priotity') final int? priority,
      @JsonKey(name: 'PODate') final DateTime? poDate,
      @JsonKey(name: 'EndUser') final int? endUser,
      @JsonKey(name: 'CreatedBy') required final String createdBy,
      @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
      @JsonKey(name: 'UpdatedBy') required final String updatedBy,
      @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate,
      @JsonKey(name: 'BusinessFieldID') final int? businessFieldId,
      @JsonKey(name: 'TypeProject') final int? typeProject,
      @JsonKey(name: 'IsDeleted')
      required final bool isDeleted}) = _$SaleProjectResponseImpl;

  factory _SaleProjectResponse.fromJson(Map<String, dynamic> json) =
      _$SaleProjectResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerID')
  int get customerId;
  @override
  @JsonKey(name: 'ProjectCode')
  String get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String get projectName;
  @override
  @JsonKey(name: 'ProjectShortName')
  String get projectShortName;
  @override
  @JsonKey(name: 'ProjectStatus')
  int get projectStatus;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'UserTechnicalID')
  int? get userTechnicalId;
  @override
  @JsonKey(name: 'Note')
  String get note;
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
  int? get priority;
  @override
  @JsonKey(name: 'PODate')
  DateTime? get poDate;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(name: 'BusinessFieldID')
  int? get businessFieldId;
  @override
  @JsonKey(name: 'TypeProject')
  int? get typeProject;
  @override
  @JsonKey(name: 'IsDeleted')
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$SaleProjectResponseImplCopyWith<_$SaleProjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerPartResponse _$CustomerPartResponseFromJson(Map<String, dynamic> json) {
  return _CustomerPartResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerPartResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartName')
  String get partName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartCode')
  String get partCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPartResponseCopyWith<CustomerPartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPartResponseCopyWith<$Res> {
  factory $CustomerPartResponseCopyWith(CustomerPartResponse value,
          $Res Function(CustomerPartResponse) then) =
      _$CustomerPartResponseCopyWithImpl<$Res, CustomerPartResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'PartName') String partName,
      @JsonKey(name: 'PartCode') String partCode,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class _$CustomerPartResponseCopyWithImpl<$Res,
        $Val extends CustomerPartResponse>
    implements $CustomerPartResponseCopyWith<$Res> {
  _$CustomerPartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partName = null,
    Object? partCode = null,
    Object? customerId = null,
    Object? stt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      partCode: null == partCode
          ? _value.partCode
          : partCode // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPartResponseImplCopyWith<$Res>
    implements $CustomerPartResponseCopyWith<$Res> {
  factory _$$CustomerPartResponseImplCopyWith(_$CustomerPartResponseImpl value,
          $Res Function(_$CustomerPartResponseImpl) then) =
      __$$CustomerPartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'PartName') String partName,
      @JsonKey(name: 'PartCode') String partCode,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class __$$CustomerPartResponseImplCopyWithImpl<$Res>
    extends _$CustomerPartResponseCopyWithImpl<$Res, _$CustomerPartResponseImpl>
    implements _$$CustomerPartResponseImplCopyWith<$Res> {
  __$$CustomerPartResponseImplCopyWithImpl(_$CustomerPartResponseImpl _value,
      $Res Function(_$CustomerPartResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partName = null,
    Object? partCode = null,
    Object? customerId = null,
    Object? stt = freezed,
  }) {
    return _then(_$CustomerPartResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partName: null == partName
          ? _value.partName
          : partName // ignore: cast_nullable_to_non_nullable
              as String,
      partCode: null == partCode
          ? _value.partCode
          : partCode // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPartResponseImpl implements _CustomerPartResponse {
  const _$CustomerPartResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'PartName') required this.partName,
      @JsonKey(name: 'PartCode') required this.partCode,
      @JsonKey(name: 'CustomerID') required this.customerId,
      @JsonKey(name: 'STT') this.stt});

  factory _$CustomerPartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPartResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'PartName')
  final String partName;
  @override
  @JsonKey(name: 'PartCode')
  final String partCode;
  @override
  @JsonKey(name: 'CustomerID')
  final int customerId;
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  @override
  String toString() {
    return 'CustomerPartResponse(id: $id, partName: $partName, partCode: $partCode, customerId: $customerId, stt: $stt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPartResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partName, partName) ||
                other.partName == partName) &&
            (identical(other.partCode, partCode) ||
                other.partCode == partCode) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.stt, stt) || other.stt == stt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, partName, partCode, customerId, stt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPartResponseImplCopyWith<_$CustomerPartResponseImpl>
      get copyWith =>
          __$$CustomerPartResponseImplCopyWithImpl<_$CustomerPartResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPartResponseImplToJson(
      this,
    );
  }
}

abstract class _CustomerPartResponse implements CustomerPartResponse {
  const factory _CustomerPartResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'PartName') required final String partName,
      @JsonKey(name: 'PartCode') required final String partCode,
      @JsonKey(name: 'CustomerID') required final int customerId,
      @JsonKey(name: 'STT') final int? stt}) = _$CustomerPartResponseImpl;

  factory _CustomerPartResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerPartResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'PartName')
  String get partName;
  @override
  @JsonKey(name: 'PartCode')
  String get partCode;
  @override
  @JsonKey(name: 'CustomerID')
  int get customerId;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPartResponseImplCopyWith<_$CustomerPartResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TypeTeamSaleResponse _$TypeTeamSaleResponseFromJson(Map<String, dynamic> json) {
  return _TypeTeamSaleResponse.fromJson(json);
}

/// @nodoc
mixin _$TypeTeamSaleResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex')
  String get mainIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainGroup')
  int get mainGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'Goal0')
  double? get goal0 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result0')
  double? get result0 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ACCP0')
  double? get accp0 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Goal1')
  double? get goal1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result1')
  double? get result1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ACCP1')
  double? get accp1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Goal2')
  double? get goal2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result2')
  double? get result2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ACCP2')
  double? get accp2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ACCP')
  double? get accp => throw _privateConstructorUsedError;
  @JsonKey(name: 'Goal')
  double? get goal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  double? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConvertID')
  int? get convertId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex1')
  String? get mainIndex1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex2')
  String? get mainIndex2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeTeamSaleResponseCopyWith<TypeTeamSaleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeTeamSaleResponseCopyWith<$Res> {
  factory $TypeTeamSaleResponseCopyWith(TypeTeamSaleResponse value,
          $Res Function(TypeTeamSaleResponse) then) =
      _$TypeTeamSaleResponseCopyWithImpl<$Res, TypeTeamSaleResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MainIndex') String mainIndex,
      @JsonKey(name: 'MainGroup') int mainGroup,
      @JsonKey(name: 'Goal0') double? goal0,
      @JsonKey(name: 'Result0') double? result0,
      @JsonKey(name: 'ACCP0') double? accp0,
      @JsonKey(name: 'Goal1') double? goal1,
      @JsonKey(name: 'Result1') double? result1,
      @JsonKey(name: 'ACCP1') double? accp1,
      @JsonKey(name: 'Goal2') double? goal2,
      @JsonKey(name: 'Result2') double? result2,
      @JsonKey(name: 'ACCP2') double? accp2,
      @JsonKey(name: 'ACCP') double? accp,
      @JsonKey(name: 'Goal') double? goal,
      @JsonKey(name: 'Result') double? result,
      @JsonKey(name: 'ConvertID') int? convertId,
      @JsonKey(name: 'MainIndex1') String? mainIndex1,
      @JsonKey(name: 'MainIndex2') String? mainIndex2});
}

/// @nodoc
class _$TypeTeamSaleResponseCopyWithImpl<$Res,
        $Val extends TypeTeamSaleResponse>
    implements $TypeTeamSaleResponseCopyWith<$Res> {
  _$TypeTeamSaleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mainIndex = null,
    Object? mainGroup = null,
    Object? goal0 = freezed,
    Object? result0 = freezed,
    Object? accp0 = freezed,
    Object? goal1 = freezed,
    Object? result1 = freezed,
    Object? accp1 = freezed,
    Object? goal2 = freezed,
    Object? result2 = freezed,
    Object? accp2 = freezed,
    Object? accp = freezed,
    Object? goal = freezed,
    Object? result = freezed,
    Object? convertId = freezed,
    Object? mainIndex1 = freezed,
    Object? mainIndex2 = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mainIndex: null == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String,
      mainGroup: null == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int,
      goal0: freezed == goal0
          ? _value.goal0
          : goal0 // ignore: cast_nullable_to_non_nullable
              as double?,
      result0: freezed == result0
          ? _value.result0
          : result0 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp0: freezed == accp0
          ? _value.accp0
          : accp0 // ignore: cast_nullable_to_non_nullable
              as double?,
      goal1: freezed == goal1
          ? _value.goal1
          : goal1 // ignore: cast_nullable_to_non_nullable
              as double?,
      result1: freezed == result1
          ? _value.result1
          : result1 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp1: freezed == accp1
          ? _value.accp1
          : accp1 // ignore: cast_nullable_to_non_nullable
              as double?,
      goal2: freezed == goal2
          ? _value.goal2
          : goal2 // ignore: cast_nullable_to_non_nullable
              as double?,
      result2: freezed == result2
          ? _value.result2
          : result2 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp2: freezed == accp2
          ? _value.accp2
          : accp2 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp: freezed == accp
          ? _value.accp
          : accp // ignore: cast_nullable_to_non_nullable
              as double?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double?,
      convertId: freezed == convertId
          ? _value.convertId
          : convertId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex1: freezed == mainIndex1
          ? _value.mainIndex1
          : mainIndex1 // ignore: cast_nullable_to_non_nullable
              as String?,
      mainIndex2: freezed == mainIndex2
          ? _value.mainIndex2
          : mainIndex2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeTeamSaleResponseImplCopyWith<$Res>
    implements $TypeTeamSaleResponseCopyWith<$Res> {
  factory _$$TypeTeamSaleResponseImplCopyWith(_$TypeTeamSaleResponseImpl value,
          $Res Function(_$TypeTeamSaleResponseImpl) then) =
      __$$TypeTeamSaleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'MainIndex') String mainIndex,
      @JsonKey(name: 'MainGroup') int mainGroup,
      @JsonKey(name: 'Goal0') double? goal0,
      @JsonKey(name: 'Result0') double? result0,
      @JsonKey(name: 'ACCP0') double? accp0,
      @JsonKey(name: 'Goal1') double? goal1,
      @JsonKey(name: 'Result1') double? result1,
      @JsonKey(name: 'ACCP1') double? accp1,
      @JsonKey(name: 'Goal2') double? goal2,
      @JsonKey(name: 'Result2') double? result2,
      @JsonKey(name: 'ACCP2') double? accp2,
      @JsonKey(name: 'ACCP') double? accp,
      @JsonKey(name: 'Goal') double? goal,
      @JsonKey(name: 'Result') double? result,
      @JsonKey(name: 'ConvertID') int? convertId,
      @JsonKey(name: 'MainIndex1') String? mainIndex1,
      @JsonKey(name: 'MainIndex2') String? mainIndex2});
}

/// @nodoc
class __$$TypeTeamSaleResponseImplCopyWithImpl<$Res>
    extends _$TypeTeamSaleResponseCopyWithImpl<$Res, _$TypeTeamSaleResponseImpl>
    implements _$$TypeTeamSaleResponseImplCopyWith<$Res> {
  __$$TypeTeamSaleResponseImplCopyWithImpl(_$TypeTeamSaleResponseImpl _value,
      $Res Function(_$TypeTeamSaleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mainIndex = null,
    Object? mainGroup = null,
    Object? goal0 = freezed,
    Object? result0 = freezed,
    Object? accp0 = freezed,
    Object? goal1 = freezed,
    Object? result1 = freezed,
    Object? accp1 = freezed,
    Object? goal2 = freezed,
    Object? result2 = freezed,
    Object? accp2 = freezed,
    Object? accp = freezed,
    Object? goal = freezed,
    Object? result = freezed,
    Object? convertId = freezed,
    Object? mainIndex1 = freezed,
    Object? mainIndex2 = freezed,
  }) {
    return _then(_$TypeTeamSaleResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mainIndex: null == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String,
      mainGroup: null == mainGroup
          ? _value.mainGroup
          : mainGroup // ignore: cast_nullable_to_non_nullable
              as int,
      goal0: freezed == goal0
          ? _value.goal0
          : goal0 // ignore: cast_nullable_to_non_nullable
              as double?,
      result0: freezed == result0
          ? _value.result0
          : result0 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp0: freezed == accp0
          ? _value.accp0
          : accp0 // ignore: cast_nullable_to_non_nullable
              as double?,
      goal1: freezed == goal1
          ? _value.goal1
          : goal1 // ignore: cast_nullable_to_non_nullable
              as double?,
      result1: freezed == result1
          ? _value.result1
          : result1 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp1: freezed == accp1
          ? _value.accp1
          : accp1 // ignore: cast_nullable_to_non_nullable
              as double?,
      goal2: freezed == goal2
          ? _value.goal2
          : goal2 // ignore: cast_nullable_to_non_nullable
              as double?,
      result2: freezed == result2
          ? _value.result2
          : result2 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp2: freezed == accp2
          ? _value.accp2
          : accp2 // ignore: cast_nullable_to_non_nullable
              as double?,
      accp: freezed == accp
          ? _value.accp
          : accp // ignore: cast_nullable_to_non_nullable
              as double?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double?,
      convertId: freezed == convertId
          ? _value.convertId
          : convertId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex1: freezed == mainIndex1
          ? _value.mainIndex1
          : mainIndex1 // ignore: cast_nullable_to_non_nullable
              as String?,
      mainIndex2: freezed == mainIndex2
          ? _value.mainIndex2
          : mainIndex2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeTeamSaleResponseImpl implements _TypeTeamSaleResponse {
  const _$TypeTeamSaleResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'MainIndex') required this.mainIndex,
      @JsonKey(name: 'MainGroup') required this.mainGroup,
      @JsonKey(name: 'Goal0') this.goal0,
      @JsonKey(name: 'Result0') this.result0,
      @JsonKey(name: 'ACCP0') this.accp0,
      @JsonKey(name: 'Goal1') this.goal1,
      @JsonKey(name: 'Result1') this.result1,
      @JsonKey(name: 'ACCP1') this.accp1,
      @JsonKey(name: 'Goal2') this.goal2,
      @JsonKey(name: 'Result2') this.result2,
      @JsonKey(name: 'ACCP2') this.accp2,
      @JsonKey(name: 'ACCP') this.accp,
      @JsonKey(name: 'Goal') this.goal,
      @JsonKey(name: 'Result') this.result,
      @JsonKey(name: 'ConvertID') this.convertId,
      @JsonKey(name: 'MainIndex1') this.mainIndex1,
      @JsonKey(name: 'MainIndex2') this.mainIndex2});

  factory _$TypeTeamSaleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeTeamSaleResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'MainIndex')
  final String mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  final int mainGroup;
  @override
  @JsonKey(name: 'Goal0')
  final double? goal0;
  @override
  @JsonKey(name: 'Result0')
  final double? result0;
  @override
  @JsonKey(name: 'ACCP0')
  final double? accp0;
  @override
  @JsonKey(name: 'Goal1')
  final double? goal1;
  @override
  @JsonKey(name: 'Result1')
  final double? result1;
  @override
  @JsonKey(name: 'ACCP1')
  final double? accp1;
  @override
  @JsonKey(name: 'Goal2')
  final double? goal2;
  @override
  @JsonKey(name: 'Result2')
  final double? result2;
  @override
  @JsonKey(name: 'ACCP2')
  final double? accp2;
  @override
  @JsonKey(name: 'ACCP')
  final double? accp;
  @override
  @JsonKey(name: 'Goal')
  final double? goal;
  @override
  @JsonKey(name: 'Result')
  final double? result;
  @override
  @JsonKey(name: 'ConvertID')
  final int? convertId;
  @override
  @JsonKey(name: 'MainIndex1')
  final String? mainIndex1;
  @override
  @JsonKey(name: 'MainIndex2')
  final String? mainIndex2;

  @override
  String toString() {
    return 'TypeTeamSaleResponse(id: $id, mainIndex: $mainIndex, mainGroup: $mainGroup, goal0: $goal0, result0: $result0, accp0: $accp0, goal1: $goal1, result1: $result1, accp1: $accp1, goal2: $goal2, result2: $result2, accp2: $accp2, accp: $accp, goal: $goal, result: $result, convertId: $convertId, mainIndex1: $mainIndex1, mainIndex2: $mainIndex2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeTeamSaleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mainIndex, mainIndex) ||
                other.mainIndex == mainIndex) &&
            (identical(other.mainGroup, mainGroup) ||
                other.mainGroup == mainGroup) &&
            (identical(other.goal0, goal0) || other.goal0 == goal0) &&
            (identical(other.result0, result0) || other.result0 == result0) &&
            (identical(other.accp0, accp0) || other.accp0 == accp0) &&
            (identical(other.goal1, goal1) || other.goal1 == goal1) &&
            (identical(other.result1, result1) || other.result1 == result1) &&
            (identical(other.accp1, accp1) || other.accp1 == accp1) &&
            (identical(other.goal2, goal2) || other.goal2 == goal2) &&
            (identical(other.result2, result2) || other.result2 == result2) &&
            (identical(other.accp2, accp2) || other.accp2 == accp2) &&
            (identical(other.accp, accp) || other.accp == accp) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.convertId, convertId) ||
                other.convertId == convertId) &&
            (identical(other.mainIndex1, mainIndex1) ||
                other.mainIndex1 == mainIndex1) &&
            (identical(other.mainIndex2, mainIndex2) ||
                other.mainIndex2 == mainIndex2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mainIndex,
      mainGroup,
      goal0,
      result0,
      accp0,
      goal1,
      result1,
      accp1,
      goal2,
      result2,
      accp2,
      accp,
      goal,
      result,
      convertId,
      mainIndex1,
      mainIndex2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeTeamSaleResponseImplCopyWith<_$TypeTeamSaleResponseImpl>
      get copyWith =>
          __$$TypeTeamSaleResponseImplCopyWithImpl<_$TypeTeamSaleResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeTeamSaleResponseImplToJson(
      this,
    );
  }
}

abstract class _TypeTeamSaleResponse implements TypeTeamSaleResponse {
  const factory _TypeTeamSaleResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'MainIndex') required final String mainIndex,
          @JsonKey(name: 'MainGroup') required final int mainGroup,
          @JsonKey(name: 'Goal0') final double? goal0,
          @JsonKey(name: 'Result0') final double? result0,
          @JsonKey(name: 'ACCP0') final double? accp0,
          @JsonKey(name: 'Goal1') final double? goal1,
          @JsonKey(name: 'Result1') final double? result1,
          @JsonKey(name: 'ACCP1') final double? accp1,
          @JsonKey(name: 'Goal2') final double? goal2,
          @JsonKey(name: 'Result2') final double? result2,
          @JsonKey(name: 'ACCP2') final double? accp2,
          @JsonKey(name: 'ACCP') final double? accp,
          @JsonKey(name: 'Goal') final double? goal,
          @JsonKey(name: 'Result') final double? result,
          @JsonKey(name: 'ConvertID') final int? convertId,
          @JsonKey(name: 'MainIndex1') final String? mainIndex1,
          @JsonKey(name: 'MainIndex2') final String? mainIndex2}) =
      _$TypeTeamSaleResponseImpl;

  factory _TypeTeamSaleResponse.fromJson(Map<String, dynamic> json) =
      _$TypeTeamSaleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'MainIndex')
  String get mainIndex;
  @override
  @JsonKey(name: 'MainGroup')
  int get mainGroup;
  @override
  @JsonKey(name: 'Goal0')
  double? get goal0;
  @override
  @JsonKey(name: 'Result0')
  double? get result0;
  @override
  @JsonKey(name: 'ACCP0')
  double? get accp0;
  @override
  @JsonKey(name: 'Goal1')
  double? get goal1;
  @override
  @JsonKey(name: 'Result1')
  double? get result1;
  @override
  @JsonKey(name: 'ACCP1')
  double? get accp1;
  @override
  @JsonKey(name: 'Goal2')
  double? get goal2;
  @override
  @JsonKey(name: 'Result2')
  double? get result2;
  @override
  @JsonKey(name: 'ACCP2')
  double? get accp2;
  @override
  @JsonKey(name: 'ACCP')
  double? get accp;
  @override
  @JsonKey(name: 'Goal')
  double? get goal;
  @override
  @JsonKey(name: 'Result')
  double? get result;
  @override
  @JsonKey(name: 'ConvertID')
  int? get convertId;
  @override
  @JsonKey(name: 'MainIndex1')
  String? get mainIndex1;
  @override
  @JsonKey(name: 'MainIndex2')
  String? get mainIndex2;
  @override
  @JsonKey(ignore: true)
  _$$TypeTeamSaleResponseImplCopyWith<_$TypeTeamSaleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return _CustomerResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerCode')
  String get customerCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerResponseCopyWith<CustomerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerResponseCopyWith<$Res> {
  factory $CustomerResponseCopyWith(
          CustomerResponse value, $Res Function(CustomerResponse) then) =
      _$CustomerResponseCopyWithImpl<$Res, CustomerResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerName') String customerName,
      @JsonKey(name: 'CustomerCode') String customerCode});
}

/// @nodoc
class _$CustomerResponseCopyWithImpl<$Res, $Val extends CustomerResponse>
    implements $CustomerResponseCopyWith<$Res> {
  _$CustomerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerResponseImplCopyWith<$Res>
    implements $CustomerResponseCopyWith<$Res> {
  factory _$$CustomerResponseImplCopyWith(_$CustomerResponseImpl value,
          $Res Function(_$CustomerResponseImpl) then) =
      __$$CustomerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerName') String customerName,
      @JsonKey(name: 'CustomerCode') String customerCode});
}

/// @nodoc
class __$$CustomerResponseImplCopyWithImpl<$Res>
    extends _$CustomerResponseCopyWithImpl<$Res, _$CustomerResponseImpl>
    implements _$$CustomerResponseImplCopyWith<$Res> {
  __$$CustomerResponseImplCopyWithImpl(_$CustomerResponseImpl _value,
      $Res Function(_$CustomerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerName = null,
    Object? customerCode = null,
  }) {
    return _then(_$CustomerResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerResponseImpl implements _CustomerResponse {
  const _$CustomerResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerName') required this.customerName,
      @JsonKey(name: 'CustomerCode') required this.customerCode});

  factory _$CustomerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerName')
  final String customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  final String customerCode;

  @override
  String toString() {
    return 'CustomerResponse(id: $id, customerName: $customerName, customerCode: $customerCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, customerName, customerCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerResponseImplCopyWith<_$CustomerResponseImpl> get copyWith =>
      __$$CustomerResponseImplCopyWithImpl<_$CustomerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerResponseImplToJson(
      this,
    );
  }
}

abstract class _CustomerResponse implements CustomerResponse {
  const factory _CustomerResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerName') required final String customerName,
          @JsonKey(name: 'CustomerCode') required final String customerCode}) =
      _$CustomerResponseImpl;

  factory _CustomerResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerName')
  String get customerName;
  @override
  @JsonKey(name: 'CustomerCode')
  String get customerCode;
  @override
  @JsonKey(ignore: true)
  _$$CustomerResponseImplCopyWith<_$CustomerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FirmBaseResponse _$FirmBaseResponseFromJson(Map<String, dynamic> json) {
  return _FirmBaseResponse.fromJson(json);
}

/// @nodoc
mixin _$FirmBaseResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmCode')
  String get firmCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmName')
  String get firmName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirmBaseResponseCopyWith<FirmBaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirmBaseResponseCopyWith<$Res> {
  factory $FirmBaseResponseCopyWith(
          FirmBaseResponse value, $Res Function(FirmBaseResponse) then) =
      _$FirmBaseResponseCopyWithImpl<$Res, FirmBaseResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FirmCode') String firmCode,
      @JsonKey(name: 'FirmName') String firmName});
}

/// @nodoc
class _$FirmBaseResponseCopyWithImpl<$Res, $Val extends FirmBaseResponse>
    implements $FirmBaseResponseCopyWith<$Res> {
  _$FirmBaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firmCode = null,
    Object? firmName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firmCode: null == firmCode
          ? _value.firmCode
          : firmCode // ignore: cast_nullable_to_non_nullable
              as String,
      firmName: null == firmName
          ? _value.firmName
          : firmName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirmBaseResponseImplCopyWith<$Res>
    implements $FirmBaseResponseCopyWith<$Res> {
  factory _$$FirmBaseResponseImplCopyWith(_$FirmBaseResponseImpl value,
          $Res Function(_$FirmBaseResponseImpl) then) =
      __$$FirmBaseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'FirmCode') String firmCode,
      @JsonKey(name: 'FirmName') String firmName});
}

/// @nodoc
class __$$FirmBaseResponseImplCopyWithImpl<$Res>
    extends _$FirmBaseResponseCopyWithImpl<$Res, _$FirmBaseResponseImpl>
    implements _$$FirmBaseResponseImplCopyWith<$Res> {
  __$$FirmBaseResponseImplCopyWithImpl(_$FirmBaseResponseImpl _value,
      $Res Function(_$FirmBaseResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firmCode = null,
    Object? firmName = null,
  }) {
    return _then(_$FirmBaseResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firmCode: null == firmCode
          ? _value.firmCode
          : firmCode // ignore: cast_nullable_to_non_nullable
              as String,
      firmName: null == firmName
          ? _value.firmName
          : firmName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirmBaseResponseImpl implements _FirmBaseResponse {
  const _$FirmBaseResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'FirmCode') required this.firmCode,
      @JsonKey(name: 'FirmName') required this.firmName});

  factory _$FirmBaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirmBaseResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'FirmCode')
  final String firmCode;
  @override
  @JsonKey(name: 'FirmName')
  final String firmName;

  @override
  String toString() {
    return 'FirmBaseResponse(id: $id, firmCode: $firmCode, firmName: $firmName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirmBaseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firmCode, firmCode) ||
                other.firmCode == firmCode) &&
            (identical(other.firmName, firmName) ||
                other.firmName == firmName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firmCode, firmName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirmBaseResponseImplCopyWith<_$FirmBaseResponseImpl> get copyWith =>
      __$$FirmBaseResponseImplCopyWithImpl<_$FirmBaseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirmBaseResponseImplToJson(
      this,
    );
  }
}

abstract class _FirmBaseResponse implements FirmBaseResponse {
  const factory _FirmBaseResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'FirmCode') required final String firmCode,
          @JsonKey(name: 'FirmName') required final String firmName}) =
      _$FirmBaseResponseImpl;

  factory _FirmBaseResponse.fromJson(Map<String, dynamic> json) =
      _$FirmBaseResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'FirmCode')
  String get firmCode;
  @override
  @JsonKey(name: 'FirmName')
  String get firmName;
  @override
  @JsonKey(ignore: true)
  _$$FirmBaseResponseImplCopyWith<_$FirmBaseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeProjectResponse _$TypeProjectResponseFromJson(Map<String, dynamic> json) {
  return _TypeProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$TypeProjectResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeCode')
  String get projectTypeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeName')
  String get projectTypeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeProjectResponseCopyWith<TypeProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeProjectResponseCopyWith<$Res> {
  factory $TypeProjectResponseCopyWith(
          TypeProjectResponse value, $Res Function(TypeProjectResponse) then) =
      _$TypeProjectResponseCopyWithImpl<$Res, TypeProjectResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'ProjectTypeCode') String projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') String projectTypeName});
}

/// @nodoc
class _$TypeProjectResponseCopyWithImpl<$Res, $Val extends TypeProjectResponse>
    implements $TypeProjectResponseCopyWith<$Res> {
  _$TypeProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectTypeCode = null,
    Object? projectTypeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectTypeCode: null == projectTypeCode
          ? _value.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeName: null == projectTypeName
          ? _value.projectTypeName
          : projectTypeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeProjectResponseImplCopyWith<$Res>
    implements $TypeProjectResponseCopyWith<$Res> {
  factory _$$TypeProjectResponseImplCopyWith(_$TypeProjectResponseImpl value,
          $Res Function(_$TypeProjectResponseImpl) then) =
      __$$TypeProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'ProjectTypeCode') String projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') String projectTypeName});
}

/// @nodoc
class __$$TypeProjectResponseImplCopyWithImpl<$Res>
    extends _$TypeProjectResponseCopyWithImpl<$Res, _$TypeProjectResponseImpl>
    implements _$$TypeProjectResponseImplCopyWith<$Res> {
  __$$TypeProjectResponseImplCopyWithImpl(_$TypeProjectResponseImpl _value,
      $Res Function(_$TypeProjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectTypeCode = null,
    Object? projectTypeName = null,
  }) {
    return _then(_$TypeProjectResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectTypeCode: null == projectTypeCode
          ? _value.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      projectTypeName: null == projectTypeName
          ? _value.projectTypeName
          : projectTypeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeProjectResponseImpl implements _TypeProjectResponse {
  const _$TypeProjectResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'ProjectTypeCode') required this.projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') required this.projectTypeName});

  factory _$TypeProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeProjectResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  final String projectTypeCode;
  @override
  @JsonKey(name: 'ProjectTypeName')
  final String projectTypeName;

  @override
  String toString() {
    return 'TypeProjectResponse(id: $id, projectTypeCode: $projectTypeCode, projectTypeName: $projectTypeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeProjectResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectTypeCode, projectTypeCode) ||
                other.projectTypeCode == projectTypeCode) &&
            (identical(other.projectTypeName, projectTypeName) ||
                other.projectTypeName == projectTypeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, projectTypeCode, projectTypeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeProjectResponseImplCopyWith<_$TypeProjectResponseImpl> get copyWith =>
      __$$TypeProjectResponseImplCopyWithImpl<_$TypeProjectResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeProjectResponseImplToJson(
      this,
    );
  }
}

abstract class _TypeProjectResponse implements TypeProjectResponse {
  const factory _TypeProjectResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'ProjectTypeCode') required final String projectTypeCode,
      @JsonKey(name: 'ProjectTypeName')
      required final String projectTypeName}) = _$TypeProjectResponseImpl;

  factory _TypeProjectResponse.fromJson(Map<String, dynamic> json) =
      _$TypeProjectResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  String get projectTypeCode;
  @override
  @JsonKey(name: 'ProjectTypeName')
  String get projectTypeName;
  @override
  @JsonKey(ignore: true)
  _$$TypeProjectResponseImplCopyWith<_$TypeProjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusProjectResponse _$StatusProjectResponseFromJson(
    Map<String, dynamic> json) {
  return _StatusProjectResponse.fromJson(json);
}

/// @nodoc
mixin _$StatusProjectResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusName')
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int? get stt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusProjectResponseCopyWith<StatusProjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusProjectResponseCopyWith<$Res> {
  factory $StatusProjectResponseCopyWith(StatusProjectResponse value,
          $Res Function(StatusProjectResponse) then) =
      _$StatusProjectResponseCopyWithImpl<$Res, StatusProjectResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'StatusName') String? statusName,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class _$StatusProjectResponseCopyWithImpl<$Res,
        $Val extends StatusProjectResponse>
    implements $StatusProjectResponseCopyWith<$Res> {
  _$StatusProjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? statusName = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? stt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusProjectResponseImplCopyWith<$Res>
    implements $StatusProjectResponseCopyWith<$Res> {
  factory _$$StatusProjectResponseImplCopyWith(
          _$StatusProjectResponseImpl value,
          $Res Function(_$StatusProjectResponseImpl) then) =
      __$$StatusProjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'StatusName') String? statusName,
      @JsonKey(name: 'CreatedDate') String? createdDate,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'UpdatedDate') String? updatedDate,
      @JsonKey(name: 'UpdatedBy') String? updatedBy,
      @JsonKey(name: 'STT') int? stt});
}

/// @nodoc
class __$$StatusProjectResponseImplCopyWithImpl<$Res>
    extends _$StatusProjectResponseCopyWithImpl<$Res,
        _$StatusProjectResponseImpl>
    implements _$$StatusProjectResponseImplCopyWith<$Res> {
  __$$StatusProjectResponseImplCopyWithImpl(_$StatusProjectResponseImpl _value,
      $Res Function(_$StatusProjectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? statusName = freezed,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? updatedDate = freezed,
    Object? updatedBy = freezed,
    Object? stt = freezed,
  }) {
    return _then(_$StatusProjectResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      stt: freezed == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusProjectResponseImpl implements _StatusProjectResponse {
  const _$StatusProjectResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'StatusName') this.statusName,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'STT') this.stt});

  factory _$StatusProjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusProjectResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'StatusName')
  final String? statusName;
  @override
  @JsonKey(name: 'CreatedDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'STT')
  final int? stt;

  @override
  String toString() {
    return 'StatusProjectResponse(id: $id, statusName: $statusName, createdDate: $createdDate, createdBy: $createdBy, updatedDate: $updatedDate, updatedBy: $updatedBy, stt: $stt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusProjectResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.stt, stt) || other.stt == stt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, statusName, createdDate,
      createdBy, updatedDate, updatedBy, stt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusProjectResponseImplCopyWith<_$StatusProjectResponseImpl>
      get copyWith => __$$StatusProjectResponseImplCopyWithImpl<
          _$StatusProjectResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusProjectResponseImplToJson(
      this,
    );
  }
}

abstract class _StatusProjectResponse implements StatusProjectResponse {
  const factory _StatusProjectResponse(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'StatusName') final String? statusName,
      @JsonKey(name: 'CreatedDate') final String? createdDate,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'UpdatedDate') final String? updatedDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'STT') final int? stt}) = _$StatusProjectResponseImpl;

  factory _StatusProjectResponse.fromJson(Map<String, dynamic> json) =
      _$StatusProjectResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'StatusName')
  String? get statusName;
  @override
  @JsonKey(name: 'CreatedDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  String? get updatedDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'STT')
  int? get stt;
  @override
  @JsonKey(ignore: true)
  _$$StatusProjectResponseImplCopyWith<_$StatusProjectResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerContactResponse _$CustomerContactResponseFromJson(
    Map<String, dynamic> json) {
  return _CustomerContactResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerContactResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  String get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerTeam')
  String? get customerTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerPart')
  String? get customerPart => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerPosition')
  String? get customerPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerContactResponseCopyWith<CustomerContactResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerContactResponseCopyWith<$Res> {
  factory $CustomerContactResponseCopyWith(CustomerContactResponse value,
          $Res Function(CustomerContactResponse) then) =
      _$CustomerContactResponseCopyWithImpl<$Res, CustomerContactResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'ContactName') String contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CustomerTeam') String? customerTeam,
      @JsonKey(name: 'CustomerPart') String? customerPart,
      @JsonKey(name: 'CustomerPosition') String? customerPosition,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$CustomerContactResponseCopyWithImpl<$Res,
        $Val extends CustomerContactResponse>
    implements $CustomerContactResponseCopyWith<$Res> {
  _$CustomerContactResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? contactName = null,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? createdDate = null,
    Object? customerTeam = freezed,
    Object? customerPart = freezed,
    Object? customerPosition = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerContactResponseImplCopyWith<$Res>
    implements $CustomerContactResponseCopyWith<$Res> {
  factory _$$CustomerContactResponseImplCopyWith(
          _$CustomerContactResponseImpl value,
          $Res Function(_$CustomerContactResponseImpl) then) =
      __$$CustomerContactResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'ContactName') String contactName,
      @JsonKey(name: 'ContactPhone') String? contactPhone,
      @JsonKey(name: 'ContactEmail') String? contactEmail,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CustomerTeam') String? customerTeam,
      @JsonKey(name: 'CustomerPart') String? customerPart,
      @JsonKey(name: 'CustomerPosition') String? customerPosition,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$CustomerContactResponseImplCopyWithImpl<$Res>
    extends _$CustomerContactResponseCopyWithImpl<$Res,
        _$CustomerContactResponseImpl>
    implements _$$CustomerContactResponseImplCopyWith<$Res> {
  __$$CustomerContactResponseImplCopyWithImpl(
      _$CustomerContactResponseImpl _value,
      $Res Function(_$CustomerContactResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? contactName = null,
    Object? contactPhone = freezed,
    Object? contactEmail = freezed,
    Object? createdDate = null,
    Object? customerTeam = freezed,
    Object? customerPart = freezed,
    Object? customerPosition = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$CustomerContactResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerContactResponseImpl implements _CustomerContactResponse {
  const _$CustomerContactResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerID') required this.customerId,
      @JsonKey(name: 'ContactName') required this.contactName,
      @JsonKey(name: 'ContactPhone') this.contactPhone,
      @JsonKey(name: 'ContactEmail') this.contactEmail,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'CustomerTeam') this.customerTeam,
      @JsonKey(name: 'CustomerPart') this.customerPart,
      @JsonKey(name: 'CustomerPosition') this.customerPosition,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$CustomerContactResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerContactResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerID')
  final int customerId;
  @override
  @JsonKey(name: 'ContactName')
  final String contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  final String? contactEmail;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
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
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'CustomerContactResponse(id: $id, customerId: $customerId, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, createdDate: $createdDate, customerTeam: $customerTeam, customerPart: $customerPart, customerPosition: $customerPosition, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerContactResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.customerTeam, customerTeam) ||
                other.customerTeam == customerTeam) &&
            (identical(other.customerPart, customerPart) ||
                other.customerPart == customerPart) &&
            (identical(other.customerPosition, customerPosition) ||
                other.customerPosition == customerPosition) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      contactName,
      contactPhone,
      contactEmail,
      createdDate,
      customerTeam,
      customerPart,
      customerPosition,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerContactResponseImplCopyWith<_$CustomerContactResponseImpl>
      get copyWith => __$$CustomerContactResponseImplCopyWithImpl<
          _$CustomerContactResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerContactResponseImplToJson(
      this,
    );
  }
}

abstract class _CustomerContactResponse implements CustomerContactResponse {
  const factory _CustomerContactResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerID') required final int customerId,
          @JsonKey(name: 'ContactName') required final String contactName,
          @JsonKey(name: 'ContactPhone') final String? contactPhone,
          @JsonKey(name: 'ContactEmail') final String? contactEmail,
          @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
          @JsonKey(name: 'CustomerTeam') final String? customerTeam,
          @JsonKey(name: 'CustomerPart') final String? customerPart,
          @JsonKey(name: 'CustomerPosition') final String? customerPosition,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$CustomerContactResponseImpl;

  factory _CustomerContactResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerContactResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerID')
  int get customerId;
  @override
  @JsonKey(name: 'ContactName')
  String get contactName;
  @override
  @JsonKey(name: 'ContactPhone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'ContactEmail')
  String? get contactEmail;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
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
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$CustomerContactResponseImplCopyWith<_$CustomerContactResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaleRequest _$SaleRequestFromJson(Map<String, dynamic> json) {
  return _SaleRequest.fromJson(json);
}

/// @nodoc
mixin _$SaleRequest {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectId')
  int get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerId')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouseId')
  String get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectStatusBaseId')
  int get projectStatusBaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateEnd')
  DateTime get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'firmId')
  int get firmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectTypeId')
  int get projectTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contactId')
  int get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupTypeId')
  int get groupTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'partId')
  int? get partId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bigAccount')
  bool get bigAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'saleOpportunity')
  bool get saleOpportunity => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  String get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'problemBacklog')
  String get problemBacklog => throw _privateConstructorUsedError;
  @JsonKey(name: 'planNext')
  String get planNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'productOfCustomer')
  String get productOfCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectStatusOld')
  int get projectStatusOld => throw _privateConstructorUsedError;
  @JsonKey(name: 'employeeId')
  int get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateStatusLog')
  DateTime get dateStatusLog => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleRequestCopyWith<SaleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleRequestCopyWith<$Res> {
  factory $SaleRequestCopyWith(
          SaleRequest value, $Res Function(SaleRequest) then) =
      _$SaleRequestCopyWithImpl<$Res, SaleRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'projectId') int projectId,
      @JsonKey(name: 'customerId') int customerId,
      @JsonKey(name: 'warehouseId') String warehouseId,
      @JsonKey(name: 'projectStatusBaseId') int projectStatusBaseId,
      @JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'dateStart') DateTime dateStart,
      @JsonKey(name: 'dateEnd') DateTime dateEnd,
      @JsonKey(name: 'firmId') int firmId,
      @JsonKey(name: 'projectTypeId') int projectTypeId,
      @JsonKey(name: 'contactId') int contactId,
      @JsonKey(name: 'groupTypeId') int groupTypeId,
      @JsonKey(name: 'partId') int? partId,
      @JsonKey(name: 'bigAccount') bool bigAccount,
      @JsonKey(name: 'saleOpportunity') bool saleOpportunity,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'result') String result,
      @JsonKey(name: 'problemBacklog') String problemBacklog,
      @JsonKey(name: 'planNext') String planNext,
      @JsonKey(name: 'productOfCustomer') String productOfCustomer,
      @JsonKey(name: 'projectStatusOld') int projectStatusOld,
      @JsonKey(name: 'employeeId') int employeeId,
      @JsonKey(name: 'dateStatusLog') DateTime dateStatusLog});
}

/// @nodoc
class _$SaleRequestCopyWithImpl<$Res, $Val extends SaleRequest>
    implements $SaleRequestCopyWith<$Res> {
  _$SaleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? customerId = null,
    Object? warehouseId = null,
    Object? projectStatusBaseId = null,
    Object? userId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? firmId = null,
    Object? projectTypeId = null,
    Object? contactId = null,
    Object? groupTypeId = null,
    Object? partId = freezed,
    Object? bigAccount = null,
    Object? saleOpportunity = null,
    Object? content = null,
    Object? result = null,
    Object? problemBacklog = null,
    Object? planNext = null,
    Object? productOfCustomer = null,
    Object? projectStatusOld = null,
    Object? employeeId = null,
    Object? dateStatusLog = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatusBaseId: null == projectStatusBaseId
          ? _value.projectStatusBaseId
          : projectStatusBaseId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmId: null == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int,
      projectTypeId: null == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      groupTypeId: null == groupTypeId
          ? _value.groupTypeId
          : groupTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      partId: freezed == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int?,
      bigAccount: null == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      saleOpportunity: null == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      problemBacklog: null == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String,
      planNext: null == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String,
      productOfCustomer: null == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatusOld: null == projectStatusOld
          ? _value.projectStatusOld
          : projectStatusOld // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStatusLog: null == dateStatusLog
          ? _value.dateStatusLog
          : dateStatusLog // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleRequestImplCopyWith<$Res>
    implements $SaleRequestCopyWith<$Res> {
  factory _$$SaleRequestImplCopyWith(
          _$SaleRequestImpl value, $Res Function(_$SaleRequestImpl) then) =
      __$$SaleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'projectId') int projectId,
      @JsonKey(name: 'customerId') int customerId,
      @JsonKey(name: 'warehouseId') String warehouseId,
      @JsonKey(name: 'projectStatusBaseId') int projectStatusBaseId,
      @JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'dateStart') DateTime dateStart,
      @JsonKey(name: 'dateEnd') DateTime dateEnd,
      @JsonKey(name: 'firmId') int firmId,
      @JsonKey(name: 'projectTypeId') int projectTypeId,
      @JsonKey(name: 'contactId') int contactId,
      @JsonKey(name: 'groupTypeId') int groupTypeId,
      @JsonKey(name: 'partId') int? partId,
      @JsonKey(name: 'bigAccount') bool bigAccount,
      @JsonKey(name: 'saleOpportunity') bool saleOpportunity,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'result') String result,
      @JsonKey(name: 'problemBacklog') String problemBacklog,
      @JsonKey(name: 'planNext') String planNext,
      @JsonKey(name: 'productOfCustomer') String productOfCustomer,
      @JsonKey(name: 'projectStatusOld') int projectStatusOld,
      @JsonKey(name: 'employeeId') int employeeId,
      @JsonKey(name: 'dateStatusLog') DateTime dateStatusLog});
}

/// @nodoc
class __$$SaleRequestImplCopyWithImpl<$Res>
    extends _$SaleRequestCopyWithImpl<$Res, _$SaleRequestImpl>
    implements _$$SaleRequestImplCopyWith<$Res> {
  __$$SaleRequestImplCopyWithImpl(
      _$SaleRequestImpl _value, $Res Function(_$SaleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? customerId = null,
    Object? warehouseId = null,
    Object? projectStatusBaseId = null,
    Object? userId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? firmId = null,
    Object? projectTypeId = null,
    Object? contactId = null,
    Object? groupTypeId = null,
    Object? partId = freezed,
    Object? bigAccount = null,
    Object? saleOpportunity = null,
    Object? content = null,
    Object? result = null,
    Object? problemBacklog = null,
    Object? planNext = null,
    Object? productOfCustomer = null,
    Object? projectStatusOld = null,
    Object? employeeId = null,
    Object? dateStatusLog = null,
  }) {
    return _then(_$SaleRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatusBaseId: null == projectStatusBaseId
          ? _value.projectStatusBaseId
          : projectStatusBaseId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmId: null == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int,
      projectTypeId: null == projectTypeId
          ? _value.projectTypeId
          : projectTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      groupTypeId: null == groupTypeId
          ? _value.groupTypeId
          : groupTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      partId: freezed == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as int?,
      bigAccount: null == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      saleOpportunity: null == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      problemBacklog: null == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String,
      planNext: null == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String,
      productOfCustomer: null == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      projectStatusOld: null == projectStatusOld
          ? _value.projectStatusOld
          : projectStatusOld // ignore: cast_nullable_to_non_nullable
              as int,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStatusLog: null == dateStatusLog
          ? _value.dateStatusLog
          : dateStatusLog // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleRequestImpl implements _SaleRequest {
  const _$SaleRequestImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'projectId') required this.projectId,
      @JsonKey(name: 'customerId') required this.customerId,
      @JsonKey(name: 'warehouseId') required this.warehouseId,
      @JsonKey(name: 'projectStatusBaseId') required this.projectStatusBaseId,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'dateStart') required this.dateStart,
      @JsonKey(name: 'dateEnd') required this.dateEnd,
      @JsonKey(name: 'firmId') required this.firmId,
      @JsonKey(name: 'projectTypeId') required this.projectTypeId,
      @JsonKey(name: 'contactId') required this.contactId,
      @JsonKey(name: 'groupTypeId') required this.groupTypeId,
      @JsonKey(name: 'partId') this.partId,
      @JsonKey(name: 'bigAccount') required this.bigAccount,
      @JsonKey(name: 'saleOpportunity') required this.saleOpportunity,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'result') required this.result,
      @JsonKey(name: 'problemBacklog') required this.problemBacklog,
      @JsonKey(name: 'planNext') required this.planNext,
      @JsonKey(name: 'productOfCustomer') required this.productOfCustomer,
      @JsonKey(name: 'projectStatusOld') required this.projectStatusOld,
      @JsonKey(name: 'employeeId') required this.employeeId,
      @JsonKey(name: 'dateStatusLog') required this.dateStatusLog});

  factory _$SaleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'projectId')
  final int projectId;
  @override
  @JsonKey(name: 'customerId')
  final int customerId;
  @override
  @JsonKey(name: 'warehouseId')
  final String warehouseId;
  @override
  @JsonKey(name: 'projectStatusBaseId')
  final int projectStatusBaseId;
  @override
  @JsonKey(name: 'userId')
  final int userId;
  @override
  @JsonKey(name: 'dateStart')
  final DateTime dateStart;
  @override
  @JsonKey(name: 'dateEnd')
  final DateTime dateEnd;
  @override
  @JsonKey(name: 'firmId')
  final int firmId;
  @override
  @JsonKey(name: 'projectTypeId')
  final int projectTypeId;
  @override
  @JsonKey(name: 'contactId')
  final int contactId;
  @override
  @JsonKey(name: 'groupTypeId')
  final int groupTypeId;
  @override
  @JsonKey(name: 'partId')
  final int? partId;
  @override
  @JsonKey(name: 'bigAccount')
  final bool bigAccount;
  @override
  @JsonKey(name: 'saleOpportunity')
  final bool saleOpportunity;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'result')
  final String result;
  @override
  @JsonKey(name: 'problemBacklog')
  final String problemBacklog;
  @override
  @JsonKey(name: 'planNext')
  final String planNext;
  @override
  @JsonKey(name: 'productOfCustomer')
  final String productOfCustomer;
  @override
  @JsonKey(name: 'projectStatusOld')
  final int projectStatusOld;
  @override
  @JsonKey(name: 'employeeId')
  final int employeeId;
  @override
  @JsonKey(name: 'dateStatusLog')
  final DateTime dateStatusLog;

  @override
  String toString() {
    return 'SaleRequest(id: $id, projectId: $projectId, customerId: $customerId, warehouseId: $warehouseId, projectStatusBaseId: $projectStatusBaseId, userId: $userId, dateStart: $dateStart, dateEnd: $dateEnd, firmId: $firmId, projectTypeId: $projectTypeId, contactId: $contactId, groupTypeId: $groupTypeId, partId: $partId, bigAccount: $bigAccount, saleOpportunity: $saleOpportunity, content: $content, result: $result, problemBacklog: $problemBacklog, planNext: $planNext, productOfCustomer: $productOfCustomer, projectStatusOld: $projectStatusOld, employeeId: $employeeId, dateStatusLog: $dateStatusLog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.projectStatusBaseId, projectStatusBaseId) ||
                other.projectStatusBaseId == projectStatusBaseId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.firmId, firmId) || other.firmId == firmId) &&
            (identical(other.projectTypeId, projectTypeId) ||
                other.projectTypeId == projectTypeId) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.groupTypeId, groupTypeId) ||
                other.groupTypeId == groupTypeId) &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.bigAccount, bigAccount) ||
                other.bigAccount == bigAccount) &&
            (identical(other.saleOpportunity, saleOpportunity) ||
                other.saleOpportunity == saleOpportunity) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.problemBacklog, problemBacklog) ||
                other.problemBacklog == problemBacklog) &&
            (identical(other.planNext, planNext) ||
                other.planNext == planNext) &&
            (identical(other.productOfCustomer, productOfCustomer) ||
                other.productOfCustomer == productOfCustomer) &&
            (identical(other.projectStatusOld, projectStatusOld) ||
                other.projectStatusOld == projectStatusOld) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.dateStatusLog, dateStatusLog) ||
                other.dateStatusLog == dateStatusLog));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        projectId,
        customerId,
        warehouseId,
        projectStatusBaseId,
        userId,
        dateStart,
        dateEnd,
        firmId,
        projectTypeId,
        contactId,
        groupTypeId,
        partId,
        bigAccount,
        saleOpportunity,
        content,
        result,
        problemBacklog,
        planNext,
        productOfCustomer,
        projectStatusOld,
        employeeId,
        dateStatusLog
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleRequestImplCopyWith<_$SaleRequestImpl> get copyWith =>
      __$$SaleRequestImplCopyWithImpl<_$SaleRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleRequestImplToJson(
      this,
    );
  }
}

abstract class _SaleRequest implements SaleRequest {
  const factory _SaleRequest(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'projectId') required final int projectId,
      @JsonKey(name: 'customerId') required final int customerId,
      @JsonKey(name: 'warehouseId') required final String warehouseId,
      @JsonKey(name: 'projectStatusBaseId')
      required final int projectStatusBaseId,
      @JsonKey(name: 'userId') required final int userId,
      @JsonKey(name: 'dateStart') required final DateTime dateStart,
      @JsonKey(name: 'dateEnd') required final DateTime dateEnd,
      @JsonKey(name: 'firmId') required final int firmId,
      @JsonKey(name: 'projectTypeId') required final int projectTypeId,
      @JsonKey(name: 'contactId') required final int contactId,
      @JsonKey(name: 'groupTypeId') required final int groupTypeId,
      @JsonKey(name: 'partId') final int? partId,
      @JsonKey(name: 'bigAccount') required final bool bigAccount,
      @JsonKey(name: 'saleOpportunity') required final bool saleOpportunity,
      @JsonKey(name: 'content') required final String content,
      @JsonKey(name: 'result') required final String result,
      @JsonKey(name: 'problemBacklog') required final String problemBacklog,
      @JsonKey(name: 'planNext') required final String planNext,
      @JsonKey(name: 'productOfCustomer')
      required final String productOfCustomer,
      @JsonKey(name: 'projectStatusOld') required final int projectStatusOld,
      @JsonKey(name: 'employeeId') required final int employeeId,
      @JsonKey(name: 'dateStatusLog')
      required final DateTime dateStatusLog}) = _$SaleRequestImpl;

  factory _SaleRequest.fromJson(Map<String, dynamic> json) =
      _$SaleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'projectId')
  int get projectId;
  @override
  @JsonKey(name: 'customerId')
  int get customerId;
  @override
  @JsonKey(name: 'warehouseId')
  String get warehouseId;
  @override
  @JsonKey(name: 'projectStatusBaseId')
  int get projectStatusBaseId;
  @override
  @JsonKey(name: 'userId')
  int get userId;
  @override
  @JsonKey(name: 'dateStart')
  DateTime get dateStart;
  @override
  @JsonKey(name: 'dateEnd')
  DateTime get dateEnd;
  @override
  @JsonKey(name: 'firmId')
  int get firmId;
  @override
  @JsonKey(name: 'projectTypeId')
  int get projectTypeId;
  @override
  @JsonKey(name: 'contactId')
  int get contactId;
  @override
  @JsonKey(name: 'groupTypeId')
  int get groupTypeId;
  @override
  @JsonKey(name: 'partId')
  int? get partId;
  @override
  @JsonKey(name: 'bigAccount')
  bool get bigAccount;
  @override
  @JsonKey(name: 'saleOpportunity')
  bool get saleOpportunity;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'result')
  String get result;
  @override
  @JsonKey(name: 'problemBacklog')
  String get problemBacklog;
  @override
  @JsonKey(name: 'planNext')
  String get planNext;
  @override
  @JsonKey(name: 'productOfCustomer')
  String get productOfCustomer;
  @override
  @JsonKey(name: 'projectStatusOld')
  int get projectStatusOld;
  @override
  @JsonKey(name: 'employeeId')
  int get employeeId;
  @override
  @JsonKey(name: 'dateStatusLog')
  DateTime get dateStatusLog;
  @override
  @JsonKey(ignore: true)
  _$$SaleRequestImplCopyWith<_$SaleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamSaleResponse _$TeamSaleResponseFromJson(Map<String, dynamic> json) {
  return _TeamSaleResponse.fromJson(json);
}

/// @nodoc
mixin _$TeamSaleResponse {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'STT')
  int get stt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  int get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID')
  int get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamSaleResponseCopyWith<TeamSaleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamSaleResponseCopyWith<$Res> {
  factory $TeamSaleResponseCopyWith(
          TeamSaleResponse value, $Res Function(TeamSaleResponse) then) =
      _$TeamSaleResponseCopyWithImpl<$Res, TeamSaleResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'STT') int stt,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'IsDeleted') int isDeleted,
      @JsonKey(name: 'ParentID') int parentId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate});
}

/// @nodoc
class _$TeamSaleResponseCopyWithImpl<$Res, $Val extends TeamSaleResponse>
    implements $TeamSaleResponseCopyWith<$Res> {
  _$TeamSaleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stt = null,
    Object? code = null,
    Object? isDeleted = null,
    Object? parentId = null,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? updatedBy = null,
    Object? updatedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stt: null == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamSaleResponseImplCopyWith<$Res>
    implements $TeamSaleResponseCopyWith<$Res> {
  factory _$$TeamSaleResponseImplCopyWith(_$TeamSaleResponseImpl value,
          $Res Function(_$TeamSaleResponseImpl) then) =
      __$$TeamSaleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'STT') int stt,
      @JsonKey(name: 'Code') String code,
      @JsonKey(name: 'IsDeleted') int isDeleted,
      @JsonKey(name: 'ParentID') int parentId,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'UpdatedBy') String updatedBy,
      @JsonKey(name: 'UpdatedDate') DateTime updatedDate});
}

/// @nodoc
class __$$TeamSaleResponseImplCopyWithImpl<$Res>
    extends _$TeamSaleResponseCopyWithImpl<$Res, _$TeamSaleResponseImpl>
    implements _$$TeamSaleResponseImplCopyWith<$Res> {
  __$$TeamSaleResponseImplCopyWithImpl(_$TeamSaleResponseImpl _value,
      $Res Function(_$TeamSaleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stt = null,
    Object? code = null,
    Object? isDeleted = null,
    Object? parentId = null,
    Object? createdBy = null,
    Object? createdDate = null,
    Object? updatedBy = null,
    Object? updatedDate = null,
  }) {
    return _then(_$TeamSaleResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stt: null == stt
          ? _value.stt
          : stt // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDate: null == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamSaleResponseImpl implements _TeamSaleResponse {
  const _$TeamSaleResponseImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'STT') required this.stt,
      @JsonKey(name: 'Code') required this.code,
      @JsonKey(name: 'IsDeleted') required this.isDeleted,
      @JsonKey(name: 'ParentID') required this.parentId,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'UpdatedBy') required this.updatedBy,
      @JsonKey(name: 'UpdatedDate') required this.updatedDate});

  factory _$TeamSaleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamSaleResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'STT')
  final int stt;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'IsDeleted')
  final int isDeleted;
  @override
  @JsonKey(name: 'ParentID')
  final int parentId;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;

  @override
  String toString() {
    return 'TeamSaleResponse(id: $id, name: $name, stt: $stt, code: $code, isDeleted: $isDeleted, parentId: $parentId, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamSaleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stt, stt) || other.stt == stt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
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
  int get hashCode => Object.hash(runtimeType, id, name, stt, code, isDeleted,
      parentId, createdBy, createdDate, updatedBy, updatedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamSaleResponseImplCopyWith<_$TeamSaleResponseImpl> get copyWith =>
      __$$TeamSaleResponseImplCopyWithImpl<_$TeamSaleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamSaleResponseImplToJson(
      this,
    );
  }
}

abstract class _TeamSaleResponse implements TeamSaleResponse {
  const factory _TeamSaleResponse(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'Name') required final String name,
          @JsonKey(name: 'STT') required final int stt,
          @JsonKey(name: 'Code') required final String code,
          @JsonKey(name: 'IsDeleted') required final int isDeleted,
          @JsonKey(name: 'ParentID') required final int parentId,
          @JsonKey(name: 'CreatedBy') required final String createdBy,
          @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
          @JsonKey(name: 'UpdatedBy') required final String updatedBy,
          @JsonKey(name: 'UpdatedDate') required final DateTime updatedDate}) =
      _$TeamSaleResponseImpl;

  factory _TeamSaleResponse.fromJson(Map<String, dynamic> json) =
      _$TeamSaleResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'STT')
  int get stt;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'IsDeleted')
  int get isDeleted;
  @override
  @JsonKey(name: 'ParentID')
  int get parentId;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime get updatedDate;
  @override
  @JsonKey(ignore: true)
  _$$TeamSaleResponseImplCopyWith<_$TeamSaleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleReportResponse _$SaleReportResponseFromJson(Map<String, dynamic> json) {
  return _SaleReportResponse.fromJson(json);
}

/// @nodoc
mixin _$SaleReportResponse {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SaleReportData get data => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleReportResponseCopyWith<SaleReportResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleReportResponseCopyWith<$Res> {
  factory $SaleReportResponseCopyWith(
          SaleReportResponse value, $Res Function(SaleReportResponse) then) =
      _$SaleReportResponseCopyWithImpl<$Res, SaleReportResponse>;
  @useResult
  $Res call({int status, String message, SaleReportData data, String error});

  $SaleReportDataCopyWith<$Res> get data;
}

/// @nodoc
class _$SaleReportResponseCopyWithImpl<$Res, $Val extends SaleReportResponse>
    implements $SaleReportResponseCopyWith<$Res> {
  _$SaleReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SaleReportData,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SaleReportDataCopyWith<$Res> get data {
    return $SaleReportDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SaleReportResponseImplCopyWith<$Res>
    implements $SaleReportResponseCopyWith<$Res> {
  factory _$$SaleReportResponseImplCopyWith(_$SaleReportResponseImpl value,
          $Res Function(_$SaleReportResponseImpl) then) =
      __$$SaleReportResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String message, SaleReportData data, String error});

  @override
  $SaleReportDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$SaleReportResponseImplCopyWithImpl<$Res>
    extends _$SaleReportResponseCopyWithImpl<$Res, _$SaleReportResponseImpl>
    implements _$$SaleReportResponseImplCopyWith<$Res> {
  __$$SaleReportResponseImplCopyWithImpl(_$SaleReportResponseImpl _value,
      $Res Function(_$SaleReportResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
    Object? error = null,
  }) {
    return _then(_$SaleReportResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SaleReportData,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleReportResponseImpl implements _SaleReportResponse {
  const _$SaleReportResponseImpl(
      {required this.status,
      required this.message,
      required this.data,
      required this.error});

  factory _$SaleReportResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleReportResponseImplFromJson(json);

  @override
  final int status;
  @override
  final String message;
  @override
  final SaleReportData data;
  @override
  final String error;

  @override
  String toString() {
    return 'SaleReportResponse(status: $status, message: $message, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleReportResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleReportResponseImplCopyWith<_$SaleReportResponseImpl> get copyWith =>
      __$$SaleReportResponseImplCopyWithImpl<_$SaleReportResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleReportResponseImplToJson(
      this,
    );
  }
}

abstract class _SaleReportResponse implements SaleReportResponse {
  const factory _SaleReportResponse(
      {required final int status,
      required final String message,
      required final SaleReportData data,
      required final String error}) = _$SaleReportResponseImpl;

  factory _SaleReportResponse.fromJson(Map<String, dynamic> json) =
      _$SaleReportResponseImpl.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  SaleReportData get data;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$SaleReportResponseImplCopyWith<_$SaleReportResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleReportData _$SaleReportDataFromJson(Map<String, dynamic> json) {
  return _SaleReportData.fromJson(json);
}

/// @nodoc
mixin _$SaleReportData {
  List<SaleReportItem> get data => throw _privateConstructorUsedError;
  List<SaleReportTotalPage> get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleReportDataCopyWith<SaleReportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleReportDataCopyWith<$Res> {
  factory $SaleReportDataCopyWith(
          SaleReportData value, $Res Function(SaleReportData) then) =
      _$SaleReportDataCopyWithImpl<$Res, SaleReportData>;
  @useResult
  $Res call({List<SaleReportItem> data, List<SaleReportTotalPage> totalPage});
}

/// @nodoc
class _$SaleReportDataCopyWithImpl<$Res, $Val extends SaleReportData>
    implements $SaleReportDataCopyWith<$Res> {
  _$SaleReportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SaleReportItem>,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as List<SaleReportTotalPage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleReportDataImplCopyWith<$Res>
    implements $SaleReportDataCopyWith<$Res> {
  factory _$$SaleReportDataImplCopyWith(_$SaleReportDataImpl value,
          $Res Function(_$SaleReportDataImpl) then) =
      __$$SaleReportDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SaleReportItem> data, List<SaleReportTotalPage> totalPage});
}

/// @nodoc
class __$$SaleReportDataImplCopyWithImpl<$Res>
    extends _$SaleReportDataCopyWithImpl<$Res, _$SaleReportDataImpl>
    implements _$$SaleReportDataImplCopyWith<$Res> {
  __$$SaleReportDataImplCopyWithImpl(
      _$SaleReportDataImpl _value, $Res Function(_$SaleReportDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalPage = null,
  }) {
    return _then(_$SaleReportDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SaleReportItem>,
      totalPage: null == totalPage
          ? _value._totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as List<SaleReportTotalPage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleReportDataImpl implements _SaleReportData {
  const _$SaleReportDataImpl(
      {required final List<SaleReportItem> data,
      required final List<SaleReportTotalPage> totalPage})
      : _data = data,
        _totalPage = totalPage;

  factory _$SaleReportDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleReportDataImplFromJson(json);

  final List<SaleReportItem> _data;
  @override
  List<SaleReportItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<SaleReportTotalPage> _totalPage;
  @override
  List<SaleReportTotalPage> get totalPage {
    if (_totalPage is EqualUnmodifiableListView) return _totalPage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalPage);
  }

  @override
  String toString() {
    return 'SaleReportData(data: $data, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleReportDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._totalPage, _totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_totalPage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleReportDataImplCopyWith<_$SaleReportDataImpl> get copyWith =>
      __$$SaleReportDataImplCopyWithImpl<_$SaleReportDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleReportDataImplToJson(
      this,
    );
  }
}

abstract class _SaleReportData implements SaleReportData {
  const factory _SaleReportData(
          {required final List<SaleReportItem> data,
          required final List<SaleReportTotalPage> totalPage}) =
      _$SaleReportDataImpl;

  factory _SaleReportData.fromJson(Map<String, dynamic> json) =
      _$SaleReportDataImpl.fromJson;

  @override
  List<SaleReportItem> get data;
  @override
  List<SaleReportTotalPage> get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$SaleReportDataImplCopyWith<_$SaleReportDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleReportItem _$SaleReportItemFromJson(Map<String, dynamic> json) {
  return _SaleReportItem.fromJson(json);
}

/// @nodoc
mixin _$SaleReportItem {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerID')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserID')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContacID')
  int get contacId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'Telesale')
  int? get telesale => throw _privateConstructorUsedError;
  @JsonKey(name: 'Visit')
  int? get visit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Demo')
  int? get demo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Result')
  String? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProblemBacklog')
  String? get problemBacklog => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlanNext')
  String? get planNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'Note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'BigAccount')
  bool? get bigAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupType')
  int? get groupType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserLoginID')
  int? get userLoginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Month')
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndUser')
  int? get endUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'Confirm')
  bool get confirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductOfCustomer')
  String? get productOfCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestOfCustomer')
  String? get requestOfCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectID')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmBaseID')
  int? get firmBaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeBaseID')
  int? get projectTypeBaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleOpportunity')
  bool? get saleOpportunity => throw _privateConstructorUsedError;
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContactName')
  String? get contactName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PartCode')
  String? get partCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'RowNum')
  int? get rowNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainIndex')
  String? get mainIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectCode')
  String? get projectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmCode')
  String? get firmCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirmName')
  String? get firmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeCode')
  String? get projectTypeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProjectTypeName')
  String? get projectTypeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleReportItemCopyWith<SaleReportItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleReportItemCopyWith<$Res> {
  factory $SaleReportItemCopyWith(
          SaleReportItem value, $Res Function(SaleReportItem) then) =
      _$SaleReportItemCopyWithImpl<$Res, SaleReportItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'ContacID') int contacId,
      @JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'Telesale') int? telesale,
      @JsonKey(name: 'Visit') int? visit,
      @JsonKey(name: 'Demo') int? demo,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'ProblemBacklog') String? problemBacklog,
      @JsonKey(name: 'PlanNext') String? planNext,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'BigAccount') bool? bigAccount,
      @JsonKey(name: 'GroupType') int? groupType,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'UserLoginID') int? userLoginId,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'Month') int month,
      @JsonKey(name: 'Year') int year,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'ProductOfCustomer') String? productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') String? requestOfCustomer,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FirmBaseID') int? firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') int? projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') bool? saleOpportunity,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'PartCode') String? partCode,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'FirmCode') String? firmCode,
      @JsonKey(name: 'FirmName') String? firmName,
      @JsonKey(name: 'ProjectTypeCode') String? projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') String? projectTypeName});
}

/// @nodoc
class _$SaleReportItemCopyWithImpl<$Res, $Val extends SaleReportItem>
    implements $SaleReportItemCopyWith<$Res> {
  _$SaleReportItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? userId = null,
    Object? contacId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? telesale = freezed,
    Object? visit = freezed,
    Object? demo = freezed,
    Object? result = freezed,
    Object? problemBacklog = freezed,
    Object? planNext = freezed,
    Object? note = freezed,
    Object? bigAccount = freezed,
    Object? groupType = freezed,
    Object? content = freezed,
    Object? userLoginId = freezed,
    Object? createdDate = null,
    Object? createdBy = null,
    Object? month = null,
    Object? year = null,
    Object? endUser = freezed,
    Object? deleteFlag = null,
    Object? confirm = null,
    Object? productOfCustomer = freezed,
    Object? requestOfCustomer = freezed,
    Object? projectId = freezed,
    Object? firmBaseId = freezed,
    Object? projectTypeBaseId = freezed,
    Object? saleOpportunity = freezed,
    Object? warehouseId = freezed,
    Object? fullName = freezed,
    Object? customerName = freezed,
    Object? contactName = freezed,
    Object? partCode = freezed,
    Object? rowNum = freezed,
    Object? mainIndex = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? firmCode = freezed,
    Object? firmName = freezed,
    Object? projectTypeCode = freezed,
    Object? projectTypeName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      contacId: null == contacId
          ? _value.contacId
          : contacId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      telesale: freezed == telesale
          ? _value.telesale
          : telesale // ignore: cast_nullable_to_non_nullable
              as int?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      problemBacklog: freezed == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String?,
      planNext: freezed == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      bigAccount: freezed == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupType: freezed == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      userLoginId: freezed == userLoginId
          ? _value.userLoginId
          : userLoginId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      productOfCustomer: freezed == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      requestOfCustomer: freezed == requestOfCustomer
          ? _value.requestOfCustomer
          : requestOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      firmBaseId: freezed == firmBaseId
          ? _value.firmBaseId
          : firmBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectTypeBaseId: freezed == projectTypeBaseId
          ? _value.projectTypeBaseId
          : projectTypeBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleOpportunity: freezed == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      partCode: freezed == partCode
          ? _value.partCode
          : partCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      firmCode: freezed == firmCode
          ? _value.firmCode
          : firmCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firmName: freezed == firmName
          ? _value.firmName
          : firmName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeCode: freezed == projectTypeCode
          ? _value.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeName: freezed == projectTypeName
          ? _value.projectTypeName
          : projectTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleReportItemImplCopyWith<$Res>
    implements $SaleReportItemCopyWith<$Res> {
  factory _$$SaleReportItemImplCopyWith(_$SaleReportItemImpl value,
          $Res Function(_$SaleReportItemImpl) then) =
      __$$SaleReportItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'CustomerID') int customerId,
      @JsonKey(name: 'UserID') int userId,
      @JsonKey(name: 'ContacID') int contacId,
      @JsonKey(name: 'DateStart') DateTime dateStart,
      @JsonKey(name: 'DateEnd') DateTime dateEnd,
      @JsonKey(name: 'Telesale') int? telesale,
      @JsonKey(name: 'Visit') int? visit,
      @JsonKey(name: 'Demo') int? demo,
      @JsonKey(name: 'Result') String? result,
      @JsonKey(name: 'ProblemBacklog') String? problemBacklog,
      @JsonKey(name: 'PlanNext') String? planNext,
      @JsonKey(name: 'Note') String? note,
      @JsonKey(name: 'BigAccount') bool? bigAccount,
      @JsonKey(name: 'GroupType') int? groupType,
      @JsonKey(name: 'Content') String? content,
      @JsonKey(name: 'UserLoginID') int? userLoginId,
      @JsonKey(name: 'CreatedDate') DateTime createdDate,
      @JsonKey(name: 'CreatedBy') String createdBy,
      @JsonKey(name: 'Month') int month,
      @JsonKey(name: 'Year') int year,
      @JsonKey(name: 'EndUser') int? endUser,
      @JsonKey(name: 'DeleteFlag') int deleteFlag,
      @JsonKey(name: 'Confirm') bool confirm,
      @JsonKey(name: 'ProductOfCustomer') String? productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') String? requestOfCustomer,
      @JsonKey(name: 'ProjectID') int? projectId,
      @JsonKey(name: 'FirmBaseID') int? firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') int? projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') bool? saleOpportunity,
      @JsonKey(name: 'WarehouseID') int? warehouseId,
      @JsonKey(name: 'FullName') String? fullName,
      @JsonKey(name: 'CustomerName') String? customerName,
      @JsonKey(name: 'ContactName') String? contactName,
      @JsonKey(name: 'PartCode') String? partCode,
      @JsonKey(name: 'RowNum') int? rowNum,
      @JsonKey(name: 'MainIndex') String? mainIndex,
      @JsonKey(name: 'ProjectCode') String? projectCode,
      @JsonKey(name: 'ProjectName') String? projectName,
      @JsonKey(name: 'FirmCode') String? firmCode,
      @JsonKey(name: 'FirmName') String? firmName,
      @JsonKey(name: 'ProjectTypeCode') String? projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') String? projectTypeName});
}

/// @nodoc
class __$$SaleReportItemImplCopyWithImpl<$Res>
    extends _$SaleReportItemCopyWithImpl<$Res, _$SaleReportItemImpl>
    implements _$$SaleReportItemImplCopyWith<$Res> {
  __$$SaleReportItemImplCopyWithImpl(
      _$SaleReportItemImpl _value, $Res Function(_$SaleReportItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? userId = null,
    Object? contacId = null,
    Object? dateStart = null,
    Object? dateEnd = null,
    Object? telesale = freezed,
    Object? visit = freezed,
    Object? demo = freezed,
    Object? result = freezed,
    Object? problemBacklog = freezed,
    Object? planNext = freezed,
    Object? note = freezed,
    Object? bigAccount = freezed,
    Object? groupType = freezed,
    Object? content = freezed,
    Object? userLoginId = freezed,
    Object? createdDate = null,
    Object? createdBy = null,
    Object? month = null,
    Object? year = null,
    Object? endUser = freezed,
    Object? deleteFlag = null,
    Object? confirm = null,
    Object? productOfCustomer = freezed,
    Object? requestOfCustomer = freezed,
    Object? projectId = freezed,
    Object? firmBaseId = freezed,
    Object? projectTypeBaseId = freezed,
    Object? saleOpportunity = freezed,
    Object? warehouseId = freezed,
    Object? fullName = freezed,
    Object? customerName = freezed,
    Object? contactName = freezed,
    Object? partCode = freezed,
    Object? rowNum = freezed,
    Object? mainIndex = freezed,
    Object? projectCode = freezed,
    Object? projectName = freezed,
    Object? firmCode = freezed,
    Object? firmName = freezed,
    Object? projectTypeCode = freezed,
    Object? projectTypeName = freezed,
  }) {
    return _then(_$SaleReportItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      contacId: null == contacId
          ? _value.contacId
          : contacId // ignore: cast_nullable_to_non_nullable
              as int,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEnd: null == dateEnd
          ? _value.dateEnd
          : dateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      telesale: freezed == telesale
          ? _value.telesale
          : telesale // ignore: cast_nullable_to_non_nullable
              as int?,
      visit: freezed == visit
          ? _value.visit
          : visit // ignore: cast_nullable_to_non_nullable
              as int?,
      demo: freezed == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      problemBacklog: freezed == problemBacklog
          ? _value.problemBacklog
          : problemBacklog // ignore: cast_nullable_to_non_nullable
              as String?,
      planNext: freezed == planNext
          ? _value.planNext
          : planNext // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      bigAccount: freezed == bigAccount
          ? _value.bigAccount
          : bigAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupType: freezed == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      userLoginId: freezed == userLoginId
          ? _value.userLoginId
          : userLoginId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      endUser: freezed == endUser
          ? _value.endUser
          : endUser // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteFlag: null == deleteFlag
          ? _value.deleteFlag
          : deleteFlag // ignore: cast_nullable_to_non_nullable
              as int,
      confirm: null == confirm
          ? _value.confirm
          : confirm // ignore: cast_nullable_to_non_nullable
              as bool,
      productOfCustomer: freezed == productOfCustomer
          ? _value.productOfCustomer
          : productOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      requestOfCustomer: freezed == requestOfCustomer
          ? _value.requestOfCustomer
          : requestOfCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      firmBaseId: freezed == firmBaseId
          ? _value.firmBaseId
          : firmBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectTypeBaseId: freezed == projectTypeBaseId
          ? _value.projectTypeBaseId
          : projectTypeBaseId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleOpportunity: freezed == saleOpportunity
          ? _value.saleOpportunity
          : saleOpportunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactName: freezed == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String?,
      partCode: freezed == partCode
          ? _value.partCode
          : partCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rowNum: freezed == rowNum
          ? _value.rowNum
          : rowNum // ignore: cast_nullable_to_non_nullable
              as int?,
      mainIndex: freezed == mainIndex
          ? _value.mainIndex
          : mainIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      projectCode: freezed == projectCode
          ? _value.projectCode
          : projectCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      firmCode: freezed == firmCode
          ? _value.firmCode
          : firmCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firmName: freezed == firmName
          ? _value.firmName
          : firmName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeCode: freezed == projectTypeCode
          ? _value.projectTypeCode
          : projectTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectTypeName: freezed == projectTypeName
          ? _value.projectTypeName
          : projectTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleReportItemImpl implements _SaleReportItem {
  const _$SaleReportItemImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'CustomerID') required this.customerId,
      @JsonKey(name: 'UserID') required this.userId,
      @JsonKey(name: 'ContacID') required this.contacId,
      @JsonKey(name: 'DateStart') required this.dateStart,
      @JsonKey(name: 'DateEnd') required this.dateEnd,
      @JsonKey(name: 'Telesale') this.telesale,
      @JsonKey(name: 'Visit') this.visit,
      @JsonKey(name: 'Demo') this.demo,
      @JsonKey(name: 'Result') this.result,
      @JsonKey(name: 'ProblemBacklog') this.problemBacklog,
      @JsonKey(name: 'PlanNext') this.planNext,
      @JsonKey(name: 'Note') this.note,
      @JsonKey(name: 'BigAccount') this.bigAccount,
      @JsonKey(name: 'GroupType') this.groupType,
      @JsonKey(name: 'Content') this.content,
      @JsonKey(name: 'UserLoginID') this.userLoginId,
      @JsonKey(name: 'CreatedDate') required this.createdDate,
      @JsonKey(name: 'CreatedBy') required this.createdBy,
      @JsonKey(name: 'Month') required this.month,
      @JsonKey(name: 'Year') required this.year,
      @JsonKey(name: 'EndUser') this.endUser,
      @JsonKey(name: 'DeleteFlag') required this.deleteFlag,
      @JsonKey(name: 'Confirm') required this.confirm,
      @JsonKey(name: 'ProductOfCustomer') this.productOfCustomer,
      @JsonKey(name: 'RequestOfCustomer') this.requestOfCustomer,
      @JsonKey(name: 'ProjectID') this.projectId,
      @JsonKey(name: 'FirmBaseID') this.firmBaseId,
      @JsonKey(name: 'ProjectTypeBaseID') this.projectTypeBaseId,
      @JsonKey(name: 'SaleOpportunity') this.saleOpportunity,
      @JsonKey(name: 'WarehouseID') this.warehouseId,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'CustomerName') this.customerName,
      @JsonKey(name: 'ContactName') this.contactName,
      @JsonKey(name: 'PartCode') this.partCode,
      @JsonKey(name: 'RowNum') this.rowNum,
      @JsonKey(name: 'MainIndex') this.mainIndex,
      @JsonKey(name: 'ProjectCode') this.projectCode,
      @JsonKey(name: 'ProjectName') this.projectName,
      @JsonKey(name: 'FirmCode') this.firmCode,
      @JsonKey(name: 'FirmName') this.firmName,
      @JsonKey(name: 'ProjectTypeCode') this.projectTypeCode,
      @JsonKey(name: 'ProjectTypeName') this.projectTypeName});

  factory _$SaleReportItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleReportItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'CustomerID')
  final int customerId;
  @override
  @JsonKey(name: 'UserID')
  final int userId;
  @override
  @JsonKey(name: 'ContacID')
  final int contacId;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  final DateTime dateEnd;
  @override
  @JsonKey(name: 'Telesale')
  final int? telesale;
  @override
  @JsonKey(name: 'Visit')
  final int? visit;
  @override
  @JsonKey(name: 'Demo')
  final int? demo;
  @override
  @JsonKey(name: 'Result')
  final String? result;
  @override
  @JsonKey(name: 'ProblemBacklog')
  final String? problemBacklog;
  @override
  @JsonKey(name: 'PlanNext')
  final String? planNext;
  @override
  @JsonKey(name: 'Note')
  final String? note;
  @override
  @JsonKey(name: 'BigAccount')
  final bool? bigAccount;
  @override
  @JsonKey(name: 'GroupType')
  final int? groupType;
  @override
  @JsonKey(name: 'Content')
  final String? content;
  @override
  @JsonKey(name: 'UserLoginID')
  final int? userLoginId;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'Month')
  final int month;
  @override
  @JsonKey(name: 'Year')
  final int year;
  @override
  @JsonKey(name: 'EndUser')
  final int? endUser;
  @override
  @JsonKey(name: 'DeleteFlag')
  final int deleteFlag;
  @override
  @JsonKey(name: 'Confirm')
  final bool confirm;
  @override
  @JsonKey(name: 'ProductOfCustomer')
  final String? productOfCustomer;
  @override
  @JsonKey(name: 'RequestOfCustomer')
  final String? requestOfCustomer;
  @override
  @JsonKey(name: 'ProjectID')
  final int? projectId;
  @override
  @JsonKey(name: 'FirmBaseID')
  final int? firmBaseId;
  @override
  @JsonKey(name: 'ProjectTypeBaseID')
  final int? projectTypeBaseId;
  @override
  @JsonKey(name: 'SaleOpportunity')
  final bool? saleOpportunity;
  @override
  @JsonKey(name: 'WarehouseID')
  final int? warehouseId;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'CustomerName')
  final String? customerName;
  @override
  @JsonKey(name: 'ContactName')
  final String? contactName;
  @override
  @JsonKey(name: 'PartCode')
  final String? partCode;
  @override
  @JsonKey(name: 'RowNum')
  final int? rowNum;
  @override
  @JsonKey(name: 'MainIndex')
  final String? mainIndex;
  @override
  @JsonKey(name: 'ProjectCode')
  final String? projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  final String? projectName;
  @override
  @JsonKey(name: 'FirmCode')
  final String? firmCode;
  @override
  @JsonKey(name: 'FirmName')
  final String? firmName;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  final String? projectTypeCode;
  @override
  @JsonKey(name: 'ProjectTypeName')
  final String? projectTypeName;

  @override
  String toString() {
    return 'SaleReportItem(id: $id, customerId: $customerId, userId: $userId, contacId: $contacId, dateStart: $dateStart, dateEnd: $dateEnd, telesale: $telesale, visit: $visit, demo: $demo, result: $result, problemBacklog: $problemBacklog, planNext: $planNext, note: $note, bigAccount: $bigAccount, groupType: $groupType, content: $content, userLoginId: $userLoginId, createdDate: $createdDate, createdBy: $createdBy, month: $month, year: $year, endUser: $endUser, deleteFlag: $deleteFlag, confirm: $confirm, productOfCustomer: $productOfCustomer, requestOfCustomer: $requestOfCustomer, projectId: $projectId, firmBaseId: $firmBaseId, projectTypeBaseId: $projectTypeBaseId, saleOpportunity: $saleOpportunity, warehouseId: $warehouseId, fullName: $fullName, customerName: $customerName, contactName: $contactName, partCode: $partCode, rowNum: $rowNum, mainIndex: $mainIndex, projectCode: $projectCode, projectName: $projectName, firmCode: $firmCode, firmName: $firmName, projectTypeCode: $projectTypeCode, projectTypeName: $projectTypeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleReportItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.contacId, contacId) ||
                other.contacId == contacId) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd) &&
            (identical(other.telesale, telesale) ||
                other.telesale == telesale) &&
            (identical(other.visit, visit) || other.visit == visit) &&
            (identical(other.demo, demo) || other.demo == demo) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.problemBacklog, problemBacklog) ||
                other.problemBacklog == problemBacklog) &&
            (identical(other.planNext, planNext) ||
                other.planNext == planNext) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.bigAccount, bigAccount) ||
                other.bigAccount == bigAccount) &&
            (identical(other.groupType, groupType) ||
                other.groupType == groupType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userLoginId, userLoginId) ||
                other.userLoginId == userLoginId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.endUser, endUser) || other.endUser == endUser) &&
            (identical(other.deleteFlag, deleteFlag) ||
                other.deleteFlag == deleteFlag) &&
            (identical(other.confirm, confirm) || other.confirm == confirm) &&
            (identical(other.productOfCustomer, productOfCustomer) ||
                other.productOfCustomer == productOfCustomer) &&
            (identical(other.requestOfCustomer, requestOfCustomer) ||
                other.requestOfCustomer == requestOfCustomer) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.firmBaseId, firmBaseId) ||
                other.firmBaseId == firmBaseId) &&
            (identical(other.projectTypeBaseId, projectTypeBaseId) ||
                other.projectTypeBaseId == projectTypeBaseId) &&
            (identical(other.saleOpportunity, saleOpportunity) ||
                other.saleOpportunity == saleOpportunity) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.partCode, partCode) ||
                other.partCode == partCode) &&
            (identical(other.rowNum, rowNum) || other.rowNum == rowNum) &&
            (identical(other.mainIndex, mainIndex) ||
                other.mainIndex == mainIndex) &&
            (identical(other.projectCode, projectCode) ||
                other.projectCode == projectCode) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.firmCode, firmCode) ||
                other.firmCode == firmCode) &&
            (identical(other.firmName, firmName) ||
                other.firmName == firmName) &&
            (identical(other.projectTypeCode, projectTypeCode) ||
                other.projectTypeCode == projectTypeCode) &&
            (identical(other.projectTypeName, projectTypeName) ||
                other.projectTypeName == projectTypeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        customerId,
        userId,
        contacId,
        dateStart,
        dateEnd,
        telesale,
        visit,
        demo,
        result,
        problemBacklog,
        planNext,
        note,
        bigAccount,
        groupType,
        content,
        userLoginId,
        createdDate,
        createdBy,
        month,
        year,
        endUser,
        deleteFlag,
        confirm,
        productOfCustomer,
        requestOfCustomer,
        projectId,
        firmBaseId,
        projectTypeBaseId,
        saleOpportunity,
        warehouseId,
        fullName,
        customerName,
        contactName,
        partCode,
        rowNum,
        mainIndex,
        projectCode,
        projectName,
        firmCode,
        firmName,
        projectTypeCode,
        projectTypeName
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleReportItemImplCopyWith<_$SaleReportItemImpl> get copyWith =>
      __$$SaleReportItemImplCopyWithImpl<_$SaleReportItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleReportItemImplToJson(
      this,
    );
  }
}

abstract class _SaleReportItem implements SaleReportItem {
  const factory _SaleReportItem(
          {@JsonKey(name: 'ID') required final int id,
          @JsonKey(name: 'CustomerID') required final int customerId,
          @JsonKey(name: 'UserID') required final int userId,
          @JsonKey(name: 'ContacID') required final int contacId,
          @JsonKey(name: 'DateStart') required final DateTime dateStart,
          @JsonKey(name: 'DateEnd') required final DateTime dateEnd,
          @JsonKey(name: 'Telesale') final int? telesale,
          @JsonKey(name: 'Visit') final int? visit,
          @JsonKey(name: 'Demo') final int? demo,
          @JsonKey(name: 'Result') final String? result,
          @JsonKey(name: 'ProblemBacklog') final String? problemBacklog,
          @JsonKey(name: 'PlanNext') final String? planNext,
          @JsonKey(name: 'Note') final String? note,
          @JsonKey(name: 'BigAccount') final bool? bigAccount,
          @JsonKey(name: 'GroupType') final int? groupType,
          @JsonKey(name: 'Content') final String? content,
          @JsonKey(name: 'UserLoginID') final int? userLoginId,
          @JsonKey(name: 'CreatedDate') required final DateTime createdDate,
          @JsonKey(name: 'CreatedBy') required final String createdBy,
          @JsonKey(name: 'Month') required final int month,
          @JsonKey(name: 'Year') required final int year,
          @JsonKey(name: 'EndUser') final int? endUser,
          @JsonKey(name: 'DeleteFlag') required final int deleteFlag,
          @JsonKey(name: 'Confirm') required final bool confirm,
          @JsonKey(name: 'ProductOfCustomer') final String? productOfCustomer,
          @JsonKey(name: 'RequestOfCustomer') final String? requestOfCustomer,
          @JsonKey(name: 'ProjectID') final int? projectId,
          @JsonKey(name: 'FirmBaseID') final int? firmBaseId,
          @JsonKey(name: 'ProjectTypeBaseID') final int? projectTypeBaseId,
          @JsonKey(name: 'SaleOpportunity') final bool? saleOpportunity,
          @JsonKey(name: 'WarehouseID') final int? warehouseId,
          @JsonKey(name: 'FullName') final String? fullName,
          @JsonKey(name: 'CustomerName') final String? customerName,
          @JsonKey(name: 'ContactName') final String? contactName,
          @JsonKey(name: 'PartCode') final String? partCode,
          @JsonKey(name: 'RowNum') final int? rowNum,
          @JsonKey(name: 'MainIndex') final String? mainIndex,
          @JsonKey(name: 'ProjectCode') final String? projectCode,
          @JsonKey(name: 'ProjectName') final String? projectName,
          @JsonKey(name: 'FirmCode') final String? firmCode,
          @JsonKey(name: 'FirmName') final String? firmName,
          @JsonKey(name: 'ProjectTypeCode') final String? projectTypeCode,
          @JsonKey(name: 'ProjectTypeName') final String? projectTypeName}) =
      _$SaleReportItemImpl;

  factory _SaleReportItem.fromJson(Map<String, dynamic> json) =
      _$SaleReportItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'CustomerID')
  int get customerId;
  @override
  @JsonKey(name: 'UserID')
  int get userId;
  @override
  @JsonKey(name: 'ContacID')
  int get contacId;
  @override
  @JsonKey(name: 'DateStart')
  DateTime get dateStart;
  @override
  @JsonKey(name: 'DateEnd')
  DateTime get dateEnd;
  @override
  @JsonKey(name: 'Telesale')
  int? get telesale;
  @override
  @JsonKey(name: 'Visit')
  int? get visit;
  @override
  @JsonKey(name: 'Demo')
  int? get demo;
  @override
  @JsonKey(name: 'Result')
  String? get result;
  @override
  @JsonKey(name: 'ProblemBacklog')
  String? get problemBacklog;
  @override
  @JsonKey(name: 'PlanNext')
  String? get planNext;
  @override
  @JsonKey(name: 'Note')
  String? get note;
  @override
  @JsonKey(name: 'BigAccount')
  bool? get bigAccount;
  @override
  @JsonKey(name: 'GroupType')
  int? get groupType;
  @override
  @JsonKey(name: 'Content')
  String? get content;
  @override
  @JsonKey(name: 'UserLoginID')
  int? get userLoginId;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime get createdDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'Month')
  int get month;
  @override
  @JsonKey(name: 'Year')
  int get year;
  @override
  @JsonKey(name: 'EndUser')
  int? get endUser;
  @override
  @JsonKey(name: 'DeleteFlag')
  int get deleteFlag;
  @override
  @JsonKey(name: 'Confirm')
  bool get confirm;
  @override
  @JsonKey(name: 'ProductOfCustomer')
  String? get productOfCustomer;
  @override
  @JsonKey(name: 'RequestOfCustomer')
  String? get requestOfCustomer;
  @override
  @JsonKey(name: 'ProjectID')
  int? get projectId;
  @override
  @JsonKey(name: 'FirmBaseID')
  int? get firmBaseId;
  @override
  @JsonKey(name: 'ProjectTypeBaseID')
  int? get projectTypeBaseId;
  @override
  @JsonKey(name: 'SaleOpportunity')
  bool? get saleOpportunity;
  @override
  @JsonKey(name: 'WarehouseID')
  int? get warehouseId;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'CustomerName')
  String? get customerName;
  @override
  @JsonKey(name: 'ContactName')
  String? get contactName;
  @override
  @JsonKey(name: 'PartCode')
  String? get partCode;
  @override
  @JsonKey(name: 'RowNum')
  int? get rowNum;
  @override
  @JsonKey(name: 'MainIndex')
  String? get mainIndex;
  @override
  @JsonKey(name: 'ProjectCode')
  String? get projectCode;
  @override
  @JsonKey(name: 'ProjectName')
  String? get projectName;
  @override
  @JsonKey(name: 'FirmCode')
  String? get firmCode;
  @override
  @JsonKey(name: 'FirmName')
  String? get firmName;
  @override
  @JsonKey(name: 'ProjectTypeCode')
  String? get projectTypeCode;
  @override
  @JsonKey(name: 'ProjectTypeName')
  String? get projectTypeName;
  @override
  @JsonKey(ignore: true)
  _$$SaleReportItemImplCopyWith<_$SaleReportItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleReportTotalPage _$SaleReportTotalPageFromJson(Map<String, dynamic> json) {
  return _SaleReportTotalPage.fromJson(json);
}

/// @nodoc
mixin _$SaleReportTotalPage {
  @JsonKey(name: 'TotalPage')
  int get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleReportTotalPageCopyWith<SaleReportTotalPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleReportTotalPageCopyWith<$Res> {
  factory $SaleReportTotalPageCopyWith(
          SaleReportTotalPage value, $Res Function(SaleReportTotalPage) then) =
      _$SaleReportTotalPageCopyWithImpl<$Res, SaleReportTotalPage>;
  @useResult
  $Res call({@JsonKey(name: 'TotalPage') int totalPage});
}

/// @nodoc
class _$SaleReportTotalPageCopyWithImpl<$Res, $Val extends SaleReportTotalPage>
    implements $SaleReportTotalPageCopyWith<$Res> {
  _$SaleReportTotalPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleReportTotalPageImplCopyWith<$Res>
    implements $SaleReportTotalPageCopyWith<$Res> {
  factory _$$SaleReportTotalPageImplCopyWith(_$SaleReportTotalPageImpl value,
          $Res Function(_$SaleReportTotalPageImpl) then) =
      __$$SaleReportTotalPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TotalPage') int totalPage});
}

/// @nodoc
class __$$SaleReportTotalPageImplCopyWithImpl<$Res>
    extends _$SaleReportTotalPageCopyWithImpl<$Res, _$SaleReportTotalPageImpl>
    implements _$$SaleReportTotalPageImplCopyWith<$Res> {
  __$$SaleReportTotalPageImplCopyWithImpl(_$SaleReportTotalPageImpl _value,
      $Res Function(_$SaleReportTotalPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
  }) {
    return _then(_$SaleReportTotalPageImpl(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaleReportTotalPageImpl implements _SaleReportTotalPage {
  const _$SaleReportTotalPageImpl(
      {@JsonKey(name: 'TotalPage') required this.totalPage});

  factory _$SaleReportTotalPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleReportTotalPageImplFromJson(json);

  @override
  @JsonKey(name: 'TotalPage')
  final int totalPage;

  @override
  String toString() {
    return 'SaleReportTotalPage(totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleReportTotalPageImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleReportTotalPageImplCopyWith<_$SaleReportTotalPageImpl> get copyWith =>
      __$$SaleReportTotalPageImplCopyWithImpl<_$SaleReportTotalPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleReportTotalPageImplToJson(
      this,
    );
  }
}

abstract class _SaleReportTotalPage implements SaleReportTotalPage {
  const factory _SaleReportTotalPage(
          {@JsonKey(name: 'TotalPage') required final int totalPage}) =
      _$SaleReportTotalPageImpl;

  factory _SaleReportTotalPage.fromJson(Map<String, dynamic> json) =
      _$SaleReportTotalPageImpl.fromJson;

  @override
  @JsonKey(name: 'TotalPage')
  int get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$SaleReportTotalPageImplCopyWith<_$SaleReportTotalPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
