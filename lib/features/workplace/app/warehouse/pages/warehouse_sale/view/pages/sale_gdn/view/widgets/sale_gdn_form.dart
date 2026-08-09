import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/select_bottom_sheet_helper.dart';
import 'package:rtc_erp/common/widgets/form/form_card.dart';
import 'package:rtc_erp/common/widgets/form/form_checkbox.dart';
import 'package:rtc_erp/common/widgets/form/form_date_time_picker.dart';
import 'package:rtc_erp/common/widgets/form/form_input_field.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';

/// Form phiếu chi tiết xuất kho - 1 card duy nhất.
///
/// Tất cả field đều dùng `DetailGDNItemResponse` (API `/billexport/{id}`) làm
/// nguồn chính. Text của các dropdown (NCC, người giao, KH, kho, loại kho, ...)
/// được resolve từ ID thông qua các lookup list đã load sẵn (suppliers,
/// senders, customers, warehouses, productGroups). Khi lookup chưa load,
/// text sẽ rỗng.
///
/// Form là read-only theo yêu cầu - chỉ xem, không lưu server.
class SaleGdnForm extends StatelessWidget {
  const SaleGdnForm({
    super.key,
    required this.detail,
    required this.suppliers,
    required this.senders,
    required this.customers,
    required this.warehouses,
    required this.productGroups,
    required this.onSelectSupplier,
    required this.onSelectSender,
    required this.onSelectCustomer,
    required this.onSelectCustomerWithAddress,
    required this.onSelectWarehouse,
    required this.onSelectKhoType,
    required this.onSelectStatus,
    required this.onChangeDeliveryDate,
    required this.onChangeRequestDate,
    required this.onChangeReceiveTime,
    required this.onSelectLoaiKho,
    required this.onToggleTransferInternal,
    required this.onToggleInternal,
    required this.onSelectInternalWarehouse,
    required this.onSelectInternalKhoType,
    required this.onChangeDeliveryAddress,
    required this.onSelectNcc,
  });

  final GdnDetailState detail;

  // Lookup data
  final List<SupplierResponse> suppliers;
  final List<SenderResponse> senders;
  final List<CustomerResponse> customers;
  final List<WarehouseResponse> warehouses;
  final List<ProductGroupNewResponse> productGroups;

  // Callbacks
  final ValueChanged<int?> onSelectSupplier;
  final ValueChanged<int?> onSelectSender;
  final ValueChanged<int?> onSelectCustomer;
  final void Function(int? id, String? address) onSelectCustomerWithAddress;
  final ValueChanged<int?> onSelectWarehouse;
  final ValueChanged<int?> onSelectKhoType;
  final ValueChanged<int?> onSelectStatus;
  final ValueChanged<DateTime?> onChangeDeliveryDate;
  final ValueChanged<DateTime?> onChangeRequestDate;
  final ValueChanged<DateTime?> onChangeReceiveTime;
  final ValueChanged<String?> onSelectLoaiKho;
  final ValueChanged<bool> onToggleTransferInternal;
  final ValueChanged<bool> onToggleInternal;
  final ValueChanged<int?> onSelectInternalWarehouse;
  final ValueChanged<int?> onSelectInternalKhoType;
  final ValueChanged<String?> onChangeDeliveryAddress;
  final ValueChanged<int?> onSelectNcc;

