import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_approval_model.freezed.dart';
part 'product_return_approval_model.g.dart';

/// Nhân viên được giao duyệt trả sản phẩm.
///
/// Trả về từ API `GET /borrow/get-employee-team-and-department`.
@freezed
class ProductReturnEmployee with _$ProductReturnEmployee {
  const factory ProductReturnEmployee({
    /// Id nhân viên (lưu ý server trả với key `EmployeeeID`).
    @JsonKey(name: 'EmployeeeID') int? employeeId,

    /// Id người dùng — dùng làm tham số `userID` khi lọc lịch sử mượn/trả.
    @JsonKey(name: 'UserID') int? userId,

    /// Mã nhân viên (vd. `GM00`).
    @JsonKey(name: 'Code') String? code,

    /// Họ tên nhân viên.
    @JsonKey(name: 'FullName') String? fullName,

    /// Id phòng ban.
    @JsonKey(name: 'DepartmentID') int? departmentId,

    /// Tên phòng ban.
    @JsonKey(name: 'DepartmentName') String? departmentName,

    /// Id nhóm.
    @JsonKey(name: 'TeamID') int? teamId,

    /// Tên nhóm.
    @JsonKey(name: 'TeamName') String? teamName,
  }) = _ProductReturnEmployee;

  factory ProductReturnEmployee.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnEmployeeFromJson(json);
}

/// Một dòng lịch sử mượn / trả sản phẩm.
///
/// Trả về từ API `GET /borrow/get-product-history`.
@freezed
class ProductReturnHistoryItem with _$ProductReturnHistoryItem {
  const factory ProductReturnHistoryItem({
    /// Id phiếu mượn.
    @JsonKey(name: 'ID') int? id,

    /// Trạng thái phiếu (4 = đăng ký trả, 5 = chờ duyệt...).
    @JsonKey(name: 'Status') int? status,

    /// Trạng thái mới của phiếu (dùng để hiển thị chip).
    @JsonKey(name: 'StatusNew') int? statusNew,

    /// Nhãn trạng thái (vd. `Đăng ký trả`).
    @JsonKey(name: 'StatusText') String? statusText,

    /// Id sản phẩm RTC.
    @JsonKey(name: 'ProductRTCID') int? productRtcId,

    /// Id QR code sản phẩm.
    @JsonKey(name: 'ProductRTCQRCodeID') int? productRtcQrCodeId,

    /// Thời điểm mượn (ISO).
    @JsonKey(name: 'DateBorrow') String? dateBorrow,

    /// Hạn trả dự kiến (ISO).
    @JsonKey(name: 'DateReturnExpected') String? dateReturnExpected,

    /// Thời điểm trả thực tế (ISO, null = chưa trả).
    @JsonKey(name: 'DateReturn') String? dateReturn,

    /// Id người mượn.
    @JsonKey(name: 'PeopleID') int? peopleId,

    /// Họ tên người mượn (vd. `R0339 - Nguyễn Đức Thuận`).
    @JsonKey(name: 'FullName') String? fullName,

    /// Người mượn trước đó.
    @JsonKey(name: 'OldBorrower') String? oldBorrower,

    /// Dự án sử dụng.
    @JsonKey(name: 'Project') String? project,

    /// Ghi chú.
    @JsonKey(name: 'Note') String? note,

    /// Số lượng đã mượn.
    @JsonKey(name: 'NumberBorrow') double? numberBorrow,

    /// Người quản lý đã xác nhận hay chưa.
    @JsonKey(name: 'AdminConfirm') @Default(false) bool adminConfirm,

    /// Id phiếu xuất kho liên quan.
    @JsonKey(name: 'BillExportTechnicalID') int? billExportTechnicalId,

    /// Mã phiếu xuất kho liên quan.
    @JsonKey(name: 'BillExportCode') String? billExportCode,

    /// Nhãn loại phiếu.
    @JsonKey(name: 'BillTypeText') String? billTypeText,

    /// Trạng thái phiếu xuất kho.
    @JsonKey(name: 'BillStatus') int? billStatus,

    /// Id nhóm sản phẩm.
    @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,

    /// Tên nhóm sản phẩm.
    @JsonKey(name: 'ProductGroupName') String? productGroupName,

    /// Mã sản phẩm.
    @JsonKey(name: 'ProductCode') String? productCode,

    /// Mã nội bộ sản phẩm.
    @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,

    /// Tên sản phẩm.
    @JsonKey(name: 'ProductName') String? productName,

    /// Nhà sản xuất.
    @JsonKey(name: 'Maker') String? maker,

    /// Id đơn vị tính.
    @JsonKey(name: 'UnitCountID') int? unitCountId,

    /// Tên đơn vị tính (vd. `PCS`).
    @JsonKey(name: 'UnitCountName') String? unitCountName,

    /// Số lượng còn lại.
    @JsonKey(name: 'Number') double? number,

    /// Trạng thái sản phẩm.
    @JsonKey(name: 'StatusProduct') @Default(false) bool statusProduct,

    /// Thời điểm tạo bản ghi.
    @JsonKey(name: 'CreateDate') String? createDate,

    /// Số lượng tồn trong kho.
    @JsonKey(name: 'NumberInStore') double? numberInStore,

    /// Số serial.
    @JsonKey(name: 'Serial') String? serial,

    /// Số serial.
    @JsonKey(name: 'SerialNumber') String? serialNumber,

    /// Part number.
    @JsonKey(name: 'PartNumber') String? partNumber,

    /// Người tạo bản ghi.
    @JsonKey(name: 'CreatedBy') String? createdBy,

    /// Đường dẫn ảnh vị trí.
    @JsonKey(name: 'LocationImg') String? locationImg,

    /// Sản phẩm mượn của khách hàng hay không.
    @JsonKey(name: 'BorrowCustomer') @Default(false) bool borrowCustomer,

    /// Địa chỉ lưu kho (ô lưu trữ).
    @JsonKey(name: 'AddressBox') String? addressBox,

    /// Bản ghi đã bị xoá hay chưa.
    @JsonKey(name: 'IsDelete') @Default(false) bool isDelete,

    /// Tên phòng ban của người mượn.
    @JsonKey(name: 'DepartmentName') String? departmentName,

    /// QR code sản phẩm.
    @JsonKey(name: 'ProductQRCode') String? productQrCode,

    /// Zalo id của người mượn.
    @JsonKey(name: 'UserZaloID') String? userZaloId,

    /// Vị trí kho Modula.
    @JsonKey(name: 'ModulaLocationName') String? modulaLocationName,

    /// Mã vị trí kho Modula.
    @JsonKey(name: 'ModulaLocationCode') String? modulaLocationCode,

    /// Toạ độ X.
    @JsonKey(name: 'AxisX') double? axisX,

    /// Toạ độ Y.
    @JsonKey(name: 'AxisY') double? axisY,

    /// Trạng thái người mượn.
    @JsonKey(name: 'StatusPerson') int? statusPerson,

    /// Nhãn trạng thái người mượn.
    @JsonKey(name: 'StatusPersonText') String? statusPersonText,

    /// Id ô Modula chi tiết.
    @JsonKey(name: 'ModulaLocationDetailID') int? modulaLocationDetailId,

    /// Mã ô Modula chi tiết.
    @JsonKey(name: 'ModulaLocationDetailCode') String? modulaLocationDetailCode,

    /// Tên ô Modula chi tiết.
    @JsonKey(name: 'ModulaLocationDetailName') String? modulaLocationDetailName,

    /// Tên kho.
    @JsonKey(name: 'WarehouseName') String? warehouseName,

    /// Số thứ tự hiển thị.
    @JsonKey(name: 'RowNumber') int? rowNumber,

    /// Cờ trùng ngày.
    @JsonKey(name: 'DualDate') int? dualDate,
  }) = _ProductReturnHistoryItem;

