// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingVehicleItemImpl _$$BookingVehicleItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingVehicleItemImpl(
      timeNeedPresent: json['TimeNeedPresent'] == null
          ? null
          : DateTime.parse(json['TimeNeedPresent'] as String),
      id: (json['ID'] as num?)?.toInt(),
      vehicleManagementId: (json['VehicleManagementID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      bookerVehicles: json['BookerVehicles'] as String?,
      departureAddress: json['DepartureAddress'] as String?,
      departureDate: json['DepartureDate'] == null
          ? null
          : DateTime.parse(json['DepartureDate'] as String),
      category: (json['Category'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      companyNameArrives: json['CompanyNameArrives'] as String?,
      province: json['Province'] as String?,
      specificDestinationAddress: json['SpecificDestinationAddress'] as String?,
      timeNeedPresent1: json['TimeNeedPresent1'] == null
          ? null
          : DateTime.parse(json['TimeNeedPresent1'] as String),
      timeReturn: json['TimeReturn'] == null
          ? null
          : DateTime.parse(json['TimeReturn'] as String),
      nameVehicleCharge: json['NameVehicleCharge'] as String?,
      licensePlate: json['LicensePlate'] as String?,
      driverName: json['DriverName'] as String?,
      driverPhoneNumber: json['DriverPhoneNumber'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      phoneNumber: json['PhoneNumber'] as String?,
      passengerEmployeeId: (json['PassengerEmployeeID'] as num?)?.toInt(),
      passengerCode: json['PassengerCode'] as String?,
      passengerName: json['PassengerName'] as String?,
      passengerDepartment: json['PassengerDepartment'] as String?,
      passengerPhoneNumber: json['PassengerPhoneNumber'] as String?,
      note: json['Note'] as String?,
      receiverEmployeeId: (json['ReceiverEmployeeID'] as num?)?.toInt(),
      receiverCode: json['ReceiverCode'] as String?,
      receiverName: json['ReceiverName'] as String?,
      receiverPhoneNumber: json['ReceiverPhoneNumber'] as String?,
      packageName: json['PackageName'] as String?,
      deliverName: json['DeliverName'] as String?,
      deliverPhoneNumber: json['DeliverPhoneNumber'] as String?,
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      decilineApprove: json['DecilineApprove'] as String?,
      reasonDeciline: json['ReasonDeciline'] as String?,
      problemArises: json['ProblemArises'] as String?,
      isProblemArises: json['IsProblemArises'] as bool?,
      isCancel: json['IsCancel'] as bool?,
      isSend: json['IsSend'] as bool?,
      approvedTBP: (json['ApprovedTBP'] as num?)?.toInt(),
      isNotifiled: json['IsNotifiled'] as bool?,
      parentId: (json['ParentID'] as num?)?.toInt(),
      departureAddressStatus: (json['DepartureAddressStatus'] as num?)?.toInt(),
      departureAddressStatusActual:
          (json['DepartureAddressStatusActual'] as num?)?.toInt(),
      departureAddressActual: json['DepartureAddressActual'] as String?,
      departureDateActual: json['DepartureDateActual'] == null
          ? null
          : DateTime.parse(json['DepartureDateActual'] as String),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      vehicleMoney: json['VehicleMoney'] as num?,
      packageSize: json['PackageSize'] as String?,
      packageWeight: json['PackageWeight'] as String?,
      packageQuantity: (json['PackageQuantity'] as num?)?.toInt(),
      vehicleType: (json['VehicleType'] as num?)?.toInt(),
      startTimeActual: json['StartTimeActual'] == null
          ? null
          : DateTime.parse(json['StartTimeActual'] as String),
      decilineApproveSenior: (json['DecilineApproveSenior'] as num?)?.toInt(),
      reasonDecilineSenior: json['ReasonDecilineSenior'] as String?,
      vehicleInformation: json['VehicleInformation'] as String?,
      categoryText: json['CategoryText'] as String?,
      statusText: json['StatusText'] as String?,
      approvedTBPText: json['ApprovedTBPText'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      fullName: json['FullName'] as String?,
      departureAddressText: json['DepartureAddressText'] as String?,
      departureDateText: json['DepartureDateText'] as String?,
      projectFullName: json['ProjectFullName'] as String?,
      timeNeedPresentText: json['TimeNeedPresentText'] as String?,
      fullNameTBP: json['FullNameTBP'] as String?,
      provinceName: json['ProvinceName'] as String?,
      vehicleTypeText: json['VehicleTypeText'] as String?,
      departureDateActualText: json['DepartureDateActualText'] as String?,
    );

Map<String, dynamic> _$$BookingVehicleItemImplToJson(
        _$BookingVehicleItemImpl instance) =>
    <String, dynamic>{
      'TimeNeedPresent': instance.timeNeedPresent?.toIso8601String(),
      'ID': instance.id,
      'VehicleManagementID': instance.vehicleManagementId,
      'STT': instance.stt,
      'EmployeeID': instance.employeeId,
      'BookerVehicles': instance.bookerVehicles,
      'DepartureAddress': instance.departureAddress,
      'DepartureDate': instance.departureDate?.toIso8601String(),
      'Category': instance.category,
      'Status': instance.status,
      'CompanyNameArrives': instance.companyNameArrives,
      'Province': instance.province,
      'SpecificDestinationAddress': instance.specificDestinationAddress,
      'TimeNeedPresent1': instance.timeNeedPresent1?.toIso8601String(),
      'TimeReturn': instance.timeReturn?.toIso8601String(),
      'NameVehicleCharge': instance.nameVehicleCharge,
      'LicensePlate': instance.licensePlate,
      'DriverName': instance.driverName,
      'DriverPhoneNumber': instance.driverPhoneNumber,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'PhoneNumber': instance.phoneNumber,
      'PassengerEmployeeID': instance.passengerEmployeeId,
      'PassengerCode': instance.passengerCode,
      'PassengerName': instance.passengerName,
      'PassengerDepartment': instance.passengerDepartment,
      'PassengerPhoneNumber': instance.passengerPhoneNumber,
      'Note': instance.note,
      'ReceiverEmployeeID': instance.receiverEmployeeId,
      'ReceiverCode': instance.receiverCode,
      'ReceiverName': instance.receiverName,
      'ReceiverPhoneNumber': instance.receiverPhoneNumber,
      'PackageName': instance.packageName,
      'DeliverName': instance.deliverName,
      'DeliverPhoneNumber': instance.deliverPhoneNumber,
      'IsApprovedTBP': instance.isApprovedTBP,
      'DecilineApprove': instance.decilineApprove,
      'ReasonDeciline': instance.reasonDeciline,
      'ProblemArises': instance.problemArises,
      'IsProblemArises': instance.isProblemArises,
      'IsCancel': instance.isCancel,
      'IsSend': instance.isSend,
      'ApprovedTBP': instance.approvedTBP,
      'IsNotifiled': instance.isNotifiled,
      'ParentID': instance.parentId,
      'DepartureAddressStatus': instance.departureAddressStatus,
      'DepartureAddressStatusActual': instance.departureAddressStatusActual,
      'DepartureAddressActual': instance.departureAddressActual,
      'DepartureDateActual': instance.departureDateActual?.toIso8601String(),
      'ProjectID': instance.projectId,
      'VehicleMoney': instance.vehicleMoney,
      'PackageSize': instance.packageSize,
      'PackageWeight': instance.packageWeight,
      'PackageQuantity': instance.packageQuantity,
      'VehicleType': instance.vehicleType,
      'StartTimeActual': instance.startTimeActual?.toIso8601String(),
      'DecilineApproveSenior': instance.decilineApproveSenior,
      'ReasonDecilineSenior': instance.reasonDecilineSenior,
      'VehicleInformation': instance.vehicleInformation,
      'CategoryText': instance.categoryText,
      'StatusText': instance.statusText,
      'ApprovedTBPText': instance.approvedTBPText,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'FullName': instance.fullName,
      'DepartureAddressText': instance.departureAddressText,
      'DepartureDateText': instance.departureDateText,
      'ProjectFullName': instance.projectFullName,
      'TimeNeedPresentText': instance.timeNeedPresentText,
      'FullNameTBP': instance.fullNameTBP,
      'ProvinceName': instance.provinceName,
      'VehicleTypeText': instance.vehicleTypeText,
      'DepartureDateActualText': instance.departureDateActualText,
    };

_$BookingVehicleTotalPageImpl _$$BookingVehicleTotalPageImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingVehicleTotalPageImpl(
      totalPage: (json['TotalPage'] as num).toInt(),
    );

Map<String, dynamic> _$$BookingVehicleTotalPageImplToJson(
        _$BookingVehicleTotalPageImpl instance) =>
    <String, dynamic>{
      'TotalPage': instance.totalPage,
    };

_$ProvinceDepartureItemImpl _$$ProvinceDepartureItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProvinceDepartureItemImpl(
      id: (json['ID'] as num).toInt(),
      provinceName: json['ProvinceName'] as String,
    );

Map<String, dynamic> _$$ProvinceDepartureItemImplToJson(
        _$ProvinceDepartureItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProvinceName': instance.provinceName,
    };

_$ProvinceArrivesItemImpl _$$ProvinceArrivesItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProvinceArrivesItemImpl(
      id: (json['ID'] as num).toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      provinceCode: json['ProvinceCode'] as String?,
      provinceName: json['ProvinceName'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
    );

Map<String, dynamic> _$$ProvinceArrivesItemImplToJson(
        _$ProvinceArrivesItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'ProvinceCode': instance.provinceCode,
      'ProvinceName': instance.provinceName,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
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

_$BookingVehicleProjectItemImpl _$$BookingVehicleProjectItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingVehicleProjectItemImpl(
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
      priotity: (json['Priotity'] as num?)?.toInt(),
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

Map<String, dynamic> _$$BookingVehicleProjectItemImplToJson(
        _$BookingVehicleProjectItemImpl instance) =>
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

_$BookingVehiclePersonalItemImpl _$$BookingVehiclePersonalItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingVehiclePersonalItemImpl(
      id: (json['ID'] as num).toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
      chuVuId: (json['ChuVuID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      fullName: json['FullName'] as String?,
      anhCbnv: json['AnhCBNV'] as String?,
      chucVuHd: json['ChucVuHD'] as String?,
      chucVu: json['ChucVu'] as String?,
      departmentStt: (json['DepartmentSTT'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      dvBhxh: json['DvBHXH'] as String?,
      diaDiemLamViec: json['DiaDiemLamViec'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      noiSinh: json['NoiSinh'] as String?,
      gioiTinh: (json['GioiTinh'] as num?)?.toInt(),
      gioiTinhText: json['GioiTinhText'] as String?,
      danToc: json['DanToc'] as String?,
      tonGiao: json['TonGiao'] as String?,
      quocTich: json['QuocTich'] as String?,
      tinhTrangHonNhan: json['TinhTrangHonNhan'] as String?,
      dcThuongTru: json['DcThuongTru'] as String?,
      dcTamTru: json['DcTamTru'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCaNhan: json['EmailCaNhan'] as String?,
      sdtCongTy: json['SDTCongTy'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      nguoiLienHeKhiCan: json['NguoiLienHeKhiCan'] as String?,
      moiQuanHe: json['MoiQuanHe'] as String?,
      sdtNguoiThan: json['SDTNguoiThan'] as String?,
      nguoiLienHeKhiCan2: json['NguoiLienHeKhiCan2'] as String?,
      moiQuanHe2: json['MoiQuanHe2'] as String?,
      sdtNguoiThan2: json['SDTNguoiThan2'] as String?,
    );

Map<String, dynamic> _$$BookingVehiclePersonalItemImplToJson(
        _$BookingVehiclePersonalItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'ChucVuHDID': instance.chucVuHdId,
      'ChuVuID': instance.chuVuId,
      'STT': instance.stt,
      'Code': instance.code,
      'IDChamCongMoi': instance.idChamCongMoi,
      'FullName': instance.fullName,
      'AnhCBNV': instance.anhCbnv,
      'ChucVuHD': instance.chucVuHd,
      'ChucVu': instance.chucVu,
      'DepartmentSTT': instance.departmentStt,
      'DepartmentName': instance.departmentName,
      'DvBHXH': instance.dvBhxh,
      'DiaDiemLamViec': instance.diaDiemLamViec,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'NoiSinh': instance.noiSinh,
      'GioiTinh': instance.gioiTinh,
      'GioiTinhText': instance.gioiTinhText,
      'DanToc': instance.danToc,
      'TonGiao': instance.tonGiao,
      'QuocTich': instance.quocTich,
      'TinhTrangHonNhan': instance.tinhTrangHonNhan,
      'DcThuongTru': instance.dcThuongTru,
      'DcTamTru': instance.dcTamTru,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCaNhan': instance.emailCaNhan,
      'SDTCongTy': instance.sdtCongTy,
      'EmailCongTy': instance.emailCongTy,
      'NguoiLienHeKhiCan': instance.nguoiLienHeKhiCan,
      'MoiQuanHe': instance.moiQuanHe,
      'SDTNguoiThan': instance.sdtNguoiThan,
      'NguoiLienHeKhiCan2': instance.nguoiLienHeKhiCan2,
      'MoiQuanHe2': instance.moiQuanHe2,
      'SDTNguoiThan2': instance.sdtNguoiThan2,
    };
