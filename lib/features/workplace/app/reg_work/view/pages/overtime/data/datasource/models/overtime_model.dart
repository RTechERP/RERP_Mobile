import 'package:freezed_annotation/freezed_annotation.dart';

part 'overtime_model.freezed.dart';
part 'overtime_model.g.dart';


@freezed
class OvertimeItem with _$OvertimeItem {
  const factory OvertimeItem({
    @JsonKey(name: 'ID') required int id,
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
    @JsonKey(name: 'ApprovedID') int? approvedId,
  }) = _OvertimeItem;

  factory OvertimeItem.fromJson(Map<String, dynamic> json) =>
      _$OvertimeItemFromJson(json);
}

@freezed
class ApproverItem with _$ApproverItem {
  const factory ApproverItem({
    @JsonKey(name: 'ID') required int id,
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
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ApproverItem;

  factory ApproverItem.fromJson(Map<String, dynamic> json) =>
      _$ApproverItemFromJson(json);
}
@freezed
class OvertimeProject with _$OvertimeProject {
  const factory OvertimeProject({
    @JsonKey(name: 'ID') required int id,
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
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _OvertimeProject;

  factory OvertimeProject.fromJson(Map<String, dynamic> json) =>
      _$OvertimeProjectFromJson(json);
}

@freezed
class OvertimeType with _$OvertimeType {
  const factory OvertimeType({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'TypeCode') String? typeCode,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'Ratio') double? ratio,
    @JsonKey(name: 'Cost') double? cost,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _OvertimeType;

  factory OvertimeType.fromJson(Map<String, dynamic> json) =>
      _$OvertimeTypeFromJson(json);
}

@freezed
class OvertimeDetailItem with _$OvertimeDetailItem {
  const factory OvertimeDetailItem({
    @JsonKey(name: 'ID') int? id,
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
    @JsonKey(name: 'DecilineApproveSenior') int? declineApproveSenior,
  }) = _OvertimeDetailItem;

  factory OvertimeDetailItem.fromJson(Map<String, dynamic> json) =>
      _$OvertimeDetailItemFromJson(json);
}

/// Liên kết ca làm thêm với hạng mục công việc (bảng trung gian
/// `EmployeeOvertimeProjectItem`).
@freezed
class OvertimeProjectItemLink with _$OvertimeProjectItemLink {
  const factory OvertimeProjectItemLink({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
    @JsonKey(name: 'ProjectItemID') int? projectItemId,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
  }) = _OvertimeProjectItemLink;

  factory OvertimeProjectItemLink.fromJson(Map<String, dynamic> json) =>
      _$OvertimeProjectItemLinkFromJson(json);
}

/// File đính kèm của phiếu làm thêm.
@freezed
class OvertimeFileItem with _$OvertimeFileItem {
  const factory OvertimeFileItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeOvertimeID') int? employeeOvertimeId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'OriginPath') String? originPath,
    @JsonKey(name: 'ServerPath') String? serverPath,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _OvertimeFileItem;

  factory OvertimeFileItem.fromJson(Map<String, dynamic> json) =>
      _$OvertimeFileItemFromJson(json);
}
/// Toàn bộ response của `GET /EmployeeOverTime/get-by-id`.
///
/// Gồm phiếu làm thêm, file đính kèm và liên kết hạng mục công việc.
@freezed
class OvertimeDetailResponse with _$OvertimeDetailResponse {
  const factory OvertimeDetailResponse({
    @JsonKey(name: 'employeeOverTime') OvertimeDetailItem? employeeOvertime,
    @JsonKey(name: 'overTimeFile') OvertimeFileItem? overTimeFile,
    @JsonKey(name: 'overTimeProjectItem')
    OvertimeProjectItemLink? overTimeProjectItem,
  }) = _OvertimeDetailResponse;

  factory OvertimeDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OvertimeDetailResponseFromJson(json);
}

/// Hạng mục công việc (`ProjectItem`) của một dự án.
///
/// Lấy từ `GET /DailyReportTech/get-project-item-by-user` — chỉ trả về các hạng
/// mục mà nhân viên đang được giao việc (mặc định `status = 2`).
@freezed
class OvertimeProjectItem with _$OvertimeProjectItem {
  const factory OvertimeProjectItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Mission') String? mission,
    @JsonKey(name: 'PercentageActual') double? percentageActual,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'TotalDayPlan') double? totalDayPlan,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsCheckedToday') int? isCheckedToday,
  }) = _OvertimeProjectItem;

  factory OvertimeProjectItem.fromJson(Map<String, dynamic> json) =>
      _$OvertimeProjectItemFromJson(json);
}

/// Một khoảng thời gian làm thêm khi tạo mới phiếu (không freezed — dùng trong event/form).
class OvertimeAddSlip {
  const OvertimeAddSlip({
    required this.timeStart,
    required this.endTime,
    required this.typeId,
    required this.location,
    required this.overnight,
    required this.reason,
    this.projectId,
    this.projectItemId,
  });

  final DateTime timeStart;
  final DateTime endTime;
  final int typeId;
  final int location;
  final bool overnight;
  final String reason;
  final int? projectId;

  /// Hạng mục công việc mà ca làm thêm này gắn vào (`ProjectItemID`).
  final int? projectItemId;

  @override
  String toString() =>
      'OvertimeAddSlip(timeStart: $timeStart, endTime: $endTime, typeId: $typeId, '
      'location: $location, overnight: $overnight, projectId: $projectId, '
      'projectItemId: $projectItemId, reason: $reason)';
}

@freezed
class FillApproverItem with _$FillApproverItem {
  const factory FillApproverItem({
    @JsonKey(name: 'ApproveID') required int approveId,
  }) = _FillApproverItem;

  factory FillApproverItem.fromJson(Map<String, dynamic> json) =>
      _$FillApproverItemFromJson(json);
}
