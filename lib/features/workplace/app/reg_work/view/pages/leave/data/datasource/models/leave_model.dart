import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

@freezed
class LeaveItem with _$LeaveItem {
  const factory LeaveItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeIsReal') int? typeIsReal,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsCancelTP') bool? isCancelTP,
    @JsonKey(name: 'IsCancelHR') bool? isCancelHR,
    @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'DateCancel') DateTime? dateCancel,
    @JsonKey(name: 'DeleteFlag') bool? deleteFlag,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'EmployeeOnLeavePhaseID') int? employeeOnLeavePhaseId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'IDApprovedTP') int? idApprovedTP,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
    @JsonKey(name: 'TypeHR') String? typeHR,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
  }) = _LeaveItem;

  factory LeaveItem.fromJson(Map<String, dynamic> json) =>
      _$LeaveItemFromJson(json);
}

@freezed
class LeaveTimeItem with _$LeaveTimeItem {
  const factory LeaveTimeItem({
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'TotalToday') int? totalDay,
    @JsonKey(name: 'TotalDayApproved') int? totalDayApproved,
    @JsonKey(name: 'TotalDayOnleaveActual') int? totalDayOnleaveActual,
    @JsonKey(name: 'TotalDayRemain') int? totalDayRemain,
    @JsonKey(name: 'TotalDayUnApproved') int? totalDayUnApproved,
  }) = _LeaveTimeItem;

  factory LeaveTimeItem.fromJson(Map<String, dynamic> json) =>
      _$LeaveTimeItemFromJson(json);
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

/// Một phiếu nghỉ khi tạo đơn (gửi API lần lượt).
class LeaveAddSlip {
  const LeaveAddSlip({
    required this.date,
    required this.timeRegister,
    required this.type,
    required this.reason,
  });

  final DateTime date;
  final int timeRegister;
  final int type;
  final String reason;
}