  @override
  Widget build(BuildContext context) {
    final info = detail.billInfo;

    return FormBuilder(
      child: FormCard(
        title: 'Thông tin phiếu xuất kho',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Mã phiếu + Trạng thái + Ngày tạo ===
            _Section(
              title: 'Thông tin chung',
              children: [
                _ReadonlyFieldRow(
                  icon: Icons.numbers_outlined,
                  label: 'Mã phiếu xuất',
                  value: (info?.code ?? '').trim(),
                  isCode: true,
                ),
                FormInputField(
                  nameForm: 'gdn_status',
                  nameTextField: 'gdn_status_text',
                  label: 'Trạng thái',
                  icon: Icons.flag_outlined,
                  initialValue: _resolveStatusText(),
                  readOnly: true,
                  onTap: () => _pickStatus(context),
                ),
                _ReadonlyFieldRow(
                  icon: Icons.event_outlined,
                  label: 'Ngày tạo',
                  value: _formatDateTime(info?.creatDate),
                ),
                FormDateTimePicker(
                  nameForm: 'gdn_delivery_date',
                  nameTimePicker: 'gdn_delivery_date_picker',
                  label: 'Ngày xuất',
                  icon: Icons.event_available_outlined,
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  initialValue: detail.deliveryDate ?? info?.deliveryTime,
                  onChanged: onChangeDeliveryDate,
                ),
                FormDateTimePicker(
                  nameForm: 'gdn_request_date',
                  nameTimePicker: 'gdn_request_date_picker',
                  label: 'Ngày yêu cầu',
                  icon: Icons.calendar_today_outlined,
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  initialValue: detail.requestDate ?? info?.requestDate,
                  onChanged: onChangeRequestDate,
                ),
                FormDateTimePicker(
                  nameForm: 'gdn_receive_time',
                  nameTimePicker: 'gdn_receive_time_picker',
                  label: 'Thời gian nhận hàng',
                  icon: Icons.schedule_outlined,
                  inputType: InputType.both,
                  format: DateFormat('dd/MM/yyyy HH:mm'),
                  initialValue: detail.receiveTime ?? info?.deliveryTime,
                  onChanged: onChangeReceiveTime,
                ),
              ],
            ),

            // === Kho + Loại kho + Kho chuyển nội bộ ===
            _Section(
              title: 'Kho & Loại kho',
              children: [
                FormInputField(
                  nameForm: 'gdn_warehouse',
                  nameTextField: 'gdn_warehouse_text',
                  label: 'Kho',
                  icon: Icons.warehouse_outlined,
                  initialValue: _resolveWarehouseText(),
                  readOnly: true,
                  onTap: () => _pickWarehouse(context),
                ),
                FormInputField(
                  nameForm: 'gdn_loai_kho',
                  nameTextField: 'gdn_loai_kho_text',
                  label: 'Loại kho',
                  icon: Icons.category_outlined,
                  initialValue: _resolveLoaiKhoText(),
                  readOnly: true,
                  onTap: () => _pickLoaiKho(context),
                ),
                // Checkbox "Chuyển kho" bên trái + Field "Kho chuyển" bên phải
                _CheckboxInputRow(
                  checked: detail.isTransferInternalChecked,
                  label: 'Chuyển kho',
                  onChanged: (v) => onToggleTransferInternal(v),
                  child: FormInputField(
                    nameForm: 'gdn_internal_warehouse',
                    nameTextField: 'gdn_internal_warehouse_text',
                    label: 'Kho chuyển',
                    icon: Icons.swap_horiz_outlined,
                    initialValue: _resolveInternalWarehouseText(),
                    readOnly: true,
                    enabled: detail.isTransferInternalChecked,
                    onTap: detail.isTransferInternalChecked
                        ? () => _pickInternalWarehouse(context)
                        : null,
                  ),
                ),
                // Checkbox "Chuyển kho nội bộ" bên trái + Field "Kho nội bộ" bên phải
                _CheckboxInputRow(
                  checked: detail.isInternalChecked,
                  label: 'Chuyển kho nội bộ',
                  onChanged: (v) => onToggleInternal(v),
                  child: FormInputField(
                    nameForm: 'gdn_internal_kho_type',
                    nameTextField: 'gdn_internal_kho_type_text',
                    label: 'Loại kho chuyển',
                    icon: Icons.category_outlined,
                    initialValue: _resolveInternalKhoTypeText(),
                    readOnly: true,
                    enabled: detail.isInternalChecked,
                    onTap: detail.isInternalChecked
                        ? () => _pickInternalKhoType(context)
                        : null,
                  ),
                ),
              ],
            ),

            // === NCC + Khách hàng + Địa chỉ giao hàng ===
            _Section(
              title: 'Khách hàng & Nhà cung cấp',
              children: [
                FormInputField(
                  nameForm: 'gdn_ncc',
                  nameTextField: 'gdn_ncc_text',
                  label: 'Nhà cung cấp',
                  icon: Icons.business_center_outlined,
                  initialValue: _resolveNccText(),
                  readOnly: true,
                  onTap: () => _pickNcc(context),
                ),
                FormInputField(
                  nameForm: 'gdn_supplier',
                  nameTextField: 'gdn_supplier_text',
                  label: 'NCC (kho)',
                  icon: Icons.local_shipping_outlined,
                  initialValue: _resolveSupplierText(),
                  readOnly: true,
                  onTap: () => _pickSupplier(context),
                ),
                FormInputField(
                  nameForm: 'gdn_customer',
                  nameTextField: 'gdn_customer_text',
                  label: 'Khách hàng',
                  icon: Icons.people_alt_outlined,
                  initialValue: _resolveCustomerText(),
                  readOnly: true,
                  onTap: () => _pickCustomer(context),
                ),
                // Địa chỉ khách hàng - read-only, tự fill từ customer.address
                _ReadonlyFieldRow(
                  icon: Icons.place_outlined,
                  label: 'Địa chỉ khách hàng',
                  value: _resolveCustomerAddress(),
                ),
                FormInputField(
                  nameForm: 'gdn_delivery_address',
                  nameTextField: 'gdn_delivery_address_text',
                  label: 'Địa chỉ giao hàng',
                  icon: Icons.local_shipping_outlined,
                  initialValue: detail.deliveryAddress ??
                      (info?.address ?? '').trim(),
                  readOnly: true,
                  onTap: () => _pickDeliveryAddress(context),
                ),
              ],
            ),

            // === Người nhận + Người giao + Bộ phận ===
            _Section(
              title: 'Nhân sự',
              children: [
                FormInputField(
                  nameForm: 'gdn_sender',
                  nameTextField: 'gdn_sender_text',
                  label: 'Người giao',
                  icon: Icons.delivery_dining_outlined,
                  initialValue: _resolveSenderText(),
                  readOnly: true,
                  onTap: () => _pickSender(context),
                ),
                FormInputField(
                  nameForm: 'gdn_receiver',
                  nameTextField: 'gdn_receiver_text',
                  label: 'Người nhận',
                  icon: Icons.assignment_ind_outlined,
                  initialValue: _resolveReceiverText(),
                  readOnly: true,
                  onTap: () => _pickReceiver(context),
                ),
              ],
            ),

            // === Footer: Tham chiếu + Phát sinh + Mô tả + Người tạo ===
            _Section(
              title: 'Khác',
              children: [
                FormInputField(
                  nameForm: 'gdn_reference',
                  nameTextField: 'gdn_reference_text',
                  label: 'Tham chiếu',
                  icon: Icons.link_outlined,
                  initialValue: _resolveReference(),
                  enabled: _resolveReference().isNotEmpty,
                ),
                if (info?.isIncurredApproved != null)
                  FormCheckbox(
                    name: 'gdn_is_incurred',
                    title: const Text(
                      'Phát sinh',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    initialValue: info!.isIncurredApproved ?? false,
                    enabled: false,
                  ),
                _ReadonlyFieldRow(
                  icon: Icons.person_outline,
                  label: 'Người tạo',
                  value: (info?.createdBy ?? '').trim(),
                ),
                if ((info?.description ?? '').trim().isNotEmpty)
                  _ReadonlyFieldRow(
                    icon: Icons.notes_outlined,
                    label: 'Mô tả',
                    value: (info!.description ?? '').trim(),
                    multiline: true,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // Text resolvers - lookup từ list qua ID
  // ===========================================================================

  String _resolveSupplierText() {
    final id = detail.selectedSupplierId ?? detail.billInfo?.supplierId;
    if (id != null && id > 0) {
      for (final s in suppliers) {
        if (s.id == id) return (s.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveSenderText() {
    final id = detail.selectedSenderId ?? detail.billInfo?.senderId;
    if (id != null && id > 0) {
      for (final s in senders) {
        if (s.id == id) return (s.fullName ?? '').trim();
      }
    }
    return '';
  }

  String _resolveReceiverText() {
    final id = detail.billInfo?.receiverId;
    if (id != null && id > 0) {
      for (final s in senders) {
        if (s.id == id) return (s.fullName ?? '').trim();
      }
    }
    return '';
  }

  String _resolveCustomerText() {
    final id = detail.selectedCustomerId ?? detail.billInfo?.customerId;
    if (id != null && id > 0) {
      for (final c in customers) {
        if (c.id == id) return (c.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveCustomerAddress() {
    final id = detail.selectedCustomerId ?? detail.billInfo?.customerId;
    if (id != null && id > 0) {
      for (final c in customers) {
        if (c.id == id) return (c.address ?? '').trim();
      }
    }
    return '';
  }

  String _resolveWarehouseText() {
    final id = detail.selectedWarehouseId ?? detail.billInfo?.warehouseId;
    if (id != null && id > 0) {
      for (final w in warehouses) {
        if (w.id == id) return (w.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveLoaiKhoText() {
    final id = detail.selectedKhoTypeId ?? detail.billInfo?.khoTypeId;
    if (id != null && id > 0) {
      for (final p in productGroups) {
        if (p.id == id) return (p.name ?? '').trim();
      }
    }
    // Fallback: dùng text thô từ API khi lookup chưa load.
    return detail.selectedLoaiKhoText ??
        (detail.billInfo?.warehouseType ?? '').trim();
  }

  String _resolveStatusText() {
    final status = detail.selectedStatus ?? detail.billInfo?.status;
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
        return '';
    }
  }

  String _resolveNccText() {
    final id = detail.selectedNccId ?? detail.billInfo?.supplierId;
    if (id != null && id > 0) {
      for (final s in suppliers) {
        if (s.id == id) return (s.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveInternalWarehouseText() {
    final id = detail.selectedInternalWarehouseId ??
        detail.billInfo?.wareHouseTranferId;
    if (id != null && id > 0) {
      for (final w in warehouses) {
        if (w.id == id) return (w.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveInternalKhoTypeText() {
    final id = detail.selectedInternalKhoTypeId ??
        detail.billInfo?.khoTypeTransferId;
    if (id != null && id > 0) {
      for (final p in productGroups) {
        if (p.id == id) return (p.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveReference() {
    // DetailGDNItemResponse chưa có field Reference → trả rỗng → field disable.
    // User sẽ bổ sung field này sau nếu cần.
    return '';
  }

  String _formatDateTime(DateTime? dt) {
    if (dt == null) return '';
    return DateFormat('dd/MM/yyyy HH:mm').format(dt);
  }

  // ===========================================================================
  // Bottom-sheet pickers
  // ===========================================================================

  Future<void> _pickSupplier(BuildContext context) async {
    if (suppliers.isEmpty) return;
    await openSelectBottomSheet<SupplierResponse>(
      context: context,
      title: 'Chọn NCC',
      items: suppliers,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(suppliers, detail.selectedSupplierId),
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
      initialSelectedItem: _findById(senders, detail.selectedSenderId),
      onSelected: (item) => onSelectSender(item.id),
    );
  }

  Future<void> _pickReceiver(BuildContext context) async {
    if (senders.isEmpty) return;
    await openSelectBottomSheet<SenderResponse>(
      context: context,
      title: 'Chọn người nhận',
      items: senders,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.fullName ?? '').trim()}'.trim(),
      initialSelectedItem:
          _findById(senders, detail.billInfo?.receiverId),
      onSelected: (item) => onSelectCustomer(item.id),
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
      initialSelectedItem: _findById(customers, detail.selectedCustomerId),
      onSelected: (item) => onSelectCustomerWithAddress(
        item.id,
        (item.address ?? '').trim(),
      ),
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
      initialSelectedItem: _findById(warehouses, detail.selectedWarehouseId),
      onSelected: (item) => onSelectWarehouse(item.id),
    );
  }

  Future<void> _pickStatus(BuildContext context) async {
    const options = <_StatusOption>[
      _StatusOption(0, 'Mượn'),
      _StatusOption(1, 'Tồn kho'),
      _StatusOption(2, 'Đã xuất kho'),
      _StatusOption(5, 'Xuất trả NCC'),
      _StatusOption(6, 'Y/C xuất kho'),
      _StatusOption(7, 'Y/C mượn'),
    ];
    final current = detail.selectedStatus ?? detail.billInfo?.status;
    await openSelectBottomSheet<_StatusOption>(
      context: context,
      title: 'Chọn trạng thái',
      items: options,
      displayText: (o) => o.label,
      initialSelectedItem: options.firstWhere(
        (o) => o.value == current,
        orElse: () => options.first,
      ),
      onSelected: (item) => onSelectStatus(item.value),
    );
  }

  Future<void> _pickLoaiKho(BuildContext context) async {
    if (productGroups.isEmpty) return;
    await openSelectBottomSheet<ProductGroupNewResponse>(
      context: context,
      title: 'Chọn loại kho',
      items: productGroups,
      displayText: (p) => (p.name ?? '').trim(),
      initialSelectedItem: _findById(productGroups, detail.selectedKhoTypeId),
      onSelected: (item) {
        onSelectKhoType(item.id);
        onSelectLoaiKho((item.name ?? '').trim());
      },
    );
  }

  Future<void> _pickDeliveryAddress(BuildContext context) async {
    final items = suppliers
        .map((s) => _AddressOption(
              label:
                  '${(s.name ?? '').trim()} - ${(s.address ?? '').trim()}',
              value: (s.address ?? '').trim(),
            ))
        .where((o) => o.value.isNotEmpty)
        .toList();
    if (items.isEmpty) return;
    await openSelectBottomSheet<_AddressOption>(
      context: context,
      title: 'Chọn địa chỉ giao hàng',
      items: items,
      displayText: (a) => a.label,
      onSelected: (item) => onChangeDeliveryAddress(item.value),
    );
  }

  Future<void> _pickInternalWarehouse(BuildContext context) async {
    if (warehouses.isEmpty) return;
    await openSelectBottomSheet<WarehouseResponse>(
      context: context,
      title: 'Chọn kho chuyển',
      items: warehouses,
      displayText: (w) =>
          '${(w.code ?? '').trim()} - ${(w.name ?? '').trim()}'.trim(),
      initialSelectedItem:
          _findById(warehouses, detail.selectedInternalWarehouseId),
      onSelected: (item) => onSelectInternalWarehouse(item.id),
    );
  }

  Future<void> _pickInternalKhoType(BuildContext context) async {
    if (productGroups.isEmpty) return;
    await openSelectBottomSheet<ProductGroupNewResponse>(
      context: context,
      title: 'Chọn loại kho chuyển',
      items: productGroups,
      displayText: (p) => (p.name ?? '').trim(),
      initialSelectedItem:
          _findById(productGroups, detail.selectedInternalKhoTypeId),
      onSelected: (item) => onSelectInternalKhoType(item.id),
    );
  }

  Future<void> _pickNcc(BuildContext context) async {
    if (suppliers.isEmpty) return;
    await openSelectBottomSheet<SupplierResponse>(
      context: context,
      title: 'Chọn nhà cung cấp',
      items: suppliers,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(suppliers, detail.selectedNccId),
      onSelected: (item) => onSelectNcc(item.id),
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

  int? _readId(Object? item) {
    if (item is SupplierResponse) return item.id;
    if (item is SenderResponse) return item.id;
    if (item is CustomerResponse) return item.id;
    if (item is WarehouseResponse) return item.id;
    if (item is ProductGroupNewResponse) return item.id;
    return null;
  }
}

// ===========================================================================
// Internal helpers
// ===========================================================================

class _StatusOption {
  const _StatusOption(this.value, this.label);
  final int value;
  final String label;
}

class _AddressOption {
  const _AddressOption({required this.label, required this.value});
  final String label;
  final String value;
}

/// Một section trong form (header + children) - tạo khoảng cách giữa các nhóm.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
              ],
            ),
          ),
          // Spacing giữa các field
          ..._withSpacing(children),
        ],
      ),
    );
  }

  /// Chèn SizedBox(height: 14) giữa các widget liên tiếp.
  List<Widget> _withSpacing(List<Widget> widgets) {
    if (widgets.isEmpty) return widgets;
    final result = <Widget>[];
    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(const SizedBox(height: 14));
      }
    }
    return result;
  }
}

/// Field hiển thị read-only (label + value) cho 1 row đơn giản.
class _ReadonlyFieldRow extends StatelessWidget {
  const _ReadonlyFieldRow({
    required this.icon,
    required this.label,
    required this.value,
    this.multiline = false,
    this.isCode = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool multiline;
  final bool isCode;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;
    return Row(
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
                fontWeight: isCode ? FontWeight.w600 : FontWeight.w500,
                color: hasValue
                    ? AppColors.enableText
                    : AppColors.gray.withValues(alpha: 0.7),
                height: 1.4,
              ),
              maxLines: multiline ? null : 2,
              overflow: multiline ? null : TextOverflow.ellipsis,
            ),
          ),
        ],
    );
  }
}

/// Row gồm: Checkbox + label bên trái, FormInputField bên phải.
/// Field bên phải sẽ bị disable khi checkbox chưa tick.
class _CheckboxInputRow extends StatelessWidget {
  const _CheckboxInputRow({
    required this.checked,
    required this.label,
    required this.onChanged,
    required this.child,
  });

  final bool checked;
  final String label;
  final ValueChanged<bool> onChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Checkbox + label - tap cả row để toggle
        InkWell(
          onTap: () => onChanged(!checked),
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: Checkbox(
                    value: checked,
                    onChanged: (v) => onChanged(v ?? false),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: child),
      ],
    );
  }
}