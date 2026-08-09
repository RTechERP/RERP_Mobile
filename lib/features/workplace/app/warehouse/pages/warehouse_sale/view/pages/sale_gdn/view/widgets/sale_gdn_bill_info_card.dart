import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/select_bottom_sheet_helper.dart';
import 'package:rtc_erp/common/widgets/form/form_input_field.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

/// Card hiển thị các trường header của phiếu xuất kho ở đầu trang Detail.
///
/// Dữ liệu được fill từ:
/// - `DetailGDNItemResponse` (API `/billexport/{id}`) — các trường thông tin
///   header (Code, CreatDate, WarehouseType, Status, DeliveryTime, ...).
/// - `BillExporResponse` (truyền từ màn danh sách) — các trường text đã được
///   server join sẵn (WarehouseName, CustomerName/NameNCC, FullNameSender,
///   DepartmentName, receiverFullName, nameStatus, ...).
///
/// Form cho phép chọn các lookup (Kho, Loại kho, NCC, Khách hàng, Người giao)
/// thông qua `FormInputField` + `openSelectBottomSheet`.
class SaleGdnBillInfoCard extends StatelessWidget {
  const SaleGdnBillInfoCard({
    super.key,
    required this.billInfo,
    required this.bill,
    required this.suppliers,
    required this.senders,
    required this.customers,
    required this.projects,
    required this.warehouses,
    required this.productGroups,
    required this.selectedSupplierId,
    required this.selectedSenderId,
    required this.selectedCustomerId,
    required this.selectedWarehouseId,
    required this.selectedKhoTypeId,
    required this.onSelectSupplier,
    required this.onSelectSender,
    required this.onSelectCustomer,
    required this.onSelectWarehouse,
    required this.onSelectKhoType,
  });

  /// Header từ API `/billexport/{id}`.
  final DetailGDNItemResponse? billInfo;

  /// Thông tin phiếu truyền từ màn danh sách (chứa text đã join từ server).
  final BillExporResponse? bill;

  /// Danh sách lookup để mở bottom-sheet chọn.
  final List<SupplierResponse> suppliers;
  final List<SenderResponse> senders;
  final List<CustomerResponse> customers;
  final List<ProjectGDNResponse> projects;
  final List<WarehouseResponse> warehouses;
  final List<ProductGroupNewResponse> productGroups;

  /// ID đang chọn cho từng dropdown (override từ `billInfo` khi user đổi).
  final int? selectedSupplierId;
  final int? selectedSenderId;
  final int? selectedCustomerId;
  final int? selectedWarehouseId;
  final int? selectedKhoTypeId;

  /// Callback khi user chọn item trong dropdown tương ứng.
  final ValueChanged<int?> onSelectSupplier;
  final ValueChanged<int?> onSelectSender;
  final ValueChanged<int?> onSelectCustomer;
  final ValueChanged<int?> onSelectWarehouse;
  final ValueChanged<int?> onSelectKhoType;

