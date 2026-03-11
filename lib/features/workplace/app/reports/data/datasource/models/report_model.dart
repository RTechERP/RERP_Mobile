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
    @JsonKey(name: 'TeamID') required String teamId,
    @JsonKey(name: 'UserID') required String userId,
    @JsonKey(name: 'Keyword') required String keyword,
    @JsonKey(name: 'DepartmentID') required String departmentId,
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

    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectText') String? projectText,

    @JsonKey(name: 'TotalHours') required double totalHours,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,

    @JsonKey(name: 'Backlog') String? backlog,
    @JsonKey(name: 'Problem') String? problem,
    @JsonKey(name: 'ProblemSolve') String? problemSolve,
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'PositionName') required String positionName,
    @JsonKey(name: 'Mission') required String mission,

    @JsonKey(name: 'ProjectItemCode') required String projectItemCode,
    @JsonKey(name: 'ProjectItemName') String? projectItemName, // 🔧 thêm field
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'PercentComplete') required double percentComplete,

    @JsonKey(name: 'TotalHourOT') double? totalHourOT,
    @JsonKey(name: 'HolidayDate') DateTime? holidayDate,

    /// ⚠️ API trả "" → nên để String? rồi tự parse khi cần
    @JsonKey(name: 'PlanStartDate') String? planStartDate,
    @JsonKey(name: 'PlanEndDate') String? planEndDate,
    @JsonKey(name: 'ActualStartDate') String? actualStartDate,
    @JsonKey(name: 'ActualEndDate') String? actualEndDate,

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

/// ==========================
/// 🔹 Send Email Request Model
/// ==========================

@freezed
class SendMailRequestModel with _$SendMailRequestModel {
  const factory SendMailRequestModel({
    @JsonKey(name: 'Body') required String body,
    @JsonKey(name: 'DateReport') required String dateReport,
  }) = _SendMailRequestModel;

  factory SendMailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendMailRequestModelFromJson(json);
}

/// ==========================
/// 🔹 Detail Report Response Model
/// ==========================

@freezed
class DetailReportResponse with _$DetailReportResponse {
  const factory DetailReportResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MasterID') required int masterId,
    @JsonKey(name: 'UserReport') required int userReport,
    @JsonKey(name: 'DateReport') required String dateReport,
    @JsonKey(name: 'ProjectID') required int projectId,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'Problem') required String problem,
    @JsonKey(name: 'ProblemSolve') required String problemSolve,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'Confirm') required bool confirm,
    @JsonKey(name: 'Backlog') required String backlog,
    @JsonKey(name: 'DeleteFlag') required int deleteFlag,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'ReportLate') required int reportLate,
    @JsonKey(name: 'OldProjectID') required int oldProjectId,
    @JsonKey(name: 'TotalHours') required double totalHours,
    @JsonKey(name: 'StatusResult') required int statusResult,
    @JsonKey(name: 'WorkPlanDetailID') required int workPlanDetailId,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'ProjectItemID') required int projectItemId,
    @JsonKey(name: 'PercentComplete') required int percentComplete,
    @JsonKey(name: 'TotalHourOT') required double totalHourOT,
    @JsonKey(name: 'Location') required String location,
  }) = _DetailReportResponse;

  factory DetailReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailReportResponseFromJson(json);
}

