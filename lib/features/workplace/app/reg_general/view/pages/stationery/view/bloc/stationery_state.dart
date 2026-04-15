// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: State cho stationery bloc - list data, add form slips, submit state

part of 'stationery_bloc.dart';

/// Một dòng VPP trong form đăng ký.
class StationerySlip {
  const StationerySlip({
    this.supply,
    this.quantity = 1,
    this.exceedsLimit = false,
    this.reason = '',
    this.note = '',
  });

  /// VPP được chọn (null = chưa chọn).
  final StationerySupplyItem? supply;

  /// Số lượng yêu cầu.
  final int quantity;

  /// Có vượt định mức không.
  final bool exceedsLimit;

  /// Lý do vượt định mức.
  final String reason;

  /// Ghi chú.
  final String note;

  /// Đơn vị tính — lấy từ supply.
  String get unit => supply?.unit ?? '-';

  /// Định mức tối đa từ supply.
  int? get requestLimit => supply?.requestLimit;

  /// Số lượng nhận (bằng quantity hoặc requestLimit, tuỳ vượt định mức).
  int get receivedQuantity {
    if (!exceedsLimit) return quantity;
    return (requestLimit != null && quantity > requestLimit!) ? requestLimit! : quantity;
  }

  StationerySlip copyWith({
    StationerySupplyItem? supply,
    int? quantity,
    bool? exceedsLimit,
    String? reason,
    String? note,
  }) {
    return StationerySlip(
      supply: supply ?? this.supply,
      quantity: quantity ?? this.quantity,
      exceedsLimit: exceedsLimit ?? this.exceedsLimit,
      reason: reason ?? this.reason,
      note: note ?? this.note,
    );
  }
}

@CopyWith()
class StationeryState extends BaseBlocState {
  // --- List data ---
  final List<StationeryItem> stationery;
  final List<StationeryDetailItem> stationeryDetail;
  final List<StationerySupplyItem> stationerySupply;

  // --- Form add state ---
  final DateTime? dateRegister;
  final List<StationerySlip> slips;

  // --- Submit state ---
  final bool isSubmitting;
  final bool submitSuccess;

  const StationeryState({
    required super.status,
    super.message,
    this.stationery = const [],
    this.stationeryDetail = const [],
    this.stationerySupply = const [],
    this.dateRegister,
    this.slips = const [],
    this.isSubmitting = false,
    this.submitSuccess = false,
  });

  factory StationeryState.init() => const StationeryState(
    status: BaseStateStatus.init,
    stationery: [],
    stationeryDetail: [],
    stationerySupply: [],
    dateRegister: null,
    slips: [],
    isSubmitting: false,
    submitSuccess: false,
  );

  @override
  List get props => [
    status,
    message,
    stationery,
    stationeryDetail,
    stationerySupply,
    dateRegister,
    slips,
    isSubmitting,
    submitSuccess,
  ];
}
