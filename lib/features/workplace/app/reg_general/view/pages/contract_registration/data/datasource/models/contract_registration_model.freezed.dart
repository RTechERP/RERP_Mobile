// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContractResponseItem _$ContractResponseItemFromJson(Map<String, dynamic> json) {
  return _ContractResponseItem.fromJson(json);
}

/// @nodoc
mixin _$ContractResponseItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeReciveID')
  int? get employeeReciveId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegistedDate')
  DateTime? get registedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentTypeID')
  int? get documentTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentName')
  String? get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentQuantity')
  int? get documentQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractTypeID')
  int? get contractTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsScan')
  bool? get isScan => throw _privateConstructorUsedError;
  @JsonKey(name: 'FolderPath')
  String? get folderPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeRegister')
  String? get employeeRegister => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeRecive')
  String? get employeeRecive => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompany')
  String? get taxCompany => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentType')
  String? get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractType')
  String? get contractType => throw _privateConstructorUsedError;
  @JsonKey(name: 'StatusText')
  String? get statusText => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentName')
  String? get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FolderPath1')
  String? get folderPath1 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractResponseItemCopyWith<ContractResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractResponseItemCopyWith<$Res> {
  factory $ContractResponseItemCopyWith(ContractResponseItem value,
          $Res Function(ContractResponseItem) then) =
      _$ContractResponseItemCopyWithImpl<$Res, ContractResponseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'FolderPath1') String? folderPath1});
}

/// @nodoc
class _$ContractResponseItemCopyWithImpl<$Res,
        $Val extends ContractResponseItem>
    implements $ContractResponseItemCopyWith<$Res> {
  _$ContractResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeReciveId = freezed,
    Object? taxCompanyId = freezed,
    Object? registedDate = freezed,
    Object? documentTypeId = freezed,
    Object? documentName = freezed,
    Object? documentQuantity = freezed,
    Object? contractTypeId = freezed,
    Object? reasonCancel = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? dateApproved = freezed,
    Object? isScan = freezed,
    Object? folderPath = freezed,
    Object? employeeRegister = freezed,
    Object? employeeRecive = freezed,
    Object? taxCompany = freezed,
    Object? documentType = freezed,
    Object? contractType = freezed,
    Object? statusText = freezed,
    Object? departmentName = freezed,
    Object? folderPath1 = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeReciveId: freezed == employeeReciveId
          ? _value.employeeReciveId
          : employeeReciveId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      registedDate: freezed == registedDate
          ? _value.registedDate
          : registedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      documentName: freezed == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentQuantity: freezed == documentQuantity
          ? _value.documentQuantity
          : documentQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      contractTypeId: freezed == contractTypeId
          ? _value.contractTypeId
          : contractTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScan: freezed == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderPath: freezed == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeRegister: freezed == employeeRegister
          ? _value.employeeRegister
          : employeeRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeRecive: freezed == employeeRecive
          ? _value.employeeRecive
          : employeeRecive // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCompany: freezed == taxCompany
          ? _value.taxCompany
          : taxCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      folderPath1: freezed == folderPath1
          ? _value.folderPath1
          : folderPath1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractResponseItemImplCopyWith<$Res>
    implements $ContractResponseItemCopyWith<$Res> {
  factory _$$ContractResponseItemImplCopyWith(_$ContractResponseItemImpl value,
          $Res Function(_$ContractResponseItemImpl) then) =
      __$$ContractResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'FolderPath1') String? folderPath1});
}

