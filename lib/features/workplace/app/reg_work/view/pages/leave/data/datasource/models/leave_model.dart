import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

@freezed
class LeaveItem with _$LeaveItem {
  const factory LeaveItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ApprovedTP') int? approvedTP,
    @JsonKey(name: 'ApprovedHR') int? approvedHR,
    @JsonKey(name: 'TimeOnLeave') int? timeOnLeave,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'TotalTime') double? totalTime,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'TypeIsReal') int? typeIsReal,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'Reason') String? reason,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApprovedTP') bool? isApprovedTP,
    @JsonKey(name: 'IsApprovedHR') bool? isApprovedHR,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'IsCancelTP') bool? isCancelTP,
    @JsonKey(name: 'IsCancelHR') bool? isCancelHR,
    @JsonKey(name: 'IsCancelRegister') bool? isCancelRegister,
    @JsonKey(name: 'DecilineApprove') int? decilineApprove,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'DateCancel') DateTime? dateCancel,
    @JsonKey(name: 'DeleteFlag') bool? deleteFlag,
    @JsonKey(name: 'ReasonDeciline') String? reasonDeciline,
    @JsonKey(name: 'ReasonHREdit') String? reasonHREdit,
    @JsonKey(name: 'IsProblem') bool? isProblem,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBGD,
    @JsonKey(name: 'ApprovedBGDID') int? approvedBGDID,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBGD,
    @JsonKey(name: 'IsSeniorApproved') int? isSeniorApproved,
    @JsonKey(name: 'ApprovedSeniorID') int? approvedSeniorID,
    @JsonKey(name: 'DateApprovedSenior') DateTime? dateApprovedSenior,
    @JsonKey(name: 'DecilineApproveSenior') int? decilineApproveSenior,
    @JsonKey(name: 'ReasonDecilineSenior') String? reasonDecilineSenior,
    @JsonKey(name: 'EmployeeOnLeavePhaseID') int? employeeOnLeavePhaseId,
    @JsonKey(name: 'PhaseCode') String? phaseCode,
    @JsonKey(name: 'DateRegister') DateTime? dateRegister,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'IDApprovedTP') int? idApprovedTP,
    @JsonKey(name: 'TypeText') String? typeText,
    @JsonKey(name: 'TimeOnLeaveText') String? timeOnLeaveText,
    @JsonKey(name: 'TypeHR') String? typeHR,
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'RowNumber') int? rowNumber,
    @JsonKey(name: 'ApprovedName') String? approvedName,
    @JsonKey(name: 'StatusNumber') int? statusNumber,
    @JsonKey(name: 'StatusHRNumber') int? statusHRNumber,
    @JsonKey(name: 'StatusText') String? statusText,
    @JsonKey(name: 'StatusHRText') String? statusHRText,
  }) = _LeaveItem;

  factory LeaveItem.fromJson(Map<String, dynamic> json) =>
      _$LeaveItemFromJson(json);
}

@freezed
class LeaveTimeItem with _$LeaveTimeItem {
  const factory LeaveTimeItem({
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'TotalDay') double? totalDay,
    @JsonKey(name: 'TotalDayApproved') double? totalDayApproved,
    @JsonKey(name: 'TotalDayOnleaveActual') double? totalDayOnleaveActual,
    @JsonKey(name: 'TotalDayRemain') double? totalDayRemain,
    @JsonKey(name: 'TotalDayUnApproved') double? totalDayUnApproved,
  }) = _LeaveTimeItem;

  factory LeaveTimeItem.fromJson(Map<String, dynamic> json) =>
      _$LeaveTimeItemFromJson(json);
}

