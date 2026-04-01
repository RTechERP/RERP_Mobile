// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkTripItemImpl _$$WorkTripItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkTripItemImpl(
      id: (json['ID'] as num).toInt(),
      isApprovedTbp: (json['IsApprovedTBP'] as num?)?.toInt(),
      isApprovedHr: (json['IsApprovedHR'] as num?)?.toInt(),
      isApprovedText: json['IsApprovedText'] as String?,
      employeeName: json['EmployeeName'] as String?,
      approvedName: json['ApprovedName'] as String?,
      approvedHr: json['ApprovedHR'] as String?,
      dayBussiness: json['DayBussiness'] == null
          ? null
          : DateTime.parse(json['DayBussiness'] as String),
      location: json['Location'] as String?,
      typeBusiness: (json['TypeBusiness'] as num?)?.toInt(),
      typeName: json['TypeName'] as String?,
      costType: (json['CostType'] as num?)?.toDouble(),
      vehicleId: (json['VehicleID'] as num?)?.toInt(),
      vehicleName: json['VehicleName'] as String?,
      notChekIn: json['NotChekIn'] as bool?,
      notChekInText: json['NotChekInText'] as String?,
      note: json['Note'] as String?,
      workEarlyText: json['WorkEarlyText'] as String?,
      costWorkEarly: (json['CostWorkEarly'] as num?)?.toDouble(),
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      decilineApproveText: json['DecilineApproveText'] as String?,
      statusHr: (json['StatusHR'] as num?)?.toInt(),
      statusTbp: (json['StatusTBP'] as num?)?.toInt(),
      costVehicle: (json['CostVehicle'] as num?)?.toDouble(),
      totalMoney: (json['TotalMoney'] as num?)?.toDouble(),
      reasonDeciline: json['ReasonDeciline'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      overnight: json['Overnight'] as bool?,
      isProblem: json['IsProblem'] as bool?,
      reason: json['Reason'] as String?,
      fileName: json['FileName'] as String?,
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      projectText: json['ProjectText'] as String?,
      statusTbpText: json['StatusTBPText'] as String?,
      statusHrText: json['StatusHRText'] as String?,
    );

Map<String, dynamic> _$$WorkTripItemImplToJson(_$WorkTripItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsApprovedTBP': instance.isApprovedTbp,
      'IsApprovedHR': instance.isApprovedHr,
      'IsApprovedText': instance.isApprovedText,
      'EmployeeName': instance.employeeName,
      'ApprovedName': instance.approvedName,
      'ApprovedHR': instance.approvedHr,
      'DayBussiness': instance.dayBussiness?.toIso8601String(),
      'Location': instance.location,
      'TypeBusiness': instance.typeBusiness,
      'TypeName': instance.typeName,
      'CostType': instance.costType,
      'VehicleID': instance.vehicleId,
      'VehicleName': instance.vehicleName,
      'NotChekIn': instance.notChekIn,
      'NotChekInText': instance.notChekInText,
      'Note': instance.note,
      'WorkEarlyText': instance.workEarlyText,
      'CostWorkEarly': instance.costWorkEarly,
      'CostOvernight': instance.costOvernight,
      'DecilineApprove': instance.decilineApprove,
      'DecilineApproveText': instance.decilineApproveText,
      'StatusHR': instance.statusHr,
      'StatusTBP': instance.statusTbp,
      'CostVehicle': instance.costVehicle,
      'TotalMoney': instance.totalMoney,
      'ReasonDeciline': instance.reasonDeciline,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'Overnight': instance.overnight,
      'IsProblem': instance.isProblem,
      'Reason': instance.reason,
      'FileName': instance.fileName,
      'EmployeeID': instance.employeeId,
      'ApprovedID': instance.approvedId,
      'ProjectID': instance.projectId,
      'ProjectText': instance.projectText,
      'StatusTBPText': instance.statusTbpText,
      'StatusHRText': instance.statusHrText,
    };

