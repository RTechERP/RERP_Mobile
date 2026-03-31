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
  });

  final DateTime timeStart;
  final DateTime endTime;
  final int typeId;
  final int location;
  final bool overnight;
  final String reason;
  final int? projectId;

  @override
  String toString() =>
      'OvertimeAddSlip(timeStart: $timeStart, endTime: $endTime, typeId: $typeId, '
      'location: $location, overnight: $overnight, projectId: $projectId, reason: $reason)';
}