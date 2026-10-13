// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_booking_guest_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveBookingGuestHouseItemImpl _$$ApproveBookingGuestHouseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingGuestHouseItemImpl(
      id: (json['ID'] as num).toInt(),
      accommodationBookingPaymentOrderId:
          (json['AccommodationBookingPaymentOrderID'] as num?)?.toInt(),
      accommodationBookingId: (json['AccommodationBookingID'] as num?)?.toInt(),
      detailStatus: (json['DetailStatus'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      recipientName: json['RecipientName'] as String?,
      registerFullName: json['RegisterFullName'] as String?,
      bankAccount: json['BankAccount'] as String?,
      bankName: json['BankName'] as String?,
      hotelName: json['HotelName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      companyName: json['CompanyName'] as String?,
      totalAmount: (json['TotalAmount'] as num?)?.toDouble(),
      totalAmountWithInvoice:
          (json['TotalAmountWithInvoice'] as num?)?.toDouble(),
      invoiceNumber: json['InvoiceNumber'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      submitDate: json['SubmitDate'] == null
          ? null
          : DateTime.parse(json['SubmitDate'] as String),
      checkInDate: json['CheckInDate'] == null
          ? null
          : DateTime.parse(json['CheckInDate'] as String),
      checkOutDate: json['CheckOutDate'] == null
          ? null
          : DateTime.parse(json['CheckOutDate'] as String),
      type: json['Type'] as String?,
      files: (json['Files'] as List<dynamic>?)
          ?.map((e) => ApproveBookingFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApproveBookingGuestHouseItemImplToJson(
        _$ApproveBookingGuestHouseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'AccommodationBookingPaymentOrderID':
          instance.accommodationBookingPaymentOrderId,
      'AccommodationBookingID': instance.accommodationBookingId,
      'DetailStatus': instance.detailStatus,
      'Reason': instance.reason,
      'RecipientName': instance.recipientName,
      'RegisterFullName': instance.registerFullName,
      'BankAccount': instance.bankAccount,
      'BankName': instance.bankName,
      'HotelName': instance.hotelName,
      'DepartmentName': instance.departmentName,
      'CompanyName': instance.companyName,
      'TotalAmount': instance.totalAmount,
      'TotalAmountWithInvoice': instance.totalAmountWithInvoice,
      'InvoiceNumber': instance.invoiceNumber,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'SubmitDate': instance.submitDate?.toIso8601String(),
      'CheckInDate': instance.checkInDate?.toIso8601String(),
      'CheckOutDate': instance.checkOutDate?.toIso8601String(),
      'Type': instance.type,
      'Files': instance.files,
    };

_$ApproveBookingFileImpl _$$ApproveBookingFileImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingFileImpl(
      id: (json['ID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      fileType: json['FileType'] as String?,
      url: json['Url'] as String?,
    );

Map<String, dynamic> _$$ApproveBookingFileImplToJson(
        _$ApproveBookingFileImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileName': instance.fileName,
      'FileType': instance.fileType,
      'Url': instance.url,
    };

_$ApproveProjectFilterItemImpl _$$ApproveProjectFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveProjectFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$ApproveProjectFilterItemImplToJson(
        _$ApproveProjectFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };

_$ApproveEmployeeFilterItemImpl _$$ApproveEmployeeFilterItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveEmployeeFilterItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
    );

Map<String, dynamic> _$$ApproveEmployeeFilterItemImplToJson(
        _$ApproveEmployeeFilterItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'SDTCaNhan': instance.sdtCaNhan,
    };