/// @nodoc
class __$$ContractResponseItemImplCopyWithImpl<$Res>
    extends _$ContractResponseItemCopyWithImpl<$Res, _$ContractResponseItemImpl>
    implements _$$ContractResponseItemImplCopyWith<$Res> {
  __$$ContractResponseItemImplCopyWithImpl(_$ContractResponseItemImpl _value,
      $Res Function(_$ContractResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeReciveId = freezed,
    Object? taxCompanyId = freezed,
    Object? registedDate = freezed,
    Object? documentTypeId = freezed,
    Object? documentName = freezed,
    Object? documentQuantity = freezed,
    Object? contractTypeId = freezed,
    Object? reasonCancel = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? dateApproved = freezed,
    Object? isScan = freezed,
    Object? folderPath = freezed,
    Object? employeeRegister = freezed,
    Object? employeeRecive = freezed,
    Object? taxCompany = freezed,
    Object? documentType = freezed,
    Object? contractType = freezed,
    Object? statusText = freezed,
    Object? departmentName = freezed,
    Object? folderPath1 = freezed,
  }) {
    return _then(_$ContractResponseItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeReciveId: freezed == employeeReciveId
          ? _value.employeeReciveId
          : employeeReciveId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      registedDate: freezed == registedDate
          ? _value.registedDate
          : registedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      documentName: freezed == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentQuantity: freezed == documentQuantity
          ? _value.documentQuantity
          : documentQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      contractTypeId: freezed == contractTypeId
          ? _value.contractTypeId
          : contractTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScan: freezed == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderPath: freezed == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeRegister: freezed == employeeRegister
          ? _value.employeeRegister
          : employeeRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeRecive: freezed == employeeRecive
          ? _value.employeeRecive
          : employeeRecive // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCompany: freezed == taxCompany
          ? _value.taxCompany
          : taxCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      statusText: freezed == statusText
          ? _value.statusText
          : statusText // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      folderPath1: freezed == folderPath1
          ? _value.folderPath1
          : folderPath1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractResponseItemImpl implements _ContractResponseItem {
  const _$ContractResponseItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeReciveID') this.employeeReciveId,
      @JsonKey(name: 'TaxCompanyID') this.taxCompanyId,
      @JsonKey(name: 'RegistedDate') this.registedDate,
      @JsonKey(name: 'DocumentTypeID') this.documentTypeId,
      @JsonKey(name: 'DocumentName') this.documentName,
      @JsonKey(name: 'DocumentQuantity') this.documentQuantity,
      @JsonKey(name: 'ContractTypeID') this.contractTypeId,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'IsScan') this.isScan,
      @JsonKey(name: 'FolderPath') this.folderPath,
      @JsonKey(name: 'EmployeeRegister') this.employeeRegister,
      @JsonKey(name: 'EmployeeRecive') this.employeeRecive,
      @JsonKey(name: 'TaxCompany') this.taxCompany,
      @JsonKey(name: 'DocumentType') this.documentType,
      @JsonKey(name: 'ContractType') this.contractType,
      @JsonKey(name: 'StatusText') this.statusText,
      @JsonKey(name: 'DepartmentName') this.departmentName,
      @JsonKey(name: 'FolderPath1') this.folderPath1});

  factory _$ContractResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractResponseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeReciveID')
  final int? employeeReciveId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  final int? taxCompanyId;
  @override
  @JsonKey(name: 'RegistedDate')
  final DateTime? registedDate;
  @override
  @JsonKey(name: 'DocumentTypeID')
  final int? documentTypeId;
  @override
  @JsonKey(name: 'DocumentName')
  final String? documentName;
  @override
  @JsonKey(name: 'DocumentQuantity')
  final int? documentQuantity;
  @override
  @JsonKey(name: 'ContractTypeID')
  final int? contractTypeId;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'IsScan')
  final bool? isScan;
  @override
  @JsonKey(name: 'FolderPath')
  final String? folderPath;
  @override
  @JsonKey(name: 'EmployeeRegister')
  final String? employeeRegister;
  @override
  @JsonKey(name: 'EmployeeRecive')
  final String? employeeRecive;
  @override
  @JsonKey(name: 'TaxCompany')
  final String? taxCompany;
  @override
  @JsonKey(name: 'DocumentType')
  final String? documentType;
  @override
  @JsonKey(name: 'ContractType')
  final String? contractType;
  @override
  @JsonKey(name: 'StatusText')
  final String? statusText;
  @override
  @JsonKey(name: 'DepartmentName')
  final String? departmentName;
  @override
  @JsonKey(name: 'FolderPath1')
  final String? folderPath1;

  @override
  String toString() {
    return 'ContractResponseItem(id: $id, employeeId: $employeeId, employeeReciveId: $employeeReciveId, taxCompanyId: $taxCompanyId, registedDate: $registedDate, documentTypeId: $documentTypeId, documentName: $documentName, documentQuantity: $documentQuantity, contractTypeId: $contractTypeId, reasonCancel: $reasonCancel, status: $status, createdDate: $createdDate, updatedDate: $updatedDate, createdBy: $createdBy, updatedBy: $updatedBy, isDeleted: $isDeleted, dateApproved: $dateApproved, isScan: $isScan, folderPath: $folderPath, employeeRegister: $employeeRegister, employeeRecive: $employeeRecive, taxCompany: $taxCompany, documentType: $documentType, contractType: $contractType, statusText: $statusText, departmentName: $departmentName, folderPath1: $folderPath1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractResponseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeReciveId, employeeReciveId) ||
                other.employeeReciveId == employeeReciveId) &&
            (identical(other.taxCompanyId, taxCompanyId) ||
                other.taxCompanyId == taxCompanyId) &&
            (identical(other.registedDate, registedDate) ||
                other.registedDate == registedDate) &&
            (identical(other.documentTypeId, documentTypeId) ||
                other.documentTypeId == documentTypeId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentQuantity, documentQuantity) ||
                other.documentQuantity == documentQuantity) &&
            (identical(other.contractTypeId, contractTypeId) ||
                other.contractTypeId == contractTypeId) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.isScan, isScan) || other.isScan == isScan) &&
            (identical(other.folderPath, folderPath) ||
                other.folderPath == folderPath) &&
            (identical(other.employeeRegister, employeeRegister) ||
                other.employeeRegister == employeeRegister) &&
            (identical(other.employeeRecive, employeeRecive) ||
                other.employeeRecive == employeeRecive) &&
            (identical(other.taxCompany, taxCompany) ||
                other.taxCompany == taxCompany) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.contractType, contractType) ||
                other.contractType == contractType) &&
            (identical(other.statusText, statusText) ||
                other.statusText == statusText) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.folderPath1, folderPath1) ||
                other.folderPath1 == folderPath1));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        employeeReciveId,
        taxCompanyId,
        registedDate,
        documentTypeId,
        documentName,
        documentQuantity,
        contractTypeId,
        reasonCancel,
        status,
        createdDate,
        updatedDate,
        createdBy,
        updatedBy,
        isDeleted,
        dateApproved,
        isScan,
        folderPath,
        employeeRegister,
        employeeRecive,
        taxCompany,
        documentType,
        contractType,
        statusText,
        departmentName,
        folderPath1
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractResponseItemImplCopyWith<_$ContractResponseItemImpl>
      get copyWith =>
          __$$ContractResponseItemImplCopyWithImpl<_$ContractResponseItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractResponseItemImplToJson(
      this,
    );
  }
}

