import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_purchasing_model.freezed.dart';
part 'approve_purchasing_model.g.dart';

// ═══════════════════════════════════════════════════════════════
// 1. PHIẾU YÊU CẦU MUA HÀNG — get-all
// ═══════════════════════════════════════════════════════════════

/// Một bản ghi phiếu yêu cầu mua hàng trả về từ API `/get-all`.
@freezed
class ApprovePurchasingItem with _$ApprovePurchasingItem {
  const factory ApprovePurchasingItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'TotalBillImport') double? totalBillImport,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectFullName') String? projectFullName,
    @JsonKey(name: 'TT') String? tt,
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'StatusRequest') int? statusRequest,
    @JsonKey(name: 'StatusRequestText') String? statusRequestText,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'DateRequest') DateTime? dateRequest,
    @JsonKey(name: 'DateReturnExpected') DateTime? dateReturnExpected,
    @JsonKey(name: 'Quantity') double? quantity,
    @JsonKey(name: 'UnitPrice') double? unitPrice,
    @JsonKey(name: 'TotalPrice') double? totalPrice,
    @JsonKey(name: 'RequestDate') DateTime? requestDate,
    @JsonKey(name: 'DeadlineDelivery') DateTime? deadlineDelivery,
    @JsonKey(name: 'DateReturnActual') DateTime? dateReturnActual,
    @JsonKey(name: 'DateReceive') DateTime? dateReceive,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'NameNCC') String? nameNcc,
    @JsonKey(name: 'ProjectPartListID') int? projectPartListId,
    @JsonKey(name: 'SupplierSaleID') int? supplierSaleId,
    @JsonKey(name: 'UnitMoney') String? unitMoney,
    @JsonKey(name: 'IsApprovedTBP') bool? isApprovedTbp,
    @JsonKey(name: 'IsApprovedBGD') bool? isApprovedBgd,
    @JsonKey(name: 'ApprovedTBP') int? approvedTbp,
    @JsonKey(name: 'ApprovedTBPName') String? approvedTbpName,
    @JsonKey(name: 'ApprovedBGD') int? approvedBgd,
    @JsonKey(name: 'ApprovedBGDName') String? approvedBgdName,
    @JsonKey(name: 'DateApprovedTBP') DateTime? dateApprovedTbp,
    @JsonKey(name: 'DateApprovedBGD') DateTime? dateApprovedBgd,
    @JsonKey(name: 'ProductGroupID') int? productGroupId,
    @JsonKey(name: 'ProductSaleID') int? productSaleId,
    @JsonKey(name: 'ProductNewCode') String? productNewCode,
    @JsonKey(name: 'IsImport') bool? isImport,
    @JsonKey(name: 'CurrencyID') int? currencyId,
    @JsonKey(name: 'CurrencyRate') double? currencyRate,
    @JsonKey(name: 'TotalPriceExchange') double? totalPriceExchange,
    @JsonKey(name: 'LeadTime') String? leadTime,
    @JsonKey(name: 'UnitFactoryExportPrice') double? unitFactoryExportPrice,
    @JsonKey(name: 'UnitImportPrice') double? unitImportPrice,
    @JsonKey(name: 'TotalImportPrice') double? totalImportPrice,
    @JsonKey(name: 'IsRequestApproved') bool? isRequestApproved,
    @JsonKey(name: 'Manufacturer') String? manufacturer,
    @JsonKey(name: 'ReasonCancel') String? reasonCancel,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'UpdatedName') String? updatedName,
    @JsonKey(name: 'VAT') double? vat,
    @JsonKey(name: 'TotaMoneyVAT') double? totaMoneyVat,
    @JsonKey(name: 'TotalDayLeadTime') int? totalDayLeadTime,
    @JsonKey(name: 'PONCCID') int? ponccId,
    @JsonKey(name: 'BillCode') String? billCode,
    @JsonKey(name: 'UnitPricePOKH') double? unitPricePokh,
    @JsonKey(name: 'IsCommercialProduct') bool? isCommercialProduct,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'Model') String? model,
    @JsonKey(name: 'JobRequirementID') int? jobRequirementId,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectTypeName') String? projectTypeName,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'PONumber') String? poNumber,
    @JsonKey(name: 'GuestCode') String? guestCode,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'POKHCode') String? pokhCode,
    @JsonKey(name: 'StatusPOKHText') String? statusPokhText,
    @JsonKey(name: 'SpecialCode') String? specialCode,
    @JsonKey(name: 'HistoryPrice') double? historyPrice,
    @JsonKey(name: 'TotalPriceHistory') double? totalPriceHistory,
    @JsonKey(name: 'IsTechBought') bool? isTechBought,
    @JsonKey(name: 'IsApprovedBGDText') String? isApprovedBgdText,
    @JsonKey(name: 'ProductGroupRTCID') int? productGroupRtcId,
    @JsonKey(name: 'ProductRTCID') int? productRtcId,
    @JsonKey(name: 'ProductNewCodeSale') String? productNewCodeSale,
    @JsonKey(name: 'NotePartlist') String? notePartlist,
    @JsonKey(name: 'TicketType') int? ticketType,
    @JsonKey(name: 'TicketTypeText') String? ticketTypeText,
    @JsonKey(name: 'DateReturnEstimated') DateTime? dateReturnEstimated,
    @JsonKey(name: 'IsStock') bool? isStock,
    @JsonKey(name: 'ProductCodeRTC') String? productCodeRtc,
    @JsonKey(name: 'TotalBillImportCount') double? totalBillImportCount,
    @JsonKey(name: 'ProjectPartlistPurchaseRequestTypeID')
    int? projectPartlistPurchaseRequestTypeId,
    @JsonKey(name: 'UnitCountID') int? unitCountId,
    @JsonKey(name: 'NoteMarketing') String? noteMarketing,
    @JsonKey(name: 'UnitName') String? unitName,
    @JsonKey(name: 'FullNamePriceRequest') String? fullNamePriceRequest,
    @JsonKey(name: 'UnitNameNew') String? unitNameNew,
    @JsonKey(name: 'UnitPricetext') String? unitPriceText,
    @JsonKey(name: 'ProjectID1') int? projectId1,
    @JsonKey(name: 'ProjectID2') int? projectId2,
    @JsonKey(name: 'ProductCode1') String? productCode1,
    @JsonKey(name: 'POKHDetailID') int? pokhDetailId,
    @JsonKey(name: 'InventoryProjectID') int? inventoryProjectId,
    @JsonKey(name: 'TargetPrice') double? targetPrice,
    @JsonKey(name: 'DuplicateID') int? duplicateId,
    @JsonKey(name: 'OriginQuantity') double? originQuantity,
    @JsonKey(name: 'TotalHN') String? totalHn,
    @JsonKey(name: 'TotalHCM') String? totalHcm,
    @JsonKey(name: 'TotalBN') String? totalBn,
    @JsonKey(name: 'TotalHP') String? totalHp,
    @JsonKey(name: 'TotalBH') String? totalBh,
    @JsonKey(name: 'TotalDP') String? totalDp,
    @JsonKey(name: 'ParentProductCode') String? parentProductCode,
    @JsonKey(name: 'ParentProductCodePO') String? parentProductCodePo,
    @JsonKey(name: 'WarehouseID') int? warehouseId,
    @JsonKey(name: 'IsPaidLater') bool? isPaidLater,
    @JsonKey(name: 'DiscountPercent') double? discountPercent,
    @JsonKey(name: 'FullNameSale') String? fullNameSale,
  }) = _ApprovePurchasingItem;

  factory ApprovePurchasingItem.fromJson(Map<String, dynamic> json) =>
      _$ApprovePurchasingItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 2. LOẠI PHIẾU MUỐ — request-types
