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

/// Item cho danh sách duyệt trong detail.
@freezed
class WorkRequirementApproveItem with _$WorkRequirementApproveItem {
  const factory WorkRequirementApproveItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
    @JsonKey(name: 'Step') int? step,
    @JsonKey(name: 'StepName') String? stepName,
    @JsonKey(name: 'IsApproved') int? isApproved,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'ApprovedActualID') int? approvedActualId,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'ContentLog') String? contentLog,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'EmployeeActualName') String? employeeActualName,
    @JsonKey(name: 'EmployeeName') String? employeeName,
  }) = _WorkRequirementApproveItem;

  factory WorkRequirementApproveItem.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementApproveItemFromJson(json);
}

/// File đính kèm trong detail.
@freezed
class WorkRequirementFileItem with _$WorkRequirementFileItem {
  const factory WorkRequirementFileItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'FilePath') String? filePath,
    @JsonKey(name: 'FileType') String? fileType,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
  }) = _WorkRequirementFileItem;

  factory WorkRequirementFileItem.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementFileItemFromJson(json);
}

/// File request dùng khi submit (tương tự MarketingFileRequest).
/// ID=0: file mới upload; ID>0: file đã tồn tại trên server.
class WorkRequirementFileRequest {
  const WorkRequirementFileRequest({
    required this.id,
    required this.fileName,
    required this.fileNameOrigin,
    required this.filePath,
    required this.extension,
    required this.jobRequirementId,
  });

  final int id;
  final String fileName;
  final String fileNameOrigin;
  final String filePath;
  final String extension;
  final int jobRequirementId;

  Map<String, dynamic> toJson() => {
        'ID': id,
        'FileName': fileName,
        'FilePath': filePath,
        'FileType': extension,
        'JobRequirementID': jobRequirementId,
      };
}

/// Chi tiết đề mục trong detail.
@freezed
class WorkRequirementDetailCategory with _$WorkRequirementDetailCategory {
  const factory WorkRequirementDetailCategory({
    @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
    @JsonKey(name: 'RequestContent') String? requestContent,
    @JsonKey(name: 'RequestedBy') String? requestedBy,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Quantity') String? quantity,
    @JsonKey(name: 'Quality') String? quality,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'DeadlineDate') String? deadlineDate,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'RequestContentNote') String? requestContentNote,
  }) = _WorkRequirementDetailCategory;

  factory WorkRequirementDetailCategory.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementDetailCategoryFromJson(json);
}

/// Response chi tiết từ API /jobrequirement/details/{id}.
@freezed
class WorkRequirementDetailData with _$WorkRequirementDetailData {
  const factory WorkRequirementDetailData({
    @JsonKey(name: 'details') List<WorkRequirementDetailResponse>? details,
    @JsonKey(name: 'approves') List<WorkRequirementApproveItem>? approves,
    @JsonKey(name: 'files') List<WorkRequirementFileItem>? files,
    @JsonKey(name: 'detailsCategory') List<WorkRequirementDetailCategory>? detailsCategory,
  }) = _WorkRequirementDetailData;

  factory WorkRequirementDetailData.fromJson(Map<String, dynamic> json) =>
      _$WorkRequirementDetailDataFromJson(json);
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