abstract class _ContractResponseItem implements ContractResponseItem {
  const factory _ContractResponseItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeReciveID') final int? employeeReciveId,
          @JsonKey(name: 'TaxCompanyID') final int? taxCompanyId,
          @JsonKey(name: 'RegistedDate') final DateTime? registedDate,
          @JsonKey(name: 'DocumentTypeID') final int? documentTypeId,
          @JsonKey(name: 'DocumentName') final String? documentName,
          @JsonKey(name: 'DocumentQuantity') final int? documentQuantity,
          @JsonKey(name: 'ContractTypeID') final int? contractTypeId,
          @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'IsScan') final bool? isScan,
          @JsonKey(name: 'FolderPath') final String? folderPath,
          @JsonKey(name: 'EmployeeRegister') final String? employeeRegister,
          @JsonKey(name: 'EmployeeRecive') final String? employeeRecive,
          @JsonKey(name: 'TaxCompany') final String? taxCompany,
          @JsonKey(name: 'DocumentType') final String? documentType,
          @JsonKey(name: 'ContractType') final String? contractType,
          @JsonKey(name: 'StatusText') final String? statusText,
          @JsonKey(name: 'DepartmentName') final String? departmentName,
          @JsonKey(name: 'FolderPath1') final String? folderPath1}) =
      _$ContractResponseItemImpl;

  factory _ContractResponseItem.fromJson(Map<String, dynamic> json) =
      _$ContractResponseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeReciveID')
  int? get employeeReciveId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId;
  @override
  @JsonKey(name: 'RegistedDate')
  DateTime? get registedDate;
  @override
  @JsonKey(name: 'DocumentTypeID')
  int? get documentTypeId;
  @override
  @JsonKey(name: 'DocumentName')
  String? get documentName;
  @override
  @JsonKey(name: 'DocumentQuantity')
  int? get documentQuantity;
  @override
  @JsonKey(name: 'ContractTypeID')
  int? get contractTypeId;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'IsScan')
  bool? get isScan;
  @override
  @JsonKey(name: 'FolderPath')
  String? get folderPath;
  @override
  @JsonKey(name: 'EmployeeRegister')
  String? get employeeRegister;
  @override
  @JsonKey(name: 'EmployeeRecive')
  String? get employeeRecive;
  @override
  @JsonKey(name: 'TaxCompany')
  String? get taxCompany;
  @override
  @JsonKey(name: 'DocumentType')
  String? get documentType;
  @override
  @JsonKey(name: 'ContractType')
  String? get contractType;
  @override
  @JsonKey(name: 'StatusText')
  String? get statusText;
  @override
  @JsonKey(name: 'DepartmentName')
  String? get departmentName;
  @override
  @JsonKey(name: 'FolderPath1')
  String? get folderPath1;
  @override
  @JsonKey(ignore: true)
  _$$ContractResponseItemImplCopyWith<_$ContractResponseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TypeDocumentResponseItem _$TypeDocumentResponseItemFromJson(
    Map<String, dynamic> json) {
  return _TypeDocumentResponseItem.fromJson(json);
}

/// @nodoc
mixin _$TypeDocumentResponseItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeDocumentResponseItemCopyWith<TypeDocumentResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeDocumentResponseItemCopyWith<$Res> {
  factory $TypeDocumentResponseItemCopyWith(TypeDocumentResponseItem value,
          $Res Function(TypeDocumentResponseItem) then) =
      _$TypeDocumentResponseItemCopyWithImpl<$Res, TypeDocumentResponseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class _$TypeDocumentResponseItemCopyWithImpl<$Res,
        $Val extends TypeDocumentResponseItem>
    implements $TypeDocumentResponseItemCopyWith<$Res> {
  _$TypeDocumentResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeDocumentResponseItemImplCopyWith<$Res>
    implements $TypeDocumentResponseItemCopyWith<$Res> {
  factory _$$TypeDocumentResponseItemImplCopyWith(
          _$TypeDocumentResponseItemImpl value,
          $Res Function(_$TypeDocumentResponseItemImpl) then) =
      __$$TypeDocumentResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'IsDeleted') bool? isDeleted});
}