// ═══════════════════════════════════════════════════════════════

/// Một loại phiếu mua trả về từ API `/request-types`.
@freezed
class ApprovePurchasingRequestTypeItem
    with _$ApprovePurchasingRequestTypeItem {
  const factory ApprovePurchasingRequestTypeItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'RequestTypeName') String? requestTypeName,
    @JsonKey(name: 'RequestTypeCode') String? requestTypeCode,
    @JsonKey(name: 'IsIgnoreBGD') bool? isIgnoreBgd,
  }) = _ApprovePurchasingRequestTypeItem;

  factory ApprovePurchasingRequestTypeItem.fromJson(
          Map<String, dynamic> json) =>
      _$ApprovePurchasingRequestTypeItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 3. LOẠI TIỀN TỆ — /currency/get-all
// ═══════════════════════════════════════════════════════════════

/// Một loại tiền tệ trả về từ API `/currency/get-all`.
@freezed
class CurrencyItem with _$CurrencyItem {
  const factory CurrencyItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'NameEnglist') String? nameEnglish,
    @JsonKey(name: 'NameVietNamese') String? nameVietnamese,
    @JsonKey(name: 'MinUnit') String? minUnit,
    @JsonKey(name: 'CurrencyRate') double? currencyRate,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CurrencyRateOfficialQuota') double? currencyRateOfficialQuota,
    @JsonKey(name: 'CurrencyRateUnofficialQuota')
    double? currencyRateUnofficialQuota,
    @JsonKey(name: 'DateExpried') DateTime? dateExpired,
    @JsonKey(name: 'DateStart') DateTime? dateStart,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _CurrencyItem;

  factory CurrencyItem.fromJson(Map<String, dynamic> json) =>
      _$CurrencyItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 4. NHÓM SẢN PHẨM — /ProductGroup/get-productgroup-purchase
