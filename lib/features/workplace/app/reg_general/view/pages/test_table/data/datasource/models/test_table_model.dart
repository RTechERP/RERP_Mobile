import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_table_model.freezed.dart';
part 'test_table_model.g.dart';

/// Phiếu đăng ký bàn test ESL từ `/ESLRegistration/get-all-registration`.
@freezed
class TestCardItem with _$TestCardItem {
  const factory TestCardItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegistrationCode') String? registrationCode,
    @JsonKey(name: 'TestTableID') int? testTableId,
    @JsonKey(name: 'TestTableName') String? testTableName,
    @JsonKey(name: 'TableSide') int? tableSide,
    @JsonKey(name: 'RegistrationStartDate') DateTime? registrationStartDate,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'RegistrationContent') String? registrationContent,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'DetailID') int? detailId,
    @JsonKey(name: 'No') int? no,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'DetailStartDate') DateTime? detailStartDate,
    @JsonKey(name: 'DetailEndDate') DateTime? detailEndDate,
    @JsonKey(name: 'ActualReturnDate') DateTime? actualReturnDate,
    @JsonKey(name: 'OwnerID') int? ownerId,
    @JsonKey(name: 'OwnerFullName') String? ownerFullName,
    @JsonKey(name: 'OwnerSDTCaNhan') String? ownerPhone,
    @JsonKey(name: 'OwnerCode') String? ownerCode,
    @JsonKey(name: 'ApproverID') int? approverId,
    @JsonKey(name: 'ApproverFullName') String? approverFullName,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ApproveDate') DateTime? approveDate,
    @JsonKey(name: 'ApproveNote') String? approveNote,
    @JsonKey(name: 'esl_battery') int? eslBattery,
    @JsonKey(name: 'online') bool? online,
    @JsonKey(name: 'tableID') int? tableId,
    @JsonKey(name: 'MachineNames') String? machineNames,
    @JsonKey(name: 'DetailsJson') String? detailsJson,
  }) = _TestCardItem;

  factory TestCardItem.fromJson(Map<String, dynamic> json) =>
      _$TestCardItemFromJson(json);
}

/// Thông tin bàn test từ '/ESLTestTable/getall'.
@freezed
class TestTableItem with _$TestTableItem {
  const factory TestTableItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TestTableName') String? testTableName,
    @JsonKey(name: 'Barcode') String? barcode,
    @JsonKey(name: 'TableSide') int? tableSide,
    @JsonKey(name: 'NumberOfSides') int? numberOfSides,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'online') bool? online,
    @JsonKey(name: 'esl_battery') int? eslBattery,
    @JsonKey(name: 'isRegistrated') int? isRegistrated,
  }) = _TestTableItem;

  factory TestTableItem.fromJson(Map<String, dynamic> json) =>
      _$TestTableItemFromJson(json);
}

/// Thông tin nhân viên từ '/employee/?status=0&departmentid=0&keyword='.
@freezed
class EmployeeInfoItem with _$EmployeeInfoItem {
  const factory EmployeeInfoItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'ChuVuID') int? chuVuId,
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
  }) = _EmployeeInfoItem;

  factory EmployeeInfoItem.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoItemFromJson(json);
}

/// Thông tin dự án từ '/ProjectTask/get-all-project'.
@freezed
class ProjectItem with _$ProjectItem {
  const factory ProjectItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
  }) = _ProjectItem;

  factory ProjectItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemFromJson(json);
}

