import 'package:freezed_annotation/freezed_annotation.dart';

part 'stamp_model.freezed.dart';
part 'stamp_model.g.dart';

@freezed
class StampItem with _$StampItem {
  const factory StampItem({
    @JsonKey(name: 'EmployeeName') String? employeeName,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DocumentTypeName') String? documentTypeName,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'EmployeeSignName') String? employeeSignName,
    @JsonKey(name: 'ApprovedText') String? approvedText,
    @JsonKey(name: 'SealNameText') String? sealNameText,
    @JsonKey(name: 'TaxCompanyText') String? taxCompanyText,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegisterDate') DateTime? registerDate,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'DocumentTypeID') int? documentTypeId,
    @JsonKey(name: 'DocumentName') String? documentName,
    @JsonKey(name: 'DocumentQuantity') int? documentQuantity,
    @JsonKey(name: 'DocumentTotalPage') int? documentTotalPage,
    @JsonKey(name: 'ApprovedID') int? approvedId,
    @JsonKey(name: 'ApprovedDate') DateTime? approvedDate,
    @JsonKey(name: 'EmployeeSignID') int? employeeSignId,
    @JsonKey(name: 'SignDatedActual') DateTime? signDatedActual,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'IsUrgent') bool? isUrgent,
    @JsonKey(name: 'Deadline') DateTime? deadline,
    @JsonKey(name: 'ExpectDateComplete') DateTime? expectDateComplete,
  }) = _StampItem;

  factory StampItem.fromJson(Map<String, dynamic> json) =>
      _$StampItemFromJson(json);
}

@freezed
class SealItem with _$SealItem {
  const factory SealItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'SealCode') String? sealCode,
    @JsonKey(name: 'SealName') String? sealName,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
  }) = _SealItem;

  factory SealItem.fromJson(Map<String, dynamic> json) =>
      _$SealItemFromJson(json);
}

@freezed
class AssignerStampItem with _$AssignerStampItem {
  const factory AssignerStampItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHDID,
    @JsonKey(name: 'ChuVuID') int? chuVuID,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'AnhCBNV') String? anhCBNV,
    @JsonKey(name: 'ChucVuHD') String? chucVuHD,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'DepartmentSTT') int? departmentSTT,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DvBHXH') String? dvBHXH,
    @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'NoiSinh') String? noiSinh,
    @JsonKey(name: 'GioiTinh') int? gioiTinh,
    @JsonKey(name: 'GioiTinhText') String? gioiTinhText,
    @JsonKey(name: 'DanToc') String? danToc,
    @JsonKey(name: 'TonGiao') String? tonGiao,
    @JsonKey(name: 'QuocTich') String? quocTich,
    @JsonKey(name: 'TinhTrangHonNhan') String? tinhTrangHonNhan,
    @JsonKey(name: 'DcThuongTru') String? dcThuongTru,
    @JsonKey(name: 'DcTamTru') String? dcTamTru,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
    @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
    @JsonKey(name: 'SDTCongTy') String? sdtCongTy,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,
    @JsonKey(name: 'NguoiLienHeKhiCan') String? nguoiLienHeKhiCan,
    @JsonKey(name: 'MoiQuanHe') String? moiQuanHe,
    @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan,
    @JsonKey(name: 'NguoiLienHeKhiCan2') String? nguoiLienHeKhiCan2,
    @JsonKey(name: 'MoiQuanHe2') String? moiQuanHe2,
    @JsonKey(name: 'SDTNguoiThan2') String? sdtNguoiThan2,
  }) = _AssignerStampItem;

  factory AssignerStampItem.fromJson(Map<String, dynamic> json) =>
      _$AssignerStampItemFromJson(json);
}

@freezed
class DocumentStampItem with _$DocumentStampItem {
  const factory DocumentStampItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _DocumentStampItem;

  factory DocumentStampItem.fromJson(Map<String, dynamic> json) =>
      _$DocumentStampItemFromJson(json);
}

@freezed
class CompanyStampItem with _$CompanyStampItem {
  const factory CompanyStampItem({
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
    @JsonKey(name: 'AddressBuyerEnglish') String? addressBuyerEnglish,
    @JsonKey(name: 'LegalRepresentativeEnglish')
    String? legalRepresentativeEnglish,
    @JsonKey(name: 'BuyerVietnamese') String? buyerVietnamese,
    @JsonKey(name: 'AddressBuyerVienamese') String? addressBuyerVienamese,
    @JsonKey(name: 'TaxVietnamese') String? taxVietnamese,
  }) = _CompanyStampItem;

  factory CompanyStampItem.fromJson(Map<String, dynamic> json) =>
      _$CompanyStampItemFromJson(json);
}
