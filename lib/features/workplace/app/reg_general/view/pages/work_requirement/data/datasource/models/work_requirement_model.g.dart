// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_requirement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkRequirementItemImpl _$$WorkRequirementItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementItemImpl(
      rowIndex: (json['RowIndex'] as num?)?.toInt(),
      id: (json['ID'] as num?)?.toInt(),
      numberRequest: json['NumberRequest'] as String?,
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      deadlineRequest: json['DeadlineRequest'] == null
          ? null
          : DateTime.parse(json['DeadlineRequest'] as String),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      coordinationDepartmentID:
          (json['CoordinationDepartmentID'] as num?)?.toInt(),
      requiredDepartmentID: (json['RequiredDepartmentID'] as num?)?.toInt(),
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      dateApprovedTBP: json['DateApprovedTBP'] == null
          ? null
          : DateTime.parse(json['DateApprovedTBP'] as String),
      approvedTBPID: (json['ApprovedTBPID'] as num?)?.toInt(),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      dateApprovedHR: json['DateApprovedHR'] == null
          ? null
          : DateTime.parse(json['DateApprovedHR'] as String),
      approvedHRID: (json['ApprovedHRID'] as num?)?.toInt(),
      isApprovedBGD: json['IsApprovedBGD'] as bool?,
      dateApprovedBGD: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      approvedBGDID: (json['ApprovedBGDID'] as num?)?.toInt(),
      evaluateCompletion: json['EvaluateCompletion'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isRequestBuy: json['IsRequestBuy'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      isRequestBGDApproved: json['IsRequestBGDApproved'] as bool?,
      coordinationDepartment: json['CoordinationDepartment'] as String?,
      requiredDepartment: json['RequiredDepartment'] as String?,
      employeeName: json['EmployeeName'] as String?,
      employeeDepartment: json['EmployeeDepartment'] as String?,
      step: (json['Step'] as num?)?.toInt(),
      stepApproved: (json['StepApproved'] as num?)?.toInt(),
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      isApprovedText: json['IsApprovedText'] as String?,
      statusText: json['StatusText'] as String?,
      note: json['Note'] as String?,
      fullNameApprovedTBP: json['FullNameApprovedTBP'] as String?,
      reasonCancel: json['ReasonCancel'] as String?,
      isRequestPriceQuote: json['IsRequestPriceQuote'] as bool?,
      departmentID: (json['DepartmentID'] as num?)?.toInt(),
      chucVuHDID: (json['ChucVuHDID'] as num?)?.toInt(),
      chucVu: json['ChucVu'] as String?,
    );

Map<String, dynamic> _$$WorkRequirementItemImplToJson(
        _$WorkRequirementItemImpl instance) =>
    <String, dynamic>{
      'RowIndex': instance.rowIndex,
      'ID': instance.id,
      'NumberRequest': instance.numberRequest,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'DeadlineRequest': instance.deadlineRequest?.toIso8601String(),
      'EmployeeID': instance.employeeId,
      'CoordinationDepartmentID': instance.coordinationDepartmentID,
      'RequiredDepartmentID': instance.requiredDepartmentID,
      'IsApprovedTBP': instance.isApprovedTBP,
      'DateApprovedTBP': instance.dateApprovedTBP?.toIso8601String(),
      'ApprovedTBPID': instance.approvedTBPID,
      'IsApprovedHR': instance.isApprovedHR,
      'DateApprovedHR': instance.dateApprovedHR?.toIso8601String(),
      'ApprovedHRID': instance.approvedHRID,
      'IsApprovedBGD': instance.isApprovedBGD,
      'DateApprovedBGD': instance.dateApprovedBGD?.toIso8601String(),
      'ApprovedBGDID': instance.approvedBGDID,
      'EvaluateCompletion': instance.evaluateCompletion,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsRequestBuy': instance.isRequestBuy,
      'Status': instance.status,
      'IsRequestBGDApproved': instance.isRequestBGDApproved,
      'CoordinationDepartment': instance.coordinationDepartment,
      'RequiredDepartment': instance.requiredDepartment,
      'EmployeeName': instance.employeeName,
      'EmployeeDepartment': instance.employeeDepartment,
      'Step': instance.step,
      'StepApproved': instance.stepApproved,
      'IsApproved': instance.isApproved,
      'IsApprovedText': instance.isApprovedText,
      'StatusText': instance.statusText,
      'Note': instance.note,
      'FullNameApprovedTBP': instance.fullNameApprovedTBP,
      'ReasonCancel': instance.reasonCancel,
      'IsRequestPriceQuote': instance.isRequestPriceQuote,
      'DepartmentID': instance.departmentID,
      'ChucVuHDID': instance.chucVuHDID,
      'ChucVu': instance.chucVu,
    };

_$WorkRequirementDepartmentItemImpl
    _$$WorkRequirementDepartmentItemImplFromJson(Map<String, dynamic> json) =>
        _$WorkRequirementDepartmentItemImpl(
          id: (json['ID'] as num?)?.toInt(),
          name: json['Name'] as String?,
          code: json['Code'] as String?,
        );

Map<String, dynamic> _$$WorkRequirementDepartmentItemImplToJson(
        _$WorkRequirementDepartmentItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Code': instance.code,
    };

_$WorkRequirementApproverItemImpl _$$WorkRequirementApproverItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementApproverItemImpl(
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      fullName: json['FullName'] as String?,
      code: json['Code'] as String?,
    );

Map<String, dynamic> _$$WorkRequirementApproverItemImplToJson(
        _$WorkRequirementApproverItemImpl instance) =>
    <String, dynamic>{
      'EmployeeID': instance.employeeId,
      'DepartmentName': instance.departmentName,
      'FullName': instance.fullName,
      'Code': instance.code,
    };

_$WorkRequirementApproveItemImpl _$$WorkRequirementApproveItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementApproveItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      jobRequirementId: (json['JobRequirementID'] as num?)?.toInt(),
      step: (json['Step'] as num?)?.toInt(),
      stepName: json['StepName'] as String?,
      isApproved: (json['IsApproved'] as num?)?.toInt(),
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      approvedActualId: (json['ApprovedActualID'] as num?)?.toInt(),
      reasonCancel: json['ReasonCancel'] as String?,
      contentLog: json['ContentLog'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isApprovedText: json['IsApprovedText'] as String?,
      employeeActualName: json['EmployeeActualName'] as String?,
      employeeName: json['EmployeeName'] as String?,
    );

Map<String, dynamic> _$$WorkRequirementApproveItemImplToJson(
        _$WorkRequirementApproveItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'JobRequirementID': instance.jobRequirementId,
      'Step': instance.step,
      'StepName': instance.stepName,
      'IsApproved': instance.isApproved,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'ApprovedID': instance.approvedId,
      'ApprovedActualID': instance.approvedActualId,
      'ReasonCancel': instance.reasonCancel,
      'ContentLog': instance.contentLog,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsApprovedText': instance.isApprovedText,
      'EmployeeActualName': instance.employeeActualName,
      'EmployeeName': instance.employeeName,
    };

_$WorkRequirementFileItemImpl _$$WorkRequirementFileItemImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementFileItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      jobRequirementId: (json['JobRequirementID'] as num?)?.toInt(),
      fileName: json['FileName'] as String?,
      filePath: json['FilePath'] as String?,
      fileType: json['FileType'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
    );

Map<String, dynamic> _$$WorkRequirementFileItemImplToJson(
        _$WorkRequirementFileItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'JobRequirementID': instance.jobRequirementId,
      'FileName': instance.fileName,
      'FilePath': instance.filePath,
      'FileType': instance.fileType,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
    };

_$WorkRequirementDetailCategoryImpl
    _$$WorkRequirementDetailCategoryImplFromJson(Map<String, dynamic> json) =>
        _$WorkRequirementDetailCategoryImpl(
          jobRequirementId: (json['JobRequirementID'] as num?)?.toInt(),
          requestContent: json['RequestContent'] as String?,
          requestedBy: json['RequestedBy'] as String?,
          reason: json['Reason'] as String?,
          quantity: json['Quantity'] as String?,
          quality: json['Quality'] as String?,
          location: json['Location'] as String?,
          deadlineDate: json['DeadlineDate'] as String?,
          unit: json['Unit'] as String?,
          requestContentNote: json['RequestContentNote'] as String?,
        );

Map<String, dynamic> _$$WorkRequirementDetailCategoryImplToJson(
        _$WorkRequirementDetailCategoryImpl instance) =>
    <String, dynamic>{
      'JobRequirementID': instance.jobRequirementId,
      'RequestContent': instance.requestContent,
      'RequestedBy': instance.requestedBy,
      'Reason': instance.reason,
      'Quantity': instance.quantity,
      'Quality': instance.quality,
      'Location': instance.location,
      'DeadlineDate': instance.deadlineDate,
      'Unit': instance.unit,
      'RequestContentNote': instance.requestContentNote,
    };

_$WorkRequirementDetailDataImpl _$$WorkRequirementDetailDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementDetailDataImpl(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) =>
              WorkRequirementDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      approves: (json['approves'] as List<dynamic>?)
          ?.map((e) =>
              WorkRequirementApproveItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) =>
              WorkRequirementFileItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      detailsCategory: (json['detailsCategory'] as List<dynamic>?)
          ?.map((e) =>
              WorkRequirementDetailCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkRequirementDetailDataImplToJson(
        _$WorkRequirementDetailDataImpl instance) =>
    <String, dynamic>{
      'details': instance.details,
      'approves': instance.approves,
      'files': instance.files,
      'detailsCategory': instance.detailsCategory,
    };

_$WorkRequirementDetailResponseImpl
    _$$WorkRequirementDetailResponseImplFromJson(Map<String, dynamic> json) =>
        _$WorkRequirementDetailResponseImpl(
          id: (json['ID'] as num?)?.toInt(),
          jobRequirementId: (json['JobRequirementID'] as num?)?.toInt(),
          stt: (json['STT'] as num?)?.toInt(),
          category: json['Category'] as String?,
          description: json['Description'] as String?,
          target: json['Target'] as String?,
          note: json['Note'] as String?,
          createdBy: json['CreatedBy'] as String?,
          createdDate: json['CreatedDate'] == null
              ? null
              : DateTime.parse(json['CreatedDate'] as String),
          updatedBy: json['UpdatedBy'] as String?,
          updatedDate: json['UpdatedDate'] == null
              ? null
              : DateTime.parse(json['UpdatedDate'] as String),
          isDeleted: json['IsDeleted'] as bool?,
        );

Map<String, dynamic> _$$WorkRequirementDetailResponseImplToJson(
        _$WorkRequirementDetailResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'JobRequirementID': instance.jobRequirementId,
      'STT': instance.stt,
      'Category': instance.category,
      'Description': instance.description,
      'Target': instance.target,
      'Note': instance.note,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
    };

_$WorkRequirementSaveResponseImpl _$$WorkRequirementSaveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkRequirementSaveResponseImpl(
      id: (json['ID'] as num?)?.toInt(),
      numberRequest: json['NumberRequest'] as String?,
      dateRequest: json['DateRequest'] == null
          ? null
          : DateTime.parse(json['DateRequest'] as String),
      deadlineRequest: json['DeadlineRequest'] == null
          ? null
          : DateTime.parse(json['DeadlineRequest'] as String),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      coordinationDepartmentId:
          (json['CoordinationDepartmentID'] as num?)?.toInt(),
      requiredDepartmentId: (json['RequiredDepartmentID'] as num?)?.toInt(),
      approvedTBPId: (json['ApprovedTBPID'] as num?)?.toInt(),
      isApprovedTBP: json['IsApprovedTBP'] as bool?,
      dateApprovedTBP: json['DateApprovedTBP'] == null
          ? null
          : DateTime.parse(json['DateApprovedTBP'] as String),
      isApprovedHR: json['IsApprovedHR'] as bool?,
      dateApprovedHR: json['DateApprovedHR'] == null
          ? null
          : DateTime.parse(json['DateApprovedHR'] as String),
      approvedHRId: (json['ApprovedHRID'] as num?)?.toInt(),
      isApprovedBGD: json['IsApprovedBGD'] as bool?,
      dateApprovedBGD: json['DateApprovedBGD'] == null
          ? null
          : DateTime.parse(json['DateApprovedBGD'] as String),
      approvedBGDId: (json['ApprovedBGDID'] as num?)?.toInt(),
      evaluateCompletion: json['EvaluateCompletion'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isRequestBuy: json['IsRequestBuy'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      note: json['Note'] as String?,
      isRequestBGDApproved: json['IsRequestBGDApproved'] as bool?,
      isRequestPriceQuote: json['IsRequestPriceQuote'] as bool?,
      jobRequirementDetails: (json['JobRequirementDetails'] as List<dynamic>?)
          ?.map((e) =>
              WorkRequirementDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobRequirementFiles: json['JobRequirementFiles'] as List<dynamic>?,
    );

Map<String, dynamic> _$$WorkRequirementSaveResponseImplToJson(
        _$WorkRequirementSaveResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NumberRequest': instance.numberRequest,
      'DateRequest': instance.dateRequest?.toIso8601String(),
      'DeadlineRequest': instance.deadlineRequest?.toIso8601String(),
      'EmployeeID': instance.employeeId,
      'CoordinationDepartmentID': instance.coordinationDepartmentId,
      'RequiredDepartmentID': instance.requiredDepartmentId,
      'ApprovedTBPID': instance.approvedTBPId,
      'IsApprovedTBP': instance.isApprovedTBP,
      'DateApprovedTBP': instance.dateApprovedTBP?.toIso8601String(),
      'IsApprovedHR': instance.isApprovedHR,
      'DateApprovedHR': instance.dateApprovedHR?.toIso8601String(),
      'ApprovedHRID': instance.approvedHRId,
      'IsApprovedBGD': instance.isApprovedBGD,
      'DateApprovedBGD': instance.dateApprovedBGD?.toIso8601String(),
      'ApprovedBGDID': instance.approvedBGDId,
      'EvaluateCompletion': instance.evaluateCompletion,
      'IsDeleted': instance.isDeleted,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsRequestBuy': instance.isRequestBuy,
      'Status': instance.status,
      'Note': instance.note,
      'IsRequestBGDApproved': instance.isRequestBGDApproved,
      'IsRequestPriceQuote': instance.isRequestPriceQuote,
      'JobRequirementDetails': instance.jobRequirementDetails,
      'JobRequirementFiles': instance.jobRequirementFiles,
    };
