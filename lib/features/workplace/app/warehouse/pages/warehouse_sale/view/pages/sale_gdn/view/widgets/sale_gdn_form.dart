import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/helpers/select_bottom_sheet_helper.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart';
import 'package:rtc_erp/common/widgets/form/form_card.dart';
import 'package:rtc_erp/common/widgets/form/form_checkbox.dart';
import 'package:rtc_erp/common/widgets/form/form_date_time_picker.dart';
import 'package:rtc_erp/common/widgets/form/form_input_field.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/view/bloc/sale_gdn_bloc.dart';

import '../../../../../../../../../../../base/network/errors/extension.dart';

/// Form phiếu chi tiết xuất kho - 1 card duy nhất.
///
/// Tất cả field đều dùng `DetailGDNItemResponse` (API `/billexport/{id}`) làm
/// nguồn chính. Text của các dropdown (NCC, người giao, KH, kho, loại kho, ...)
/// được resolve từ ID thông qua các lookup list đã load sẵn (suppliers,
/// senders, customers, warehouses, warehouseTypes, users). Khi lookup chưa load,
/// text sẽ rỗng.
///
/// Form là read-only theo yêu cầu - chỉ xem, không lưu server.
class SaleGdnForm extends StatefulWidget {
  const SaleGdnForm({
    super.key,
    required this.detail,
    required this.suppliers,
    required this.senders,
    required this.customers,
    required this.warehouses,
    required this.users,
    required this.currentWarehouseCode,
    required this.onSelectSupplier,
    required this.onSelectSender,
    required this.onSelectReceiver,
    required this.onSelectCustomer,
    required this.onSelectCustomerWithAddress,
    required this.onSelectKhoType,
    required this.onSelectProductType,
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
    required this.warehouseTypes,
    this.addressStocks = const [],
    this.onFetchAddressStockByCustomer,
  });

  final GdnDetailState detail;

  // Lookup data
  final List<SupplierResponse> suppliers;
  final List<SenderResponse> senders;
  final List<CustomerResponse> customers;
  final List<WarehouseResponse> warehouses;
  final List<TypeWarehouseResponse> warehouseTypes;
  final List<BillExportUserResponse> users;

  /// Danh sách địa chỉ giao hàng theo customerId (fetch từ API AddressStock).
  final List<AddressStockResponse> addressStocks;

  /// Callback để fetch địa chỉ giao hàng khi chọn khách hàng.
  final void Function(int customerId)? onFetchAddressStockByCustomer;

  final String currentWarehouseCode;

  // Callbacks
  final ValueChanged<int?> onSelectSupplier;
  final ValueChanged<int?> onSelectSender;
  final ValueChanged<int?> onSelectReceiver;
  final ValueChanged<int?> onSelectCustomer;
  final void Function(int? id, String? address) onSelectCustomerWithAddress;
  final ValueChanged<int?> onSelectKhoType;
  final ValueChanged<int?> onSelectProductType;
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
  State<SaleGdnForm> createState() => _SaleGdnFormState();
}

/// Khóa các field FormBuilder, dùng để `didChange` từ BlocListener khi
/// bloc state đổi. Đặt ở file scope để tránh hard-code string rải rác.
const _kFieldStatus = 'gdn_status';
const _kFieldSender = 'gdn_sender';
const _kFieldReceiver = 'gdn_receiver';
const _kFieldDeliveryDate = 'gdn_delivery_date';
const _kFieldRequestDate = 'gdn_request_date';
const _kFieldReceiveTime = 'gdn_receive_time';
const _kFieldLoaiKho = 'gdn_loai_kho';
const _kFieldProductType = 'gdn_warehouse';
const _kFieldInternalWarehouse = 'gdn_internal_warehouse';
const _kFieldInternalKhoType = 'gdn_internal_kho_type';
const _kFieldCustomer = 'gdn_customer';
const _kFieldDeliveryAddress = 'gdn_delivery_address';
const _kFieldSupplier = 'gdn_supplier';
const _kFieldIsIncurred = 'gdn_is_incurred';

class _SaleGdnFormState extends State<SaleGdnForm> {
  // Trạng thái thu/mở toàn bộ card thông tin. Mặc định collapse.
  bool _isExpanded = false;

