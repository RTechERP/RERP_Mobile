// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractResponseItemImpl _$$ContractResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractResponseItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeReciveId: (json['EmployeeReciveID'] as num?)?.toInt(),
      taxCompanyId: (json['TaxCompanyID'] as num?)?.toInt(),
      registedDate: json['RegistedDate'] == null
          ? null
          : DateTime.parse(json['RegistedDate'] as String),
      documentTypeId: (json['DocumentTypeID'] as num?)?.toInt(),
      documentName: json['DocumentName'] as String?,
      documentQuantity: (json['DocumentQuantity'] as num?)?.toInt(),
      contractTypeId: (json['ContractTypeID'] as num?)?.toInt(),
      reasonCancel: json['ReasonCancel'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      isScan: json['IsScan'] as bool?,
      folderPath: json['FolderPath'] as String?,
      employeeRegister: json['EmployeeRegister'] as String?,
      employeeRecive: json['EmployeeRecive'] as String?,
      taxCompany: json['TaxCompany'] as String?,
      documentType: json['DocumentType'] as String?,
      contractType: json['ContractType'] as String?,
      statusText: json['StatusText'] as String?,
      departmentName: json['DepartmentName'] as String?,
      folderPath1: json['FolderPath1'] as String?,
    );

Map<String, dynamic> _$$ContractResponseItemImplToJson(
        _$ContractResponseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'EmployeeReciveID': instance.employeeReciveId,
      'TaxCompanyID': instance.taxCompanyId,
      'RegistedDate': instance.registedDate?.toIso8601String(),
      'DocumentTypeID': instance.documentTypeId,
      'DocumentName': instance.documentName,
      'DocumentQuantity': instance.documentQuantity,
      'ContractTypeID': instance.contractTypeId,
      'ReasonCancel': instance.reasonCancel,
      'Status': instance.status,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'IsScan': instance.isScan,
      'FolderPath': instance.folderPath,
      'EmployeeRegister': instance.employeeRegister,
      'EmployeeRecive': instance.employeeRecive,
      'TaxCompany': instance.taxCompany,
      'DocumentType': instance.documentType,
      'ContractType': instance.contractType,
      'StatusText': instance.statusText,
      'DepartmentName': instance.departmentName,
      'FolderPath1': instance.folderPath1,
    };

_$TypeDocumentResponseItemImpl _$$TypeDocumentResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TypeDocumentResponseItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
      code: json['Code'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$TypeDocumentResponseItemImplToJson(
        _$TypeDocumentResponseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Code': instance.code,
      'IsDeleted': instance.isDeleted,
    };

_$TaxCompanyResponseItemImpl _$$TaxCompanyResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TaxCompanyResponseItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isDeleted: json['IsDeleted'] as bool?,
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

Map<String, dynamic> _$$TaxCompanyResponseItemImplToJson(
        _$TaxCompanyResponseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Code': instance.code,
      'Name': instance.name,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'IsDeleted': instance.isDeleted,
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

_$DetailContractResponseItemImpl _$$DetailContractResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailContractResponseItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      employeeReciveId: (json['EmployeeReciveID'] as num?)?.toInt(),
      taxCompanyId: (json['TaxCompanyID'] as num?)?.toInt(),
      registedDate: json['RegistedDate'] == null
          ? null
          : DateTime.parse(json['RegistedDate'] as String),
      documentTypeId: (json['DocumentTypeID'] as num?)?.toInt(),
      documentName: json['DocumentName'] as String?,
      documentQuantity: (json['DocumentQuantity'] as num?)?.toInt(),
      contractTypeId: (json['ContractTypeID'] as num?)?.toInt(),
      reasonCancel: json['ReasonCancel'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      dateApproved: json['DateApproved'] == null
          ? null
          : DateTime.parse(json['DateApproved'] as String),
      isScan: json['IsScan'] as bool?,
      folderPath: json['FolderPath'] as String?,
    );

Map<String, dynamic> _$$DetailContractResponseItemImplToJson(
        _$DetailContractResponseItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'EmployeeID': instance.employeeId,
      'EmployeeReciveID': instance.employeeReciveId,
      'TaxCompanyID': instance.taxCompanyId,
      'RegistedDate': instance.registedDate?.toIso8601String(),
      'DocumentTypeID': instance.documentTypeId,
      'DocumentName': instance.documentName,
      'DocumentQuantity': instance.documentQuantity,
      'ContractTypeID': instance.contractTypeId,
      'ReasonCancel': instance.reasonCancel,
      'Status': instance.status,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'DateApproved': instance.dateApproved?.toIso8601String(),
      'IsScan': instance.isScan,
      'FolderPath': instance.folderPath,
    };
