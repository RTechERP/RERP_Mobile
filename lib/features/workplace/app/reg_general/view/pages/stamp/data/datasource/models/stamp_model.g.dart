// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StampItemImpl _$$StampItemImplFromJson(Map<String, dynamic> json) =>
    _$StampItemImpl(
      employeeName: json['EmployeeName'] as String?,
      departmentName: json['DepartmentName'] as String?,
      documentTypeName: json['DocumentTypeName'] as String?,
      approvedName: json['ApprovedName'] as String?,
      employeeSignName: json['EmployeeSignName'] as String?,
      approvedText: json['ApprovedText'] as String?,
      sealNameText: json['SealNameText'] as String?,
      taxCompanyText: json['TaxCompanyText'] as String?,
      id: (json['ID'] as num?)?.toInt(),
      registerDate: json['RegisterDate'] == null
          ? null
          : DateTime.parse(json['RegisterDate'] as String),
      employeeId: (json['EmployeeID'] as num?)?.toInt(),
      documentTypeId: (json['DocumentTypeID'] as num?)?.toInt(),
      documentName: json['DocumentName'] as String?,
      documentQuantity: (json['DocumentQuantity'] as num?)?.toInt(),
      documentTotalPage: (json['DocumentTotalPage'] as num?)?.toInt(),
      approvedId: (json['ApprovedID'] as num?)?.toInt(),
      approvedDate: json['ApprovedDate'] == null
          ? null
          : DateTime.parse(json['ApprovedDate'] as String),
      employeeSignId: (json['EmployeeSignID'] as num?)?.toInt(),
      signDatedActual: json['SignDatedActual'] == null
          ? null
          : DateTime.parse(json['SignDatedActual'] as String),
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      reasonCancel: json['ReasonCancel'] as String?,
      isUrgent: json['IsUrgent'] as bool?,
      deadline: json['Deadline'] == null
          ? null
          : DateTime.parse(json['Deadline'] as String),
      expectDateComplete: json['ExpectDateComplete'] == null
          ? null
          : DateTime.parse(json['ExpectDateComplete'] as String),
    );

Map<String, dynamic> _$$StampItemImplToJson(_$StampItemImpl instance) =>
    <String, dynamic>{
      'EmployeeName': instance.employeeName,
      'DepartmentName': instance.departmentName,
      'DocumentTypeName': instance.documentTypeName,
      'ApprovedName': instance.approvedName,
      'EmployeeSignName': instance.employeeSignName,
      'ApprovedText': instance.approvedText,
      'SealNameText': instance.sealNameText,
      'TaxCompanyText': instance.taxCompanyText,
      'ID': instance.id,
      'RegisterDate': instance.registerDate?.toIso8601String(),
      'EmployeeID': instance.employeeId,
      'DocumentTypeID': instance.documentTypeId,
      'DocumentName': instance.documentName,
      'DocumentQuantity': instance.documentQuantity,
      'DocumentTotalPage': instance.documentTotalPage,
      'ApprovedID': instance.approvedId,
      'ApprovedDate': instance.approvedDate?.toIso8601String(),
      'EmployeeSignID': instance.employeeSignId,
      'SignDatedActual': instance.signDatedActual?.toIso8601String(),
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
      'Status': instance.status,
      'ReasonCancel': instance.reasonCancel,
      'IsUrgent': instance.isUrgent,
      'Deadline': instance.deadline?.toIso8601String(),
      'ExpectDateComplete': instance.expectDateComplete?.toIso8601String(),
    };

_$SealItemImpl _$$SealItemImplFromJson(Map<String, dynamic> json) =>
    _$SealItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      sealCode: json['SealCode'] as String?,
      sealName: json['SealName'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
    );

Map<String, dynamic> _$$SealItemImplToJson(_$SealItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'SealCode': instance.sealCode,
      'SealName': instance.sealName,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedBy': instance.updatedBy,
    };

