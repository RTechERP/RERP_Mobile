// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_requirement_model.freezed.dart';
part 'work_requirement_model.g.dart';

@freezed
class WorkRequirementItem with _$WorkRequirementItem {
  const factory WorkRequirementItem({
    @JsonKey(name: 'RowIndex') int? rowIndex,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'NumberRequest') String? numberRequest,
    @JsonKey(name: 'DateRequest') DateTime? dateRequest,
    @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'CoordinationDepartmentID')
    int? coordinationDepartmentID,
    @JsonKey(name: 'RequiredDepartmentID')
    int? requiredDepartmentID,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
    @JsonKey(name: 'ApprovedTBPID') int? approvedTBPID,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
    @JsonKey(name: 'ApprovedHRID') int? approvedHRID,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
    @JsonKey(name: 'EvaluateCompletion')
    String? evaluateCompletion,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'IsRequestBGDApproved')
    bool? isRequestBGDApproved,
    @JsonKey(name: 'CoordinationDepartment')
    String? coordinationDepartment,
    @JsonKey(name: 'RequiredDepartment') String? requiredDepartment,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'EmployeeDepartment')
    String? employeeDepartment,
    @JsonKey(name: 'Step') int? step,
    @JsonKey(name: 'StepApproved') int? stepApproved,
    @JsonKey(name: 'IsApproved') int? isApproved,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'FullNameApprovedTBP')
    String? fullNameApprovedTBP,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'IsRequestPriceQuote')
    bool? isRequestPriceQuote,
    @JsonKey(name: 'DepartmentID') int? departmentID,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHDID,
    @JsonKey(name: 'ChucVu') String? chucVu,
  }) = _WorkRequirementItem;

  factory WorkRequirementItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$WorkRequirementItemFromJson(json);
}

/// Item cho dropdown bộ phận.
@freezed
class WorkRequirementDepartmentItem with _$WorkRequirementDepartmentItem {
  const factory WorkRequirementDepartmentItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Code') String? code,
  }) = _WorkRequirementDepartmentItem;

  factory WorkRequirementDepartmentItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$WorkRequirementDepartmentItemFromJson(json);
}

/// Item cho dropdown TBP duyệt (người duyệt).
@freezed
class WorkRequirementApproverItem with _$WorkRequirementApproverItem {
  const factory WorkRequirementApproverItem({
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Code') String? code,
  }) = _WorkRequirementApproverItem;

  factory WorkRequirementApproverItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$WorkRequirementApproverItemFromJson(json);
}

/// Một đề mục (STT) trong form yêu cầu công việc.
class WorkRequirementDetailItem {
  const WorkRequirementDetailItem({
    required this.rowIndex,
    required this.title,
    required this.explanation,
    required this.target,
    this.note,
  });

  final int rowIndex;
  final String title;
  final String explanation;
  final String target;
  final String? note;
}

/// Response chi tiết trả về từ API save-data.
@freezed
class WorkRequirementDetailResponse with _$WorkRequirementDetailResponse {
  const factory WorkRequirementDetailResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Category') String? category,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'Target') String? target,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _WorkRequirementDetailResponse;

  factory WorkRequirementDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementDetailResponseFromJson(json);
}

/// Response trả về từ API /jobrequirement/save-data.
@freezed
class WorkRequirementSaveResponse with _$WorkRequirementSaveResponse {
  const factory WorkRequirementSaveResponse({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'NumberRequest') String? numberRequest,
    @JsonKey(name: 'DateRequest') DateTime? dateRequest,
    @JsonKey(name: 'DeadlineRequest') DateTime? deadlineRequest,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'CoordinationDepartmentID') int? coordinationDepartmentId,
    @JsonKey(name: 'RequiredDepartmentID') int? requiredDepartmentId,
    @JsonKey(name: 'ApprovedTBPID') int? approvedTBPId,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTBP,
    @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTBP,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'DateApprovedHR') DateTime? dateApprovedHR,
    @JsonKey(name: 'ApprovedHRID') int? approvedHRId,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDId,
    @JsonKey(name: 'EvaluateCompletion') String? evaluateCompletion,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsRequestBuy') bool? isRequestBuy,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsRequestBGDApproved') bool? isRequestBGDApproved,
    @JsonKey(name: 'IsRequestPriceQuote') bool? isRequestPriceQuote,
    @JsonKey(name: 'JobRequirementDetails')
        List<WorkRequirementDetailResponse>? jobRequirementDetails,
    @JsonKey(name: 'JobRequirementFiles') List<dynamic>? jobRequirementFiles,
  }) = _WorkRequirementSaveResponse;

  factory WorkRequirementSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementSaveResponseFromJson(json);
}
