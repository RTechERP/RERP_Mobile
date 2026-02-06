import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

/// ==========================
/// 🔹 Report Request Payload
/// ==========================
@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: 'DateStart') required DateTime dateStart,
    @JsonKey(name: 'DateEnd') required DateTime dateEnd,
    @JsonKey(name: 'TeamID') required int teamId,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'Keyword') String? keyword,
    @JsonKey(name: 'DepartmentID') required int departmentId,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportRequestFromJson(json);
}

/// ==========================
/// 🔹 Report Response Model
/// ==========================
@freezed
class ReportResponse with _$ReportResponse {
  const factory ReportResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'FullName') required String fullName,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'DateReport') required DateTime dateReport,

    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'ProjectText') required String projectText,

    @JsonKey(name: 'TotalHours') required double totalHours,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,

    @JsonKey(name: 'Backlog') String? backlog,
    @JsonKey(name: 'Problem') String? problem,
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'PositionName') required String positionName,
    @JsonKey(name: 'Mission') required String mission,

    @JsonKey(name: 'ProjectItemCode') required String projectItemCode,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'PercentComplete') required int percentComplete,

    @JsonKey(name: 'TotalHourOT') double? totalHourOT,
    @JsonKey(name: 'HolidayDate') required DateTime holidayDate,

    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,

    @JsonKey(name: 'TotalDayPlan') int? totalDayPlan,
  }) = _ReportResponse;

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
}