/// @nodoc
class __$$TypeDocumentResponseItemImplCopyWithImpl<$Res>
    extends _$TypeDocumentResponseItemCopyWithImpl<$Res,
        _$TypeDocumentResponseItemImpl>
    implements _$$TypeDocumentResponseItemImplCopyWith<$Res> {
  __$$TypeDocumentResponseItemImplCopyWithImpl(
      _$TypeDocumentResponseItemImpl _value,
      $Res Function(_$TypeDocumentResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isDeleted = freezed,
  }) {
    return _then(_$TypeDocumentResponseItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeDocumentResponseItemImpl implements _TypeDocumentResponseItem {
  const _$TypeDocumentResponseItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'IsDeleted') this.isDeleted});

  factory _$TypeDocumentResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeDocumentResponseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;

  @override
  String toString() {
    return 'TypeDocumentResponseItem(id: $id, name: $name, code: $code, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeDocumentResponseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeDocumentResponseItemImplCopyWith<_$TypeDocumentResponseItemImpl>
      get copyWith => __$$TypeDocumentResponseItemImplCopyWithImpl<
          _$TypeDocumentResponseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeDocumentResponseItemImplToJson(
      this,
    );
  }
}

abstract class _TypeDocumentResponseItem implements TypeDocumentResponseItem {
  const factory _TypeDocumentResponseItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Code') final String? code,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted}) =
      _$TypeDocumentResponseItemImpl;

  factory _TypeDocumentResponseItem.fromJson(Map<String, dynamic> json) =
      _$TypeDocumentResponseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$TypeDocumentResponseItemImplCopyWith<_$TypeDocumentResponseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TaxCompanyResponseItem _$TaxCompanyResponseItemFromJson(
    Map<String, dynamic> json) {
  return _TaxCompanyResponseItem.fromJson(json);
}

/// @nodoc
mixin _$TaxCompanyResponseItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCode')
  String? get taxCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director')
  String? get director => throw _privateConstructorUsedError;
  @JsonKey(name: 'Position')
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'BuyerEnglish')
  String? get buyerEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressBuyerEnglish')
  String? get addressBuyerEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: 'LegalRepresentativeEnglish')
  String? get legalRepresentativeEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: 'BuyerVietnamese')
  String? get buyerVietnamese => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressBuyerVienamese')
  String? get addressBuyerVienamese => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxVietnamese')
  String? get taxVietnamese => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxCompanyResponseItemCopyWith<TaxCompanyResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxCompanyResponseItemCopyWith<$Res> {
  factory $TaxCompanyResponseItemCopyWith(TaxCompanyResponseItem value,
          $Res Function(TaxCompanyResponseItem) then) =
      _$TaxCompanyResponseItemCopyWithImpl<$Res, TaxCompanyResponseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'AddressBuyerEnglish') String? addressBuyerEnglish,
      @JsonKey(name: 'LegalRepresentativeEnglish')
      String? legalRepresentativeEnglish,
      @JsonKey(name: 'BuyerVietnamese') String? buyerVietnamese,
      @JsonKey(name: 'AddressBuyerVienamese') String? addressBuyerVienamese,
      @JsonKey(name: 'TaxVietnamese') String? taxVietnamese});
}

/// @nodoc
class _$TaxCompanyResponseItemCopyWithImpl<$Res,
        $Val extends TaxCompanyResponseItem>
    implements $TaxCompanyResponseItemCopyWith<$Res> {
  _$TaxCompanyResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? taxCode = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? director = freezed,
    Object? position = freezed,
    Object? fullName = freezed,
    Object? buyerEnglish = freezed,
    Object? addressBuyerEnglish = freezed,
    Object? legalRepresentativeEnglish = freezed,
    Object? buyerVietnamese = freezed,
    Object? addressBuyerVienamese = freezed,
    Object? taxVietnamese = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerEnglish: freezed == buyerEnglish
          ? _value.buyerEnglish
          : buyerEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBuyerEnglish: freezed == addressBuyerEnglish
          ? _value.addressBuyerEnglish
          : addressBuyerEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      legalRepresentativeEnglish: freezed == legalRepresentativeEnglish
          ? _value.legalRepresentativeEnglish
          : legalRepresentativeEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerVietnamese: freezed == buyerVietnamese
          ? _value.buyerVietnamese
          : buyerVietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBuyerVienamese: freezed == addressBuyerVienamese
          ? _value.addressBuyerVienamese
          : addressBuyerVienamese // ignore: cast_nullable_to_non_nullable
              as String?,
      taxVietnamese: freezed == taxVietnamese
          ? _value.taxVietnamese
          : taxVietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxCompanyResponseItemImplCopyWith<$Res>
    implements $TaxCompanyResponseItemCopyWith<$Res> {
  factory _$$TaxCompanyResponseItemImplCopyWith(
          _$TaxCompanyResponseItemImpl value,
          $Res Function(_$TaxCompanyResponseItemImpl) then) =
      __$$TaxCompanyResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'AddressBuyerEnglish') String? addressBuyerEnglish,
      @JsonKey(name: 'LegalRepresentativeEnglish')
      String? legalRepresentativeEnglish,
      @JsonKey(name: 'BuyerVietnamese') String? buyerVietnamese,
      @JsonKey(name: 'AddressBuyerVienamese') String? addressBuyerVienamese,
      @JsonKey(name: 'TaxVietnamese') String? taxVietnamese});
}

