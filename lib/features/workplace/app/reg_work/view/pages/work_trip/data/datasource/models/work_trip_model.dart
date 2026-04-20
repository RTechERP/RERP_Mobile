import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_trip_model.freezed.dart';
part 'work_trip_model.g.dart';

@freezed
class WorkTripItem with _$WorkTripItem {
  const factory WorkTripItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'IsApprovedTBP') int? isApprovedTbp,
    @JsonKey(name: 'IsApprovedHR') int? isApprovedHr,
    @JsonKey(name: 'IsApprovedText') String? isApprovedText,
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'ApprovedHR') String? approvedHr,
    @JsonKey(name: 'DayBussiness') DateTime? dayBussiness,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'TypeBusiness') int? typeBusiness,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'CostType') double? costType,
    @JsonKey(name: 'VehicleID') int? vehicleId,
    @JsonKey(name: 'VehicleName') String? vehicleName,
    @JsonKey(name: 'NotChekIn') bool? notChekIn,
    @JsonKey(name: 'NotChekInText') String? notChekInText,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'WorkEarlyText') String? workEarlyText,
    @JsonKey(name: 'CostWorkEarly') double? costWorkEarly,
    @JsonKey(name: 'CostOvernight') double? costOvernight,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'DecilineApproveText') String? decilineApproveText,
    @JsonKey(name: 'StatusHR') int? statusHr,
    @JsonKey(name: 'StatusTBP') int? statusTbp,
    @JsonKey(name: 'CostVehicle') double? costVehicle,
    @JsonKey(name: 'TotalMoney') double? totalMoney,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'Overnight') bool? overnight,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'FileName') String? fileName,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'ProjectText') String? projectText,
    @JsonKey(name: 'StatusTBPText') String? statusTbpText,
    @JsonKey(name: 'StatusHRText') String? statusHrText,
  }) = _WorkTripItem;

  factory WorkTripItem.fromJson(Map<String, dynamic> json) =>
      _$WorkTripItemFromJson(json);
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
class WorkTripTypeVehicle with _$WorkTripTypeVehicle {
  const factory WorkTripTypeVehicle({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'VehicleCode') String? vehicleCode,
    @JsonKey(name: 'VehicleName') String? vehicleName,
    @JsonKey(name: 'Cost') double? cost,
    @JsonKey(name: 'EditCost') bool? editCost,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _WorkTripTypeVehicle;

  factory WorkTripTypeVehicle.fromJson(Map<String, dynamic> json) =>
      _$WorkTripTypeVehicleFromJson(json);
}

@freezed
class WorkTripTypeItem with _$WorkTripTypeItem {
  const factory WorkTripTypeItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'TypeCode') String? typeCode,
    @JsonKey(name: 'TypeName') String? typeName,
    @JsonKey(name: 'Cost') double? cost,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _WorkTripTypeItem;

  factory WorkTripTypeItem.fromJson(Map<String, dynamic> json) =>
      _$WorkTripTypeItemFromJson(json);
}

@freezed
class WorkTripProject with _$WorkTripProject {
  const factory WorkTripProject({
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
  }) = _WorkTripProject;

  factory WorkTripProject.fromJson(Map<String, dynamic> json) =>
      _$WorkTripProjectFromJson(json);
}

@freezed
class WorkTripDetailItem with _$WorkTripDetailItem {
  const factory WorkTripDetailItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'DayBussiness') DateTime? dayBussiness,
    @JsonKey(name: 'TypeBusiness') int? typeBusiness,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'VehicleID') int? vehicleId,
    @JsonKey(name: 'CostVehicle') double? costVehicle,
    @JsonKey(name: 'CostBussiness') double? costBussiness,
    @JsonKey(name: 'TotalMoney') double? totalMoney,
    @JsonKey(name: 'NotChekIn') bool? notChekIn,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'Overnight') bool? overnight,
    @JsonKey(name: 'CostOvernight') double? costOvernight,
    @JsonKey(name: 'WorkEarly') bool? workEarly,
    @JsonKey(name: 'CostWorkEarly') double? costWorkEarly,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ApprovedHR') int? approvedHr,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHr,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'OvernightType') int? overnightType,
    @JsonKey(name: 'ReasonHREdit') String? reasonHrEdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'ProvinceID') int? provinceId,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBgd,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBgdId,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBgd,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorId,
    @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
  }) = _WorkTripDetailItem;

  factory WorkTripDetailItem.fromJson(Map<String, dynamic> json) =>
      _$WorkTripDetailItemFromJson(json);
}

@freezed
class FillApproverItem with _$FillApproverItem {
  const factory FillApproverItem({
    @JsonKey(name: 'ApproveID') required int approveId,
  }) = _FillApproverItem;

  factory FillApproverItem.fromJson(Map<String, dynamic> json) =>
      _$FillApproverItemFromJson(json);
}
