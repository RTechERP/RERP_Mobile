// ignore_for_file: type=lint, unused_element, deprecated_member_use,
// deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters,
// unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named,
// prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target,
// unnecessary_question_mark

import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_plan_model.freezed.dart';
part 'week_plan_model.g.dart';

@freezed
class WeekPlanTaskItem with _$WeekPlanTaskItem {
  const factory WeekPlanTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'TaskName') String? taskName,
    @JsonKey(name: 'TaskContent') String? taskContent,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
    @JsonKey(name: 'PercentItem') double? percentItem,
    @JsonKey(name: 'PercentageActual') double? percentageActual,
    @JsonKey(name: 'Progress') double? progress,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'TypeProjectItem') int? typeProjectItem,
    @JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
    @JsonKey(name: 'UpdatedDateActual') DateTime? updatedDateActual,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatorID') int? creatorId,
    @JsonKey(name: 'CreatorName') String? creatorName,
    @JsonKey(name: 'AssigneeID') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'AsigneeEmployeeID') int? asigneeEmployeeId,
    @JsonKey(name: 'AsigneeEmployeeFullName') String? asigneeEmployeeFullName,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsUpdateLate') bool? isUpdateLate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsPersonalProject') bool? isPersonalProject,
    @JsonKey(name: 'IsAdditional') bool? isAdditional,
    @JsonKey(name: 'IsCheckIn') bool? isCheckedIn,
    @JsonKey(name: 'CheckInTime') DateTime? checkInTime,
    @JsonKey(name: 'TaskComplexity') int? taskComplexity,
    @JsonKey(name: 'TaskComplexityText') String? taskComplexityText,
    @JsonKey(name: 'PercentOverTime') double? percentOverTime,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'ParentCode') String? parentCode,
    @JsonKey(name: 'ParentTitle') String? parentTitle,
    @JsonKey(name: 'SecondEmployeeID') int? secondEmployeeId,
    @JsonKey(name: 'SecondEmployeeFullName') String? secondEmployeeFullName,
    @JsonKey(name: 'SecondEmployeeType') int? secondEmployeeType,
    @JsonKey(name: 'ReviewDiscription') String? reviewDiscription,
    @JsonKey(name: 'ProjectTaskTypeName') String? projectTaskTypeName,
    @JsonKey(name: 'DepartmentAssignerID') int? departmentAssignerId,
    @JsonKey(name: 'DepartmentAssigneeID') int? departmentAssigneeId,
    @JsonKey(name: 'DepartmentAssignerName') String? departmentAssignerName,
    @JsonKey(name: 'DepartmentAssigneeName') String? departmentAssigneeName,
    @JsonKey(name: 'ProjectTaskColor') String? projectTaskColor,
    @JsonKey(name: 'TotalActualHours') double? totalActualHours,
    @JsonKey(name: 'ReviewCompletionRating') double? reviewCompletionRating,
    @JsonKey(name: 'IsCheck') bool? isCheck,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'ProjectTaskTypeID') int? projectTaskTypeId,
    @JsonKey(name: 'ApprovalStatus') int? approvalStatus,
    @JsonKey(name: 'Priority') int? priority,
    @JsonKey(name: 'PriorityText') String? priorityText,
    @JsonKey(name: 'EstimatedTime') double? estimatedTime,
    @JsonKey(name: 'Description') String? description,
  }) = _WeekPlanTaskItem;

  factory WeekPlanTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanTaskItemFromJson(json);
}

@freezed
class TaskTypeItem with _$TaskTypeItem {
  const factory TaskTypeItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Color') String? color,
  }) = _TaskTypeItem;

  factory TaskTypeItem.fromJson(Map<String, dynamic> json) =>
      _$TaskTypeItemFromJson(json);
}

@freezed
class ProjectTaskItem with _$ProjectTaskItem {
  const factory ProjectTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _ProjectTaskItem;

  factory ProjectTaskItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectTaskItemFromJson(json);
}

@freezed
class ParentProjectTaskItem with _$ParentProjectTaskItem {
  const factory ParentProjectTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'EmployeeCreateID') int? employeeCreateID,
  }) = _ParentProjectTaskItem;

  factory ParentProjectTaskItem.fromJson(Map<String, dynamic> json) =>
      _$ParentProjectTaskItemFromJson(json);
}

@freezed
class ProjectTypeItem with _$ProjectTypeItem {
  const factory ProjectTypeItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectTypeCode') String? projectTypeCode,
    @JsonKey(name: 'ProjectTypeName') String? projectTypeName,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'RootFolder') String? rootFolder,
    @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsHide') bool? isHide,
  }) = _ProjectTypeItem;

  factory ProjectTypeItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeItemFromJson(json);
}

@freezed
class WeekPlanSubTaskItem with _$WeekPlanSubTaskItem {
  const factory WeekPlanSubTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Content') String? content,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'AssigneeID') int? assigneeId,
    @JsonKey(name: 'AssigneeName') String? assigneeName,
    @JsonKey(name: 'AssignerID') int? assignerId,
    @JsonKey(name: 'AssignerName') String? assignerName,
    @JsonKey(name: 'Complexity') int? complexity,
    @JsonKey(name: 'WorkType') int? workType,
    @JsonKey(name: 'WorkTypeName') String? workTypeName,
    @JsonKey(name: 'TaskCategory') int? taskCategory,
    @JsonKey(name: 'TaskCategoryName') String? taskCategoryName,
  }) = _WeekPlanSubTaskItem;

  factory WeekPlanSubTaskItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanSubTaskItemFromJson(json);
}

