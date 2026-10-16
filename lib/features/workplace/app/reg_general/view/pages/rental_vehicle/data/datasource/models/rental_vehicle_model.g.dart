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

_$RentalVehicleEmployeeImpl _$$RentalVehicleEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalVehicleEmployeeImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      avatar: json['AnhCBNV'] as String?,
      chucVuHd: json['ChucVuHD'] as String?,
      chucVu: json['ChucVu'] as String?,
      departmentName: json['DepartmentName'] as String?,
      diaDiemLamViec: json['DiaDiemLamViec'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
    );

Map<String, dynamic> _$$RentalVehicleEmployeeImplToJson(
        _$RentalVehicleEmployeeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'AnhCBNV': instance.avatar,
      'ChucVuHD': instance.chucVuHd,
      'ChucVu': instance.chucVu,
      'DepartmentName': instance.departmentName,
      'DiaDiemLamViec': instance.diaDiemLamViec,
      'EmailCongTy': instance.emailCongTy,
      'SDTCaNhan': instance.sdtCaNhan,
    };

_$RentalVehicleDepartmentImpl _$$RentalVehicleDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalVehicleDepartmentImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      parentId: json['ParentID'],
      pId: json['PId'] as String?,
      stt: (json['STT'] as num?)?.toInt(),
      email: json['Email'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      isShowHotline: json['IsShowHotline'] as bool?,
    );

Map<String, dynamic> _$$RentalVehicleDepartmentImplToJson(
        _$RentalVehicleDepartmentImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'ParentID': instance.parentId,
      'PId': instance.pId,
      'STT': instance.stt,
      'Email': instance.email,
      'Status': instance.status,
      'IsShowHotline': instance.isShowHotline,
    };

_$RentalVehicleProjectImpl _$$RentalVehicleProjectImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalVehicleProjectImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      projectShortName: json['ProjectShortName'] as String?,
      customerId: (json['CustomerID'] as num?)?.toInt(),
      projectStatus: (json['ProjectStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RentalVehicleProjectImplToJson(
        _$RentalVehicleProjectImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProjectShortName': instance.projectShortName,
      'CustomerID': instance.customerId,
      'ProjectStatus': instance.projectStatus,
    };

_$RentalVehicleVehicleTypeImpl _$$RentalVehicleVehicleTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalVehicleVehicleTypeImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$RentalVehicleVehicleTypeImplToJson(
        _$RentalVehicleVehicleTypeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
    };
