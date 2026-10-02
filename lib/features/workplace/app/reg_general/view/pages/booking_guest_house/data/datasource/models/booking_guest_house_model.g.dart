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
      fullName: json['FullName'] as String?,
    );

Map<String, dynamic> _$$EmployeeFilterItemImplToJson(
        _$EmployeeFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'FullName': instance.fullName,
    };