/// Thông tin người duyệt từ '/ESLRegistration/get-all-user-approve'.
@freezed
class ApproverItem with _$ApproverItem {
  const factory ApproverItem({
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'BirthOfDate') DateTime? birthOfDate,
    @JsonKey(name: 'Sex') int? sex,
    @JsonKey(name: 'Qualifications') String? qualifications,
    @JsonKey(name: 'BankAccount') String? bankAccount,
    @JsonKey(name: 'BHYT') String? bhyt,
    @JsonKey(name: 'MST') String? mst,
    @JsonKey(name: 'BHXH') String? bhxh,
    @JsonKey(name: 'CMTND') String? cmtnd,
    @JsonKey(name: 'JobDescription') String? jobDescription,
    @JsonKey(name: 'NhanVienTuVan') bool? nhanVienTuVan,
    @JsonKey(name: 'Telephone') String? telephone,
    @JsonKey(name: 'HandPhone') String? handPhone,
    @JsonKey(name: 'HomeAddress') String? homeAddress,
    @JsonKey(name: 'Resident') String? resident,
    @JsonKey(name: 'PostalCode') String? postalCode,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Communication') String? communication,
    @JsonKey(name: 'PassExpireDate') DateTime? passExpireDate,
    @JsonKey(name: 'IsCashier') bool? isCashier,
    @JsonKey(name: 'CashierNo') int? cashierNo,
    @JsonKey(name: 'EmailCom') String? emailCom,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'StartWorking') DateTime? startWorking,
    @JsonKey(name: 'UserGroupID') int? userGroupId,
    @JsonKey(name: 'UserGroupSXID') int? userGroupSxId,
    @JsonKey(name: 'MainViewID') int? mainViewId,
    @JsonKey(name: 'Position') String? position,
    @JsonKey(name: 'IsSetupFunction') bool? isSetupFunction,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'isAdminSale') int? isAdminSale,
    @JsonKey(name: 'RoleID') int? roleId,
    @JsonKey(name: 'TeamID') int? teamId,
    @JsonKey(name: 'Leader') int? leader,
    @JsonKey(name: 'IDChamCongCu') String? idChamCongCu,
    @JsonKey(name: 'IDChamCongMoi') String? idChamCongMoi,
    @JsonKey(name: 'AnhCBNV') String? anhCBNV,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'ChuVuID') int? chuVuId,
    @JsonKey(name: 'DvBHXH') String? dvBHXH,
    @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
    @JsonKey(name: 'NoiSinh') String? noiSinh,
    @JsonKey(name: 'GioiTinh') int? gioiTinh,
    @JsonKey(name: 'DanToc') String? danToc,
    @JsonKey(name: 'TonGiao') String? tonGiao,
    @JsonKey(name: 'QuocTich') String? quocTich,
    @JsonKey(name: 'TinhTrangHonNhanID') int? tinhTrangHonNhanId,
    @JsonKey(name: 'SoCMTND') String? soCMTND,
    @JsonKey(name: 'NgayCap') DateTime? ngayCap,
    @JsonKey(name: 'NoiCap') String? noiCap,
    @JsonKey(name: 'DcThuongTru') String? dcThuongTru,
    @JsonKey(name: 'DcTamTru') String? dcTamTru,
    @JsonKey(name: 'SDTCaNhan') String? sdtCaNhan,
    @JsonKey(name: 'EmailCaNhan') String? emailCaNhan,
    @JsonKey(name: 'SDTCongTy') String? sdtCongTy,
    @JsonKey(name: 'EmailCongTy') String? emailCongTy,
    @JsonKey(name: 'NguoiLienHeKhiCan') String? nguoiLienHeKhiCan,
    @JsonKey(name: 'MoiQuanHe') String? moiQuanHe,
    @JsonKey(name: 'SDTNguoiThan') String? sdtNguoiThan,
    @JsonKey(name: 'LoaiHDLDID') int? loaiHdldId,
    @JsonKey(name: 'TinhTrangKyHD') String? tinhTrangKyHD,
    @JsonKey(name: 'NgayBatDauHD') DateTime? ngayBatDauHD,
    @JsonKey(name: 'NgayKetThucHD') DateTime? ngayKetThucHD,
    @JsonKey(name: 'SoHD') String? soHD,
    @JsonKey(name: 'SoSoBHXH') String? soSoBHXH,
    @JsonKey(name: 'NguoiGiuSoBHXH') int? nguoiGiuSoBHXH,
    @JsonKey(name: 'NgayBatDauBHXHCty') DateTime? ngayBatDauBHXHCty,
    @JsonKey(name: 'MucDongBHXHHienTai') double? mucDongBHXHHienTai,
    @JsonKey(name: 'LuongThuViec') double? luongThuViec,
    @JsonKey(name: 'LuongCoBan') double? luongCoBan,
    @JsonKey(name: 'AnCa') double? anCa,
    @JsonKey(name: 'XangXe') double? xangXe,
    @JsonKey(name: 'DienThoai') double? dienThoai,
    @JsonKey(name: 'NhaO') double? nhaO,
    @JsonKey(name: 'TrangPhuc') double? trangPhuc,
    @JsonKey(name: 'ChuyenCan') double? chuyenCan,
    @JsonKey(name: 'Khac') double? khac,
    @JsonKey(name: 'TongPhuCap') double? tongPhuCap,
    @JsonKey(name: 'TongLuong') double? tongLuong,
    @JsonKey(name: 'GiamTruBanThan') double? giamTruBanThan,
    @JsonKey(name: 'SoNguoiPT') int? soNguoiPT,
    @JsonKey(name: 'TongTien') double? tongTien,
    @JsonKey(name: 'STKChuyenLuong') String? stkChuyenLuong,
    @JsonKey(name: 'SYLL') bool? syll,
    @JsonKey(name: 'GiayKS') bool? giayKS,
    @JsonKey(name: 'CMNDorCCCD') bool? cmndOrCccd,
    @JsonKey(name: 'SoHK') bool? soHK,
    @JsonKey(name: 'XNNS') bool? xnns,
    @JsonKey(name: 'BangCap') bool? bangCap,
    @JsonKey(name: 'CV') bool? cv,
    @JsonKey(name: 'DXV') bool? dxv,
    @JsonKey(name: 'CamKetTs') bool? camKetTs,
    @JsonKey(name: 'ToTrinhTD') bool? toTrinhTD,
    @JsonKey(name: 'ThuMoiNhanViec') bool? thuMoiNhanViec,
    @JsonKey(name: 'QDTD') bool? qdtd,
    @JsonKey(name: 'HDTV') bool? hdtv,
    @JsonKey(name: 'DGTV') bool? dgtv,
    @JsonKey(name: 'HDLDXDTH') bool? hdldxdth,
    @JsonKey(name: 'DGChuyenHD') bool? dgChuyenHD,
    @JsonKey(name: 'HDLDKXDTH') bool? hdldkxdth,
    @JsonKey(name: 'TinhTrangCapDongPhuc') bool? tinhTrangCapDongPhuc,
    @JsonKey(name: 'GiayKSK') bool? giayKSK,
    @JsonKey(name: 'NgayBatDauThuViec') DateTime? ngayBatDauThuViec,
    @JsonKey(name: 'NgayKetThucThuViec') DateTime? ngayKetThucThuViec,
    @JsonKey(name: 'SoHDTV') String? soHDTV,
    @JsonKey(name: 'NgayBatDauHDXDTH') DateTime? ngayBatDauHDXDTH,
    @JsonKey(name: 'NgayKetThucHDXDTH') DateTime? ngayKetThucHDXDTH,
    @JsonKey(name: 'SoHDXDTH') String? soHDXDTH,
    @JsonKey(name: 'NgayHieuLucHDKXDTH') DateTime? ngayHieuLucHDKXDTH,
    @JsonKey(name: 'SoHDKXDTH') String? soHDKXDTH,
    @JsonKey(name: 'NgayBatDauBHXH') DateTime? ngayBatDauBHXH,
    @JsonKey(name: 'NgayKetThucBHXH') DateTime? ngayKetThucBHXH,
    @JsonKey(name: 'SoNhaDcThuongTru') String? soNhaDcThuongTru,
    @JsonKey(name: 'DuongDcThuongTru') String? duongDcThuongTru,
    @JsonKey(name: 'PhuongDcThuongTru') String? phuongDcThuongTru,
    @JsonKey(name: 'QuanDcThuongTru') String? quanDcThuongTru,
    @JsonKey(name: 'TinhDcThuongTru') String? tinhDcThuongTru,
    @JsonKey(name: 'SoNhaDcTamTru') String? soNhaDcTamTru,
    @JsonKey(name: 'DuongDcTamTru') String? duongDcTamTru,
    @JsonKey(name: 'PhuongDcTamTru') String? phuongDcTamTru,
    @JsonKey(name: 'QuanDcTamTru') String? quanDcTamTru,
    @JsonKey(name: 'TinhDcTamTru') String? tinhDcTamTru,
    @JsonKey(name: 'HDLDXDTHYear') bool? hdldxdthYear,
    @JsonKey(name: 'DGChuyenHDYear') bool? dgChuyenHdYear,
    @JsonKey(name: 'EndWorking') DateTime? endWorking,
    @JsonKey(name: 'ReasonDeleted') String? reasonDeleted,
    @JsonKey(name: 'CodeOld') String? codeOld,
    @JsonKey(name: 'ProjectTypeID') int? projectTypeId,
    @JsonKey(name: 'EmployeeTeamID') int? employeeTeamId,
    @JsonKey(name: 'GiayXacNhanCuTru') bool? giayXacNhanCuTru,
    @JsonKey(name: 'UserZaloID') String? userZaloId,
    @JsonKey(name: 'TaxCompanyID') int? taxCompanyId,
    @JsonKey(name: 'NguoiLienHeKhiCan2') String? nguoiLienHeKhiCan2,
    @JsonKey(name: 'MoiQuanHe2') String? moiQuanHe2,
    @JsonKey(name: 'SDTNguoiThan2') String? sdtNguoiThan2,
    @JsonKey(name: 'IsExcludedFromSalary') bool? isExcludedFromSalary,
  }) = _ApproverItem;

  factory ApproverItem.fromJson(Map<String, dynamic> json) =>
      _$ApproverItemFromJson(json);
}