  @override
  Widget build(BuildContext context) {
    final info = billInfo;
    final fb = bill;

    final code = (fb?.code ?? info?.code ?? '').trim();
    final creatDateText = _formatDate(fb?.creatDate) ??
        _formatDate(info?.creatDate?.toIso8601String()) ??
        _formatDate(info?.createdDate?.toIso8601String()) ??
        _formatDate(fb?.createdDate) ??
        '';
    final department = (fb?.departmentName ?? '').trim();
    final description =
        (info?.description ?? fb?.description ?? '').trim();
    final receiver = (fb?.receiverFullName ?? '').trim();
    final statusText =
        (fb?.nameStatus ?? _mapStatus(info?.status) ?? '').trim();

    // ----- Compute display text for dropdowns from selected ID + lists -----
    final supplierText = _resolveSupplierText();
    final senderText = _resolveSenderText();
    final customerText = _resolveCustomerText();
    final warehouseText = _resolveWarehouseText();
    final khoTypeText = _resolveKhoTypeText();

    // ----- Fields for the second card (BillExport Form) -----
    final typeBillText = _mapTypeBill(info?.typeBill ?? fb?.typeBill);
    final requestStatusText =
        ((info?.status != null ? _mapStatus(info!.status) : null) ??
                (fb?.nameStatus ?? ''))
            .trim();
    final approvedText = _mapApproved(info?.isApproved ?? fb?.isApproved);
    final deliveryDateText =
        _formatDate(info?.deliveryTime?.toIso8601String()) ?? '';
    final isAfterHours = info?.isAfterHours;
    final afterHoursText = isAfterHours == null
        ? ''
        : (isAfterHours ? 'Có' : 'Không');
    final warehouseTransferText =
        info?.wareHouseTranferId == null || info!.wareHouseTranferId == 0
            ? ''
            : info.wareHouseTranferId.toString();
    final isTransferInternal =
        info?.isTransferInternal ?? fb?.isTransfer;
    final transferInternalText = isTransferInternal == null
        ? ''
        : (isTransferInternal ? 'Có' : 'Không');
    final requestDateText =
        _formatDate(info?.requestDate?.toIso8601String()) ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderInfoCard(
          code: code,
          statusText: statusText,
          creatDateText: creatDateText,
          warehouseText: warehouseText,
          khoTypeText: khoTypeText,
          supplierText: supplierText,
          address: (fb?.address ?? info?.address ?? '').trim(),
          createdBy: (fb?.fullName ?? info?.createdBy ?? '').trim(),
          senderText: senderText,
          department: department,
          customerText: customerText,
          receiver: receiver,
          description: description,
          // Dropdown handlers
          onTapWarehouse: () => _pickWarehouse(context),
          onTapKhoType: () => _pickKhoType(context),
          onTapSupplier: () => _pickSupplier(context),
          onTapSender: () => _pickSender(context),
          onTapCustomer: () => _pickCustomer(context),
        ),
        const SizedBox(height: 12),
        _ExportFormCard(
          typeBillText: typeBillText,
          requestStatusText: requestStatusText,
          approvedText: approvedText,
          deliveryDateText: deliveryDateText,
          afterHoursText: afterHoursText,
          warehouseTransferText: warehouseTransferText,
          transferInternalText: transferInternalText,
          requestDateText: requestDateText,
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Display-text resolvers — tìm text từ list ứng với ID đang chọn.
  // Nếu ID chưa khớp (do danh sách lookup chưa load) → fallback về text đã
  // có sẵn trong `bill` (server join).
  // ---------------------------------------------------------------------------

  String _resolveSupplierText() {
    final id = selectedSupplierId ?? billInfo?.supplierId;
    if (id != null && id > 0) {
      for (final s in suppliers) {
        if (s.id == id) return (s.name ?? '').trim();
      }
    }
    return (bill?.nameNcc ?? '').trim();
  }

  String _resolveSenderText() {
    final id = selectedSenderId ?? billInfo?.senderId;
    if (id != null && id > 0) {
      for (final s in senders) {
        if (s.id == id) return (s.fullName ?? '').trim();
      }
    }
    return (bill?.fullNameSender ?? '').trim();
  }

  String _resolveCustomerText() {
    final id = selectedCustomerId ?? billInfo?.customerId;
    if (id != null && id > 0) {
      for (final c in customers) {
        if (c.id == id) return (c.name ?? '').trim();
      }
    }
    return (bill?.customerName ?? '').trim();
  }

  String _resolveWarehouseText() {
    final id = selectedWarehouseId ?? billInfo?.warehouseId;
    if (id != null && id > 0) {
      for (final w in warehouses) {
        if (w.id == id) return (w.name ?? '').trim();
      }
    }
    return (bill?.warehouseName ?? '').trim();
  }

  String _resolveKhoTypeText() {
    final id = selectedKhoTypeId ?? billInfo?.khoTypeId;
    if (id != null && id > 0) {
      for (final p in productGroups) {
        if (p.id == id) return (p.name ?? '').trim();
      }
    }
    return (bill?.warehouseType ?? billInfo?.warehouseType ?? '').trim();
  }

  // ---------------------------------------------------------------------------
  // Bottom-sheet pickers
  // ---------------------------------------------------------------------------

  Future<void> _pickSupplier(BuildContext context) async {
    if (suppliers.isEmpty) return;
    await openSelectBottomSheet<SupplierResponse>(
      context: context,
      title: 'Chọn NCC',
      items: suppliers,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(suppliers, selectedSupplierId),
      onSelected: (item) => onSelectSupplier(item.id),
    );
  }

  Future<void> _pickSender(BuildContext context) async {
    if (senders.isEmpty) return;
    await openSelectBottomSheet<SenderResponse>(
      context: context,
      title: 'Chọn người giao',
      items: senders,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.fullName ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(senders, selectedSenderId),
      onSelected: (item) => onSelectSender(item.id),
    );
  }

  Future<void> _pickCustomer(BuildContext context) async {
    if (customers.isEmpty) return;
    await openSelectBottomSheet<CustomerResponse>(
      context: context,
      title: 'Chọn khách hàng',
      items: customers,
      displayText: (c) =>
          '${(c.code ?? '').trim()} - ${(c.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(customers, selectedCustomerId),
      onSelected: (item) => onSelectCustomer(item.id),
    );
  }

  Future<void> _pickWarehouse(BuildContext context) async {
    if (warehouses.isEmpty) return;
    await openSelectBottomSheet<WarehouseResponse>(
      context: context,
      title: 'Chọn kho',
      items: warehouses,
      displayText: (w) =>
          '${(w.code ?? '').trim()} - ${(w.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(warehouses, selectedWarehouseId),
      onSelected: (item) => onSelectWarehouse(item.id),
    );
  }

  Future<void> _pickKhoType(BuildContext context) async {
    if (productGroups.isEmpty) return;
    await openSelectBottomSheet<ProductGroupNewResponse>(
      context: context,
      title: 'Chọn loại kho',
      items: productGroups,
      displayText: (p) => (p.name ?? '').trim(),
      initialSelectedItem: _findById(productGroups, selectedKhoTypeId),
      onSelected: (item) => onSelectKhoType(item.id),
    );
  }

  T? _findById<T>(List<T> items, int? id) {
    if (id == null) return null;
    for (final item in items) {
      final itemId = _readId(item);
      if (itemId is int && itemId == id) return item;
    }
    return null;
  }

  /// Trả về `id` của bất kỳ model lookup nào có trường `id`.
  /// Dùng `dynamic` để có thể truy cập `item.id` trên cả 6 kiểu model.
  int? _readId(Object? item) {
    if (item is SupplierResponse) return item.id;
    if (item is SenderResponse) return item.id;
    if (item is CustomerResponse) return item.id;
    if (item is WarehouseResponse) return item.id;
    if (item is ProjectGDNResponse) return item.id;
    if (item is ProductGroupNewResponse) return item.id;
    return null;
  }

  // ---------------------------------------------------------------------------
  // Mappers
  // ---------------------------------------------------------------------------

  /// Map `Status` (int) sang text hiển thị.
  String? _mapStatus(int? status) {
    switch (status) {
      case 0:
        return 'Mượn';
      case 1:
        return 'Tồn kho';
      case 2:
        return 'Đã xuất kho';
      case 5:
        return 'Xuất trả NCC';
      case 6:
        return 'Y/C xuất kho';
      case 7:
        return 'Y/C mượn';
      default:
        return null;
    }
  }

  /// Map `TypeBill` (bool) sang text: `false` = phiếu xuất thường,
  /// `true` = phiếu xuất trả / NCC.
  String _mapTypeBill(bool? typeBill) {
    if (typeBill == null) return '';
    return typeBill ? 'Phiếu trả NCC' : 'Phiếu xuất';
  }

  /// Map `IsApproved` (bool) sang text hiển thị.
  String _mapApproved(bool? isApproved) {
    if (isApproved == null) return '';
    return isApproved ? 'Đã duyệt' : 'Chưa duyệt';
  }

  String? _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      final dt = DateTime.parse(raw);
      return DateFormat('dd/MM/yyyy HH:mm').format(dt);
    } catch (_) {
      return raw;
    }
  }
}