/// @nodoc
class __$$TaxCompanyResponseItemImplCopyWithImpl<$Res>
    extends _$TaxCompanyResponseItemCopyWithImpl<$Res,
        _$TaxCompanyResponseItemImpl>
    implements _$$TaxCompanyResponseItemImplCopyWith<$Res> {
  __$$TaxCompanyResponseItemImplCopyWithImpl(
      _$TaxCompanyResponseItemImpl _value,
      $Res Function(_$TaxCompanyResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? createdDate = freezed,
    Object? updatedBy = freezed,
    Object? updatedDate = freezed,
    Object? isDeleted = freezed,
    Object? taxCode = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? director = freezed,
    Object? position = freezed,
    Object? fullName = freezed,
    Object? buyerEnglish = freezed,
    Object? addressBuyerEnglish = freezed,
    Object? legalRepresentativeEnglish = freezed,
    Object? buyerVietnamese = freezed,
    Object? addressBuyerVienamese = freezed,
    Object? taxVietnamese = freezed,
  }) {
    return _then(_$TaxCompanyResponseItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      taxCode: freezed == taxCode
          ? _value.taxCode
          : taxCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      director: freezed == director
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerEnglish: freezed == buyerEnglish
          ? _value.buyerEnglish
          : buyerEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBuyerEnglish: freezed == addressBuyerEnglish
          ? _value.addressBuyerEnglish
          : addressBuyerEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      legalRepresentativeEnglish: freezed == legalRepresentativeEnglish
          ? _value.legalRepresentativeEnglish
          : legalRepresentativeEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      buyerVietnamese: freezed == buyerVietnamese
          ? _value.buyerVietnamese
          : buyerVietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
      addressBuyerVienamese: freezed == addressBuyerVienamese
          ? _value.addressBuyerVienamese
          : addressBuyerVienamese // ignore: cast_nullable_to_non_nullable
              as String?,
      taxVietnamese: freezed == taxVietnamese
          ? _value.taxVietnamese
          : taxVietnamese // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxCompanyResponseItemImpl implements _TaxCompanyResponseItem {
  const _$TaxCompanyResponseItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'TaxCode') this.taxCode,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'PhoneNumber') this.phoneNumber,
      @JsonKey(name: 'Director') this.director,
      @JsonKey(name: 'Position') this.position,
      @JsonKey(name: 'FullName') this.fullName,
      @JsonKey(name: 'BuyerEnglish') this.buyerEnglish,
      @JsonKey(name: 'AddressBuyerEnglish') this.addressBuyerEnglish,
      @JsonKey(name: 'LegalRepresentativeEnglish')
      this.legalRepresentativeEnglish,
      @JsonKey(name: 'BuyerVietnamese') this.buyerVietnamese,
      @JsonKey(name: 'AddressBuyerVienamese') this.addressBuyerVienamese,
      @JsonKey(name: 'TaxVietnamese') this.taxVietnamese});

  factory _$TaxCompanyResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxCompanyResponseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'TaxCode')
  final String? taxCode;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'Director')
  final String? director;
  @override
  @JsonKey(name: 'Position')
  final String? position;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'BuyerEnglish')
  final String? buyerEnglish;
  @override
  @JsonKey(name: 'AddressBuyerEnglish')
  final String? addressBuyerEnglish;
  @override
  @JsonKey(name: 'LegalRepresentativeEnglish')
  final String? legalRepresentativeEnglish;
  @override
  @JsonKey(name: 'BuyerVietnamese')
  final String? buyerVietnamese;
  @override
  @JsonKey(name: 'AddressBuyerVienamese')
  final String? addressBuyerVienamese;
  @override
  @JsonKey(name: 'TaxVietnamese')
  final String? taxVietnamese;

  @override
  String toString() {
    return 'TaxCompanyResponseItem(id: $id, code: $code, name: $name, createdBy: $createdBy, createdDate: $createdDate, updatedBy: $updatedBy, updatedDate: $updatedDate, isDeleted: $isDeleted, taxCode: $taxCode, address: $address, phoneNumber: $phoneNumber, director: $director, position: $position, fullName: $fullName, buyerEnglish: $buyerEnglish, addressBuyerEnglish: $addressBuyerEnglish, legalRepresentativeEnglish: $legalRepresentativeEnglish, buyerVietnamese: $buyerVietnamese, addressBuyerVienamese: $addressBuyerVienamese, taxVietnamese: $taxVietnamese)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxCompanyResponseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.taxCode, taxCode) || other.taxCode == taxCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.director, director) ||
                other.director == director) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.buyerEnglish, buyerEnglish) ||
                other.buyerEnglish == buyerEnglish) &&
            (identical(other.addressBuyerEnglish, addressBuyerEnglish) ||
                other.addressBuyerEnglish == addressBuyerEnglish) &&
            (identical(other.legalRepresentativeEnglish,
                    legalRepresentativeEnglish) ||
                other.legalRepresentativeEnglish ==
                    legalRepresentativeEnglish) &&
            (identical(other.buyerVietnamese, buyerVietnamese) ||
                other.buyerVietnamese == buyerVietnamese) &&
            (identical(other.addressBuyerVienamese, addressBuyerVienamese) ||
                other.addressBuyerVienamese == addressBuyerVienamese) &&
            (identical(other.taxVietnamese, taxVietnamese) ||
                other.taxVietnamese == taxVietnamese));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        code,
        name,
        createdBy,
        createdDate,
        updatedBy,
        updatedDate,
        isDeleted,
        taxCode,
        address,
        phoneNumber,
        director,
        position,
        fullName,
        buyerEnglish,
        addressBuyerEnglish,
        legalRepresentativeEnglish,
        buyerVietnamese,
        addressBuyerVienamese,
        taxVietnamese
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxCompanyResponseItemImplCopyWith<_$TaxCompanyResponseItemImpl>
      get copyWith => __$$TaxCompanyResponseItemImplCopyWithImpl<
          _$TaxCompanyResponseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxCompanyResponseItemImplToJson(
      this,
    );
  }
}