@freezed
class ApproverItem with _$ApproverItem {
  const factory ApproverItem({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Type') int? type,
    @JsonKey(name: 'CreatedBy') String? createdBy,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'UpdatedBy') String? updatedBy,
    @JsonKey(name: 'UpdatedDate') DateTime? updatedDate,
    @JsonKey(name: 'UsersID') int? usersId,
    @JsonKey(name: 'IsPassed') bool? isPassed,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ApproverItem;

  factory ApproverItem.fromJson(Map<String, dynamic> json) =>
      _$ApproverItemFromJson(json);
}

@freezed
class EmployeeLeave with _$EmployeeLeave {
  const factory EmployeeLeave({
    @JsonKey(name: 'DepartmentID') int? departmentId,
    @JsonKey(name: 'DepartmentName') String? departmentName,
    @JsonKey(name: 'DepartmentSTT') int? departmentStt,
    @JsonKey(name: 'LoginName') String? loginName,
    @JsonKey(name: 'PriorityOrder') int? priorityOrder,
    @JsonKey(name: 'ChucVu') String? chucVu,
    @JsonKey(name: 'ChucVuHD') String? chucVuHd,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'UserID') int? userId,
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
    @JsonKey(name: 'DepartmentID1') int? departmentId1,
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
    @JsonKey(name: 'AnhCBNV') String? anhCbnv,
    @JsonKey(name: 'ChucVuHDID') int? chucVuHdId,
    @JsonKey(name: 'ChuVuID') int? chuVuId,
    @JsonKey(name: 'DvBHXH') String? dvBhxh,
    @JsonKey(name: 'DiaDiemLamViec') String? diaDiemLamViec,
    @JsonKey(name: 'NoiSinh') String? noiSinh,
    @JsonKey(name: 'GioiTinh') int? gioiTinh,
    @JsonKey(name: 'DanToc') String? danToc,
    @JsonKey(name: 'TonGiao') String? tonGiao,
    @JsonKey(name: 'QuocTich') String? quocTich,
    @JsonKey(name: 'TinhTrangHonNhanID') int? tinhTrangHonNhanId,
    @JsonKey(name: 'SoCMTND') String? soCmtnd,
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
    @JsonKey(name: 'TinhTrangKyHD') String? tinhTrangKyHd,
    @JsonKey(name: 'NgayBatDauHD') DateTime? ngayBatDauHd,
    @JsonKey(name: 'NgayKetThucHD') DateTime? ngayKetThucHd,
    @JsonKey(name: 'SoHD') String? soHd,
    @JsonKey(name: 'SoSoBHXH') String? soSoBhxh,
    @JsonKey(name: 'NguoiGiuSoBHXH') int? nguoiGiuSoBhxh,
    @JsonKey(name: 'NgayBatDauBHXHCty') DateTime? ngayBatDauBhxhCty,
    @JsonKey(name: 'MucDongBHXHHienTai') double? mucDongBhxhHienTai,
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
    @JsonKey(name: 'SoNguoiPT') int? soNguoiPt,
    @JsonKey(name: 'TongTien') double? tongTien,
    @JsonKey(name: 'STKChuyenLuong') String? stkChuyenLuong,
    @JsonKey(name: 'SYLL') bool? syll,
    @JsonKey(name: 'GiayKS') bool? giayKs,
    @JsonKey(name: 'CMNDorCCCD') bool? cmndOrCccd,
    @JsonKey(name: 'SoHK') bool? soHk,
    @JsonKey(name: 'XNNS') bool? xnns,
    @JsonKey(name: 'BangCap') bool? bangCap,
    @JsonKey(name: 'CV') bool? cv,
    @JsonKey(name: 'DXV') bool? dxv,
    @JsonKey(name: 'CamKetTs') bool? camKetTs,
    @JsonKey(name: 'ToTrinhTD') bool? toTrinhTd,
    @JsonKey(name: 'ThuMoiNhanViec') bool? thuMoiNhanViec,
    @JsonKey(name: 'QDTD') bool? qdtd,
    @JsonKey(name: 'HDTV') bool? hdtv,
    @JsonKey(name: 'DGTV') bool? dgtv,
    @JsonKey(name: 'HDLDXDTH') bool? hdldxdth,
    @JsonKey(name: 'DGChuyenHD') bool? dgChuyenHd,
    @JsonKey(name: 'HDLDKXDTH') bool? hdldkxdth,
    @JsonKey(name: 'TinhTrangCapDongPhuc') bool? tinhTrangCapDongPhuc,
    @JsonKey(name: 'GiayKSK') bool? giayKsk,
    @JsonKey(name: 'NgayBatDauThuViec') DateTime? ngayBatDauThuViec,
    @JsonKey(name: 'NgayKetThucThuViec') DateTime? ngayKetThucThuViec,
    @JsonKey(name: 'SoHDTV') String? soHdtv,
    @JsonKey(name: 'NgayBatDauHDXDTH') DateTime? ngayBatDauHdxdth,
    @JsonKey(name: 'NgayKetThucHDXDTH') DateTime? ngayKetThucHdxdth,
    @JsonKey(name: 'SoHDXDTH') String? soHdxdth,
    @JsonKey(name: 'NgayHieuLucHDKXDTH') DateTime? ngayHieuLucHdkxdth,
    @JsonKey(name: 'SoHDKXDTH') String? soHdkxdth,
    @JsonKey(name: 'NgayBatDauBHXH') DateTime? ngayBatDauBhxh,
    @JsonKey(name: 'NgayKetThucBHXH') DateTime? ngayKetThucBhxh,
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
    @JsonKey(name: 'GioiTinhText') String? gioiTinhText,
    @JsonKey(name: 'STT') int? stt,
    @JsonKey(name: 'TinhTrangHonNhan') String? tinhTrangHonNhan,
    @JsonKey(name: 'LoaiHDLD') String? loaiHdld,
    @JsonKey(name: 'NguoiGiuSoBHXHText') String? nguoiGiuSoBhxhText,
    @JsonKey(name: 'DateStartContractTV') DateTime? dateStartContractTv,
    @JsonKey(name: 'DateEndContractTV') DateTime? dateEndContractTv,
    @JsonKey(name: 'ContractNumberTV') String? contractNumberTv,
    @JsonKey(name: 'DateStartContractOneYear') DateTime? dateStartContractOneYear,
    @JsonKey(name: 'DateEndContractOneYear') DateTime? dateEndContractOneYear,
    @JsonKey(name: 'ContractNumberOneYear') String? contractNumberOneYear,
    @JsonKey(name: 'DateStartContractThreeYear') DateTime? dateStartContractThreeYear,
    @JsonKey(name: 'DateEndContractThreeYear') DateTime? dateEndContractThreeYear,
    @JsonKey(name: 'ContractNumberThreeYear') String? contractNumberThreeYear,
    @JsonKey(name: 'DateStartContract') DateTime? dateStartContract,
    @JsonKey(name: 'ContractNumber') String? contractNumber,
    @JsonKey(name: 'IsExpireContract') double? isExpireContract,
    @JsonKey(name: 'SchoolName') String? schoolName,
    @JsonKey(name: 'Major') String? major,
    @JsonKey(name: 'YearGraduate') int? yearGraduate,
    @JsonKey(name: 'RankType') String? rankType,
    @JsonKey(name: 'TrainType') String? trainType,
    @JsonKey(name: 'Classification') String? classification,
    @JsonKey(name: 'ProjectTypeName') String? projectTypeName,
    @JsonKey(name: 'EmployeeTeamName') String? employeeTeamName,
    @JsonKey(name: 'EmployeeTeamSTT') int? employeeTeamStt,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsExcludedFromSalary1') bool? isExcludedFromSalary1,
  }) = _EmployeeLeave;