@freezed
class DetailReportNullResponse with _$DetailReportNullResponse {
  const factory DetailReportNullResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MasterID') required int masterId,
    @JsonKey(name: 'UserReport') required int userReport,
    @JsonKey(name: 'DateReport') required String dateReport,
    @JsonKey(name: 'ProjectID') required int projectId,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'Problem') required String problem,
    @JsonKey(name: 'ProblemSolve') required String problemSolve,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'Confirm') required bool confirm,
    @JsonKey(name: 'Backlog') required String backlog,
    @JsonKey(name: 'DeleteFlag') required int deleteFlag,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'ReportLate') required int reportLate,
    @JsonKey(name: 'OldProjectID') required int oldProjectId,
    @JsonKey(name: 'TotalHours') required double totalHours,
    @JsonKey(name: 'StatusResult') required int statusResult,
    @JsonKey(name: 'WorkPlanDetailID') required int workPlanDetailId,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'ProjectItemID') int? projectItemId,
    @JsonKey(name: 'PercentComplete') int? percentComplete,
    @JsonKey(name: 'TotalHourOT') required double totalHourOT,
    @JsonKey(name: 'Location') required String location,
  }) = _DetailReportNullResponse;

  factory DetailReportNullResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailReportNullResponseFromJson(json);
}

/// ==========================
/// 🔹 Copy Request + Response Model
/// ==========================

@freezed
class CopyRequest with _$CopyRequest {
  const factory CopyRequest({
    @JsonKey(name: 'dateStart') required String dateStart,
    @JsonKey(name: 'dateEnd') required String dateEnd,
    @JsonKey(name: 'team_id') required int teamId,
    @JsonKey(name: 'keyword') required String keyword,
    @JsonKey(name: 'userid') required int userId,
    @JsonKey(name: 'departmentid') required int departmentId,
  }) = _CopyRequest;

  factory CopyRequest.fromJson(Map<String, dynamic> json) =>
      _$CopyRequestFromJson(json);
}

@freezed
class CopyResponse with _$CopyResponse {
  const factory CopyResponse({
    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'ProjectItemCode') required String projectItemCode,
    @JsonKey(name: 'DateReport') required String dateReport,
    @JsonKey(name: 'Mission') required String mission, // Nội dung công việc
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'Backlog') required String backlog,
    @JsonKey(name: 'Problem') required String problem,
    @JsonKey(name: 'ProblemSolve') required String problemSolve,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,
    @JsonKey(name: 'Note') required String note,
  }) = _CopyResponse;

  factory CopyResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyResponseFromJson(json);
}

@freezed
class CopyNullResponse with _$CopyNullResponse {
  const factory CopyNullResponse({
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectItemCode') String? projectItemCode,
    @JsonKey(name: 'DateReport') required String dateReport,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'Results') String? results,
    @JsonKey(name: 'Backlog') required String backlog,
    @JsonKey(name: 'Problem') String? problem,
    @JsonKey(name: 'ProblemSolve') String? problemSolve,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,
    @JsonKey(name: 'Note') required String note,
  }) = _CopyNullResponse;

  factory CopyNullResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyNullResponseFromJson(json);
}

/// ==========================
/// 🔹 Marketing + File Request Model
/// ==========================

@freezed
class MarketingFileRequest with _$MarketingFileRequest {
  const factory MarketingFileRequest({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'FileName') required String fileName,
    @JsonKey(name: 'FileNameOrigin') required String fileNameOrigin,
    @JsonKey(name: 'OriginPath') required String originPath,
    @JsonKey(name: 'Extension') required String extension,
    @JsonKey(name: 'PathServer') required String pathServer,
    @JsonKey(name: 'DailyReportID') required int dailyReportId,
  }) = _MarketingFileRequest;

  factory MarketingFileRequest.fromJson(Map<String, dynamic> json) =>
      _$MarketingFileRequestFromJson(json);
}

@freezed
class MarketingRequest with _$MarketingRequest {
  const factory MarketingRequest({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'UserReport') required int userReport,
    @JsonKey(name: 'DateReport') required String dateReport,
    @JsonKey(name: 'Content') required String content,
    @JsonKey(name: 'Results') required String results,
    @JsonKey(name: 'PlanNextDay') required String planNextDay,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'dailyReportMarketingFiles')
    required List<MarketingFileRequest> dailyReportMarketingFiles,
    @JsonKey(name: 'deletedFileID') required List<int> deletedFileId,
  }) = _MarketingRequest;

  factory MarketingRequest.fromJson(Map<String, dynamic> json) =>
      _$MarketingRequestFromJson(json);
}