// ===========================================================================
// Top info card — Thông tin phiếu xuất
// ===========================================================================

class _HeaderInfoCard extends StatelessWidget {
  const _HeaderInfoCard({
    required this.code,
    required this.statusText,
    required this.creatDateText,
    required this.warehouseText,
    required this.khoTypeText,
    required this.supplierText,
    required this.address,
    required this.createdBy,
    required this.senderText,
    required this.department,
    required this.customerText,
    required this.receiver,
    required this.description,
    required this.onTapWarehouse,
    required this.onTapKhoType,
    required this.onTapSupplier,
    required this.onTapSender,
    required this.onTapCustomer,
  });

  final String code;
  final String statusText;
  final String creatDateText;
  final String warehouseText;
  final String khoTypeText;
  final String supplierText;
  final String address;
  final String createdBy;
  final String senderText;
  final String department;
  final String customerText;
  final String receiver;
  final String description;

  final VoidCallback onTapWarehouse;
  final VoidCallback onTapKhoType;
  final VoidCallback onTapSupplier;
  final VoidCallback onTapSender;
  final VoidCallback onTapCustomer;

  @override
  Widget build(BuildContext context) {
    return _InfoCardShell(
      title: 'Thông tin phiếu xuất',
      titleIcon: Icons.receipt_long_outlined,
      trailing: statusText.isNotEmpty
          ? _StatusChip(text: statusText)
          : const SizedBox.shrink(),
      children: [
        _ReadonlyFieldRow(
          icon: Icons.numbers_outlined,
          label: 'Mã phiếu xuất',
          value: code,
          isCode: true,
        ),
        _ReadonlyFieldRow(
          icon: Icons.event_outlined,
          label: 'Ngày tạo',
          value: creatDateText,
        ),
        // Kho — FormInputField dropdown
        FormInputField(
          nameForm: 'gdn_warehouse',
          nameTextField: 'gdn_warehouse_text',
          label: 'Kho',
          icon: Icons.warehouse_outlined,
          initialValue: warehouseText,
          readOnly: true,
          onTap: onTapWarehouse,
        ),
        // Loại kho — FormInputField dropdown
        FormInputField(
          nameForm: 'gdn_kho_type',
          nameTextField: 'gdn_kho_type_text',
          label: 'Loại kho',
          icon: Icons.category_outlined,
          initialValue: khoTypeText,
          readOnly: true,
          onTap: onTapKhoType,
        ),
        // NCC — FormInputField dropdown
        FormInputField(
          nameForm: 'gdn_supplier',
          nameTextField: 'gdn_supplier_text',
          label: 'NCC',
          icon: Icons.local_shipping_outlined,
          initialValue: supplierText,
          readOnly: true,
          onTap: onTapSupplier,
        ),
        _ReadonlyFieldRow(
          icon: Icons.location_on_outlined,
          label: 'Địa chỉ',
          value: address,
        ),
        _ReadonlyFieldRow(
          icon: Icons.person_outline,
          label: 'Người tạo',
          value: createdBy,
        ),
        // Người giao — FormInputField dropdown
        FormInputField(
          nameForm: 'gdn_sender',
          nameTextField: 'gdn_sender_text',
          label: 'Người giao',
          icon: Icons.delivery_dining_outlined,
          initialValue: senderText,
          readOnly: true,
          onTap: onTapSender,
        ),
        _ReadonlyFieldRow(
          icon: Icons.business_outlined,
          label: 'Bộ phận',
          value: department,
        ),
        // Khách hàng — FormInputField dropdown
        FormInputField(
          nameForm: 'gdn_customer',
          nameTextField: 'gdn_customer_text',
          label: 'Khách hàng',
          icon: Icons.people_alt_outlined,
          initialValue: customerText,
          readOnly: true,
          onTap: onTapCustomer,
        ),
        if (receiver.isNotEmpty)
          _ReadonlyFieldRow(
            icon: Icons.assignment_ind_outlined,
            label: 'Người nhận',
            value: receiver,
          ),
        _ReadonlyFieldRow(
          icon: Icons.notes_outlined,
          label: 'Mô tả',
          value: description,
          multiline: true,
        ),
      ],
    );
  }
}