  factory EmployeeLeave.fromJson(Map<String, dynamic> json) =>
      _$EmployeeLeaveFromJson(json);
}

/// Một phiếu nghỉ khi tạo đơn (gửi API lần lượt).
class LeaveAddSlip {
  const LeaveAddSlip({
    required this.date,
    required this.timeRegister,
    required this.type,
    required this.reason,
  });

  final DateTime date;
  final int timeRegister;
  final int type;
  final String reason;
}

/// Phiếu khi sửa đơn (có [detailId] từ API; 0 = dòng mới thêm trên form).
class LeaveEditSlip {
  const LeaveEditSlip({
    required this.detailId,
    required this.date,
    required this.endDate,
    required this.timeRegister,
    required this.type,
    required this.reason,
    this.apiType,
    this.apiTypeIsReal,
    this.approvedPayloadFromRow,
    this.deleteFlag,
    this.isCancelRegister,
    this.isCancelTP,
    this.isApprovedBGD,
    this.isApprovedTP,
    this.isApprovedHR,
    this.statusHRNumber,
    this.statusHRText,
  });

  final int detailId;
  /// Ngày bắt đầu (lịch local) — đồng bộ form / gửi API.
  final DateTime date;
  /// Ngày kết thúc (lịch local) từ [EndDate] — hiển thị khoảng nghỉ.
  final DateTime endDate;
  final int timeRegister;
  /// Mã loại nghỉ dùng khi gửi: ưu tiên TypeIsReal ?? Type.
  final int type;
  /// [Type] gốc từ API (map nhãn hiển thị).
  final int? apiType;
  /// [TypeIsReal] gốc từ API (map nhãn hiển thị).
  final int? apiTypeIsReal;
  final String reason;
  /// ApprovedTP / ApprovedID trên dòng detail (khi Phase không có).
  final int? approvedPayloadFromRow;
  final bool? deleteFlag;
  final bool? isCancelRegister;
  final bool? isCancelTP;
  final bool? isApprovedBGD;
  final bool? isApprovedTP;
  final bool? isApprovedHR;
  final int? statusHRNumber;
  final String? statusHRText;