abstract class _TaxCompanyResponseItem implements TaxCompanyResponseItem {
  const factory _TaxCompanyResponseItem(
      {@JsonKey(name: 'ID') final int? id,
      @JsonKey(name: 'Code') final String? code,
      @JsonKey(name: 'Name') final String? name,
      @JsonKey(name: 'CreatedBy') final String? createdBy,
      @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
      @JsonKey(name: 'UpdatedBy') final String? updatedBy,
      @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
      @JsonKey(name: 'IsDeleted') final bool? isDeleted,
      @JsonKey(name: 'TaxCode') final String? taxCode,
      @JsonKey(name: 'Address') final String? address,
      @JsonKey(name: 'PhoneNumber') final String? phoneNumber,
      @JsonKey(name: 'Director') final String? director,
      @JsonKey(name: 'Position') final String? position,
      @JsonKey(name: 'FullName') final String? fullName,
      @JsonKey(name: 'BuyerEnglish') final String? buyerEnglish,
      @JsonKey(name: 'AddressBuyerEnglish') final String? addressBuyerEnglish,
      @JsonKey(name: 'LegalRepresentativeEnglish')
      final String? legalRepresentativeEnglish,
      @JsonKey(name: 'BuyerVietnamese') final String? buyerVietnamese,
      @JsonKey(name: 'AddressBuyerVienamese')
      final String? addressBuyerVienamese,
      @JsonKey(name: 'TaxVietnamese')
      final String? taxVietnamese}) = _$TaxCompanyResponseItemImpl;

  factory _TaxCompanyResponseItem.fromJson(Map<String, dynamic> json) =
      _$TaxCompanyResponseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'TaxCode')
  String? get taxCode;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'Director')
  String? get director;
  @override
  @JsonKey(name: 'Position')
  String? get position;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'BuyerEnglish')
  String? get buyerEnglish;
  @override
  @JsonKey(name: 'AddressBuyerEnglish')
  String? get addressBuyerEnglish;
  @override
  @JsonKey(name: 'LegalRepresentativeEnglish')
  String? get legalRepresentativeEnglish;
  @override
  @JsonKey(name: 'BuyerVietnamese')
  String? get buyerVietnamese;
  @override
  @JsonKey(name: 'AddressBuyerVienamese')
  String? get addressBuyerVienamese;
  @override
  @JsonKey(name: 'TaxVietnamese')
  String? get taxVietnamese;
  @override
  @JsonKey(ignore: true)
  _$$TaxCompanyResponseItemImplCopyWith<_$TaxCompanyResponseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailContractResponseItem _$DetailContractResponseItemFromJson(
    Map<String, dynamic> json) {
  return _DetailContractResponseItem.fromJson(json);
}

/// @nodoc
mixin _$DetailContractResponseItem {
  @JsonKey(name: 'ID')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeID')
  int? get employeeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmployeeReciveID')
  int? get employeeReciveId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegistedDate')
  DateTime? get registedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentTypeID')
  int? get documentTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentName')
  String? get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DocumentQuantity')
  int? get documentQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractTypeID')
  int? get contractTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsScan')
  bool? get isScan => throw _privateConstructorUsedError;
  @JsonKey(name: 'FolderPath')
  String? get folderPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailContractResponseItemCopyWith<DetailContractResponseItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailContractResponseItemCopyWith<$Res> {
  factory $DetailContractResponseItemCopyWith(DetailContractResponseItem value,
          $Res Function(DetailContractResponseItem) then) =
      _$DetailContractResponseItemCopyWithImpl<$Res,
          DetailContractResponseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'FolderPath') String? folderPath});
}

/// @nodoc
class _$DetailContractResponseItemCopyWithImpl<$Res,
        $Val extends DetailContractResponseItem>
    implements $DetailContractResponseItemCopyWith<$Res> {
  _$DetailContractResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeReciveId = freezed,
    Object? taxCompanyId = freezed,
    Object? registedDate = freezed,
    Object? documentTypeId = freezed,
    Object? documentName = freezed,
    Object? documentQuantity = freezed,
    Object? contractTypeId = freezed,
    Object? reasonCancel = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? dateApproved = freezed,
    Object? isScan = freezed,
    Object? folderPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeReciveId: freezed == employeeReciveId
          ? _value.employeeReciveId
          : employeeReciveId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      registedDate: freezed == registedDate
          ? _value.registedDate
          : registedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      documentName: freezed == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentQuantity: freezed == documentQuantity
          ? _value.documentQuantity
          : documentQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      contractTypeId: freezed == contractTypeId
          ? _value.contractTypeId
          : contractTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScan: freezed == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderPath: freezed == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailContractResponseItemImplCopyWith<$Res>
    implements $DetailContractResponseItemCopyWith<$Res> {
  factory _$$DetailContractResponseItemImplCopyWith(
          _$DetailContractResponseItemImpl value,
          $Res Function(_$DetailContractResponseItemImpl) then) =
      __$$DetailContractResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int? id,
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
      @JsonKey(name: 'FolderPath') String? folderPath});
}

