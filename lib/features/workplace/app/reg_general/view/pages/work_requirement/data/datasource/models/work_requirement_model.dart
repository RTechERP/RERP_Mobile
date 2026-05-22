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