  /// Giữ độ dài khoảng nghỉ (start→end ngày lịch) khi user đổi [newStartCalendar].
  static DateTime computeEndDateCalendar(
    DateTime newStartCalendar,
    LeaveEditSlip base,
  ) {
    final s = DateTime(base.date.year, base.date.month, base.date.day);
    final e = DateTime(base.endDate.year, base.endDate.month, base.endDate.day);
    final deltaDays = e.difference(s).inDays;
    final ns = DateTime(
      newStartCalendar.year,
      newStartCalendar.month,
      newStartCalendar.day,
    );
    if (deltaDays <= 0) return ns;
    return ns.add(Duration(days: deltaDays));
  }
}

/// Kết quả GET `/EmployeeOnLeave/get-multi/{phaseId}`.
class LeavePhaseMultiDto {
  const LeavePhaseMultiDto({
    required this.phaseId,
    required this.approvedTP,
    required this.slips,
    this.dateRegister,
    this.employeeId,
    this.phaseCode,
    this.phaseIsApprovedBGD,
    this.phaseIsApprovedTP,
    this.phaseIsApprovedHR,
    this.phaseStatusHRNumber,
    this.phaseStatusHRText,
  });

  final int phaseId;
  final int approvedTP;
  final DateTime? dateRegister;
  final int? employeeId;
  final String? phaseCode;
  final List<LeaveEditSlip> slips;
  final bool? phaseIsApprovedBGD;
  final bool? phaseIsApprovedTP;
  final bool? phaseIsApprovedHR;
  final int? phaseStatusHRNumber;
  final String? phaseStatusHRText;