// ═══════════════════════════════════════════════════════════════

/// Một nhóm sản phẩm trả về từ API `/ProductGroup/get-productgroup-purchase`.
@freezed
class ProductGroupItem with _$ProductGroupItem {
  const factory ProductGroupItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'ProductGroupID') String? productGroupCode,
    @JsonKey(name: 'ProductGroupName') String? productGroupName,
    @JsonKey(name: 'IsVisible') bool? isVisible,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'ParentID') int? parentId,
    @JsonKey(name: 'STT') int? stt,
  }) = _ProductGroupItem;

  factory ProductGroupItem.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 5. NHÀ CUNG CẤP — /suppliersale/list-supplier-sale
// ═══════════════════════════════════════════════════════════════

/// Một nhà cung cấp trả về từ API `/suppliersale/list-supplier-sale`.
@freezed
class SupplierItem with _$SupplierItem {
  const factory SupplierItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CodeNCC') String? codeNcc,
    @JsonKey(name: 'NameNCC') String? nameNcc,
    @JsonKey(name: 'AddressNCC') String? addressNcc,
    @JsonKey(name: 'PhoneNCC') String? phoneNcc,
    @JsonKey(name: 'OrdererNCC') String? ordererNcc,
    @JsonKey(name: 'Debt') String? debt,
    @JsonKey(name: 'NgayUpdate') DateTime? ngayUpdate,
    @JsonKey(name: 'NVPhuTrach') String? nvPhuTrach,
    @JsonKey(name: 'LoaiHangHoa') String? loaiHangHoa,
    @JsonKey(name: 'Brand') String? brand,
    @JsonKey(name: 'MaNhom') String? maNhom,
    @JsonKey(name: 'TenTiengAnh') String? tenTiengAnh,
    @JsonKey(name: 'Website') String? website,
    @JsonKey(name: 'SoTK') String? soTk,
    @JsonKey(name: 'NganHang') String? nganHang,
    @JsonKey(name: 'MaSoThue') String? maSoThue,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'Company') int? company,
    @JsonKey(name: 'ShortNameSupplier') String? shortNameSupplier,
    @JsonKey(name: 'EmployeeID') int? employeeId,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
    @JsonKey(name: 'IsDebt') bool? isDebt,
    @JsonKey(name: 'FedexAccount') String? fedexAccount,
    @JsonKey(name: 'OriginItem') String? originItem,
    @JsonKey(name: 'BankCharge') String? bankCharge,
    @JsonKey(name: 'AddressDelivery') String? addressDelivery,
    @JsonKey(name: 'RulePayID') int? rulePayId,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'RuleIncoterm') String? ruleIncoterm,
    @JsonKey(name: 'BankListID') int? bankListId,
  }) = _SupplierItem;

  factory SupplierItem.fromJson(Map<String, dynamic> json) =>
      _$SupplierItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 6. DỰ ÁN — /ProjectPartlistPurchaseRequest/get-all-project
// ═══════════════════════════════════════════════════════════════

/// Một dự án trả về từ API `/ProjectPartlistPurchaseRequest/get-all-project`.
@freezed
class ProjectFilterItem with _$ProjectFilterItem {
  const factory ProjectFilterItem({
    @JsonKey(name: 'ID') int? id,
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'ProjectShortName') String? projectShortName,
    @JsonKey(name: 'ProjectStatus') int? projectStatus,
    @JsonKey(name: 'UserID') int? userId,
    @JsonKey(name: 'UserTechnicalID') int? userTechnicalId,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'IsApproved') bool? isApproved,
    @JsonKey(name: 'ContactID') int? contactId,
    @JsonKey(name: 'PO') String? po,
    @JsonKey(name: 'ProjectType') int? projectType,
    @JsonKey(name: 'ListCostID') int? listCostId,
    @JsonKey(name: 'PlanDateStart') DateTime? planDateStart,
    @JsonKey(name: 'PlanDateEnd') DateTime? planDateEnd,
    @JsonKey(name: 'ActualDateStart') DateTime? actualDateStart,
    @JsonKey(name: 'ActualDateEnd') DateTime? actualDateEnd,
    @JsonKey(name: 'EU') String? eu,
    @JsonKey(name: 'ProjectManager') int? projectManager,
    @JsonKey(name: 'CurrentState') String? currentState,
    @JsonKey(name: 'Priotity') double? priority,
    @JsonKey(name: 'PODate') DateTime? poDate,
    @JsonKey(name: 'EndUser') int? endUser,
    @JsonKey(name: 'BusinessFieldID') int? businessFieldId,
    @JsonKey(name: 'TypeProject') int? typeProject,
    @JsonKey(name: 'IsDeleted') bool? isDeleted,
  }) = _ProjectFilterItem;

  factory ProjectFilterItem.fromJson(Map<String, dynamic> json) =>
      _$ProjectFilterItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 8. LỊCH SỬ GIÁ SẢN PHẨM — /history-product-partlist
