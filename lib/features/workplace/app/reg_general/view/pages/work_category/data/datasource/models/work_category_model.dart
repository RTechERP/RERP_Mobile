
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_category_model.freezed.dart';
part 'work_category_model.g.dart';
@freezed
class WorkCategoryItem with _$WorkCategoryItem {
  const factory WorkCategoryItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Status') required int status,
    @JsonKey(name: 'STT') required String stt,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'ProjectID') required int projectId,
    @JsonKey(name: 'Mission') required String mission,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'TotalDayPlan') required double totalDayPlan,
    @JsonKey(name: 'PercentItem') required double percentItem,
    @JsonKey(name: 'ParentID') required int parentId,
    @JsonKey(name: 'TotalDayActual') required double totalDayActual,
    @JsonKey(name: 'ItemLate') required int itemLate,
    @JsonKey(name: 'TimeSpan') required double timeSpan,
    @JsonKey(name: 'TypeProjectItem') required int typeProjectItem,
    @JsonKey(name: 'PercentageActual') required double percentageActual,
    @JsonKey(name: 'EmployeeIDRequest') required int employeeIdRequest,
    @JsonKey(name: 'UpdatedDateActual') DateTime? updatedDateActual,
    @JsonKey(name: 'IsApproved') required int isApproved,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'IsUpdateLate') required bool isUpdateLate,
    @JsonKey(name: 'ReasonLate') required String reasonLate,
    @JsonKey(name: 'UpdatedDateReasonLate') DateTime? updatedDateReasonLate,
    @JsonKey(name: 'IsApprovedLate') required bool isApprovedLate,
    @JsonKey(name: 'EmployeeRequestID') required int employeeRequestId,
    @JsonKey(name: 'EmployeeRequestName') String? employeeRequestName,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
    @JsonKey(name: 'Location') required String location,
    @JsonKey(name: 'EmployeeCreateID') int? employeeCreateId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'IsPersonalProject') bool? isPersonalProject,
    @JsonKey(name: 'IsAdditional') bool? isAdditional,
    @JsonKey(name: 'TaskComplexity') int? taskComplexity,
    @JsonKey(name: 'PercentOverTime') double? percentOverTime,
    @JsonKey(name: 'DescriptionSolution') String? descriptionSolution,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'FullName') required String fullName,
    @JsonKey(name: 'StatusText') required String statusText,
    @JsonKey(name: 'ProjectEmployee') required String projectEmployee,
    @JsonKey(name: 'ProjectEmployeeName') required String projectEmployeeName,
    @JsonKey(name: 'EmployeeRequest') required String employeeRequest,
    @JsonKey(name: 'IsApprovedText') required String isApprovedText,
    @JsonKey(name: 'CreatedName') required String createdName,
    @JsonKey(name: 'ProjectTypeName') required String projectTypeName,
    @JsonKey(name: 'EmployeeRequestFullName')
    required String employeeRequestFullName,
    @JsonKey(name: 'StatusUpdate') required int statusUpdate,
    @JsonKey(name: 'IsUpdateProblem') required int isUpdateProblem,
    @JsonKey(name: 'ItemLateActual') required int itemLateActual,
    @JsonKey(name: 'TotalDayExpridSoon') required int totalDayExpridSoon,
  }) = _WorkCategoryItem;

  factory WorkCategoryItem.fromJson(Map<String, dynamic> json) =>
      _$WorkCategoryItemFromJson(json);
}

@freezed
class WorkProjectItem with _$WorkProjectItem {
  const factory WorkProjectItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'CustomerID') required int customerId,
    @JsonKey(name: 'ProjectCode') required String projectCode,
    @JsonKey(name: 'ProjectName') required String projectName,
    @JsonKey(name: 'ProjectShortName') required String projectShortName,
    @JsonKey(name: 'ProjectStatus') required int projectStatus,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'UserTechnicalID') required int userTechnicalId,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'IsApproved') int? isApproved,
    @JsonKey(name: 'ContactID') int? contactId,
    @JsonKey(name: 'PO') String? po,
    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'ListCostID') String? listCostId,
    @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
    @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
    @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
    @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,
    @JsonKey(name: 'EU') String? eu,
    @JsonKey(name: 'ProjectManager') required int projectManager,
    @JsonKey(name: 'CurrentState') int? currentState,
    @JsonKey(name: 'Priotity') required double priotity,
    @JsonKey(name: 'PODate') DateTime? poDate,
    @JsonKey(name: 'EndUser') required int endUser,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'BusinessFieldID') required int businessFieldId,
    @JsonKey(name: 'TypeProject') required int typeProject,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
  }) = _WorkProjectItem;

  factory WorkProjectItem.fromJson(Map<String, dynamic> json) =>
      _$WorkProjectItemFromJson(json);
}