  static LeavePhaseMultiDto? tryParse(
    dynamic root, {
    int? fallbackPhaseId,
  }) {
    if (root == null) return null;
    Map<String, dynamic>? map;
    if (root is Map<String, dynamic>) {
      map = root;
    } else {
      return null;
    }
    final data = map['data'] ?? map['Data'] ?? map;
    if (data is! Map) return null;
    final dm = Map<String, dynamic>.from(data);

    Map<String, dynamic>? phaseMap;
    final p = dm['Phase'] ?? dm['phase'];
    if (p is Map) {
      phaseMap = Map<String, dynamic>.from(p);
    }

    List<dynamic>? rawDetails;
    final d = dm['Details'] ?? dm['details'] ?? dm['DataDetails'];
    if (d is List) {
      rawDetails = d;
    }

    if (phaseMap == null && (rawDetails == null || rawDetails.isEmpty)) {
      return null;
    }

    var phaseId = _readInt(phaseMap?['ID'] ?? phaseMap?['Id'] ?? dm['ID']) ??
        _readInt(dm['EmployeeOnLeavePhaseID']) ??
        0;
    if (phaseId == 0 && rawDetails != null && rawDetails.isNotEmpty) {
      final first = rawDetails.first;
      if (first is Map) {
        phaseId = _readInt(
              Map<String, dynamic>.from(first)['EmployeeOnLeavePhaseID'],
            ) ??
            phaseId;
      }
    }
    if (phaseId == 0) phaseId = fallbackPhaseId ?? 0;
    if (phaseId == 0) return null;

    final approvedTP = _readInt(phaseMap?['ApprovedTP']) ??
        _readInt(phaseMap?['IDApprovedTP']) ??
        _readInt(phaseMap?['ApprovedID']) ??
        _readInt(phaseMap?['ApprovedId']) ??
        _readInt(phaseMap?['approvedID']) ??
        0;

    final empId = _readInt(phaseMap?['EmployeeID']);
    final phaseCode = phaseMap?['Code']?.toString();

    final phaseIsApprovedBGD = _readBool(phaseMap?['IsApprovedBGD']);
    final phaseIsApprovedTP = _readBool(phaseMap?['IsApprovedTP']);
    final phaseIsApprovedHR = _readBool(phaseMap?['IsApprovedHR']);
    final phaseStatusHRNumber = _readInt(
      phaseMap?['StatusHRNumber'] ?? phaseMap?['statusHRNumber'],
    );
    final phaseStatusHRText = phaseMap?['StatusHRText']?.toString() ??
        phaseMap?['statusHRText']?.toString();

    DateTime? dr;
    final drRaw = phaseMap?['DateRegister'] ?? phaseMap?['dateRegister'];
    if (drRaw != null) {
      final parsed = DateTime.tryParse(drRaw.toString());
      if (parsed != null) {
        dr = LeavePhaseMultiDto._calendarDateLocal(parsed);
      }
    }

    final slips = <LeaveEditSlip>[];
    if (rawDetails != null) {
      for (final e in rawDetails) {
        if (e is! Map) continue;
        final m = Map<String, dynamic>.from(e);
        final slip = _slipFromDetail(m);
        if (slip != null) slips.add(slip);
      }
    }

    if (slips.isEmpty) return null;

    return LeavePhaseMultiDto(
      phaseId: phaseId,
      approvedTP: approvedTP,
      dateRegister: dr,
      employeeId: empId,
      phaseCode: phaseCode,
      slips: slips,
      phaseIsApprovedBGD: phaseIsApprovedBGD,
      phaseIsApprovedTP: phaseIsApprovedTP,
      phaseIsApprovedHR: phaseIsApprovedHR,
      phaseStatusHRNumber: phaseStatusHRNumber,
      phaseStatusHRText: phaseStatusHRText,
    );
  }