// ═══════════════════════════════════════════════════════════════

/// Một bản ghi lịch sử giá sản phẩm, trả về từ API
/// `/ProjectPartlistPurchaseRequest/history-product-partlist`.
///
/// Mỗi bản ghi là 1 lần sản phẩm từng được mua ở 1 dự án / 1 NCC
/// với 1 mức giá tại thời điểm tạo phiếu.
@freezed
class ProductPriceHistoryItem with _$ProductPriceHistoryItem {
  const factory ProductPriceHistoryItem({
    @JsonKey(name: 'ProductCode') String? productCode,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'UnitPrice') double? unitPrice,
    @JsonKey(name: 'CurrencyCode') String? currencyCode,
    @JsonKey(name: 'CurrencyRate') double? currencyRate,
    @JsonKey(name: 'NameNCC') String? nameNcc,
    @JsonKey(name: 'CreatedDate') DateTime? createdDate,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'LeadTime') String? leadTime,
    @JsonKey(name: 'TableType') String? tableType,
    @JsonKey(name: 'ProjectCode') String? projectCode,
    @JsonKey(name: 'ProjectName') String? projectName,
    @JsonKey(name: 'SupplierSaleID') int? supplierSaleId,
    @JsonKey(name: 'ProjectID') int? projectId,
    @JsonKey(name: 'Unit') String? unit,
    @JsonKey(name: 'CodeNCC') String? codeNcc,
    @JsonKey(name: 'Quantity') double? quantity,
    @JsonKey(name: 'Maker') String? maker,
    @JsonKey(name: 'Model') String? model,
    @JsonKey(name: 'TotalPriceExchange') double? totalPriceExchange,
    @JsonKey(name: 'TotalMoney') double? totalMoney,
    @JsonKey(name: 'EmployeeID') int? employeeId,
  }) = _ProductPriceHistoryItem;

  factory ProductPriceHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceHistoryItemFromJson(json);
}

// ═══════════════════════════════════════════════════════════════
// 7. BỘ LỌC CLIENT-SIDE
// ═══════════════════════════════════════════════════════════════

/// Bộ lọc client-side áp dụng lên cache `itemsByType`.
/// Tiêu chí:
///   - selectedProduct: sản phẩm đã chọn từ picker gộp, lưu khoá
///                      nội bộ `code|name` (bỏ phần rỗng). Khi lọc,
///                      tách theo `|` và giữ lại item nếu BẤT KỲ khoá
///                      nào `contains` trong `productCode` hoặc
///                      `productName` (case-insensitive).
///   - approvalFilter: trạng thái duyệt BGĐ. Mặc định `all`.
///   - selectedProjectId: `null` = không lọc; khác `null` = lọc theo
///                         ProjectID tương ứng.
///   - selectedSupplierId: `null` = không lọc; khác `null` = lọc theo
///                          SupplierSaleID tương ứng.
enum PurchasingApprovalFilter { all, pending, approved }

class PurchasingFilter {
  final String searchKeyword;
  final String selectedProduct;
  final PurchasingApprovalFilter approvalFilter;
  final int? selectedProjectId;
  final int? selectedSupplierId;

  const PurchasingFilter({
    this.searchKeyword = '',
    this.selectedProduct = '',
    this.approvalFilter = PurchasingApprovalFilter.all,
    this.selectedProjectId,
    this.selectedSupplierId,
  });

  /// `true` khi không có tiêu chí nào được áp dụng.
  bool get isEmpty =>
      searchKeyword.trim().isEmpty &&
      selectedProduct.trim().isEmpty &&
      approvalFilter == PurchasingApprovalFilter.all &&
      selectedProjectId == null &&
      selectedSupplierId == null;

  PurchasingFilter copyWith({
    String? searchKeyword,
    String? selectedProduct,
    PurchasingApprovalFilter? approvalFilter,
    int? selectedProjectId,
    int? selectedSupplierId,
    bool clearProject = false,
    bool clearSupplier = false,
  }) {
    return PurchasingFilter(
      searchKeyword: searchKeyword ?? this.searchKeyword,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      approvalFilter: approvalFilter ?? this.approvalFilter,
      selectedProjectId:
          clearProject ? null : (selectedProjectId ?? this.selectedProjectId),
      selectedSupplierId: clearSupplier
          ? null
          : (selectedSupplierId ?? this.selectedSupplierId),
    );
  }
}