_$ApproverItemImpl _$$ApproverItemImplFromJson(Map<String, dynamic> json) =>
    _$ApproverItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      type: (json['Type'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      usersId: (json['UsersID'] as num?)?.toInt(),
      isPassed: json['IsPassed'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$ApproverItemImplToJson(_$ApproverItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'Type': instance.type,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UsersID': instance.usersId,
      'IsPassed': instance.isPassed,
      'IsDeleted': instance.isDeleted,
    };

_$WorkTripTypeVehicleImpl _$$WorkTripTypeVehicleImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkTripTypeVehicleImpl(
      id: (json['ID'] as num).toInt(),
      vehicleCode: json['VehicleCode'] as String?,
      vehicleName: json['VehicleName'] as String?,
      cost: (json['Cost'] as num?)?.toDouble(),
      editCost: json['EditCost'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$WorkTripTypeVehicleImplToJson(
        _$WorkTripTypeVehicleImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'VehicleCode': instance.vehicleCode,
      'VehicleName': instance.vehicleName,
      'Cost': instance.cost,
      'EditCost': instance.editCost,
      'IsDeleted': instance.isDeleted,
    };

_$WorkTripTypeItemImpl _$$WorkTripTypeItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkTripTypeItemImpl(
      id: (json['ID'] as num).toInt(),
      typeCode: json['TypeCode'] as String?,
      typeName: json['TypeName'] as String?,
      cost: (json['Cost'] as num?)?.toDouble(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$WorkTripTypeItemImplToJson(
        _$WorkTripTypeItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TypeCode': instance.typeCode,
      'TypeName': instance.typeName,
      'Cost': instance.cost,
      'IsDeleted': instance.isDeleted,
    };

_$WorkTripProjectImpl _$$WorkTripProjectImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkTripProjectImpl(
      id: (json['ID'] as num).toInt(),
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      userTechnicalId: (json['UserTechnicalID'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isApproved: json['IsApproved'] as bool?,
      contactId: (json['ContactID'] as num?)?.toInt(),
      po: json['PO'] as String?,
      projectType: (json['ProjectType'] as num?)?.toInt(),
      listCostId: (json['ListCostID'] as num?)?.toInt(),
      planDateStart: json['PlanDateStart'] == null
          ? null
          : DateTime.parse(json['PlanDateStart'] as String),
      planDateEnd: json['PlanDateEnd'] == null
          ? null
          : DateTime.parse(json['PlanDateEnd'] as String),
      actualDateStart: json['ActualDateStart'] == null
          ? null
          : DateTime.parse(json['ActualDateStart'] as String),
      actualDateEnd: json['ActualDateEnd'] == null
          ? null
          : DateTime.parse(json['ActualDateEnd'] as String),
      eu: json['EU'] as String?,
      projectManager: (json['ProjectManager'] as num?)?.toInt(),
      currentState: json['CurrentState'] as String?,
      priotity: (json['Priotity'] as num?)?.toDouble(),
      poDate: json['PODate'] == null
          ? null
          : DateTime.parse(json['PODate'] as String),
      endUser: (json['EndUser'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      businessFieldId: (json['BusinessFieldID'] as num?)?.toInt(),
      typeProject: (json['TypeProject'] as num?)?.toInt(),
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$WorkTripProjectImplToJson(
        _$WorkTripProjectImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CustomerID': instance.customerId,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'ProjectStatus': instance.projectStatus,
      'UserID': instance.userId,
      'UserTechnicalID': instance.userTechnicalId,
      'Note': instance.note,
      'IsApproved': instance.isApproved,
      'ContactID': instance.contactId,
      'PO': instance.po,
      'ProjectType': instance.projectType,
      'ListCostID': instance.listCostId,
      'PlanDateStart': instance.planDateStart?.toIso8601String(),
      'PlanDateEnd': instance.planDateEnd?.toIso8601String(),
      'ActualDateStart': instance.actualDateStart?.toIso8601String(),
      'ActualDateEnd': instance.actualDateEnd?.toIso8601String(),
      'EU': instance.eu,
      'ProjectManager': instance.projectManager,
      'CurrentState': instance.currentState,
      'Priotity': instance.priotity,
      'PODate': instance.poDate?.toIso8601String(),
      'EndUser': instance.endUser,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'BusinessFieldID': instance.businessFieldId,
      'TypeProject': instance.typeProject,
      'IsDeleted': instance.isDeleted,
    };

_$WorkTripDetailItemImpl _$$WorkTripDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkTripDetailItemImpl(
      id: (json['ID'] as num).toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      dayBussiness: json['DayBussiness'] == null
          ? null
          : DateTime.parse(json['DayBussiness'] as String),
      typeBusiness: (json['TypeBusiness'] as num?)?.toInt(),
      location: json['Location'] as String?,
      vehicleId: (json['VehicleID'] as num?)?.toInt(),
      costVehicle: (json['CostVehicle'] as num?)?.toDouble(),
      costBussiness: (json['CostBussiness'] as num?)?.toDouble(),
      totalMoney: (json['TotalMoney'] as num?)?.toDouble(),
      notChekIn: json['NotChekIn'] as bool?,
      note: json['Note'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      overnight: json['Overnight'] as bool?,
      costOvernight: (json['CostOvernight'] as num?)?.toDouble(),
      workEarly: json['WorkEarly'] as bool?,
      costWorkEarly: (json['CostWorkEarly'] as num?)?.toDouble(),
      decilineApprove: (json['DecilineApprove'] as num?)?.toInt(),
      approvedHr: (json['ApprovedHR'] as num?)?.toInt(),
      isApprovedHr: json['IsApprovedHR'] as bool?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      overnightType: (json['OvernightType'] as num?)?.toInt(),
      reasonHrEdit: json['ReasonHREdit'] as String?,
      isProblem: json['IsProblem'] as bool?,
      reason: json['Reason'] as String?,
      provinceId: (json['ProvinceID'] as num?)?.toInt(),
      isApprovedBgd: json['IsApprovedBGD'] as bool?,
      approvedBgdId: (json['ApprovedBGDID'] as num?)?.toInt(),
      dateApprovedBgd: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      isSeniorApproved: (json['IsSeniorApproved'] as num?)?.toInt(),
      approvedSeniorId: (json['ApprovedSeniorID'] as num?)?.toInt(),
      dateApprovedSenior: json['DateApprovedSenior'] == null
          ? null
          : DateTime.parse(json['DateApprovedSenior'] as String),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
    );

Map<String, dynamic> _$$WorkTripDetailItemImplToJson(
        _$WorkTripDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'IsApproved': instance.isApproved,
      'ApprovedID': instance.approvedId,
      'DayBussiness': instance.dayBussiness?.toIso8601String(),
      'TypeBusiness': instance.typeBusiness,
      'Location': instance.location,
      'VehicleID': instance.vehicleId,
      'CostVehicle': instance.costVehicle,
      'CostBussiness': instance.costBussiness,
      'TotalMoney': instance.totalMoney,
      'NotChekIn': instance.notChekIn,
      'Note': instance.note,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'Overnight': instance.overnight,
      'CostOvernight': instance.costOvernight,
      'WorkEarly': instance.workEarly,
      'CostWorkEarly': instance.costWorkEarly,
      'DecilineApprove': instance.decilineApprove,
      'ApprovedHR': instance.approvedHr,
      'IsApprovedHR': instance.isApprovedHr,
      'ReasonDeciline': instance.reasonDeciline,
      'OvernightType': instance.overnightType,
      'ReasonHREdit': instance.reasonHrEdit,
      'IsProblem': instance.isProblem,
      'Reason': instance.reason,
      'ProvinceID': instance.provinceId,
      'IsApprovedBGD': instance.isApprovedBgd,
      'ApprovedBGDID': instance.approvedBgdId,
      'DateApprovedBGD': instance.dateApprovedBgd?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'IsSeniorApproved': instance.isSeniorApproved,
      'ApprovedSeniorID': instance.approvedSeniorId,
      'DateApprovedSenior': instance.dateApprovedSenior?.toIso8601String(),
      'ProjectID': instance.projectId,
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
    };