/// @nodoc
class __$$DetailContractResponseItemImplCopyWithImpl<$Res>
    extends _$DetailContractResponseItemCopyWithImpl<$Res,
        _$DetailContractResponseItemImpl>
    implements _$$DetailContractResponseItemImplCopyWith<$Res> {
  __$$DetailContractResponseItemImplCopyWithImpl(
      _$DetailContractResponseItemImpl _value,
      $Res Function(_$DetailContractResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? employeeId = freezed,
    Object? employeeReciveId = freezed,
    Object? taxCompanyId = freezed,
    Object? registedDate = freezed,
    Object? documentTypeId = freezed,
    Object? documentName = freezed,
    Object? documentQuantity = freezed,
    Object? contractTypeId = freezed,
    Object? reasonCancel = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? isDeleted = freezed,
    Object? dateApproved = freezed,
    Object? isScan = freezed,
    Object? folderPath = freezed,
  }) {
    return _then(_$DetailContractResponseItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeReciveId: freezed == employeeReciveId
          ? _value.employeeReciveId
          : employeeReciveId // ignore: cast_nullable_to_non_nullable
              as int?,
      taxCompanyId: freezed == taxCompanyId
          ? _value.taxCompanyId
          : taxCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      registedDate: freezed == registedDate
          ? _value.registedDate
          : registedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      documentName: freezed == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentQuantity: freezed == documentQuantity
          ? _value.documentQuantity
          : documentQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      contractTypeId: freezed == contractTypeId
          ? _value.contractTypeId
          : contractTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonCancel: freezed == reasonCancel
          ? _value.reasonCancel
          : reasonCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateApproved: freezed == dateApproved
          ? _value.dateApproved
          : dateApproved // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isScan: freezed == isScan
          ? _value.isScan
          : isScan // ignore: cast_nullable_to_non_nullable
              as bool?,
      folderPath: freezed == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailContractResponseItemImpl implements _DetailContractResponseItem {
  const _$DetailContractResponseItemImpl(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'EmployeeID') this.employeeId,
      @JsonKey(name: 'EmployeeReciveID') this.employeeReciveId,
      @JsonKey(name: 'TaxCompanyID') this.taxCompanyId,
      @JsonKey(name: 'RegistedDate') this.registedDate,
      @JsonKey(name: 'DocumentTypeID') this.documentTypeId,
      @JsonKey(name: 'DocumentName') this.documentName,
      @JsonKey(name: 'DocumentQuantity') this.documentQuantity,
      @JsonKey(name: 'ContractTypeID') this.contractTypeId,
      @JsonKey(name: 'ReasonCancel') this.reasonCancel,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'CreatedDate') this.createdDate,
      @JsonKey(name: 'UpdatedDate') this.updatedDate,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'UpdatedBy') this.updatedBy,
      @JsonKey(name: 'IsDeleted') this.isDeleted,
      @JsonKey(name: 'DateApproved') this.dateApproved,
      @JsonKey(name: 'IsScan') this.isScan,
      @JsonKey(name: 'FolderPath') this.folderPath});

  factory _$DetailContractResponseItemImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailContractResponseItemImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int? id;
  @override
  @JsonKey(name: 'EmployeeID')
  final int? employeeId;
  @override
  @JsonKey(name: 'EmployeeReciveID')
  final int? employeeReciveId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  final int? taxCompanyId;
  @override
  @JsonKey(name: 'RegistedDate')
  final DateTime? registedDate;
  @override
  @JsonKey(name: 'DocumentTypeID')
  final int? documentTypeId;
  @override
  @JsonKey(name: 'DocumentName')
  final String? documentName;
  @override
  @JsonKey(name: 'DocumentQuantity')
  final int? documentQuantity;
  @override
  @JsonKey(name: 'ContractTypeID')
  final int? contractTypeId;
  @override
  @JsonKey(name: 'ReasonCancel')
  final String? reasonCancel;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'CreatedDate')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  final DateTime? updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String? updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  final bool? isDeleted;
  @override
  @JsonKey(name: 'DateApproved')
  final DateTime? dateApproved;
  @override
  @JsonKey(name: 'IsScan')
  final bool? isScan;
  @override
  @JsonKey(name: 'FolderPath')
  final String? folderPath;

  @override
  String toString() {
    return 'DetailContractResponseItem(id: $id, employeeId: $employeeId, employeeReciveId: $employeeReciveId, taxCompanyId: $taxCompanyId, registedDate: $registedDate, documentTypeId: $documentTypeId, documentName: $documentName, documentQuantity: $documentQuantity, contractTypeId: $contractTypeId, reasonCancel: $reasonCancel, status: $status, createdDate: $createdDate, updatedDate: $updatedDate, createdBy: $createdBy, updatedBy: $updatedBy, isDeleted: $isDeleted, dateApproved: $dateApproved, isScan: $isScan, folderPath: $folderPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailContractResponseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeReciveId, employeeReciveId) ||
                other.employeeReciveId == employeeReciveId) &&
            (identical(other.taxCompanyId, taxCompanyId) ||
                other.taxCompanyId == taxCompanyId) &&
            (identical(other.registedDate, registedDate) ||
                other.registedDate == registedDate) &&
            (identical(other.documentTypeId, documentTypeId) ||
                other.documentTypeId == documentTypeId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentQuantity, documentQuantity) ||
                other.documentQuantity == documentQuantity) &&
            (identical(other.contractTypeId, contractTypeId) ||
                other.contractTypeId == contractTypeId) &&
            (identical(other.reasonCancel, reasonCancel) ||
                other.reasonCancel == reasonCancel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.dateApproved, dateApproved) ||
                other.dateApproved == dateApproved) &&
            (identical(other.isScan, isScan) || other.isScan == isScan) &&
            (identical(other.folderPath, folderPath) ||
                other.folderPath == folderPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        employeeId,
        employeeReciveId,
        taxCompanyId,
        registedDate,
        documentTypeId,
        documentName,
        documentQuantity,
        contractTypeId,
        reasonCancel,
        status,
        createdDate,
        updatedDate,
        createdBy,
        updatedBy,
        isDeleted,
        dateApproved,
        isScan,
        folderPath
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailContractResponseItemImplCopyWith<_$DetailContractResponseItemImpl>
      get copyWith => __$$DetailContractResponseItemImplCopyWithImpl<
          _$DetailContractResponseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailContractResponseItemImplToJson(
      this,
    );
  }
}

