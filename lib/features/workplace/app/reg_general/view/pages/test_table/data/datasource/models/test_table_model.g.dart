// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestCardItemImpl _$$TestCardItemImplFromJson(Map<String, dynamic> json) =>
    _$TestCardItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      registrationCode: json['RegistrationCode'] as String?,
      testTableId: (json['TestTableID'] as num?)?.toInt(),
      testTableName: json['TestTableName'] as String?,
      tableSide: (json['TableSide'] as num?)?.toInt(),
      registrationStartDate: json['RegistrationStartDate'] == null
          ? null
          : DateTime.parse(json['RegistrationStartDate'] as String),
      projectCode: json['ProjectCode'] as String?,
      registrationContent: json['RegistrationContent'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      detailId: (json['DetailID'] as num?)?.toInt(),
      no: (json['No'] as num?)?.toInt(),
      type: (json['Type'] as num?)?.toInt(),
      detailStartDate: json['DetailStartDate'] == null
          ? null
          : DateTime.parse(json['DetailStartDate'] as String),
      detailEndDate: json['DetailEndDate'] == null
          ? null
          : DateTime.parse(json['DetailEndDate'] as String),
      actualReturnDate: json['ActualReturnDate'] == null
          ? null
          : DateTime.parse(json['ActualReturnDate'] as String),
      ownerId: (json['OwnerID'] as num?)?.toInt(),
      ownerFullName: json['OwnerFullName'] as String?,
      ownerPhone: json['OwnerSDTCaNhan'] as String?,
      ownerCode: json['OwnerCode'] as String?,
      approverId: (json['ApproverID'] as num?)?.toInt(),
      approverFullName: json['ApproverFullName'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      approveDate: json['ApproveDate'] == null
          ? null
          : DateTime.parse(json['ApproveDate'] as String),
      approveNote: json['ApproveNote'] as String?,
      eslBattery: (json['esl_battery'] as num?)?.toInt(),
      online: json['online'] as bool?,
      tableId: (json['tableID'] as num?)?.toInt(),
      machineNames: json['MachineNames'] as String?,
      detailsJson: json['DetailsJson'] as String?,
    );

Map<String, dynamic> _$$TestCardItemImplToJson(_$TestCardItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegistrationCode': instance.registrationCode,
      'TestTableID': instance.testTableId,
      'TestTableName': instance.testTableName,
      'TableSide': instance.tableSide,
      'RegistrationStartDate':
          instance.registrationStartDate?.toIso8601String(),
      'ProjectCode': instance.projectCode,
      'RegistrationContent': instance.registrationContent,
      'ProjectID': instance.projectId,
      'DetailID': instance.detailId,
      'No': instance.no,
      'Type': instance.type,
      'DetailStartDate': instance.detailStartDate?.toIso8601String(),
      'DetailEndDate': instance.detailEndDate?.toIso8601String(),
      'ActualReturnDate': instance.actualReturnDate?.toIso8601String(),
      'OwnerID': instance.ownerId,
      'OwnerFullName': instance.ownerFullName,
      'OwnerSDTCaNhan': instance.ownerPhone,
      'OwnerCode': instance.ownerCode,
      'ApproverID': instance.approverId,
      'ApproverFullName': instance.approverFullName,
      'Status': instance.status,
      'ApproveDate': instance.approveDate?.toIso8601String(),
      'ApproveNote': instance.approveNote,
      'esl_battery': instance.eslBattery,
      'online': instance.online,
      'tableID': instance.tableId,
      'MachineNames': instance.machineNames,
      'DetailsJson': instance.detailsJson,
    };

_$TestTableItemImpl _$$TestTableItemImplFromJson(Map<String, dynamic> json) =>
    _$TestTableItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      testTableName: json['TestTableName'] as String?,
      barcode: json['Barcode'] as String?,
      tableSide: (json['TableSide'] as num?)?.toInt(),
      numberOfSides: (json['NumberOfSides'] as num?)?.toInt(),
      description: json['Description'] as String?,
      isActive: json['IsActive'] as bool?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      createdBy: json['CreatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      isDeleted: json['IsDeleted'] as bool?,
      online: json['online'] as bool?,
      eslBattery: (json['esl_battery'] as num?)?.toInt(),
      isRegistrated: (json['isRegistrated'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TestTableItemImplToJson(_$TestTableItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TestTableName': instance.testTableName,
      'Barcode': instance.barcode,
      'TableSide': instance.tableSide,
      'NumberOfSides': instance.numberOfSides,
      'Description': instance.description,
      'IsActive': instance.isActive,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'CreatedBy': instance.createdBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'IsDeleted': instance.isDeleted,
      'online': instance.online,
      'esl_battery': instance.eslBattery,
      'isRegistrated': instance.isRegistrated,
    };

_$EmployeeInfoItemImpl _$$EmployeeInfoItemImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeInfoItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      userId: (json['UserID'] as num?)?.toInt(),
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
      chuVuId: (json['ChuVuID'] as num?)?.toInt(),
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

Map<String, dynamic> _$$EmployeeInfoItemImplToJson(
        _$EmployeeInfoItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'ChucVuHDID': instance.chucVuHdId,
      'ChuVuID': instance.chuVuId,
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

_$ProjectItemImpl _$$ProjectItemImplFromJson(Map<String, dynamic> json) =>
    _$ProjectItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      projectCode: json['ProjectCode'] as String?,
      projectName: json['ProjectName'] as String?,
    );

Map<String, dynamic> _$$ProjectItemImplToJson(_$ProjectItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ProjectCode': instance.projectCode,
      'ProjectName': instance.projectName,
    };

_$ApproverItemImpl _$$ApproverItemImplFromJson(Map<String, dynamic> json) =>
    _$ApproverItemImpl(
      userId: (json['UserID'] as num?)?.toInt(),
      id: (json['ID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      fullName: json['FullName'] as String?,
      birthOfDate: json['BirthOfDate'] == null
          ? null
          : DateTime.parse(json['BirthOfDate'] as String),
      sex: (json['Sex'] as num?)?.toInt(),
      qualifications: json['Qualifications'] as String?,
      bankAccount: json['BankAccount'] as String?,
      bhyt: json['BHYT'] as String?,
      mst: json['MST'] as String?,
      bhxh: json['BHXH'] as String?,
      cmtnd: json['CMTND'] as String?,
      jobDescription: json['JobDescription'] as String?,
      nhanVienTuVan: json['NhanVienTuVan'] as bool?,
      telephone: json['Telephone'] as String?,
      handPhone: json['HandPhone'] as String?,
      homeAddress: json['HomeAddress'] as String?,
      resident: json['Resident'] as String?,
      postalCode: json['PostalCode'] as String?,
      departmentId: (json['DepartmentID'] as num?)?.toInt(),
      status: (json['Status'] as num?)?.toInt(),
      communication: json['Communication'] as String?,
      passExpireDate: json['PassExpireDate'] == null
          ? null
          : DateTime.parse(json['PassExpireDate'] as String),
      isCashier: json['IsCashier'] as bool?,
      cashierNo: (json['CashierNo'] as num?)?.toInt(),
      emailCom: json['EmailCom'] as String?,
      email: json['Email'] as String?,
      startWorking: json['StartWorking'] == null
          ? null
          : DateTime.parse(json['StartWorking'] as String),
      userGroupId: (json['UserGroupID'] as num?)?.toInt(),
      userGroupSxId: (json['UserGroupSXID'] as num?)?.toInt(),
      mainViewId: (json['MainViewID'] as num?)?.toInt(),
      position: json['Position'] as String?,
      isSetupFunction: json['IsSetupFunction'] as bool?,
      imagePath: json['ImagePath'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      updatedBy: json['UpdatedBy'] as String?,
      updatedDate: json['UpdatedDate'] == null
          ? null
          : DateTime.parse(json['UpdatedDate'] as String),
      isAdminSale: (json['isAdminSale'] as num?)?.toInt(),
      roleId: (json['RoleID'] as num?)?.toInt(),
      teamId: (json['TeamID'] as num?)?.toInt(),
      leader: (json['Leader'] as num?)?.toInt(),
      idChamCongCu: json['IDChamCongCu'] as String?,
      idChamCongMoi: json['IDChamCongMoi'] as String?,
      anhCBNV: json['AnhCBNV'] as String?,
      chucVuHdId: (json['ChucVuHDID'] as num?)?.toInt(),
      chuVuId: (json['ChuVuID'] as num?)?.toInt(),
      dvBHXH: json['DvBHXH'] as String?,
      diaDiemLamViec: json['DiaDiemLamViec'] as String?,
      noiSinh: json['NoiSinh'] as String?,
      gioiTinh: (json['GioiTinh'] as num?)?.toInt(),
      danToc: json['DanToc'] as String?,
      tonGiao: json['TonGiao'] as String?,
      quocTich: json['QuocTich'] as String?,
      tinhTrangHonNhanId: (json['TinhTrangHonNhanID'] as num?)?.toInt(),
      soCMTND: json['SoCMTND'] as String?,
      ngayCap: json['NgayCap'] == null
          ? null
          : DateTime.parse(json['NgayCap'] as String),
      noiCap: json['NoiCap'] as String?,
      dcThuongTru: json['DcThuongTru'] as String?,
      dcTamTru: json['DcTamTru'] as String?,
      sdtCaNhan: json['SDTCaNhan'] as String?,
      emailCaNhan: json['EmailCaNhan'] as String?,
      sdtCongTy: json['SDTCongTy'] as String?,
      emailCongTy: json['EmailCongTy'] as String?,
      nguoiLienHeKhiCan: json['NguoiLienHeKhiCan'] as String?,
      moiQuanHe: json['MoiQuanHe'] as String?,
      sdtNguoiThan: json['SDTNguoiThan'] as String?,
      loaiHdldId: (json['LoaiHDLDID'] as num?)?.toInt(),
      tinhTrangKyHD: json['TinhTrangKyHD'] as String?,
      ngayBatDauHD: json['NgayBatDauHD'] == null
          ? null
          : DateTime.parse(json['NgayBatDauHD'] as String),
      ngayKetThucHD: json['NgayKetThucHD'] == null
          ? null
          : DateTime.parse(json['NgayKetThucHD'] as String),
      soHD: json['SoHD'] as String?,
      soSoBHXH: json['SoSoBHXH'] as String?,
      nguoiGiuSoBHXH: (json['NguoiGiuSoBHXH'] as num?)?.toInt(),
      ngayBatDauBHXHCty: json['NgayBatDauBHXHCty'] == null
          ? null
          : DateTime.parse(json['NgayBatDauBHXHCty'] as String),
      mucDongBHXHHienTai: (json['MucDongBHXHHienTai'] as num?)?.toDouble(),
      luongThuViec: (json['LuongThuViec'] as num?)?.toDouble(),
      luongCoBan: (json['LuongCoBan'] as num?)?.toDouble(),
      anCa: (json['AnCa'] as num?)?.toDouble(),
      xangXe: (json['XangXe'] as num?)?.toDouble(),
      dienThoai: (json['DienThoai'] as num?)?.toDouble(),
      nhaO: (json['NhaO'] as num?)?.toDouble(),
      trangPhuc: (json['TrangPhuc'] as num?)?.toDouble(),
      chuyenCan: (json['ChuyenCan'] as num?)?.toDouble(),
      khac: (json['Khac'] as num?)?.toDouble(),
      tongPhuCap: (json['TongPhuCap'] as num?)?.toDouble(),
      tongLuong: (json['TongLuong'] as num?)?.toDouble(),
      giamTruBanThan: (json['GiamTruBanThan'] as num?)?.toDouble(),
      soNguoiPT: (json['SoNguoiPT'] as num?)?.toInt(),
      tongTien: (json['TongTien'] as num?)?.toDouble(),
      stkChuyenLuong: json['STKChuyenLuong'] as String?,
      syll: json['SYLL'] as bool?,
      giayKS: json['GiayKS'] as bool?,
      cmndOrCccd: json['CMNDorCCCD'] as bool?,
      soHK: json['SoHK'] as bool?,
      xnns: json['XNNS'] as bool?,
      bangCap: json['BangCap'] as bool?,
      cv: json['CV'] as bool?,
      dxv: json['DXV'] as bool?,
      camKetTs: json['CamKetTs'] as bool?,
      toTrinhTD: json['ToTrinhTD'] as bool?,
      thuMoiNhanViec: json['ThuMoiNhanViec'] as bool?,
      qdtd: json['QDTD'] as bool?,
      hdtv: json['HDTV'] as bool?,
      dgtv: json['DGTV'] as bool?,
      hdldxdth: json['HDLDXDTH'] as bool?,
      dgChuyenHD: json['DGChuyenHD'] as bool?,
      hdldkxdth: json['HDLDKXDTH'] as bool?,
      tinhTrangCapDongPhuc: json['TinhTrangCapDongPhuc'] as bool?,
      giayKSK: json['GiayKSK'] as bool?,
      ngayBatDauThuViec: json['NgayBatDauThuViec'] == null
          ? null
          : DateTime.parse(json['NgayBatDauThuViec'] as String),
      ngayKetThucThuViec: json['NgayKetThucThuViec'] == null
          ? null
          : DateTime.parse(json['NgayKetThucThuViec'] as String),
      soHDTV: json['SoHDTV'] as String?,
      ngayBatDauHDXDTH: json['NgayBatDauHDXDTH'] == null
          ? null
          : DateTime.parse(json['NgayBatDauHDXDTH'] as String),
      ngayKetThucHDXDTH: json['NgayKetThucHDXDTH'] == null
          ? null
          : DateTime.parse(json['NgayKetThucHDXDTH'] as String),
      soHDXDTH: json['SoHDXDTH'] as String?,
      ngayHieuLucHDKXDTH: json['NgayHieuLucHDKXDTH'] == null
          ? null
          : DateTime.parse(json['NgayHieuLucHDKXDTH'] as String),
      soHDKXDTH: json['SoHDKXDTH'] as String?,
      ngayBatDauBHXH: json['NgayBatDauBHXH'] == null
          ? null
          : DateTime.parse(json['NgayBatDauBHXH'] as String),
      ngayKetThucBHXH: json['NgayKetThucBHXH'] == null
          ? null
          : DateTime.parse(json['NgayKetThucBHXH'] as String),
      soNhaDcThuongTru: json['SoNhaDcThuongTru'] as String?,
      duongDcThuongTru: json['DuongDcThuongTru'] as String?,
      phuongDcThuongTru: json['PhuongDcThuongTru'] as String?,
      quanDcThuongTru: json['QuanDcThuongTru'] as String?,
      tinhDcThuongTru: json['TinhDcThuongTru'] as String?,
      soNhaDcTamTru: json['SoNhaDcTamTru'] as String?,
      duongDcTamTru: json['DuongDcTamTru'] as String?,
      phuongDcTamTru: json['PhuongDcTamTru'] as String?,
      quanDcTamTru: json['QuanDcTamTru'] as String?,
      tinhDcTamTru: json['TinhDcTamTru'] as String?,
      hdldxdthYear: json['HDLDXDTHYear'] as bool?,
      dgChuyenHdYear: json['DGChuyenHDYear'] as bool?,
      endWorking: json['EndWorking'] == null
          ? null
          : DateTime.parse(json['EndWorking'] as String),
      reasonDeleted: json['ReasonDeleted'] as String?,
      codeOld: json['CodeOld'] as String?,
      projectTypeId: (json['ProjectTypeID'] as num?)?.toInt(),
      employeeTeamId: (json['EmployeeTeamID'] as num?)?.toInt(),
      giayXacNhanCuTru: json['GiayXacNhanCuTru'] as bool?,
      userZaloId: json['UserZaloID'] as String?,
      taxCompanyId: (json['TaxCompanyID'] as num?)?.toInt(),
      nguoiLienHeKhiCan2: json['NguoiLienHeKhiCan2'] as String?,
      moiQuanHe2: json['MoiQuanHe2'] as String?,
      sdtNguoiThan2: json['SDTNguoiThan2'] as String?,
      isExcludedFromSalary: json['IsExcludedFromSalary'] as bool?,
    );

Map<String, dynamic> _$$ApproverItemImplToJson(_$ApproverItemImpl instance) =>
    <String, dynamic>{
      'UserID': instance.userId,
      'ID': instance.id,
      'Code': instance.code,
      'FullName': instance.fullName,
      'BirthOfDate': instance.birthOfDate?.toIso8601String(),
      'Sex': instance.sex,
      'Qualifications': instance.qualifications,
      'BankAccount': instance.bankAccount,
      'BHYT': instance.bhyt,
      'MST': instance.mst,
      'BHXH': instance.bhxh,
      'CMTND': instance.cmtnd,
      'JobDescription': instance.jobDescription,
      'NhanVienTuVan': instance.nhanVienTuVan,
      'Telephone': instance.telephone,
      'HandPhone': instance.handPhone,
      'HomeAddress': instance.homeAddress,
      'Resident': instance.resident,
      'PostalCode': instance.postalCode,
      'DepartmentID': instance.departmentId,
      'Status': instance.status,
      'Communication': instance.communication,
      'PassExpireDate': instance.passExpireDate?.toIso8601String(),
      'IsCashier': instance.isCashier,
      'CashierNo': instance.cashierNo,
      'EmailCom': instance.emailCom,
      'Email': instance.email,
      'StartWorking': instance.startWorking?.toIso8601String(),
      'UserGroupID': instance.userGroupId,
      'UserGroupSXID': instance.userGroupSxId,
      'MainViewID': instance.mainViewId,
      'Position': instance.position,
      'IsSetupFunction': instance.isSetupFunction,
      'ImagePath': instance.imagePath,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'UpdatedBy': instance.updatedBy,
      'UpdatedDate': instance.updatedDate?.toIso8601String(),
      'isAdminSale': instance.isAdminSale,
      'RoleID': instance.roleId,
      'TeamID': instance.teamId,
      'Leader': instance.leader,
      'IDChamCongCu': instance.idChamCongCu,
      'IDChamCongMoi': instance.idChamCongMoi,
      'AnhCBNV': instance.anhCBNV,
      'ChucVuHDID': instance.chucVuHdId,
      'ChuVuID': instance.chuVuId,
      'DvBHXH': instance.dvBHXH,
      'DiaDiemLamViec': instance.diaDiemLamViec,
      'NoiSinh': instance.noiSinh,
      'GioiTinh': instance.gioiTinh,
      'DanToc': instance.danToc,
      'TonGiao': instance.tonGiao,
      'QuocTich': instance.quocTich,
      'TinhTrangHonNhanID': instance.tinhTrangHonNhanId,
      'SoCMTND': instance.soCMTND,
      'NgayCap': instance.ngayCap?.toIso8601String(),
      'NoiCap': instance.noiCap,
      'DcThuongTru': instance.dcThuongTru,
      'DcTamTru': instance.dcTamTru,
      'SDTCaNhan': instance.sdtCaNhan,
      'EmailCaNhan': instance.emailCaNhan,
      'SDTCongTy': instance.sdtCongTy,
      'EmailCongTy': instance.emailCongTy,
      'NguoiLienHeKhiCan': instance.nguoiLienHeKhiCan,
      'MoiQuanHe': instance.moiQuanHe,
      'SDTNguoiThan': instance.sdtNguoiThan,
      'LoaiHDLDID': instance.loaiHdldId,
      'TinhTrangKyHD': instance.tinhTrangKyHD,
      'NgayBatDauHD': instance.ngayBatDauHD?.toIso8601String(),
      'NgayKetThucHD': instance.ngayKetThucHD?.toIso8601String(),
      'SoHD': instance.soHD,
      'SoSoBHXH': instance.soSoBHXH,
      'NguoiGiuSoBHXH': instance.nguoiGiuSoBHXH,
      'NgayBatDauBHXHCty': instance.ngayBatDauBHXHCty?.toIso8601String(),
      'MucDongBHXHHienTai': instance.mucDongBHXHHienTai,
      'LuongThuViec': instance.luongThuViec,
      'LuongCoBan': instance.luongCoBan,
      'AnCa': instance.anCa,
      'XangXe': instance.xangXe,
      'DienThoai': instance.dienThoai,
      'NhaO': instance.nhaO,
      'TrangPhuc': instance.trangPhuc,
      'ChuyenCan': instance.chuyenCan,
      'Khac': instance.khac,
      'TongPhuCap': instance.tongPhuCap,
      'TongLuong': instance.tongLuong,
      'GiamTruBanThan': instance.giamTruBanThan,
      'SoNguoiPT': instance.soNguoiPT,
      'TongTien': instance.tongTien,
      'STKChuyenLuong': instance.stkChuyenLuong,
      'SYLL': instance.syll,
      'GiayKS': instance.giayKS,
      'CMNDorCCCD': instance.cmndOrCccd,
      'SoHK': instance.soHK,
      'XNNS': instance.xnns,
      'BangCap': instance.bangCap,
      'CV': instance.cv,
      'DXV': instance.dxv,
      'CamKetTs': instance.camKetTs,
      'ToTrinhTD': instance.toTrinhTD,
      'ThuMoiNhanViec': instance.thuMoiNhanViec,
      'QDTD': instance.qdtd,
      'HDTV': instance.hdtv,
      'DGTV': instance.dgtv,
      'HDLDXDTH': instance.hdldxdth,
      'DGChuyenHD': instance.dgChuyenHD,
      'HDLDKXDTH': instance.hdldkxdth,
      'TinhTrangCapDongPhuc': instance.tinhTrangCapDongPhuc,
      'GiayKSK': instance.giayKSK,
      'NgayBatDauThuViec': instance.ngayBatDauThuViec?.toIso8601String(),
      'NgayKetThucThuViec': instance.ngayKetThucThuViec?.toIso8601String(),
      'SoHDTV': instance.soHDTV,
      'NgayBatDauHDXDTH': instance.ngayBatDauHDXDTH?.toIso8601String(),
      'NgayKetThucHDXDTH': instance.ngayKetThucHDXDTH?.toIso8601String(),
      'SoHDXDTH': instance.soHDXDTH,
      'NgayHieuLucHDKXDTH': instance.ngayHieuLucHDKXDTH?.toIso8601String(),
      'SoHDKXDTH': instance.soHDKXDTH,
      'NgayBatDauBHXH': instance.ngayBatDauBHXH?.toIso8601String(),
      'NgayKetThucBHXH': instance.ngayKetThucBHXH?.toIso8601String(),
      'SoNhaDcThuongTru': instance.soNhaDcThuongTru,
      'DuongDcThuongTru': instance.duongDcThuongTru,
      'PhuongDcThuongTru': instance.phuongDcThuongTru,
      'QuanDcThuongTru': instance.quanDcThuongTru,
      'TinhDcThuongTru': instance.tinhDcThuongTru,
      'SoNhaDcTamTru': instance.soNhaDcTamTru,
      'DuongDcTamTru': instance.duongDcTamTru,
      'PhuongDcTamTru': instance.phuongDcTamTru,
      'QuanDcTamTru': instance.quanDcTamTru,
      'TinhDcTamTru': instance.tinhDcTamTru,
      'HDLDXDTHYear': instance.hdldxdthYear,
      'DGChuyenHDYear': instance.dgChuyenHdYear,
      'EndWorking': instance.endWorking?.toIso8601String(),
      'ReasonDeleted': instance.reasonDeleted,
      'CodeOld': instance.codeOld,
      'ProjectTypeID': instance.projectTypeId,
      'EmployeeTeamID': instance.employeeTeamId,
      'GiayXacNhanCuTru': instance.giayXacNhanCuTru,
      'UserZaloID': instance.userZaloId,
      'TaxCompanyID': instance.taxCompanyId,
      'NguoiLienHeKhiCan2': instance.nguoiLienHeKhiCan2,
      'MoiQuanHe2': instance.moiQuanHe2,
      'SDTNguoiThan2': instance.sdtNguoiThan2,
      'IsExcludedFromSalary': instance.isExcludedFromSalary,
    };

_$TestMachineItemImpl _$$TestMachineItemImplFromJson(
        Map<String, dynamic> json) =>
    _$TestMachineItemImpl(
      id: (json['ID'] as num?)?.toInt(),
      machineName: json['MachineName'] as String?,
      machineCode: json['MachineCode'] as String?,
      ip: json['IP'] as String?,
    );

Map<String, dynamic> _$$TestMachineItemImplToJson(
        _$TestMachineItemImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'MachineName': instance.machineName,
      'MachineCode': instance.machineCode,
      'IP': instance.ip,
    };

_$TestCardDetailImpl _$$TestCardDetailImplFromJson(Map<String, dynamic> json) =>
    _$TestCardDetailImpl(
      id: (json['ID'] as num?)?.toInt(),
      registrationId: (json['RegistrationID'] as num?)?.toInt(),
      no: (json['No'] as num?)?.toInt(),
      type: (json['Type'] as num?)?.toInt(),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      actualReturnDate: json['ActualReturnDate'] == null
          ? null
          : DateTime.parse(json['ActualReturnDate'] as String),
      ownerId: (json['OwnerID'] as num?)?.toInt(),
      ownerName: json['OwnerName'] as String?,
      approverId: (json['ApproverID'] as num?)?.toInt(),
      approverName: json['ApproverName'] as String?,
      status: (json['Status'] as num?)?.toInt(),
      approveDate: json['ApproveDate'] == null
          ? null
          : DateTime.parse(json['ApproveDate'] as String),
      approveNote: json['ApproveNote'] as String?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      isDelete: json['IsDelete'] as bool?,
      machineIds: (json['MachineIDs'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      projectCode: json['ProjectCode'] as String?,
      projectId: (json['ProjectID'] as num?)?.toInt(),
      registrationContent: json['RegistrationContent'] as String?,
      testTableId: (json['TestTableID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TestCardDetailImplToJson(
        _$TestCardDetailImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RegistrationID': instance.registrationId,
      'No': instance.no,
      'Type': instance.type,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'ActualReturnDate': instance.actualReturnDate?.toIso8601String(),
      'OwnerID': instance.ownerId,
      'OwnerName': instance.ownerName,
      'ApproverID': instance.approverId,
      'ApproverName': instance.approverName,
      'Status': instance.status,
      'ApproveDate': instance.approveDate?.toIso8601String(),
      'ApproveNote': instance.approveNote,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'IsDelete': instance.isDelete,
      'MachineIDs': instance.machineIds,
      'ProjectCode': instance.projectCode,
      'ProjectID': instance.projectId,
      'RegistrationContent': instance.registrationContent,
      'TestTableID': instance.testTableId,
    };
