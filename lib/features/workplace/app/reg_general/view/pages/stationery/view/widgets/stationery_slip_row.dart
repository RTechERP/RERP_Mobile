// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget dòng VPP trong form đăng ký văn phòng phẩm

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../data/datasource/models/stationery_model.dart';
import '../bloc/stationery_bloc.dart';

/// Một dòng VPP trong form:
///
/// [Hàng 1] Chọn VPP (isRequired) | Xoá
/// [Hàng 2] Đơn vị tính | Số lượng nhận
/// [Hàng 3] Số lượng (isRequired)
/// [Hàng 4] Checkbox vượt định mức (readonly, tự tính) | TextField lý do vượt
/// [Hàng 5] TextField ghi chú
class StationerySlipRow extends StatefulWidget {
  const StationerySlipRow({
    super.key,
    required this.slipIndex,
    required this.slip,
    required this.supplies,
    required this.onSupplyTap,
    required this.onQuantityChanged,
    required this.onReasonChanged,
    required this.onNoteChanged,
    this.supplyRequiredValidated = false,
    this.onRemove,
  });

  final int slipIndex;
  final StationerySlip slip;
  final List<StationerySupplyItem> supplies;
  final VoidCallback onSupplyTap;
  final void Function(int) onQuantityChanged;
  final void Function(String) onReasonChanged;
  final void Function(String) onNoteChanged;
  final bool supplyRequiredValidated;
  final VoidCallback? onRemove;

  @override
  State<StationerySlipRow> createState() => _StationerySlipRowState();
}

class _StationerySlipRowState extends State<StationerySlipRow> {
  late TextEditingController _qtyController;
  late TextEditingController _reasonController;
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: widget.slip.quantity.toString());
    _reasonController = TextEditingController(text: widget.slip.reason);
    _noteController = TextEditingController(text: widget.slip.note);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _reasonController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StationerySlipRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.slip.quantity != widget.slip.quantity) {
      final sel = _qtyController.selection;
      _qtyController.text = widget.slip.quantity.toString();
      if (sel.isValid && sel.baseOffset <= _qtyController.text.length) {
        _qtyController.selection = sel;
      }
    }
    if (oldWidget.slip.reason != widget.slip.reason &&
        widget.slip.reason != _reasonController.text) {
      _reasonController.text = widget.slip.reason;
    }
    if (oldWidget.slip.note != widget.slip.note &&
        widget.slip.note != _noteController.text) {
      _noteController.text = widget.slip.note;
    }
  }

  @override
  Widget build(BuildContext context) {
    final supply = widget.slip.supply;
    final supplyLabel = supply != null
        ? supply.nameNCC ?? ''
        : 'Chọn văn phòng phẩm';
    final bool hasSupply = supply != null;
    final bool showSupplyError = !hasSupply && widget.supplyRequiredValidated;
    final bool hasLimit = widget.slip.requestLimit != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hàng 1: Chọn VPP (isRequired) + Xoá
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: widget.onSupplyTap,
                  borderRadius: BorderRadius.circular(14),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      label: Text.rich(
                        TextSpan(
                          text: 'Chọn VPP',
                          children: const [
                            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.inventory_2_outlined,
                        size: 20,
                        color: hasSupply ? AppColors.primaryERP : AppColors.hintText,
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.hintText,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: showSupplyError
                              ? Colors.redAccent
                              : AppColors.borderColor,
                          width: 1.4,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: showSupplyError
                              ? Colors.redAccent
                              : AppColors.borderColor,
                          width: 1.4,
                        ),
                      ),
                      errorText: showSupplyError ? 'Vui lòng chọn VPP' : null,
                      errorStyle: const TextStyle(fontSize: 0, height: 0),
                      isDense: false,
                    ),
                    child: Text(
                      supplyLabel,
                      style: TextStyle(
                        fontSize: 14,
                        color: hasSupply ? Colors.black87 : AppColors.hintText,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: widget.onRemove,
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: widget.onRemove != null ? AppColors.alert : AppColors.hintText,
                  size: 22,
                ),
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                padding: EdgeInsets.zero,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Hàng 2: Đơn vị tính | Số lượng nhận
          Row(
            children: [
              Expanded(
                child: _UnitCell(
                  value: widget.slip.unit,
                  label: 'ĐVT',
                  icon: Icons.straighten,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _UnitCell(
                  value: widget.slip.receivedQuantity.toString(),
                  label: 'SL nhận',
                  icon: Icons.inbox,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Hàng 3: Số lượng (isRequired)
          TextField(
            controller: _qtyController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              label: Text.rich(
                TextSpan(
                  text: 'Số lượng',
                  children: const [
                    TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              prefixIcon: const Icon(Icons.pin_outlined, size: 20),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.borderColor, width: 1.4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.primaryERP, width: 1.4),
              ),
              errorText: widget.slip.quantity <= 0 ? 'Số lượng phải > 0' : null,
              errorStyle: const TextStyle(fontSize: 10, height: 0),
              isDense: false,
            ),
            onChanged: (val) {
              final qty = int.tryParse(val);
              if (qty != null && qty > 0) {
                widget.onQuantityChanged(qty);
              }
            },
          ),

          const SizedBox(height: 10),

          // Hàng 4: Checkbox vượt định mức (readonly) + TextField lý do
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48,
                child: Checkbox(
                  value: widget.slip.exceedsLimit,
                  onChanged: hasLimit ? (_) {} : null, // readonly — bloc tự tính
                  activeColor: AppColors.primaryERP,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: TextField(
                  controller: _reasonController,
                  enabled: widget.slip.exceedsLimit,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Lý do vượt định mức',
                    hintStyle: TextStyle(fontSize: 14, color: AppColors.hintText),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.borderColor, width: 1.4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.primaryERP, width: 1.4),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: AppColors.bgCard, width: 1.4),
                    ),
                    filled: true,
                    fillColor: widget.slip.exceedsLimit ? Colors.white : AppColors.bgCard,
                    isDense: false,
                  ),
                  onChanged: widget.onReasonChanged,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Hàng 5: Ghi chú
          FormInputField(
            nameForm: 'note_${widget.slipIndex}',
            nameTextField: 'note_text_${widget.slipIndex}',
            label: 'Ghi chú',
            icon: Icons.note_outlined,
            controller: _noteController,
            onChanged: (v) => widget.onNoteChanged(v ?? ''),
          ),
        ],
      ),
    );
  }
}

/// Widget hiển thị ô chỉ-đọc — cập nhật khi [value] thay đổi qua StatefulWidget.
class _UnitCell extends StatefulWidget {
  const _UnitCell({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final IconData icon;

  @override
  State<_UnitCell> createState() => _UnitCellState();
}

class _UnitCellState extends State<_UnitCell> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _UnitCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _controller,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon, size: 20),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.4),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.4),
        ),
        filled: true,
        fillColor: AppColors.bgCard,
        isDense: false,
      ),
      enabled: false,
    );
  }
}