abstract class _DetailContractResponseItem
    implements DetailContractResponseItem {
  const factory _DetailContractResponseItem(
          {@JsonKey(name: 'ID') final int? id,
          @JsonKey(name: 'EmployeeID') final int? employeeId,
          @JsonKey(name: 'EmployeeReciveID') final int? employeeReciveId,
          @JsonKey(name: 'TaxCompanyID') final int? taxCompanyId,
          @JsonKey(name: 'RegistedDate') final DateTime? registedDate,
          @JsonKey(name: 'DocumentTypeID') final int? documentTypeId,
          @JsonKey(name: 'DocumentName') final String? documentName,
          @JsonKey(name: 'DocumentQuantity') final int? documentQuantity,
          @JsonKey(name: 'ContractTypeID') final int? contractTypeId,
          @JsonKey(name: 'ReasonCancel') final String? reasonCancel,
          @JsonKey(name: 'Status') final int? status,
          @JsonKey(name: 'CreatedDate') final DateTime? createdDate,
          @JsonKey(name: 'UpdatedDate') final DateTime? updatedDate,
          @JsonKey(name: 'CreatedBy') final String? createdBy,
          @JsonKey(name: 'UpdatedBy') final String? updatedBy,
          @JsonKey(name: 'IsDeleted') final bool? isDeleted,
          @JsonKey(name: 'DateApproved') final DateTime? dateApproved,
          @JsonKey(name: 'IsScan') final bool? isScan,
          @JsonKey(name: 'FolderPath') final String? folderPath}) =
      _$DetailContractResponseItemImpl;

  factory _DetailContractResponseItem.fromJson(Map<String, dynamic> json) =
      _$DetailContractResponseItemImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int? get id;
  @override
  @JsonKey(name: 'EmployeeID')
  int? get employeeId;
  @override
  @JsonKey(name: 'EmployeeReciveID')
  int? get employeeReciveId;
  @override
  @JsonKey(name: 'TaxCompanyID')
  int? get taxCompanyId;
  @override
  @JsonKey(name: 'RegistedDate')
  DateTime? get registedDate;
  @override
  @JsonKey(name: 'DocumentTypeID')
  int? get documentTypeId;
  @override
  @JsonKey(name: 'DocumentName')
  String? get documentName;
  @override
  @JsonKey(name: 'DocumentQuantity')
  int? get documentQuantity;
  @override
  @JsonKey(name: 'ContractTypeID')
  int? get contractTypeId;
  @override
  @JsonKey(name: 'ReasonCancel')
  String? get reasonCancel;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'CreatedDate')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'UpdatedDate')
  DateTime? get updatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'UpdatedBy')
  String? get updatedBy;
  @override
  @JsonKey(name: 'IsDeleted')
  bool? get isDeleted;
  @override
  @JsonKey(name: 'DateApproved')
  DateTime? get dateApproved;
  @override
  @JsonKey(name: 'IsScan')
  bool? get isScan;
  @override
  @JsonKey(name: 'FolderPath')
  String? get folderPath;
  @override
  @JsonKey(ignore: true)
  _$$DetailContractResponseItemImplCopyWith<_$DetailContractResponseItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