@freezed
class WeekPlanAttachmentItem with _$WeekPlanAttachmentItem {
  const factory WeekPlanAttachmentItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'FileSize') int? fileSize,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'UploadedAt') DateTime? uploadedAt,
  }) = _WeekPlanAttachmentItem;

  factory WeekPlanAttachmentItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanAttachmentItemFromJson(json);
}

@freezed
class WeekPlanIncidentItem with _$WeekPlanIncidentItem {
  const factory WeekPlanIncidentItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'Severity') int? severity,
    @JsonKey(name: 'SeverityName') String? severityName,
    @JsonKey(name: 'ReportedAt') DateTime? reportedAt,
  }) = _WeekPlanIncidentItem;

  factory WeekPlanIncidentItem.fromJson(Map<String, dynamic> json) =>
      _$WeekPlanIncidentItemFromJson(json);
}


@freezed
class EmployeeTaskItem with _$EmployeeTaskItem {
  const factory EmployeeTaskItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHDID,
    @JsonKey(name: 'ChuVuID') int? chuVuID,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'AnhCBNV') String? anhCBNV,
    @JsonKey(name: 'ChucVuHD') String? chucVuHD,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DvBHXH') String? dvBHXH,
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
    @JsonKey(name: 'NguoiLienHeKhiCan2') String? nguoiLienHeKhiCan2,
    @JsonKey(name: 'MoiQuanHe2') String? moiQuanHe2,
    @JsonKey(name: 'SDTNguoiThan2') String? sdtNguoiThan2,
  }) = _EmployeeTaskItem;

  factory EmployeeTaskItem.fromJson(Map<String, dynamic> json) =>
      _$EmployeeTaskItemFromJson(json);
}

@freezed
class AttendanceTaskResponse with _$AttendanceTaskResponse {
  const factory AttendanceTaskResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectTaskID') int? projectTaskId,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsCheck') bool? isCheck,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Date') DateTime? date,
  }) = _AttendanceTaskResponse;

  factory AttendanceTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTaskResponseFromJson(json);
}

@freezed
class SaveResponseWeekPlan with _$SaveResponseWeekPlan {
  const factory SaveResponseWeekPlan({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
    @JsonKey(name: 'PercentItem') double? percentItem,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'TotalDayActual') double? totalDayActual,
    @JsonKey(name: 'ItemLate') int? itemLate,
    @JsonKey(name: 'TimeSpan') double? timeSpan,
    @JsonKey(name: 'TypeProjectItem') int? typeProjectItem,
    @JsonKey(name: 'PercentageActual') double? percentageActual,
    @JsonKey(name: 'EmployeeIDRequest') int? employeeIdRequest,
    @JsonKey(name: 'UpdatedDateActual') DateTime? updatedDateActual,
    @JsonKey(name: 'IsApproved') int? isApproved,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsUpdateLate') bool? isUpdateLate,
    @JsonKey(name: 'ReasonLate') String? reasonLate,
    @JsonKey(name: 'UpdatedDateReasonLate')
    DateTime? updatedDateReasonLate,
    @JsonKey(name: 'IsApprovedLate') bool? isApprovedLate,
    @JsonKey(name: 'EmployeeRequestID') int? employeeRequestID,
    @JsonKey(name: 'EmployeeRequestName') String? employeeRequestName,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'EmployeeCreateID') int? employeeCreateID,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'IsPersonalProject') bool? isPersonalProject,
    @JsonKey(name: 'IsAdditional') bool? isAdditional,
    @JsonKey(name: 'TaskComplexity') int? taskComplexity,
    @JsonKey(name: 'PercentOverTime') double? percentOverTime,
    @JsonKey(name: 'DescriptionSolution') String? descriptionSolution,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'ProjectTaskTypeID') int? projectTaskTypeID,
    @JsonKey(name: 'ProjectTaskResult') String? projectTaskResult,
    @JsonKey(name: 'Priority') int? priority,
    @JsonKey(name: 'EstimatedTime') double? estimatedTime,
    @JsonKey(name: 'NeedApprove') bool? needApprove,
  }) = _SaveResponseWeekPlan;

  factory SaveResponseWeekPlan.fromJson(Map<String, dynamic> json) =>
      _$SaveResponseWeekPlanFromJson(json);
}

@freezed
class UploadAttachmentResponse with _$UploadAttachmentResponse {
  const factory UploadAttachmentResponse({
    @JsonKey(name: 'OriginalFileName') required String originalFileName,

    @JsonKey(name: 'SavedFileName') required String savedFileName,

    @JsonKey(name: 'FilePath') required String filePath,

    @JsonKey(name: 'FileSize') required int fileSize,

    @JsonKey(name: 'ContentType') required String contentType,

    @JsonKey(name: 'UploadTime') required DateTime uploadTime,
  }) = _UploadAttachmentResponse;

  factory UploadAttachmentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadAttachmentResponseFromJson(json);
}

@freezed
class FileWeekPlanResponse with _$FileWeekPlanResponse {
  const factory FileWeekPlanResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectTaskID') int? projectTaskId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'EmployeeUploadID') int? employeeUploadID,
    @JsonKey(name: 'UploadedDate') DateTime? uploadedDate,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _FileWeekPlanResponse;

  factory FileWeekPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$FileWeekPlanResponseFromJson(json);
}