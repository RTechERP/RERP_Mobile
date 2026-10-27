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
