import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_registration_model.freezed.dart';
part 'contract_registration_model.g.dart';

@freezed
class ContractResponseItem with _$ContractResponseItem {
  const factory ContractResponseItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeReciveID') int? employeeReciveId,
    @JsonKey(name: 'TaxCompanyID') int? taxCompanyId,
    @JsonKey(name: 'RegistedDate') DateTime? registedDate,
    @JsonKey(name: 'DocumentTypeID') int? documentTypeId,
    @JsonKey(name: 'DocumentName') String? documentName,
    @JsonKey(name: 'DocumentQuantity') int? documentQuantity,
    @JsonKey(name: 'ContractTypeID') int? contractTypeId,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'IsScan') bool? isScan,
    @JsonKey(name: 'FolderPath') String? folderPath,
    @JsonKey(name: 'EmployeeRegister') String? employeeRegister,
    @JsonKey(name: 'EmployeeRecive') String? employeeRecive,
    @JsonKey(name: 'TaxCompany') String? taxCompany,
    @JsonKey(name: 'DocumentType') String? documentType,
    @JsonKey(name: 'ContractType') String? contractType,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'FolderPath1') String? folderPath1,
  }) = _ContractResponseItem;

  factory ContractResponseItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ContractResponseItemFromJson(json);
}

@freezed
class TypeDocumentResponseItem with _$TypeDocumentResponseItem {
  const factory TypeDocumentResponseItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _TypeDocumentResponseItem;

  factory TypeDocumentResponseItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$TypeDocumentResponseItemFromJson(json);
}

@freezed
class TaxCompanyResponseItem with _$TaxCompanyResponseItem {
  const factory TaxCompanyResponseItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'TaxCode') String? taxCode,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Position') String? position,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'BuyerEnglish') String? buyerEnglish,
    @JsonKey(name: 'AddressBuyerEnglish')
    String? addressBuyerEnglish,
    @JsonKey(name: 'LegalRepresentativeEnglish')
    String? legalRepresentativeEnglish,
    @JsonKey(name: 'BuyerVietnamese') String? buyerVietnamese,
    @JsonKey(name: 'AddressBuyerVienamese')
    String? addressBuyerVienamese,
    @JsonKey(name: 'TaxVietnamese') String? taxVietnamese,
  }) = _TaxCompanyResponseItem;

  factory TaxCompanyResponseItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$TaxCompanyResponseItemFromJson(json);
}

@freezed
class DetailContractResponseItem
    with _$DetailContractResponseItem {
  const factory DetailContractResponseItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'EmployeeReciveID') int? employeeReciveId,
    @JsonKey(name: 'TaxCompanyID') int? taxCompanyId,
    @JsonKey(name: 'RegistedDate') DateTime? registedDate,
    @JsonKey(name: 'DocumentTypeID') int? documentTypeId,
    @JsonKey(name: 'DocumentName') String? documentName,
    @JsonKey(name: 'DocumentQuantity') int? documentQuantity,
    @JsonKey(name: 'ContractTypeID') int? contractTypeId,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'DateApproved') DateTime? dateApproved,
    @JsonKey(name: 'IsScan') bool? isScan,
    @JsonKey(name: 'FolderPath') String? folderPath,
  }) = _DetailContractResponseItem;

  factory DetailContractResponseItem.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$DetailContractResponseItemFromJson(json);
}