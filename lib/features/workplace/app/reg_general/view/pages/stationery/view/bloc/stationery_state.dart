// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: State cho stationery bloc - list data, add form slips, submit state

part of 'stationery_bloc.dart';

/// Một dòng VPP trong form đăng ký.
class StationerySlip {
  const StationerySlip({
    this.supply,
    this.quantity = 1,
    this.receivedQuantity = 0,
    this.exceedsLimit = false,
    this.reason = '',
    this.note = '',
    this.detailId,
    String? unit,
  }) : unit = unit ?? '';

  /// VPP được chọn (null = chưa chọn).
  final StationerySupplyItem? supply;

  /// Số lượng yêu cầu.
  final int quantity;

  /// Số lượng nhận — fill từ API, nếu API trả 0 thì hiển thị 0.
  final int receivedQuantity;

  /// Có vượt định mức không.
  final bool exceedsLimit;

  /// Lý do vượt định mức.
  final String reason;

  /// Ghi chú.
  final String note;

  /// ID của detail item (từ API, null = dòng mới thêm).
  final int? detailId;

  /// Đơn vị tính — ưu tiên supply, fallback vào field (cho phép copyWith).
  final String unit;

  /// Định mức tối đa từ supply.
  int? get requestLimit => supply?.requestLimit;

  StationerySlip copyWith({
    StationerySupplyItem? supply,
    int? quantity,
    int? receivedQuantity,
    bool? exceedsLimit,
    String? reason,
    String? note,
    int? detailId,
    String? unit,
  }) {
    return StationerySlip(
      supply: supply ?? this.supply,
      quantity: quantity ?? this.quantity,
      receivedQuantity: receivedQuantity ?? this.receivedQuantity,
      exceedsLimit: exceedsLimit ?? this.exceedsLimit,
      reason: reason ?? this.reason,
      note: note ?? this.note,
      detailId: detailId ?? this.detailId,
      unit: unit ?? this.unit,
    );
  }
}

@CopyWith()
class StationeryState extends BaseBlocState {
  // --- List data ---
  final List<StationeryItem> stationery;
  final List<StationeryDetailItem> stationeryDetail;
  final List<StationerySupplyItem> stationerySupply;

  // --- Month filter for list ---
  final DateTime? selectedMonth;

  // --- Form add/edit state ---
  final DateTime? dateRegister;
  final List<StationerySlip> slips;
  final int? editItemId;

  /// Bật true khi submit thất bại do thiếu VPP — hiện lỗi validation trên field.
  final bool supplyRequiredValidated;

  /// User hiện tại là Admin — bỏ qua toàn bộ validation.
  final bool isAdmin;

  // --- Submit state ---
  final bool isSubmitting;
  final bool submitSuccess;
  final bool isDeleting;
  final bool deleteSuccess;

  const StationeryState({
    required super.status,
    super.message,
    this.stationery = const [],
    this.stationeryDetail = const [],
    this.stationerySupply = const [],
    this.selectedMonth,
    this.dateRegister,
    this.slips = const [],
    this.editItemId,
    this.supplyRequiredValidated = false,
    this.isAdmin = false,
    this.isSubmitting = false,
    this.submitSuccess = false,
    this.isDeleting = false,
    this.deleteSuccess = false,
  });

  factory StationeryState.init() => const StationeryState(
    status: BaseStateStatus.init,
    stationery: [],
    stationeryDetail: [],
    stationerySupply: [],
    selectedMonth: null,
    dateRegister: null,
    slips: [],
    editItemId: null,
    supplyRequiredValidated: false,
    isAdmin: false,
    isSubmitting: false,
    submitSuccess: false,
    isDeleting: false,
    deleteSuccess: false);

  @override
  List get props => [
    status,
    message,
    stationery,
    stationeryDetail,
    stationerySupply,
    selectedMonth,
    dateRegister,
    slips,
    editItemId,
    supplyRequiredValidated,
    isAdmin,
    isSubmitting,
    submitSuccess,
    isDeleting,
    deleteSuccess,
  ];
}