/// Thông tin máy test theo bàn từ '/ESLTestMachine/get-by-table'.
@freezed
class TestMachineItem with _$TestMachineItem {
  const factory TestMachineItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'MachineName') String? machineName,
    @JsonKey(name: 'MachineCode') String? machineCode,
    @JsonKey(name: 'IP') String? ip,
  }) = _TestMachineItem;

  factory TestMachineItem.fromJson(Map<String, dynamic> json) =>
      _$TestMachineItemFromJson(json);
}

/// Chi tiết phiếu card từ '/ESLRegistration/get-details?registrationId=X'.
@freezed
class TestCardDetail with _$TestCardDetail {
  const factory TestCardDetail({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RegistrationID') int? registrationId,
    @JsonKey(name: 'No') int? no,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'ActualReturnDate') DateTime? actualReturnDate,
    @JsonKey(name: 'OwnerID') int? ownerId,
    @JsonKey(name: 'OwnerName') String? ownerName,
    @JsonKey(name: 'ApproverID') int? approverId,
    @JsonKey(name: 'ApproverName') String? approverName,
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'ApproveDate') DateTime? approveDate,
    @JsonKey(name: 'ApproveNote') String? approveNote,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    // Additional fields for edit payload
    @JsonKey(name: 'IsDelete') bool? isDelete,
    @JsonKey(name: 'MachineIDs') List<int>? machineIds,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'RegistrationContent') String? registrationContent,
    @JsonKey(name: 'TestTableID') int? testTableId,
  }) = _TestCardDetail;

  factory TestCardDetail.fromJson(Map<String, dynamic> json) =>
      _$TestCardDetailFromJson(json);
}