  factory ProductReturnHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnHistoryItemFromJson(json);
}

/// Các giá trị hiển thị đã được chuẩn hoá từ dữ liệu thô của API.
extension ProductReturnHistoryItemDisplay on ProductReturnHistoryItem {
  /// Mã vị trí hộp (ô lưu trữ) — ví dụ `K5-T2.3`.
  ///
  /// API trả `AddressBox` dạng đầy đủ:
  /// `K5-T2.3 (New)-K5-T2.3 (New) TOOL (Thước, Lục, Tô Vít)` → lấy đoạn mã
  /// vị trí ở đầu chuỗi. Rỗng nếu không tách được.
  String get boxLocation {
    final raw = (addressBox ?? '').trim();
    if (raw.isEmpty) return '';

    // Lấy mã vị trí ở đầu: "K5-T2.3" trong "K5-T2.3 (New)-K5-T2.3 (New) ...".
    final match = RegExp(r'^[A-Za-z0-9]+-[A-Za-z0-9.]+').firstMatch(raw);
    if (match != null) return match.group(0)!;

    // Dự phòng: lấy token đầu tiên.
    return raw.split(RegExp(r'\s+')).first;
  }

  /// Tên vị trí Modula.
  ///
  /// Ưu tiên tên tủ / ô (`ModulaLocationName`), không có thì lấy tên ô chi
  /// tiết, cuối cùng lấy mã vị trí. Giá trị `-` của server được coi là rỗng.
  String get modulaLocation {
    final name = (modulaLocationName ?? '').trim();
    if (name.isNotEmpty && name != '-') return name;

    final detailName = (modulaLocationDetailName ?? '').trim();
    if (detailName.isNotEmpty && detailName != '-') return detailName;

    return (modulaLocationCode ?? '').trim();
  }
}
