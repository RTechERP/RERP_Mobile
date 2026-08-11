part of 'sale_gdn_bloc.dart';

/// Trạng thái của màn chi tiết phiếu xuất kho, lồng vào state chính.
@CopyWith()
class GdnDetailState extends BaseBlocState {
  /// ID phiếu xuất đang xem chi tiết.
  final int billExportId;

  /// Thông tin cơ bản của phiếu xuất (truyền từ màn danh sách).
  final BillExporResponse? bill;

  /// Thông tin header phiếu xuất trả về từ API `/billexport/{id}`.
  /// Dùng để fill các trường form ở đầu trang Detail
  /// (mã phiếu, ngày tạo, kho, khách hàng/NCC, địa chỉ, người giao, bộ phận, ...).
  final DetailGDNItemResponse? billInfo;

  /// ID NCC đang chọn trên form (override từ `billInfo.supplierId` khi user đổi).
  final int? selectedSupplierId;

  /// ID người giao đang chọn (override từ `billInfo.senderId`).
  final int? selectedSenderId;

  /// ID người nhận đang chọn (override từ `billInfo.receiverId`).
  final int? selectedReceiverId;

  /// UserID từ detail để map với users list (BillExportUserResponse.id).
  final int? userId;

  /// ID khách hàng đang chọn (override từ `billInfo.customerId`).
  final int? selectedCustomerId;

  /// ID kho đang chọn (override từ `billInfo.warehouseId`).
  final int? selectedWarehouseId;

  /// ID loại kho đang chọn (override từ `billInfo.khoTypeId`).
  final int? selectedKhoTypeId;

  /// Trạng thái của phiếu (int) - hiển thị qua bottom-sheet.
  final int? selectedStatus;

  /// ID dự án (project) đang chọn cho phiếu.
  final int? selectedProjectId;

  /// Ngày xuất (delivery date) - chỉ ngày, set từ `billInfo.deliveryTime`
  /// hoặc `bill.deliveryTime`.
  final DateTime? deliveryDate;

  /// Ngày yêu cầu (request date) - chỉ ngày, set từ `billInfo.requestDate`.
  final DateTime? requestDate;

  /// Thời gian nhận hàng - bao gồm cả ngày + giờ (24h).
  /// Khi null → hiển thị "Thời gian nhận hàng" cho user chọn.
  final DateTime? receiveTime;

  /// Loại kho (text hiển thị) đang chọn - có thể là ProductGroup hoặc
  /// tên loại kho. Override từ `billInfo.warehouseType` khi user đổi.
  final String? selectedLoaiKhoText;

  /// Loại hàng (product type) đang chọn.
  final int? selectedProductType;

  /// Địa chỉ khách hàng (override từ CustomerResponse.address khi chọn KH).
  final String? selectedCustomerAddress;

  /// Kho chuyển nội bộ (text) - hiển thị khi tick checkbox "Chuyển kho nội bộ".
  final int? selectedInternalWarehouseId;

  /// Loại kho chuyển nội bộ (text) - kho nội bộ.
  final int? selectedInternalKhoTypeId;

  /// Checkbox "Chuyển kho nội bộ" có đang tick hay không.
  final bool isTransferInternalChecked;

  /// Checkbox "Chuyển kho nội bộ" - tách riêng với isTransferInternalChecked.
  final bool isInternalChecked;

  /// Địa chỉ giao hàng (text hiển thị) - override từ `billInfo.address`.
  final String? deliveryAddress;

  /// Tham chiếu - chuỗi text tham chiếu (mã phiếu liên quan). Disabled nếu null/rỗng.
  final String? reference;

  /// Nhà cung cấp (text) đang chọn - thường dùng lookup NCC.
  final int? selectedNccId;

  /// Danh sách dòng chi tiết sản phẩm (từ API view).
  final List<ViewGDNDetailResponse> details;

  /// Danh sách chi tiết đầy đủ (từ API detail, chứa childId để map ảnh).
  final List<DetailGDNResponse> detailFull;

  /// Danh sách file đã upload thành công (từ API).
  final List<UploadFileResponse> uploadedImages;

  /// Map lưu đường dẫn ảnh local theo STT dòng chi tiết.
  /// Key = stt, Value = danh sách đường dẫn ảnh local.
  final Map<int, List<String>> localImagePathsByStt;