/// ==========================
/// 🔹 Upload File Response Model
/// ==========================

@freezed
class UploadFileResponse with _$UploadFileResponse {
  const factory UploadFileResponse({
    @JsonKey(name: 'OriginalFileName') required String originalFileName,

    @JsonKey(name: 'SavedFileName') required String savedFileName,

    @JsonKey(name: 'FilePath') required String filePath,

    @JsonKey(name: 'FileSize') required int fileSize,

    @JsonKey(name: 'ContentType') required String contentType,

    @JsonKey(name: 'UploadTime') required DateTime uploadTime,
  }) = _UploadFileResponse;

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);
}

/// ==========================
/// 🔹 Detail Marketing Report Response Model
/// ==========================

@freezed
class DetailMarketingReportResponse with _$DetailMarketingReportResponse {
  const factory DetailMarketingReportResponse({
    @JsonKey(name: 'dailyData') required DetailMarketingDailyData dailyData,

    @JsonKey(name: 'dailyFileData')
    required List<MarketingDailyFile> dailyFileData,
  }) = _DetailMarketingReportResponse;

  factory DetailMarketingReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailMarketingReportResponseFromJson(json);
}

@freezed
class DetailMarketingDailyData with _$DetailMarketingDailyData {
  const factory DetailMarketingDailyData({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'DateReport') String? dateReport,
    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'Results') String? results,
    @JsonKey(name: 'PlanNextDay') String? planNextDay,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'UserReport') int? employeeID,
  }) = _DetailMarketingDailyData;

  factory DetailMarketingDailyData.fromJson(Map<String, dynamic> json) =>
      _$DetailMarketingDailyDataFromJson(json);
}

@freezed
class MarketingDailyFile with _$MarketingDailyFile {
  const factory MarketingDailyFile({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'FileName') required String fileName,
    @JsonKey(name: 'DailyReportID') required int dailyReportId,
    @JsonKey(name: 'PathServer') required String pathServer,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _MarketingDailyFile;

  factory MarketingDailyFile.fromJson(Map<String, dynamic> json) =>
      _$MarketingDailyFileFromJson(json);
}

/// ==========================
/// 🔹 LXCP Request Model
/// ==========================

@freezed
class ReportLXCPRequest with _$ReportLXCPRequest {
  const factory ReportLXCPRequest({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') required int employeeId,
    @JsonKey(name: 'DateReport') required String dateReport,
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
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ReportLXCPRequest;

  factory ReportLXCPRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportLXCPRequestFromJson(json);
}

/// ==========================
/// 🔹 LXCP Response Model
/// ==========================

@freezed
class ReportLXCPResponse with _$ReportLXCPResponse {
  const factory ReportLXCPResponse({
    int? status,
    String? message,
    ReportLXCPData? data,
    String? error,
  }) = _ReportLXCPResponse;

  factory ReportLXCPResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportLXCPResponseFromJson(json);
}

@freezed
class ReportLXCPData with _$ReportLXCPData {
  const factory ReportLXCPData({
    @Default([]) List<TechnicalReport> technical,
    @Default([]) List<HrReportItem> dataFilm,
    @Default([]) List<HrReportItem> dataDriver,
    @Default([]) List<HrReportItem> hrAll,
  }) = _ReportLXCPData;

  factory ReportLXCPData.fromJson(Map<String, dynamic> json) =>
      _$ReportLXCPDataFromJson(json);
}

@freezed
class TechnicalReport with _$TechnicalReport {
  const factory TechnicalReport({
    @JsonKey(name: 'UserID') int? userId,
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
    @JsonKey(name: 'TotalDayActual') double? totalDayActual,
  }) = _TechnicalReport;

  factory TechnicalReport.fromJson(Map<String, dynamic> json) =>
      _$TechnicalReportFromJson(json);
}

@freezed
class HrReportItem with _$HrReportItem {
  const factory HrReportItem({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
  }) = _HrReportItem;

  factory HrReportItem.fromJson(Map<String, dynamic> json) =>
      _$HrReportItemFromJson(json);
}

@freezed
class FilmDetailResponse with _$FilmDetailResponse {
  const factory FilmDetailResponse({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'RequestResult') bool? requestResult,
  }) = _FilmDetailResponse;

  factory FilmDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailResponseFromJson(json);
}

@freezed
class DetailLXCPReportResponse with _$DetailLXCPReportResponse {
  const factory DetailLXCPReportResponse({
    @JsonKey(name: 'ID') int? id,
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

    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _DetailLXCPReportResponse;

  factory DetailLXCPReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailLXCPReportResponseFromJson(json);
}


@freezed
class DetailSaleReportResponse with _$DetailSaleReportResponse {
  const factory DetailSaleReportResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') required int customerId,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'ContacID') required int contacId,

    @JsonKey(name: 'DateStart') required DateTime dateStart,
    @JsonKey(name: 'DateEnd') required DateTime dateEnd,

    @JsonKey(name: 'Telesale') int? telesale,
    @JsonKey(name: 'Visit') int? visit,
    @JsonKey(name: 'Demo') int? demo,

    @JsonKey(name: 'Result') required String result,
    @JsonKey(name: 'ProblemBacklog') required String problemBacklog,
    @JsonKey(name: 'PlanNext') required String planNext,
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'BigAccount') required bool bigAccount,
    @JsonKey(name: 'GroupType') required int groupType,

    @JsonKey(name: 'Content') required String content,

    @JsonKey(name: 'UserLoginID') int? userLoginId,

    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'CreatedBy') required String createdBy,

