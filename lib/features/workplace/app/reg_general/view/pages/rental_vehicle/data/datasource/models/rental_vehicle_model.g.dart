// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalVehicleItemImpl _$$RentalVehicleItemImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalVehicleItemImpl(
      employeeRequestName: json['EmployeeRequestName'] as String?,
      employeeName: json['EmployeeName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      projectName: json['ProjectName'] as String?,
      approvedFullName: json['ApprovedFullName'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      stt: (json['STT'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      packageName: json['PackageName'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      packageQuantity: (json['PackageQuantity'] as num?)?.toInt(),
      packageLengthCm: json['PackageLengthCm'] as num?,
      packageWidthCm: json['PackageWidthCm'] as num?,
      packageHeightCm: json['PackageHeightCm'] as num?,
      packageWeightKg: json['PackageWeightKg'] as num?,
      departureLocation: json['DepartureLocation'] as String?,
      addressLocation: json['AddressLocation'] as String?,
      distanceKm: json['DistanceKm'] as num?,
      nameNcc: json['NameNCC'] as String?,
      cost: json['Cost'] as num?,
      note: json['Note'] as String?,
      employeeRequestId: (json['EmployeeRequestID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      vehicleType: (json['VehicleType'] as num?)?.toInt(),
      isApproved: json['IsApproved'] as bool?,
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RentalVehicleItemImplToJson(
        _$RentalVehicleItemImpl instance) =>
    <String, dynamic>{
      'EmployeeRequestName': instance.employeeRequestName,
      'EmployeeName': instance.employeeName,
      'DepartmentName': instance.departmentName,
      'ProjectName': instance.projectName,
      'ApprovedFullName': instance.approvedFullName,
      'ID': instance.id,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'STT': instance.stt,
      'DepartmentID': instance.departmentId,
      'PackageName': instance.packageName,
      'ProjectID': instance.projectId,
      'PackageQuantity': instance.packageQuantity,
      'PackageLengthCm': instance.packageLengthCm,
      'PackageWidthCm': instance.packageWidthCm,
      'PackageHeightCm': instance.packageHeightCm,
      'PackageWeightKg': instance.packageWeightKg,
      'DepartureLocation': instance.departureLocation,
      'AddressLocation': instance.addressLocation,
      'DistanceKm': instance.distanceKm,
      'NameNCC': instance.nameNcc,
      'Cost': instance.cost,
      'Note': instance.note,
      'EmployeeRequestID': instance.employeeRequestId,
      'EmployeeID': instance.employeeId,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'IsDeleted': instance.isDeleted,
      'VehicleType': instance.vehicleType,
      'IsApproved': instance.isApproved,
      'ApprovedID': instance.approvedId,
    };
