// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_booking_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApproveBookingPaymentStepImpl _$$ApproveBookingPaymentStepImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingPaymentStepImpl(
      step: (json['Step'] as num?)?.toInt(),
      code: json['Code'] as String?,
      stepName: json['StepName'] as String?,
      approverId: (json['ApproverID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApproveBookingPaymentStepImplToJson(
        _$ApproveBookingPaymentStepImpl instance) =>
    <String, dynamic>{
      'Step': instance.step,
      'Code': instance.code,
      'StepName': instance.stepName,
      'ApproverID': instance.approverId,
    };

_$ApproveBookingPaymentItemImpl _$$ApproveBookingPaymentItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingPaymentItemImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      paymentType: json['PaymentType'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      reason: json['Reason'] as String?,
      reasonCancel: json['ReasonCancel'] as String?,
      typeName: json['TypeName'] as String?,
      typeOrder: (json['TypeOrder'] as num?)?.toInt(),
      createdByEmployeeId: (json['CreatedByEmployeeID'] as num?)?.toInt(),
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      fullName: json['FullName'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      totalMoney: (json['TotalMoney'] as num?)?.toDouble(),
      totalMoneyWithInvoice:
          (json['TotalMoneyWithInvoice'] as num?)?.toDouble(),
      totalAmountBeforeVat: (json['TotalAmountBeforeVAT'] as num?)?.toDouble(),
      totalPayment: (json['TotalPayment'] as num?)?.toDouble(),
      deadlinePayment: json['DeadlinePayment'] == null
          ? null
          : DateTime.parse(json['DeadlinePayment'] as String),
      currentStep: (json['CurrentStep'] as num?)?.toInt(),
      currentStepName: json['CurrentStepName'] as String?,
      currentStepCode: json['CurrentStepCode'] as String?,
      currentStepIsApproved: (json['CurrentStepIsApproved'] as num?)?.toInt(),
      isApprovedText: json['IsApprovedText'] as String?,
      lastApproverName: json['LastApproverName'] as String?,
      lastApprovedDate: json['LastApprovedDate'] == null
          ? null
          : DateTime.parse(json['LastApprovedDate'] as String),
      noteKttt: json['NoteKTTT'] as String?,
      noteKtt: json['NoteKTT'] as String?,
      totalRows: (json['TotalRows'] as num?)?.toInt(),
      totalPage: (json['TotalPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApproveBookingPaymentItemImplToJson(
        _$ApproveBookingPaymentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'PaymentType': instance.paymentType,
      'Status': instance.status,
      'Reason': instance.reason,
      'ReasonCancel': instance.reasonCancel,
      'TypeName': instance.typeName,
      'TypeOrder': instance.typeOrder,
      'CreatedByEmployeeID': instance.createdByEmployeeId,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
      'TotalMoney': instance.totalMoney,
      'TotalMoneyWithInvoice': instance.totalMoneyWithInvoice,
      'TotalAmountBeforeVAT': instance.totalAmountBeforeVat,
      'TotalPayment': instance.totalPayment,
      'DeadlinePayment': instance.deadlinePayment?.toIso8601String(),
      'CurrentStep': instance.currentStep,
      'CurrentStepName': instance.currentStepName,
      'CurrentStepCode': instance.currentStepCode,
      'CurrentStepIsApproved': instance.currentStepIsApproved,
      'IsApprovedText': instance.isApprovedText,
      'LastApproverName': instance.lastApproverName,
      'LastApprovedDate': instance.lastApprovedDate?.toIso8601String(),
      'NoteKTTT': instance.noteKttt,
      'NoteKTT': instance.noteKtt,
      'TotalRows': instance.totalRows,
      'TotalPage': instance.totalPage,
    };

_$ApproveBookingPaymentDepartmentImpl
    _$$ApproveBookingPaymentDepartmentImplFromJson(Map<String, dynamic> json) =>
        _$ApproveBookingPaymentDepartmentImpl(
          id: (json['ID'] as num).toInt(),
          code: json['Code'] as String?,
          name: json['Name'] as String?,
        );

Map<String, dynamic> _$$ApproveBookingPaymentDepartmentImplToJson(
        _$ApproveBookingPaymentDepartmentImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
    };

_$ApproveBookingPaymentEmployeeImpl
    _$$ApproveBookingPaymentEmployeeImplFromJson(Map<String, dynamic> json) =>
        _$ApproveBookingPaymentEmployeeImpl(
          id: (json['ID'] as num).toInt(),
          code: json['Code'] as String?,
          fullName: json['FullName'] as String?,
          departmentId: (json['DepartmentID'] as num?)?.toInt(),
          departmentName: json['DepartmentName'] as String?,
        );

Map<String, dynamic> _$$ApproveBookingPaymentEmployeeImplToJson(
        _$ApproveBookingPaymentEmployeeImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'DepartmentID': instance.departmentId,
      'DepartmentName': instance.departmentName,
    };

_$ApproveBookingPaymentFileImpl _$$ApproveBookingPaymentFileImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingPaymentFileImpl(
      id: (json['ID'] as num).toInt(),
      fileType: json['FileType'] as String?,
      fileName: json['FileName'] as String?,
      url: json['Url'] as String?,
      fileSize: (json['FileSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApproveBookingPaymentFileImplToJson(
        _$ApproveBookingPaymentFileImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FileType': instance.fileType,
      'FileName': instance.fileName,
      'Url': instance.url,
      'FileSize': instance.fileSize,
    };

_$ApproveBookingPaymentDetailLineImpl
    _$$ApproveBookingPaymentDetailLineImplFromJson(Map<String, dynamic> json) =>
        _$ApproveBookingPaymentDetailLineImpl(
          id: (json['ID'] as num).toInt(),
          files: (json['Files'] as List<dynamic>?)
                  ?.map((e) => ApproveBookingPaymentFile.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const <ApproveBookingPaymentFile>[],
          projectCode: json['ProjectCode'] as String?,
          recipientName: json['RecipientName'] as String?,
          startLocation: json['StartLocation'] as String?,
          endLocation: json['EndLocation'] as String?,
          bankAccount: json['BankAccount'] as String?,
          bankName: json['BankName'] as String?,
          transferType: (json['TransferType'] as num?)?.toInt(),
          totalAmount: (json['TotalAmount'] as num?)?.toDouble(),
          totalAmountWithInvoice:
              (json['TotalAmountWithInvoice'] as num?)?.toDouble(),
          amountBeforeVat: (json['AmountBeforeVAT'] as num?)?.toDouble(),
          invoiceNumber: json['InvoiceNumber'] as String?,
          transportCompanyName: json['TransportCompanyName'] as String?,
          transportCompanyTaxCode: json['TransportCompanyTaxCode'] as String?,
          companyName: json['CompanyName'] as String?,
          departmentName: json['DepartmentName'] as String?,
          reason: json['Reason'] as String?,
          note: json['Note'] as String?,
          isChunDongPhuongTien: json['IsChunDongPhuongTien'] as bool?,
          isBill: json['IsBill'] as bool?,
          hotelName: json['HotelName'] as String?,
          hotelTaxCode: json['HotelTaxCode'] as String?,
          checkInDate: json['CheckInDate'] == null
              ? null
              : DateTime.parse(json['CheckInDate'] as String),
          checkOutDate: json['CheckOutDate'] == null
              ? null
              : DateTime.parse(json['CheckOutDate'] as String),
        );

Map<String, dynamic> _$$ApproveBookingPaymentDetailLineImplToJson(
        _$ApproveBookingPaymentDetailLineImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Files': instance.files,
      'ProjectCode': instance.projectCode,
      'RecipientName': instance.recipientName,
      'StartLocation': instance.startLocation,
      'EndLocation': instance.endLocation,
      'BankAccount': instance.bankAccount,
      'BankName': instance.bankName,
      'TransferType': instance.transferType,
      'TotalAmount': instance.totalAmount,
      'TotalAmountWithInvoice': instance.totalAmountWithInvoice,
      'AmountBeforeVAT': instance.amountBeforeVat,
      'InvoiceNumber': instance.invoiceNumber,
      'TransportCompanyName': instance.transportCompanyName,
      'TransportCompanyTaxCode': instance.transportCompanyTaxCode,
      'CompanyName': instance.companyName,
      'DepartmentName': instance.departmentName,
      'Reason': instance.reason,
      'Note': instance.note,
      'IsChunDongPhuongTien': instance.isChunDongPhuongTien,
      'IsBill': instance.isBill,
      'HotelName': instance.hotelName,
      'HotelTaxCode': instance.hotelTaxCode,
      'CheckInDate': instance.checkInDate?.toIso8601String(),
      'CheckOutDate': instance.checkOutDate?.toIso8601String(),
    };

_$ApproveBookingPaymentDetailImpl _$$ApproveBookingPaymentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingPaymentDetailImpl(
      id: (json['ID'] as num).toInt(),
      code: json['Code'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      note: json['Note'] as String?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      isReceived: json['IsReceived'] as bool?,
      receivedDate: json['ReceivedDate'] == null
          ? null
          : DateTime.parse(json['ReceivedDate'] as String),
      isPaid: json['IsPaid'] as bool?,
      paidDate: json['PaidDate'] == null
          ? null
          : DateTime.parse(json['PaidDate'] as String),
      details: (json['Details'] as List<dynamic>?)
              ?.map((e) => ApproveBookingPaymentDetailLine.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const <ApproveBookingPaymentDetailLine>[],
    );

Map<String, dynamic> _$$ApproveBookingPaymentDetailImplToJson(
        _$ApproveBookingPaymentDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Status': instance.status,
      'Note': instance.note,
      'Deadline': instance.deadline?.toIso8601String(),
      'IsReceived': instance.isReceived,
      'ReceivedDate': instance.receivedDate?.toIso8601String(),
      'IsPaid': instance.isPaid,
      'PaidDate': instance.paidDate?.toIso8601String(),
      'Details': instance.details,
    };

_$ApproveBookingPaymentLogImpl _$$ApproveBookingPaymentLogImplFromJson(
        Map<String, dynamic> json) =>
    _$ApproveBookingPaymentLogImpl(
      id: (json['ID'] as num).toInt(),
      step: (json['Step'] as num?)?.toInt(),
      stepName: json['StepName'] as String?,
      code: json['Code'] as String?,
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      reasonCancel: json['ReasonCancel'] as String?,
      contentLog: json['ContentLog'] as String?,
    );

Map<String, dynamic> _$$ApproveBookingPaymentLogImplToJson(
        _$ApproveBookingPaymentLogImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Step': instance.step,
      'StepName': instance.stepName,
      'Code': instance.code,
      'IsApproved': instance.isApproved,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'ReasonCancel': instance.reasonCancel,
      'ContentLog': instance.contentLog,
    };