    @JsonKey(name: 'Month') required int month,
    @JsonKey(name: 'Year') required int year,

    @JsonKey(name: 'EndUser') String? endUser,

    @JsonKey(name: 'DeleteFlag') required int deleteFlag,
    @JsonKey(name: 'Confirm') required bool confirm,

    @JsonKey(name: 'ProductOfCustomer') required String productOfCustomer,
    @JsonKey(name: 'RequestOfCustomer') String? requestOfCustomer,

    @JsonKey(name: 'ProjectID') required int projectId,
    @JsonKey(name: 'FirmBaseID') required int firmBaseId,
    @JsonKey(name: 'ProjectTypeBaseID') required int projectTypeBaseId,

    @JsonKey(name: 'SaleOpportunity') required bool saleOpportunity,
    @JsonKey(name: 'WarehouseID') required int warehouseId,
  }) = _DetailSaleReportResponse;

  factory DetailSaleReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailSaleReportResponseFromJson(json);
}
@freezed
class SaleProjectResponse with _$SaleProjectResponse {
  const factory SaleProjectResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') required int customerId,

    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'ProjectShortName') required String projectShortName,

    @JsonKey(name: 'ProjectStatus') required int projectStatus,

    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,

    @JsonKey(name: 'Note') required String note,

    @JsonKey(name: 'IsApproved') required bool isApproved,
    @JsonKey(name: 'ContactID') required int contactId,

    @JsonKey(name: 'PO') required String po,

    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'ListCostID') int? listCostId,

    @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
    @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,

    @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
    @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,

    @JsonKey(name: 'EU') String? eu,
    @JsonKey(name: 'ProjectManager') String? projectManager,

    @JsonKey(name: 'CurrentState') int? currentState,
    @JsonKey(name: 'Priotity') int? priority,

    @JsonKey(name: 'PODate') DateTime? poDate,

    @JsonKey(name: 'EndUser') String? endUser,

    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,

    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,

    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'TypeProject') int? typeProject,

    @JsonKey(name: 'IsDeleted') required bool isDeleted,
  }) = _SaleProjectResponse;

  factory SaleProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SaleProjectResponseFromJson(json);
}