// ===========================================================================
// BillExport Form card — Thông tin phiếu xuất (chi tiết)
// ===========================================================================

class _ExportFormCard extends StatelessWidget {
  const _ExportFormCard({
    required this.typeBillText,
    required this.requestStatusText,
    required this.approvedText,
    required this.deliveryDateText,
    required this.afterHoursText,
    required this.warehouseTransferText,
    required this.transferInternalText,
    required this.requestDateText,
  });

  final String typeBillText;
  final String requestStatusText;
  final String approvedText;
  final String deliveryDateText;
  final String afterHoursText;
  final String warehouseTransferText;
  final String transferInternalText;
  final String requestDateText;

  @override
  Widget build(BuildContext context) {
    return _InfoCardShell(
      title: 'Thông tin BillExport',
      titleIcon: Icons.assignment_outlined,
      children: [
        _ReadonlyFieldRow(
          icon: Icons.receipt_outlined,
          label: 'Loại phiếu',
          value: typeBillText,
        ),
        _ReadonlyFieldRow(
          icon: Icons.flag_outlined,
          label: 'Yêu cầu xuất kho',
          value: requestStatusText,
          valueColor: _resolveStatusColor(requestStatusText),
        ),
        _ReadonlyFieldRow(
          icon: Icons.verified_outlined,
          label: 'Trạng thái duyệt',
          value: approvedText,
          valueColor: _resolveApprovedColor(approvedText),
        ),
        _ReadonlyFieldRow(
          icon: Icons.schedule_outlined,
          label: 'Ngày yêu cầu',
          value: requestDateText,
        ),
        _ReadonlyFieldRow(
          icon: Icons.local_shipping_outlined,
          label: 'Thời gian giao hàng',
          value: deliveryDateText,
        ),
        _ReadonlyFieldRow(
          icon: Icons.access_time_filled_outlined,
          label: 'Xuất ngoài giờ',
          value: afterHoursText,
        ),
        _ReadonlyFieldRow(
          icon: Icons.swap_horiz_outlined,
          label: 'Kho chuyển',
          value: warehouseTransferText,
        ),
        _ReadonlyFieldRow(
          icon: Icons.sync_alt_outlined,
          label: 'Kho nội bộ',
          value: transferInternalText,
        ),
      ],
    );
  }