  // Key FormBuilder dùng để gọi `fields[name]?.didChange(value)` khi bloc
  // state đổi (FormBuilderField chỉ áp dụng `initialValue` ở lần build đầu).
  final GlobalKey<FormBuilderState> _formKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final info = widget.detail.billInfo;

    return BlocListener<SaleGdnBloc, SaleGdnState>(
      // Chỉ sync khi detail state thay đổi (không quan tâm lookup lists).
      listenWhen: (p, c) => p.detail != c.detail,
      listener: (context, state) {
        // Defer 1 frame để đảm bảo FormBuilder đã mount và các field đã
        // đăng ký trong `_formKey.currentState?.fields`.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _syncFormWithState();
        });
      },
      child: FormBuilder(
        key: _formKey,
        child: FormCard(
          collapsed: !_isExpanded,
          actions: [
            // Title tappable để expand/collapse
            InkWell(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  'Thông tin phiếu xuất kho',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              tooltip: _isExpanded ? 'Thu gọn' : 'Mở rộng',
              icon: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.gray,
              ),
              onPressed: () => setState(() => _isExpanded = !_isExpanded),
            ),
          ],
          child: _buildBody(info),
        ),
      ),
    );
  }

  /// Sync giá trị các field trong FormBuilder từ state hiện tại của bloc.
  /// Gọi mỗi khi `state.detail` đổi — FormBuilderField chỉ dùng
  /// `initialValue` ở build đầu tiên nên phải chủ động `didChange` để
  /// text hiển thị đúng sau khi user chọn option từ bottom-sheet.
  void _syncFormWithState() {
    final form = _formKey.currentState;
    if (form == null) return;
    final info = widget.detail.billInfo;

    form.fields[_kFieldStatus]?.didChange(_resolveStatusText());
    form.fields[_kFieldSender]?.didChange(_resolveSenderText());
    form.fields[_kFieldReceiver]?.didChange(_resolveReceiverText());
    form.fields[_kFieldLoaiKho]?.didChange(_resolveLoaiKhoText());
    form.fields[_kFieldProductType]?.didChange(_resolveProductTypeText());
    form.fields[_kFieldInternalWarehouse]?.didChange(
      _resolveInternalWarehouseText(),
    );
    form.fields[_kFieldInternalKhoType]?.didChange(
      _resolveInternalKhoTypeText(),
    );
    form.fields[_kFieldCustomer]?.didChange(_resolveCustomerText());
    form.fields[_kFieldDeliveryAddress]?.didChange(
      _resolveDeliveryAddressText(),
    );
    form.fields[_kFieldSupplier]?.didChange(_resolveSupplierText());

    // Dates: FormDateTimePicker đã tự sync trong `didUpdateWidget` khi
    // `initialValue` thay đổi, nhưng gọi thêm `didChange` ở đây để chắc
    // chắn field state luôn đồng bộ với bloc state.
    form.fields[_kFieldDeliveryDate]?.didChange(
      widget.detail.deliveryDate ?? info?.deliveryTime,
    );
    form.fields[_kFieldRequestDate]?.didChange(
      widget.detail.requestDate ?? info?.requestDate,
    );
    form.fields[_kFieldReceiveTime]?.didChange(
      widget.detail.receiveTime ?? info?.deliveryTime,
    );

    // Checkbox "Phát sinh" - auto tick theo logic ở title.
    form.fields[_kFieldIsIncurred]?.didChange(_isIncurred());
  }

  Widget _buildBody(DetailGDNItemResponse? info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // === Mã phiếu + Trạng thái + Ngày tạo ===
        _Section(
          title: 'Thông tin chung',
          children: [
            FormInputField(
              nameForm: 'gdn_status',
              nameTextField: 'gdn_status_text',
              label: 'Trạng thái',
              icon: Icons.flag_outlined,
              initialValue: _resolveStatusText(),
              readOnly: true,
              onTap: () => _pickStatus(context),
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn trạng thái',
              ),
            ),
            FormInputField(
              nameForm: 'gdn_sender',
              nameTextField: 'gdn_sender_text',
              label: 'Người giao',
              icon: Icons.delivery_dining_outlined,
              initialValue: _resolveSenderText(),
              readOnly: true,
              onTap: () => _pickSender(context),
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn người giao',
              ),
            ),
            FormInputField(
              nameForm: 'gdn_receiver',
              nameTextField: 'gdn_receiver_text',
              label: 'Người nhận',
              icon: Icons.assignment_ind_outlined,
              initialValue: _resolveReceiverText(),
              readOnly: true,
              onTap: () => _pickReceiver(context),
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn người nhận',
              ),
            ),
            FormDateTimePicker(
              nameForm: 'gdn_delivery_date',
              nameTimePicker: 'gdn_delivery_date_picker',
              label: 'Ngày xuất',
              icon: Icons.event_available_outlined,
              inputType: InputType.date,
              format: DateFormat('dd/MM/yyyy'),
              initialValue: widget.detail.deliveryDate ?? info?.deliveryTime,
              onChanged: widget.onChangeDeliveryDate,
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn ngày xuất phiếu',
              ),
            ),
            FormDateTimePicker(
              nameForm: 'gdn_request_date',
              nameTimePicker: 'gdn_request_date_picker',
              label: 'Ngày yêu cầu',
              icon: Icons.calendar_today_outlined,
              inputType: InputType.date,
              format: DateFormat('dd/MM/yyyy'),
              initialValue: widget.detail.requestDate ?? info?.requestDate,
              onChanged: widget.onChangeRequestDate,
            ),
            FormDateTimePicker(
              nameForm: 'gdn_receive_time',
              nameTimePicker: 'gdn_receive_time_picker',
              label: 'Thời gian nhận hàng',
              icon: Icons.schedule_outlined,
              inputType: InputType.both,
              format: DateFormat('dd/MM/yyyy HH:mm'),
              initialValue: widget.detail.receiveTime ?? info?.deliveryTime,
              onChanged: widget.onChangeReceiveTime,
            ),
          ],
        ),

        // === Kho & Loại hàng ===
        _Section(
          title: 'Kho & Loại hàng',
          children: [
            FormInputField(
              nameForm: 'gdn_loai_kho',
              nameTextField: 'gdn_loai_kho_text',
              label: 'Loại kho',
              icon: Icons.category_outlined,
              initialValue: _resolveLoaiKhoText(),
              readOnly: true,
              onTap: () => _pickLoaiKho(context),
              isRequired: true,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng chọn loại kho',
              ),
            ),
            FormInputField(
              nameForm: 'gdn_warehouse',
              nameTextField: 'gdn_warehouse_text',
              label: 'Loại hàng',
              icon: Icons.inventory_2_outlined,
              initialValue: _resolveProductTypeText(),
              readOnly: true,
              onTap: () => _pickProductType(context),
            ),

            // Checkbox "Chuyển kho" bên trái + Field "Chuyển kho" bên phải
            _CheckboxInputRow(
              checked: widget.detail.isTransferInternalChecked,
              onChanged: (v) => _handleTransferToggle(v),
              child: FormInputField(
                nameForm: 'gdn_internal_warehouse',
                nameTextField: 'gdn_internal_warehouse_text',
                label: 'Chuyển kho',
                icon: Icons.swap_horiz_outlined,
                initialValue: _resolveInternalWarehouseText(),
                readOnly: true,
                enabled: widget.detail.isTransferInternalChecked,
                onTap: widget.detail.isTransferInternalChecked
                    ? () => _pickInternalWarehouse(context)
                    : null,
              ),
            ),
            // Checkbox "Chuyển kho nội bộ" bên trái + Field "Loại kho chuyển" bên phải
            _CheckboxInputRow(
              checked: widget.detail.isInternalChecked,
              onChanged: (v) => _handleInternalToggle(v),
              child: FormInputField(
                nameForm: 'gdn_internal_kho_type',
                nameTextField: 'gdn_internal_kho_type_text',
                label: 'Chuyển kho nội bộ',
                icon: Icons.category_outlined,
                initialValue: _resolveInternalKhoTypeText(),
                readOnly: true,
                enabled: widget.detail.isInternalChecked,
                onTap: widget.detail.isInternalChecked
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
              initialValue: _resolveDeliveryAddressText(),
              readOnly: true,
              onTap: () => _pickDeliveryAddress(context),
            ),
            FormInputField(
              nameForm: 'gdn_supplier',
              nameTextField: 'gdn_supplier_text',
              label: 'Nhà cung cấp',
              icon: Icons.local_shipping_outlined,
              initialValue: _resolveSupplierText(),
              readOnly: true,
              onTap: () => _pickSupplier(context),
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

            FormCheckbox(
              name: _kFieldIsIncurred,
              title: const Text(
                'Phát sinh (Ngoài 8h-16h hoặc thời gian nhận hàng < 4h tính theo thời gian tạo phiếu)',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              initialValue: _isIncurred(),
              enabled: false,
            ),
          ],
        ),
      ],
    );
  }

  // ===========================================================================
  // Text resolvers - lookup từ list qua ID
  // ===========================================================================

  String _resolveSupplierText() {
    final id =
        widget.detail.selectedSupplierId ?? widget.detail.billInfo?.supplierId;
    if (id != null && id > 0) {
      for (final s in widget.suppliers) {
        if (s.id == id) return (s.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveSenderText() {
    final id =
        widget.detail.selectedSenderId ?? widget.detail.billInfo?.senderId;
    if (id != null && id > 0) {
      for (final s in widget.senders) {
        if (s.id == id) return (s.fullName ?? '').trim();
      }
    }
    return '';
  }

  String _resolveReceiverText() {
    // Ưu tiên dùng userId từ detail để map với users list, fallback sang selectedReceiverId
    final id = widget.detail.userId ?? widget.detail.selectedReceiverId;
    if (id != null && id > 0) {
      for (final u in widget.users) {
        if (u.id == id) return (u.fullName ?? '').trim();
      }
    }
    return '';
  }

  String _resolveCustomerText() {
    final id =
        widget.detail.selectedCustomerId ?? widget.detail.billInfo?.customerId;
    if (id != null && id > 0) {
      for (final c in widget.customers) {
        if (c.id == id) return (c.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveCustomerAddress() {
    final id =
        widget.detail.selectedCustomerId ?? widget.detail.billInfo?.customerId;
    if (id != null && id > 0) {
      for (final c in widget.customers) {
        if (c.id == id) return (c.address ?? '').trim();
      }
    }
    return '';
  }

  /// Tra cứu text địa chỉ giao hàng từ `addressStocks` theo `addressStockId`:
  /// 1. Nếu đã chọn từ picker → `widget.detail.deliveryAddress`.
  /// 2. Nếu phiếu có `addressStockId` → tìm trong `addressStocks` để lấy text.
  /// Ko fallback ra text khác — chỉ lấy từ AddressStockResponse.
  String _resolveDeliveryAddressText() {
    final picked = widget.detail.deliveryAddress;
    if (picked != null && picked.trim().isNotEmpty) return picked;

    final stockId = widget.detail.billInfo?.addressStockId;
    if (stockId != null && stockId > 0) {
      for (final a in widget.addressStocks) {
        if (a.id == stockId) return (a.address ?? '').trim();
      }
    }

    return '';
  }

  String _resolveLoaiKhoText() {
    final id =
        widget.detail.selectedKhoTypeId ?? widget.detail.billInfo?.khoTypeId;
    if (id != null && id > 0) {
      for (final p in widget.warehouseTypes) {
        if (p.id == id) return (p.productGroupName ?? '').trim();
      }
    }
    // Fallback: dùng text thô từ API khi lookup chưa load.
    return widget.detail.selectedLoaiKhoText ??
        (widget.detail.billInfo?.warehouseType ?? '').trim();
  }

  void _handleTransferToggle(bool value) {
    widget.onToggleTransferInternal(value);
    // Uncheck & disable "Chuyển kho nội bộ" khi bật "Chuyển kho"
    if (value && widget.detail.isInternalChecked) {
      widget.onToggleInternal(false);
    }
  }

  void _handleInternalToggle(bool value) {
    widget.onToggleInternal(value);
    // Uncheck & disable "Chuyển kho" khi bật "Chuyển kho nội bộ"
    if (value && widget.detail.isTransferInternalChecked) {
      widget.onToggleTransferInternal(false);
    }
  }

  String _resolveProductTypeText() {
    final type =
        widget.detail.selectedProductType ??
        widget.detail.billInfo?.productType;
    switch (type) {
      case 1:
        return 'Hàng thương mại';
      case 2:
        return 'Hàng dự án';
      default:
        return '';
    }
  }

  String _resolveStatusText() {
    final status =
        widget.detail.selectedStatus ?? widget.detail.billInfo?.status;
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
    final id =
        widget.detail.selectedNccId ?? widget.detail.billInfo?.supplierId;
    if (id != null && id > 0) {
      for (final s in widget.suppliers) {
        if (s.id == id) return (s.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveInternalWarehouseText() {
    final id =
        widget.detail.selectedInternalWarehouseId ??
        widget.detail.billInfo?.wareHouseTranferId;
    if (id != null && id > 0) {
      for (final w in widget.warehouses) {
        if (w.id == id) return (w.name ?? '').trim();
      }
    }
    return '';
  }

  String _resolveInternalKhoTypeText() {
    final id =
        widget.detail.selectedInternalKhoTypeId ??
        widget.detail.billInfo?.khoTypeTransferId;
    if (id != null && id > 0) {
      for (final p in widget.warehouseTypes) {
        if (p.id == id) return (p.productGroupName ?? '').trim();
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

  /// Tính trạng thái "Phát sinh" theo đúng title đã ghi:
  /// "Phát sinh (Ngoài 8h-16h hoặc thời gian nhận hàng < 4h tính theo
  /// thời gian tạo phiếu)".
  ///
  /// Tick khi thỏa MỘT trong các điều kiện:
  /// 1. Server đã duyệt: `IsIncurredApproved = true`.
  /// 2. Thời gian nhận hàng ngoài khung 8h-16h.
  /// 3. Thời gian nhận hàng - thời gian tạo phiếu < 4 giờ.
  bool _isIncurred() {
    final info = widget.detail.billInfo;
    if (info == null) return false;

    // 1. Server đã duyệt "phát sinh" → luôn tick.
    if (info.isIncurredApproved == true) return true;

    final receive = widget.detail.receiveTime ?? info.deliveryTime;
    if (receive == null) return false;

    // 2. Ngoài khung 8h-16h.
    if (receive.hour < 8 || receive.hour >= 16) return true;

    // 3. Nhận hàng trong vòng 4 giờ kể từ lúc tạo phiếu.
    final created = info.creatDate ?? info.createdDate;
    if (created != null && !receive.isBefore(created)) {
      final diff = receive.difference(created);
      if (diff.inMinutes < 240) return true;
    }

    return false;
  }

  // ===========================================================================
  // Bottom-sheet pickers
  // ===========================================================================

  Future<void> _pickSupplier(BuildContext context) async {
    if (widget.suppliers.isEmpty) {
      context.showMessage(
        'Danh sách nhà cung cấp chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    await openSelectBottomSheet<SupplierResponse>(
      context: context,
      title: 'Chọn nhà cung cấp',
      items: widget.suppliers,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(
        widget.suppliers,
        widget.detail.selectedSupplierId,
      ),
      onSelected: (item) => widget.onSelectSupplier(item.id),
    );
  }

  Future<void> _pickSender(BuildContext context) async {
    if (widget.senders.isEmpty) {
      context.showMessage(
        'Danh sách người giao chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    await openSelectBottomSheet<SenderResponse>(
      context: context,
      title: 'Chọn người giao',
      items: widget.senders,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.fullName ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(
        widget.senders,
        widget.detail.selectedSenderId,
      ),
      onSelected: (item) => widget.onSelectSender(item.id),
    );
  }

  Future<void> _pickReceiver(BuildContext context) async {
    if (widget.users.isEmpty) {
      context.showMessage(
        'Danh sách nhân viên chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    await openSelectBottomSheet<BillExportUserResponse>(
      context: context,
      title: 'Chọn người nhận',
      items: widget.users,
      displayText: (u) =>
          '${(u.employeeCode ?? '').trim()} - ${(u.fullName ?? '').trim()}'
              .trim(),
      initialSelectedItem: _findUserById(
        widget.detail.selectedReceiverId ?? widget.detail.billInfo?.receiverId,
      ),
      onSelected: (item) => widget.onSelectReceiver(item.id),
    );
  }

  Future<void> _pickCustomer(BuildContext context) async {
    if (widget.customers.isEmpty) {
      context.showMessage(
        'Danh sách khách hàng chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    await openSelectBottomSheet<CustomerResponse>(
      context: context,
      title: 'Chọn khách hàng',
      items: widget.customers,
      displayText: (c) =>
          '${(c.shortName ?? '').trim()} - ${(c.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(
        widget.customers,
        widget.detail.selectedCustomerId,
      ),
      onSelected: (item) {
        // Gọi API lấy địa chỉ giao hàng theo customerId
        widget.onFetchAddressStockByCustomer?.call(item.id ?? 0);
        widget.onSelectCustomerWithAddress(
          item.id,
          (item.address ?? '').trim(),
        );
      },
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
    final current =
        widget.detail.selectedStatus ?? widget.detail.billInfo?.status;
    await openSelectBottomSheet<_StatusOption>(
      context: context,
      title: 'Chọn trạng thái',
      items: options,
      displayText: (o) => o.label,
      initialSelectedItem: options.firstWhere(
        (o) => o.value == current,
        orElse: () => options.first,
      ),
      onSelected: (item) => widget.onSelectStatus(item.value),
    );
  }

  Future<void> _pickProductType(BuildContext context) async {
    const options = [
      _ProductTypeOption(1, 'Hàng thương mại'),
      _ProductTypeOption(2, 'Hàng dự án'),
    ];
    final current =
        widget.detail.selectedProductType ??
        widget.detail.billInfo?.productType;
    await openSelectBottomSheet<_ProductTypeOption>(
      context: context,
      title: 'Chọn loại hàng',
      items: options,
      displayText: (o) => o.label,
      initialSelectedItem: options.firstWhere(
        (o) => o.value == current,
        orElse: () => options.first,
      ),
      onSelected: (item) => widget.onSelectProductType(item.value),
    );
  }

  Future<void> _pickLoaiKho(BuildContext context) async {
    if (widget.warehouseTypes.isEmpty) {
      context.showMessage(
        'Danh sách loại kho chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    // Lọc bỏ item đã chọn ở "Loại kho chuyển" để tránh trùng (chỉ khi có ID).
    final selectedInternalKhoTypeId = widget.detail.selectedInternalKhoTypeId;
    final filtered = selectedInternalKhoTypeId != null
        ? widget.warehouseTypes
            .where((p) => p.id != null && p.id != selectedInternalKhoTypeId)
            .toList()
        : widget.warehouseTypes;
    if (filtered.isEmpty) return;
    await openSelectBottomSheet<TypeWarehouseResponse>(
      context: context,
      title: 'Chọn loại kho',
      items: filtered,
      displayText: (p) => (p.productGroupName ?? '').trim(),
      initialSelectedItem: _findWarehouseTypeById(
        filtered,
        widget.detail.selectedKhoTypeId,
      ),
      onSelected: (item) {
        widget.onSelectKhoType(item.id);
        widget.onSelectLoaiKho((item.productGroupName ?? '').trim());
      },
    );
  }

  Future<void> _pickDeliveryAddress(BuildContext context) async {
    // Chỉ lấy từ AddressStockResponse (API AddressStock)
    if (widget.addressStocks.isEmpty) {
      context.showMessage(
        'Chưa có địa chỉ giao hàng cho khách hàng này',
        type: SnackBarType.info,
      );
      return;
    }

    final items = widget.addressStocks
        .where((a) => (a.address ?? '').trim().isNotEmpty)
        .map((a) => _DeliveryAddressItem(
              id: a.id,
              label: (a.address ?? '').trim(),
              address: (a.address ?? '').trim(),
            ))
        .toList();

    if (items.isEmpty) {
      context.showMessage(
        'Chưa có địa chỉ giao hàng',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<_DeliveryAddressItem>(
      context: context,
      title: 'Chọn địa chỉ giao hàng',
      items: items,
      displayText: (item) => item.label,
      onSelected: (item) => widget.onChangeDeliveryAddress(item.address),
    );
  }

  Future<void> _pickInternalWarehouse(BuildContext context) async {
    if (widget.warehouses.isEmpty) {
      context.showMessage(
        'Danh sách kho chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    // Ẩn kho hiện tại theo warehouseCode (state.warehouseCode).
    final currentCode = widget.currentWarehouseCode.trim();
    final filtered = widget.warehouses
        .where((w) => (w.code ?? '').trim() != currentCode)
        .toList();
    if (filtered.isEmpty) return;
    await openSelectBottomSheet<WarehouseResponse>(
      context: context,
      title: 'Chọn kho chuyển',
      items: filtered,
      displayText: (w) =>
          '${(w.code ?? '').trim()} - ${(w.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(
        filtered,
        widget.detail.selectedInternalWarehouseId,
      ),
      onSelected: (item) => widget.onSelectInternalWarehouse(item.id),
    );
  }

  Future<void> _pickInternalKhoType(BuildContext context) async {
    if (widget.warehouseTypes.isEmpty) {
      context.showMessage(
        'Danh sách loại kho chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    // Lọc bỏ item đã chọn ở "Loại kho" để tránh trùng (chỉ khi có ID).
    final selectedKhoTypeId = widget.detail.selectedKhoTypeId;
    final filtered = selectedKhoTypeId != null
        ? widget.warehouseTypes
            .where((p) => p.id != null && p.id != selectedKhoTypeId)
            .toList()
        : widget.warehouseTypes;
    if (filtered.isEmpty) return;
    await openSelectBottomSheet<TypeWarehouseResponse>(
      context: context,
      title: 'Chọn loại kho chuyển',
      items: filtered,
      displayText: (p) => (p.productGroupName ?? '').trim(),
      initialSelectedItem: _findWarehouseTypeById(
        filtered,
        widget.detail.selectedInternalKhoTypeId,
      ),
      onSelected: (item) => widget.onSelectInternalKhoType(item.id),
    );
  }

  Future<void> _pickNcc(BuildContext context) async {
    if (widget.suppliers.isEmpty) {
      context.showMessage(
        'Danh sách nhà cung cấp chưa sẵn sàng, vui lòng đợi',
        type: SnackBarType.info,
      );
      return;
    }
    await openSelectBottomSheet<SupplierResponse>(
      context: context,
      title: 'Chọn nhà cung cấp',
      items: widget.suppliers,
      displayText: (s) =>
          '${(s.code ?? '').trim()} - ${(s.name ?? '').trim()}'.trim(),
      initialSelectedItem: _findById(
        widget.suppliers,
        widget.detail.selectedNccId,
      ),
      onSelected: (item) => widget.onSelectNcc(item.id),
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

  BillExportUserResponse? _findUserById(int? id) {
    if (id == null) return null;
    for (final u in widget.users) {
      if (u.id == id) return u;
    }
    return null;
  }

  TypeWarehouseResponse? _findWarehouseTypeById(
    List<TypeWarehouseResponse> items,
    int? id,
  ) {
    if (id == null) return null;
    for (final p in items) {
      if (p.id == id) return p;
    }
    return null;
  }

  int? _readId(Object? item) {
    if (item is SupplierResponse) return item.id;
    if (item is SenderResponse) return item.id;
    if (item is CustomerResponse) return item.id;
    if (item is WarehouseResponse) return item.id;
    if (item is TypeWarehouseResponse) return item.id;
    if (item is ProductGroupNewResponse) return item.id;
    if (item is BillExportUserResponse) return item.id;
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

class _ProductTypeOption {
  const _ProductTypeOption(this.value, this.label);
  final int value;
  final String label;
}

/// Helper class cho delivery address selection (chung cho AddressStockResponse và SupplierResponse).
class _DeliveryAddressItem {
  const _DeliveryAddressItem({
    required this.id,
    required this.label,
    required this.address,
  });

  /// ID từ AddressStockResponse (null nếu từ SupplierResponse).
  final int? id;
  final String label;
  final String address;
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
      crossAxisAlignment: multiline
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.gray),
        const SizedBox(width: 8),
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: TextStyle(fontSize: 12, color: AppColors.gray, height: 1.4),
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
    required this.onChanged,
    required this.child,
  });

  final bool checked;
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
