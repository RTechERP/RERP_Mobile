// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_guest_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingGuestHouseItemImpl _$$BookingGuestHouseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingGuestHouseItemImpl(
      id: (json['ID'] as num).toInt(),
      registerId: (json['RegisterID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
      provinceId: (json['ProvinceID'] as num?)?.toInt(),
      provinceName: json['ProvinceName'] as String?,
      address: json['Address'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      note: json['Note'] as String?,
      roommates: json['Roommates'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      approvedTBP: json['ApprovedTBP'],
      approvedTBPDate: json['ApprovedTBPDate'] == null
          ? null
          : DateTime.parse(json['ApprovedTBPDate'] as String),
      fullNameTBP: json['FullNameTBP'] as String?,
      paymentApprovedTBPId: (json['PaymentApprovedTBPID'] as num?)?.toInt(),
      paymentFullNameTBP: json['PaymentFullNameTBP'] as String?,
      paymentDetailStatus: (json['PaymentDetailStatus'] as num?)?.toInt(),
      paymentRecipientName: json['PaymentRecipientName'] as String?,
      paymentBankName: json['PaymentBankName'] as String?,
      paymentBankAccount: json['PaymentBankAccount'] as String?,
      paymentHotelName: json['PaymentHotelName'] as String?,
      paymentCompanyId: (json['PaymentCompanyID'] as num?)?.toInt(),
      paymentCompanyName: json['PaymentCompanyName'] as String?,
      paymentTotalAmount: json['PaymentTotalAmount'] as num?,
      paymentTotalAmountWithInvoice:
          json['PaymentTotalAmountWithInvoice'] as num?,
      paymentInvoiceNumber: json['PaymentInvoiceNumber'] as String?,
      paymentReason: json['PaymentReason'] as String?,
      paymentNote: json['PaymentNote'] as String?,
      paymentInvoiceFileCount:
          (json['PaymentInvoiceFileCount'] as num?)?.toInt(),
      paymentBillCkFileCount: (json['PaymentBillCKFileCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BookingGuestHouseItemImplToJson(
        _$BookingGuestHouseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterID': instance.registerId,
      'ProjectID': instance.projectId,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'SDTCaNhan': instance.sdtCaNhan,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
      'ProvinceID': instance.provinceId,
      'ProvinceName': instance.provinceName,
      'Address': instance.address,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Note': instance.note,
      'Roommates': instance.roommates,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'IsApprovedTBP': instance.isApprovedTBP,
      'ApprovedTBP': instance.approvedTBP,
      'ApprovedTBPDate': instance.approvedTBPDate?.toIso8601String(),
      'FullNameTBP': instance.fullNameTBP,
      'PaymentApprovedTBPID': instance.paymentApprovedTBPId,
      'PaymentFullNameTBP': instance.paymentFullNameTBP,
      'PaymentDetailStatus': instance.paymentDetailStatus,
      'PaymentRecipientName': instance.paymentRecipientName,
      'PaymentBankName': instance.paymentBankName,
      'PaymentBankAccount': instance.paymentBankAccount,
      'PaymentHotelName': instance.paymentHotelName,
      'PaymentCompanyID': instance.paymentCompanyId,
      'PaymentCompanyName': instance.paymentCompanyName,
      'PaymentTotalAmount': instance.paymentTotalAmount,
      'PaymentTotalAmountWithInvoice': instance.paymentTotalAmountWithInvoice,
      'PaymentInvoiceNumber': instance.paymentInvoiceNumber,
      'PaymentReason': instance.paymentReason,
      'PaymentNote': instance.paymentNote,
      'PaymentInvoiceFileCount': instance.paymentInvoiceFileCount,
      'PaymentBillCKFileCount': instance.paymentBillCkFileCount,
    };

_$ProjectFilterItemImpl _$$ProjectFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$ProjectFilterItemImplToJson(
        _$ProjectFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };

_$EmployeeFilterItemImpl _$$EmployeeFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
    );

Map<String, dynamic> _$$EmployeeFilterItemImplToJson(
        _$EmployeeFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'SDTCaNhan': instance.sdtCaNhan,
    };

_$ProvinceFilterItemImpl _$$ProvinceFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProvinceFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      provinceName: json['ProvinceName'] as String?,
    );

Map<String, dynamic> _$$ProvinceFilterItemImplToJson(
        _$ProvinceFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProvinceName': instance.provinceName,
    };

_$TaxCompanyItemImpl _$$TaxCompanyItemImplFromJson(Map<String, dynamic> json) =>
    _$TaxCompanyItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      taxCode: json['TaxCode'] as String?,
      address: json['Address'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      director: json['Director'] as String?,
      position: json['Position'] as String?,
      fullName: json['FullName'] as String?,
      buyerEnglish: json['BuyerEnglish'] as String?,
      addressBuyerEnglish: json['AddressBuyerEnglish'] as String?,
      legalRepresentativeEnglish: json['LegalRepresentativeEnglish'] as String?,
      buyerVietnamese: json['BuyerVietnamese'] as String?,
      addressBuyerVienamese: json['AddressBuyerVienamese'] as String?,
      taxVietnamese: json['TaxVietnamese'] as String?,
    );

Map<String, dynamic> _$$TaxCompanyItemImplToJson(
        _$TaxCompanyItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'TaxCode': instance.taxCode,
      'Address': instance.address,
      'PhoneNumber': instance.phoneNumber,
      'Director': instance.director,
      'Position': instance.position,
      'FullName': instance.fullName,
      'BuyerEnglish': instance.buyerEnglish,
      'AddressBuyerEnglish': instance.addressBuyerEnglish,
      'LegalRepresentativeEnglish': instance.legalRepresentativeEnglish,
      'BuyerVietnamese': instance.buyerVietnamese,
      'AddressBuyerVienamese': instance.addressBuyerVienamese,
      'TaxVietnamese': instance.taxVietnamese,
    };

_$BankItemImpl _$$BankItemImplFromJson(Map<String, dynamic> json) =>
    _$BankItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      bankName: json['BankName'] as String?,
    );

Map<String, dynamic> _$$BankItemImplToJson(_$BankItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'STT': instance.stt,
      'BankName': instance.bankName,
    };

_$BookingGuestHouseDetailItemImpl _$$BookingGuestHouseDetailItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingGuestHouseDetailItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      accommodationBookingId: (json['AccommodationBookingID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      phoneNumber: json['PhoneNumber'] as String?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      note: json['Note'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
    );

Map<String, dynamic> _$$BookingGuestHouseDetailItemImplToJson(
        _$BookingGuestHouseDetailItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'AccommodationBookingID': instance.accommodationBookingId,
      'EmployeeID': instance.employeeId,
      'PhoneNumber': instance.phoneNumber,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'Note': instance.note,
      'EmployeeCode': instance.employeeCode,
    };

_$AccommodationBookingPayloadImpl _$$AccommodationBookingPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$AccommodationBookingPayloadImpl(
      id: (json['ID'] as num?)?.toInt(),
      registerId: (json['RegisterID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      provinceId: (json['ProvinceID'] as num?)?.toInt(),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      note: json['Note'] as String?,
      approvedTBP: (json['ApprovedTBP'] as num?)?.toInt(),
      specificDestinationAddress: json['SpecificDestinationAddress'] as String?,
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$$AccommodationBookingPayloadImplToJson(
        _$AccommodationBookingPayloadImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterID': instance.registerId,
      'ProjectID': instance.projectId,
      'ProvinceID': instance.provinceId,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'Note': instance.note,
      'ApprovedTBP': instance.approvedTBP,
      'SpecificDestinationAddress': instance.specificDestinationAddress,
      'Address': instance.address,
    };

_$BookingGuestHouseDetailDataImpl _$$BookingGuestHouseDetailDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingGuestHouseDetailDataImpl(
      info: BookingDetail.fromJson(
          json['accommodationBooking'] as Map<String, dynamic>),
      persons: (json['accommodationBookingDetail'] as List<dynamic>)
          .map((e) => BookingDetailPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingGuestHouseDetailDataImplToJson(
        _$BookingGuestHouseDetailDataImpl instance) =>
    <String, dynamic>{
      'accommodationBooking': instance.info,
      'accommodationBookingDetail': instance.persons,
    };

_$BookingDetailImpl _$$BookingDetailImplFromJson(Map<String, dynamic> json) =>
    _$BookingDetailImpl(
      id: (json['ID'] as num).toInt(),
      registerId: (json['RegisterID'] as num?)?.toInt(),
      projectId: (json['ProjectID'] as num?)?.toInt(),
      provinceId: (json['ProvinceID'] as num?)?.toInt(),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      note: json['Note'] as String?,
      address: json['Address'] as String?,
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      approvedTBP: (json['ApprovedTBP'] as num?)?.toInt(),
      approvedTBPDate: json['ApprovedTBPDate'] == null
          ? null
          : DateTime.parse(json['ApprovedTBPDate'] as String),
    );

Map<String, dynamic> _$$BookingDetailImplToJson(_$BookingDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegisterID': instance.registerId,
      'ProjectID': instance.projectId,
      'ProvinceID': instance.provinceId,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'Note': instance.note,
      'Address': instance.address,
      'IsApprovedTBP': instance.isApprovedTBP,
      'ApprovedTBP': instance.approvedTBP,
      'ApprovedTBPDate': instance.approvedTBPDate?.toIso8601String(),
    };

_$BookingDetailPersonImpl _$$BookingDetailPersonImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingDetailPersonImpl(
      id: (json['ID'] as num).toInt(),
      accommodationBookingId: (json['AccommodationBookingID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      phoneNumber: json['PhoneNumber'],
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
      fullName: json['FullName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      note: json['Note'] as String?,
      employeeCode: json['EmployeeCode'] as String?,
    );

Map<String, dynamic> _$$BookingDetailPersonImplToJson(
        _$BookingDetailPersonImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'AccommodationBookingID': instance.accommodationBookingId,
      'EmployeeID': instance.employeeId,
      'PhoneNumber': instance.phoneNumber,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
      'FullName': instance.fullName,
      'DepartmentName': instance.departmentName,
      'Note': instance.note,
      'EmployeeCode': instance.employeeCode,
    };

_$BookingGuestHouseSaveResponseImpl
    _$$BookingGuestHouseSaveResponseImplFromJson(Map<String, dynamic> json) =>
        _$BookingGuestHouseSaveResponseImpl(
          id: (json['ID'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$BookingGuestHouseSaveResponseImplToJson(
        _$BookingGuestHouseSaveResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
    };