@freezed
class CustomerPartResponse with _$CustomerPartResponse {
  const factory CustomerPartResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'PartName') required String partName,
    @JsonKey(name: 'PartCode') required String partCode,
    @JsonKey(name: 'CustomerID') required int customerId,
    @JsonKey(name: 'STT') required int stt,
  }) = _CustomerPartResponse;

  factory CustomerPartResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerPartResponseFromJson(json);
}

@freezed
class TypeTeamSaleResponse with _$TypeTeamSaleResponse {
  const factory TypeTeamSaleResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'MainIndex') required String mainIndex,
    @JsonKey(name: 'MainGroup') required int mainGroup,

    @JsonKey(name: 'Goal0') double? goal0,
    @JsonKey(name: 'Result0') double? result0,
    @JsonKey(name: 'ACCP0') double? accp0,

    @JsonKey(name: 'Goal1') double? goal1,
    @JsonKey(name: 'Result1') double? result1,
    @JsonKey(name: 'ACCP1') double? accp1,

    @JsonKey(name: 'Goal2') double? goal2,
    @JsonKey(name: 'Result2') double? result2,
    @JsonKey(name: 'ACCP2') double? accp2,

    @JsonKey(name: 'ACCP') required double accp,
    @JsonKey(name: 'Goal') required double goal,
    @JsonKey(name: 'Result') required double result,

    @JsonKey(name: 'ConvertID') int? convertId,

    @JsonKey(name: 'MainIndex1') String? mainIndex1,
    @JsonKey(name: 'MainIndex2') String? mainIndex2,
  }) = _TypeTeamSaleResponse;

  factory TypeTeamSaleResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeTeamSaleResponseFromJson(json);
}

@freezed
class CustomerResponse with _$CustomerResponse {
  const factory CustomerResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerName') required String customerName,
    @JsonKey(name: 'CustomerCode') required String customerCode,
  }) = _CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
}

@freezed
class FirmBaseResponse with _$FirmBaseResponse {
  const factory FirmBaseResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'FirmCode') required String firmCode,
    @JsonKey(name: 'FirmName') required String firmName,
  }) = _FirmBaseResponse;

  factory FirmBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FirmBaseResponseFromJson(json);
}

@freezed
class TypeProjectResponse with _$TypeProjectResponse {
  const factory TypeProjectResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'ProjectTypeCode') required String projectTypeCode,
    @JsonKey(name: 'ProjectTypeName') required String projectTypeName,
  }) = _TypeProjectResponse;

  factory TypeProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeProjectResponseFromJson(json);
}

@freezed
class CustomerContactResponse with _$CustomerContactResponse {
  const factory CustomerContactResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') required int customerId,
    @JsonKey(name: 'ContactName') required String contactName,
    @JsonKey(name: 'ContactPhone') String? contactPhone,
    @JsonKey(name: 'ContactEmail') String? contactEmail,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'CustomerTeam') String? customerTeam,
    @JsonKey(name: 'CustomerPart') String? customerPart,
    @JsonKey(name: 'CustomerPosition') String? customerPosition,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
  }) = _CustomerContactResponse;

  factory CustomerContactResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactResponseFromJson(json);
}

@freezed
class SaleRequest with _$SaleRequest {
  const factory SaleRequest({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'projectId') required int projectId,
    @JsonKey(name: 'customerId') required int customerId,
    @JsonKey(name: 'warehouseId') required String warehouseId,
    @JsonKey(name: 'projectStatusBaseId') required int projectStatusBaseId,
    @JsonKey(name: 'userId') required int userId,

    @JsonKey(name: 'dateStart') required DateTime dateStart,
    @JsonKey(name: 'dateEnd') required DateTime dateEnd,

    @JsonKey(name: 'firmId') required int firmId,
    @JsonKey(name: 'projectTypeId') required int projectTypeId,
    @JsonKey(name: 'contactId') required int contactId,
    @JsonKey(name: 'groupTypeId') required int groupTypeId,

    @JsonKey(name: 'partId') int? partId,

    @JsonKey(name: 'bigAccount') required bool bigAccount,
    @JsonKey(name: 'saleOpportunity') required bool saleOpportunity,

    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'result') required String result,
    @JsonKey(name: 'problemBacklog') required String problemBacklog,
    @JsonKey(name: 'planNext') required String planNext,
    @JsonKey(name: 'productOfCustomer') required String productOfCustomer,