  Color? _resolveStatusColor(String text) {
    if (text.isEmpty) return null;
    if (text.toLowerCase().contains('đã')) {
      return AppColors.stateSuccessColor;
    }
    if (text.toLowerCase().contains('y/c') ||
        text.toLowerCase().contains('mượn')) {
      return AppColors.warning;
    }
    return null;
  }

  Color? _resolveApprovedColor(String text) {
    if (text.isEmpty) return null;
    if (text.toLowerCase().contains('đã duyệt')) {
      return AppColors.stateSuccessColor;
    }
    if (text.toLowerCase().contains('chưa')) {
      return AppColors.warning;
    }
    return null;
  }
}

// ===========================================================================
// Shared building blocks
// ===========================================================================

class _InfoCardShell extends StatelessWidget {
  const _InfoCardShell({
    required this.title,
    required this.titleIcon,
    required this.children,
    this.trailing,
  });

  final String title;
  final IconData titleIcon;
  final List<Widget> children;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FormBuilder(
        // FormBuilder cho phép FormInputField hoạt động mà không cần
        // form-level state; chỉ dùng để wrap các field dropdown.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    titleIcon,
                    size: 18,
                    color: AppColors.primaryERP,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.enableText,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Field hiển thị read-only (không phải dropdown) — dùng cho mã phiếu,
/// ngày tạo, mô tả, ... Tương tự `_FieldRow` cũ nhưng giữ ở đây để tránh
/// phụ thuộc vào `FormBuilder`.
class _ReadonlyFieldRow extends StatelessWidget {
  const _ReadonlyFieldRow({
    required this.icon,
    required this.label,
    required this.value,
    this.multiline = false,
    this.isCode = false,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool multiline;
  final bool isCode;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment:
            multiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: AppColors.gray),
          const SizedBox(width: 8),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              hasValue ? value : '--',
              style: TextStyle(
                fontSize: 13,
                fontWeight:
                    isCode ? FontWeight.w600 : FontWeight.w500,
                color: valueColor ??
                    (hasValue
                        ? AppColors.enableText
                        : AppColors.gray.withValues(alpha: 0.7)),
                height: 1.4,
              ),
              maxLines: multiline ? null : 2,
              overflow: multiline ? null : TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.text});

  final String text;

  Color get _color {
    final s = text.toLowerCase();
    if (s.contains('đã') ||
        s.contains('duyệt') ||
        s.contains('approved') ||
        s.contains('xuất kho')) {
      return AppColors.stateSuccessColor;
    }
    if (s.contains('mượn') || s.contains('y/c') || s.contains('yc ')) {
      return AppColors.warning;
    }
    return AppColors.stateInfoColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}
