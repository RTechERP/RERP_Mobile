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
    @JsonKey(name: 'DateReport') required String dateReport,

    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'ProjectText') required String projectText,

    @JsonKey(name: 'TotalHours') required double totalHours,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,

    @JsonKey(name: 'Backlog') String? backlog,
    @JsonKey(name: 'Problem') String? problem,
    @JsonKey(name: 'ProblemSolve') String? problemSolve,
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'PositionName') required String positionName,
    @JsonKey(name: 'Mission') required String mission,

    @JsonKey(name: 'ProjectItemCode') required String projectItemCode,
    @JsonKey(name: 'ProjectItemName') String? projectItemName, // 🔧 thêm field
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'PercentComplete') required double percentComplete,

    @JsonKey(name: 'TotalHourOT') double? totalHourOT,
    @JsonKey(name: 'HolidayDate') DateTime? holidayDate,    // 🔧 null

    /// ⚠️ API trả "" → nên để String? rồi tự parse khi cần
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,

    /// API trả 0.0
    @JsonKey(name: 'TotalDayPlan') int? totalDayPlan,
    @JsonKey(name: 'TotalDayActual') int? totalDayActual, // 🔧 thêm field
  }) = _ReportResponse;

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
}


/// ==========================
/// 🔹 Depart Response Model
/// ==========================
@freezed
class DepartResponse with _$DepartResponse {
  const factory DepartResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'Name') required String name,
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
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _DepartResponse;

  factory DepartResponse.fromJson(Map<String, dynamic> json) =>
      _$DepartResponseFromJson(json);
}

/// ==========================
/// 🔹 Staff Response Model
/// ==========================
@freezed
class StaffResponse with _$StaffResponse {
  const factory StaffResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'DepartmentID') required int departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'ChuVuID') int? chucVuId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
    @JsonKey(name: 'FullName') required String fullName,
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
    @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan,
  }) = _StaffResponse;

  factory StaffResponse.fromJson(Map<String, dynamic> json) =>
      _$StaffResponseFromJson(json);
}

/// ==========================
/// 🔹 Team Response Model
/// ==========================
@freezed
class TeamResponse with _$TeamResponse {
  const factory TeamResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'LeaderID') int? leaderId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
    @JsonKey(name: 'Leader') String? leader,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
  }) = _TeamResponse;

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);
}


/// ==========================
/// 🔹 Project Response Model
/// ==========================
@freezed
class ProjectResponse with _$ProjectResponse {
  const factory ProjectResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
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
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}

/// ==========================
/// 🔹 Project Item Response Model
/// ==========================
@freezed
class ProjectItemResponse with _$ProjectItemResponse {
  const factory ProjectItemResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'PercentageActual') double? percentageActual,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,

    /// BE trả double (3.0)
    @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,

    @JsonKey(name: 'EmployeeID') int? employeeId,
  }) = _ProjectItemResponse;

  factory ProjectItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemResponseFromJson(json);
}

/// ==========================
/// 🔹 Save Report Tech Request Model
/// ==========================

@freezed
class SaveReportTechRequest with _$SaveReportTechRequest {
  const factory SaveReportTechRequest({
    @JsonKey(name: 'ID') required int id,

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
    @JsonKey(name: 'PercentComplete') required double percentComplete,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,

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
    @JsonKey(name: 'WorkPlanDetailID') int? workPlanDetailId,
  }) = _SaveReportTechRequest;

  factory SaveReportTechRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveReportTechRequestFromJson(json);
}