    @JsonKey(name: 'projectStatusOld') required int projectStatusOld,
    @JsonKey(name: 'employeeId') required int employeeId,

    @JsonKey(name: 'dateStatusLog') required DateTime dateStatusLog,
  }) = _SaleRequest;

  factory SaleRequest.fromJson(Map<String, dynamic> json) =>
      _$SaleRequestFromJson(json);
}

@freezed
class TeamSaleResponse with _$TeamSaleResponse {
  const factory TeamSaleResponse({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'STT') required int stt,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'IsDeleted') required int isDeleted,
    @JsonKey(name: 'ParentID') required int parentId,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'UpdatedDate') required DateTime updatedDate,
  }) = _TeamSaleResponse;

  factory TeamSaleResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamSaleResponseFromJson(json);
}

@freezed
class SaleReportResponse with _$SaleReportResponse {
  const factory SaleReportResponse({
    required int status,
    required String message,
    required SaleReportData data,
    required String error,
  }) = _SaleReportResponse;

  factory SaleReportResponse.fromJson(Map<String, dynamic> json) =>
      _$SaleReportResponseFromJson(json);
}

@freezed
class SaleReportData with _$SaleReportData {
  const factory SaleReportData({
    required List<SaleReportItem> data,
    required List<SaleReportTotalPage> totalPage,
  }) = _SaleReportData;

  factory SaleReportData.fromJson(Map<String, dynamic> json) =>
      _$SaleReportDataFromJson(json);
}

@freezed
class SaleReportItem with _$SaleReportItem {
  const factory SaleReportItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') required int customerId,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'ContacID') required int contacId,

    @JsonKey(name: 'DateStart') required DateTime dateStart,
    @JsonKey(name: 'DateEnd') required DateTime dateEnd,

    @JsonKey(name: 'Telesale') int? telesale,
    @JsonKey(name: 'Visit') int? visit,
    @JsonKey(name: 'Demo') int? demo,

    @JsonKey(name: 'Result') String? result,
    @JsonKey(name: 'ProblemBacklog') String? problemBacklog,
    @JsonKey(name: 'PlanNext') String? planNext,
    @JsonKey(name: 'Note') String? note,

    @JsonKey(name: 'BigAccount') required bool bigAccount,
    @JsonKey(name: 'GroupType') required int groupType,

    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'UserLoginID') required int userLoginId,

    @JsonKey(name: 'CreatedDate') required DateTime createdDate,
    @JsonKey(name: 'CreatedBy') required String createdBy,

    @JsonKey(name: 'Month') required int month,
    @JsonKey(name: 'Year') required int year,

    @JsonKey(name: 'EndUser') int? endUser,

    @JsonKey(name: 'DeleteFlag') required int deleteFlag,
    @JsonKey(name: 'Confirm') required bool confirm,

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
    @JsonKey(name: 'ProjectTypeName') String? projectTypeName,
  }) = _SaleReportItem;

  factory SaleReportItem.fromJson(Map<String, dynamic> json) =>
      _$SaleReportItemFromJson(json);
}

@freezed
class SaleReportTotalPage with _$SaleReportTotalPage {
  const factory SaleReportTotalPage({
    @JsonKey(name: 'TotalPage') required int totalPage,
  }) = _SaleReportTotalPage;

  factory SaleReportTotalPage.fromJson(Map<String, dynamic> json) =>
      _$SaleReportTotalPageFromJson(json);
}