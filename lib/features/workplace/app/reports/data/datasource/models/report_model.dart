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
    @JsonKey(name: 'DateReport') required String dateReport, // "2026-02-16"
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
    @JsonKey(name: 'CreatedDate')
    required DateTime createdDate, // "2026-02-12T15:32:48.303"
    @JsonKey(name: 'Type') required int type,
    @JsonKey(name: 'ReportLate') required int reportLate,
    @JsonKey(name: 'OldProjectID') required int oldProjectId,
    @JsonKey(name: 'TotalHours') required double totalHours, // 8.00
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
class CopyHrResponse with _$CopyHrResponse {
  const factory CopyHrResponse({
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
    @JsonKey(name: 'Note') required String note,}) = _CopyHrResponse;


  factory CopyHrResponse.fromJson(Map<String, dynamic> json) =>
      _$CopyHrResponseFromJson(json);
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
class DetailMarketingReportResponse
    with _$DetailMarketingReportResponse {
  const factory DetailMarketingReportResponse({
    @JsonKey(name: 'dailyData')
    required DetailMarketingDailyData dailyData,

    @JsonKey(name: 'dailyFileData')
    required List<MarketingDailyFile> dailyFileData,
  }) = _DetailMarketingReportResponse;

  factory DetailMarketingReportResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
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

  factory DetailMarketingDailyData.fromJson(
      Map<String, dynamic> json,
      ) =>
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
    @JsonKey(name: 'CreatedBy')  String? createdBy,
    @JsonKey(name: 'UpdatedBy')  String? updatedBy,
    @JsonKey(name: 'CreatedDate')  DateTime? createdDate,
  }) = _MarketingDailyFile;

  factory MarketingDailyFile.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$MarketingDailyFileFromJson(json);
}