  static bool? _readBool(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is int) return v != 0;
    final s = v.toString().toLowerCase();
    if (s == 'true' || s == '1') return true;
    if (s == 'false' || s == '0') return false;
    return null;
  }

  static int? _readInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.round();
    return int.tryParse(v.toString());
  }

  /// Ngày theo lịch **local** — tránh lệch 1 ngày khi API trả ISO UTC (vd. 30T17Z → 31/3 VN).
  static DateTime _calendarDateLocal(DateTime utcOrLocal) {
    final l = utcOrLocal.toLocal();
    return DateTime(l.year, l.month, l.day);
  }

  /// 1 sáng, 2 chiều, 3 cả ngày — đúng contract BE (vd. TimeOnLeave: 2 = chiều).
  static int _normalizeTimeOnLeave(int raw) {
    if (raw >= 1 && raw <= 3) return raw;
    return raw.clamp(1, 3);
  }

  static LeaveEditSlip? _slipFromDetail(Map<String, dynamic> m) {
    final id = _readInt(
          m['ID'] ??
              m['Id'] ??
              m['EmployeeOnLeaveID'] ??
              m['EmployeeLeaveID'] ??
              m['EmployeeOnLeaveDetailID'] ??
              m['DetailID'],
        ) ??
        0;
    final startRaw = m['StartDate'] ?? m['startDate'];
    if (startRaw == null) return null;
    final start = DateTime.tryParse(startRaw.toString());
    if (start == null) return null;
    final date = _calendarDateLocal(start);

    final endRaw = m['EndDate'] ?? m['endDate'];
    final endParsed =
        endRaw != null ? DateTime.tryParse(endRaw.toString()) : null;
    final endDate =
        endParsed != null ? _calendarDateLocal(endParsed) : date;

    final torRaw = _readInt(m['TimeOnLeave'] ?? m['timeOnLeave']);
    final int tr;
    if (torRaw != null && torRaw > 0) {
      tr = _normalizeTimeOnLeave(torRaw).clamp(1, 3);
    } else {
      tr = _inferTimeRegister(start, m['EndDate'] ?? m['endDate']).clamp(1, 3);
    }

    final typeIsReal = _readInt(m['TypeIsReal'] ?? m['typeIsReal']);
    final typePlain = _readInt(m['Type'] ?? m['type']);
    var type = typeIsReal ?? typePlain ?? 1;
    if (type <= 0) type = 1;

    final rowApproved = _readInt(m['ApprovedTP']) ??
        _readInt(m['IDApprovedTP']) ??
        _readInt(m['ApprovedID']) ??
        _readInt(m['ApprovedId']) ??
        _readInt(m['approvedID']);

    final reason = '${m['Reason'] ?? m['reason'] ?? ''}';
    return LeaveEditSlip(
      detailId: id,
      date: date,
      endDate: endDate,
      timeRegister: tr,
      type: type,
      reason: reason,
      apiType: typePlain,
      apiTypeIsReal: typeIsReal,
      approvedPayloadFromRow: rowApproved,
      deleteFlag: _readBool(m['DeleteFlag'] ?? m['deleteFlag']),
      isCancelRegister:
          _readBool(m['IsCancelRegister'] ?? m['isCancelRegister']),
      isCancelTP: _readBool(m['IsCancelTP'] ?? m['isCancelTP']),
      isApprovedBGD: _readBool(m['IsApprovedBGD'] ?? m['isApprovedBGD']),
      isApprovedTP: _readBool(m['IsApprovedTP'] ?? m['isApprovedTP']),
      isApprovedHR: _readBool(m['IsApprovedHR'] ?? m['isApprovedHR']),
      statusHRNumber: _readInt(m['StatusHRNumber'] ?? m['statusHRNumber']),
      statusHRText:
          m['StatusHRText']?.toString() ?? m['statusHRText']?.toString(),
    );
  }

  static int _inferTimeRegister(DateTime start, dynamic endRaw) {
    final s = start.toLocal();
    final end = endRaw != null
        ? DateTime.tryParse(endRaw.toString())?.toLocal()
        : null;
    if (end == null) return 3;
    final sh = s.hour, sm = s.minute;
    final eh = end.hour, em = end.minute;
    if (sh <= 8 && sm <= 1 && eh >= 12) {
      if (eh >= 17 || (eh == 17 && em >= 30)) return 3;
    }
    if (eh <= 12) return 1;
    if (sh >= 13) return 2;
    return 3;
  }
}

@freezed
class FillApproverItem with _$FillApproverItem {
  const factory FillApproverItem({
    @JsonKey(name: 'ApproveID') required int approveId,
  }) = _FillApproverItem;

  factory FillApproverItem.fromJson(Map<String, dynamic> json) =>
      _$FillApproverItemFromJson(json);
}