@freezed
class WorkProjectTypeItem with _$WorkProjectTypeItem {
  const factory WorkProjectTypeItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'ProjectTypeCode') required String projectTypeCode,
    @JsonKey(name: 'ProjectTypeName') required String projectTypeName,
    @JsonKey(name: 'ParentID') required int parentId,
    @JsonKey(name: 'RootFolder') required String rootFolder,
    @JsonKey(name: 'ApprovedTBPID') required int approvedTBPId,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
    @JsonKey(name: 'IsHide') required bool isHide,
  }) = _WorkProjectTypeItem;

  factory WorkProjectTypeItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$WorkProjectTypeItemFromJson(json);
}

@freezed
class WorkParentItem
    with _$WorkParentItem {
  const factory WorkParentItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Status') required int status,
    @JsonKey(name: 'STT') required String stt,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'ProjectID') required int projectId,
    @JsonKey(name: 'Mission') required String mission,
    @JsonKey(name: 'PlanStartDate') DateTime? planStartDate,
    @JsonKey(name: 'PlanEndDate') DateTime? planEndDate,
    @JsonKey(name: 'ActualStartDate') DateTime? actualStartDate,
    @JsonKey(name: 'ActualEndDate') DateTime? actualEndDate,
    @JsonKey(name: 'Note') required String note,
    @JsonKey(name: 'TotalDayPlan') required double totalDayPlan,
    @JsonKey(name: 'PercentItem') required double percentItem,
    @JsonKey(name: 'ParentID') required int parentId,
    @JsonKey(name: 'TotalDayActual') required double totalDayActual,
    @JsonKey(name: 'ItemLate') required int itemLate,
    @JsonKey(name: 'TimeSpan') required double timeSpan,
    @JsonKey(name: 'TypeProjectItem') required int typeProjectItem,
    @JsonKey(name: 'PercentageActual') required double percentageActual,
    @JsonKey(name: 'EmployeeIDRequest') required int employeeIdRequest,
    @JsonKey(name: 'UpdatedDateActual') DateTime? updatedDateActual,
    @JsonKey(name: 'IsApproved') required int isApproved,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') required String updatedBy,
    @JsonKey(name: 'IsUpdateLate') required bool isUpdateLate,
    @JsonKey(name: 'ReasonLate') required String reasonLate,
    @JsonKey(name: 'UpdatedDateReasonLate') DateTime? updatedDateReasonLate,
    @JsonKey(name: 'IsApprovedLate') required bool isApprovedLate,
    @JsonKey(name: 'EmployeeRequestID') required int employeeRequestId,
    @JsonKey(name: 'EmployeeRequestName') String? employeeRequestName,
    @JsonKey(name: 'IsDeleted') required bool isDeleted,
    @JsonKey(name: 'Location') required String location,
    @JsonKey(name: 'EmployeeCreateID') int? employeeCreateId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'IsPersonalProject') bool? isPersonalProject,
    @JsonKey(name: 'IsAdditional') bool? isAdditional,
    @JsonKey(name: 'TaskComplexity') int? taskComplexity,
    @JsonKey(name: 'PercentOverTime') double? percentOverTime,
  }) = _WorkParentItem;

  factory WorkParentItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$WorkParentItemFromJson(json);
}

@freezed
class WorkAssignItem with _$WorkAssignItem {
  const factory WorkAssignItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Code') required String code,
    @JsonKey(name: 'FullName') required String fullName,
  }) = _WorkAssignItem;

  factory WorkAssignItem.fromJson(Map<String, dynamic> json) =>
      _$WorkAssignItemFromJson(json);
}