_$AssignerStampItemImpl _$$AssignerStampItemImplFromJson(
        Map<String, dynamic> json) =>
    _$AssignerStampItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      chucVuHDID: (json['ChucVuHDID'] as num?)?.toInt(),
      chuVuID: (json['ChuVuID'] as num?)?.toInt(),
      stt: (json['STT'] as num?)?.toInt(),
      code: json['Code'] as String?,
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      fullName: json['FullName'] as String?,
      anhCBNV: json['AnhCBNV'] as String?,
      chucVuHD: json['ChucVuHD'] as String?,
      chucVu: json['ChucVu'] as String?,
      departmentSTT: (json['DepartmentSTT'] as num?)?.toInt(),
      departmentName: json['DepartmentName'] as String?,
      dvBHXH: json['DvBHXH'] as String?,
      diaDiemLamViec: json['DiaDiemLamViec'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      noiSinh: json['NoiSinh'] as String?,
      gioiTinh: (json['GioiTinh'] as num?)?.toInt(),
      gioiTinhText: json['GioiTinhText'] as String?,
      danToc: json['DanToc'] as String?,
      tonGiao: json['TonGiao'] as String?,
      quocTich: json['QuocTich'] as String?,
      tinhTrangHonNhan: json['TinhTrangHonNhan'] as String?,
      dcThuongTru: json['DcThuongTru'] as String?,
      dcTamTru: json['DcTamTru'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCaNhan: json['EmailCaNhan'] as String?,
      sdtCongTy: json['SDTCongTy'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      nguoiLienHeKhiCan: json['NguoiLienHeKhiCan'] as String?,
      moiQuanHe: json['MoiQuanHe'] as String?,
      sdtNguoiThan: json['SDTNguoiThan'] as String?,
      nguoiLienHeKhiCan2: json['NguoiLienHeKhiCan2'] as String?,
      moiQuanHe2: json['MoiQuanHe2'] as String?,
      sdtNguoiThan2: json['SDTNguoiThan2'] as String?,
    );

Map<String, dynamic> _$$AssignerStampItemImplToJson(
        _$AssignerStampItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'ChucVuHDID': instance.chucVuHDID,
      'ChuVuID': instance.chuVuID,
      'STT': instance.stt,
      'Code': instance.code,
      'IDChamCongMoi': instance.idChamCongMoi,
      'FullName': instance.fullName,
      'AnhCBNV': instance.anhCBNV,
      'ChucVuHD': instance.chucVuHD,
      'ChucVu': instance.chucVu,
      'DepartmentSTT': instance.departmentSTT,
      'DepartmentName': instance.departmentName,
      'DvBHXH': instance.dvBHXH,
      'DiaDiemLamViec': instance.diaDiemLamViec,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'NoiSinh': instance.noiSinh,
      'GioiTinh': instance.gioiTinh,
      'GioiTinhText': instance.gioiTinhText,
      'DanToc': instance.danToc,
      'TonGiao': instance.tonGiao,
      'QuocTich': instance.quocTich,
      'TinhTrangHonNhan': instance.tinhTrangHonNhan,
      'DcThuongTru': instance.dcThuongTru,
      'DcTamTru': instance.dcTamTru,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCaNhan': instance.emailCaNhan,
      'SDTCongTy': instance.sdtCongTy,
      'EmailCongTy': instance.emailCongTy,
      'NguoiLienHeKhiCan': instance.nguoiLienHeKhiCan,
      'MoiQuanHe': instance.moiQuanHe,
      'SDTNguoiThan': instance.sdtNguoiThan,
      'NguoiLienHeKhiCan2': instance.nguoiLienHeKhiCan2,
      'MoiQuanHe2': instance.moiQuanHe2,
      'SDTNguoiThan2': instance.sdtNguoiThan2,
    };

_$DocumentStampItemImpl _$$DocumentStampItemImplFromJson(
        Map<String, dynamic> json) =>
    _$DocumentStampItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      name: json['Name'] as String?,
      code: json['Code'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
    );

Map<String, dynamic> _$$DocumentStampItemImplToJson(
        _$DocumentStampItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Code': instance.code,
      'IsDeleted': instance.isDeleted,
    };

_$CompanyStampItemImpl _$$CompanyStampItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyStampItemImpl(
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

Map<String, dynamic> _$$CompanyStampItemImplToJson(
        _$CompanyStampItemImpl instance) =>
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