  /// Map lưu ảnh server theo ChildID (từ DetailGDNResponse.childId).
  /// Key = childId, Value = danh sách ReadFileResponse.
  final Map<int, List<ReadFileResponse>> serverImagesByChildId;

  /// Tập `fileId` (server) đã được đánh dấu xoá trong phiên làm việc hiện tại.
  /// Sẽ được gửi lên server qua `DeletedFileIds` khi submit.
  /// Key = fileId (int).
  final Set<int> pendingDeletedFileIds;

  /// Tập đường dẫn ảnh local đã được đánh dấu xoá trong phiên làm việc hiện tại.
  /// Sẽ bị loại khỏi danh sách upload và remove khỏi state sau khi submit thành công.
  final Set<String> pendingDeletedLocalPaths;

  /// Trạng thái upload ảnh (tách riêng với status để tránh conflict).
  final BaseStateStatus uploadStatus;

  const GdnDetailState({
    required super.status,
    super.message,
    this.billExportId = 0,
    this.bill,
    this.billInfo,
    this.selectedSupplierId,
    this.selectedSenderId,
    this.selectedReceiverId,
    this.userId,
    this.selectedCustomerId,
    this.selectedWarehouseId,
    this.selectedKhoTypeId,
    this.selectedStatus,
    this.selectedProjectId,
    this.deliveryDate,
    this.requestDate,
    this.receiveTime,
    this.selectedLoaiKhoText,
    this.selectedProductType,
    this.selectedCustomerAddress,
    this.selectedInternalWarehouseId,
    this.selectedInternalKhoTypeId,
    this.isTransferInternalChecked = false,
    this.isInternalChecked = false,
    this.deliveryAddress,
    this.reference,
    this.selectedNccId,
    this.details = const [],
    this.detailFull = const [],
    this.uploadedImages = const [],
    this.localImagePathsByStt = const {},
    this.serverImagesByChildId = const {},
    this.pendingDeletedFileIds = const {},
    this.pendingDeletedLocalPaths = const {},
    this.uploadStatus = BaseStateStatus.init,
  });

  factory GdnDetailState.init({required int id, BillExporResponse? bill}) {
    return GdnDetailState(
      status: BaseStateStatus.init,
      billExportId: id,
      bill: bill,
    );
  }

  /// Khởi tạo state detail với billInfo đã load từ API, đồng thời set các
  /// ID đang chọn theo billInfo để form hiển thị đúng giá trị ban đầu.
  factory GdnDetailState.fromBillInfo({
    required int id,
    BillExporResponse? bill,
    required DetailGDNItemResponse billInfo,
  }) {
    return GdnDetailState(
      status: BaseStateStatus.success,
      billExportId: id,
      bill: bill,
      billInfo: billInfo,
      selectedSupplierId: billInfo.supplierId,
      selectedSenderId: billInfo.senderId,
      selectedReceiverId: billInfo.receiverId,
      userId: billInfo.userId,
      selectedCustomerId: billInfo.customerId,
      selectedWarehouseId: billInfo.warehouseId,
      selectedKhoTypeId: billInfo.khoTypeId,
      selectedProductType: billInfo.productType,
      selectedStatus: billInfo.status,
      deliveryDate: billInfo.deliveryTime,
      requestDate: billInfo.requestDate,
      receiveTime: billInfo.deliveryTime,
      selectedLoaiKhoText: billInfo.warehouseType,
      selectedInternalWarehouseId: billInfo.wareHouseTranferId,
      selectedInternalKhoTypeId: billInfo.khoTypeTransferId,
      isTransferInternalChecked: billInfo.isTransferInternal ?? false,
    );
  }

  @override
  List get props => [
        status,
        message,
        billExportId,
        bill,
        billInfo,
        selectedSupplierId,
        selectedSenderId,
        selectedReceiverId,
        userId,
        selectedCustomerId,
        selectedWarehouseId,
        selectedKhoTypeId,
        selectedStatus,
        selectedProjectId,
        deliveryDate,
        requestDate,
        receiveTime,
        selectedLoaiKhoText,
        selectedProductType,
        selectedCustomerAddress,
        selectedInternalWarehouseId,
        selectedInternalKhoTypeId,
        isTransferInternalChecked,
        isInternalChecked,
        deliveryAddress,
        reference,
        selectedNccId,
        details,
        detailFull,
        uploadedImages,
        localImagePathsByStt,
        serverImagesByChildId,
        pendingDeletedFileIds,
        pendingDeletedLocalPaths,
        uploadStatus,
      ];
}