import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_difference_chip.dart';

/// Kết quả nhập từ bottom sheet cập nhật kết quả kiểm kê.
class InventoryCountItemEditResult {
  const InventoryCountItemEditResult({
    required this.quantityActual,
    required this.note,
  });

  /// Số lượng thực tế đã kiểm kê.
  final double quantityActual;

  /// Ghi chú kèm theo.
  final String note;
}

/// Bottom sheet nhập số lượng thực tế và ghi chú cho một dòng sản phẩm trong
/// phiếu kiểm kê.
///
/// Chỉ dùng khi đợt kiểm kê chưa hoàn thành (`isComplete = false`).
/// Bấm "Lưu" sẽ trả về [InventoryCountItemEditResult] để màn gọi API
/// `POST /WarehouseInventoryCount/save-count-details`.
class InventoryCheckSheetItemEditSheet extends StatefulWidget {
  const InventoryCheckSheetItemEditSheet({super.key, required this.item});

  /// Dòng sản phẩm cần cập nhật kết quả kiểm kê.
  final InventoryCountSheetItem item;

  /// Mở bottom sheet. Trả về kết quả nhập hoặc null nếu người dùng huỷ.
  static Future<InventoryCountItemEditResult?> show(
    BuildContext context,
    InventoryCountSheetItem item,
  ) {
    return showModalBottomSheet<InventoryCountItemEditResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InventoryCheckSheetItemEditSheet(item: item),
    );
  }

  @override
  State<InventoryCheckSheetItemEditSheet> createState() =>
      _InventoryCheckSheetItemEditSheetState();
}

class _InventoryCheckSheetItemEditSheetState
    extends State<InventoryCheckSheetItemEditSheet> {
  /// Controller ô số lượng thực tế.
  late final TextEditingController _quantityController;

  /// Controller ô ghi chú.
  late final TextEditingController _noteController;

  /// Lỗi hiển thị dưới ô số lượng thực tế.
  String? _quantityError;

  /// Số lượng thực tế đang nhập (null = chưa nhập hợp lệ).
  ///
  /// Dùng để so sánh với số lượng kỳ vọng của hệ thống và hiện chip
  /// Lệch / Khớp.
  double? _quantity;

  /// Chênh lệch giữa số lượng thực tế đang nhập và số lượng kỳ vọng.
  ///
  /// `null` = chưa nhập số lượng → dùng chênh lệch do server trả về.
  double? get _difference {
    final quantity = _quantity;
    if (quantity == null) return widget.item.difference;
    return quantity - _expectedQuantity(widget.item);
  }

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _quantityController = TextEditingController(
      text: item.quantityActual == null ? '' : _formatQty(item.quantityActual!),
    );
    _noteController = TextEditingController(text: item.note ?? '');
    _quantity = item.quantityActual;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(item),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(item),
                    const SizedBox(height: 14),
                    _buildQuantityField(),
                    const SizedBox(height: 12),
                    _buildNoteField(),
                  ],
                ),
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  /// Header: icon + tên sản phẩm + mã + chip chênh lệch + nút đóng.
  Widget _buildHeader(InventoryCountSheetItem item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 14),
      decoration: const BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.secondaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.edit_note_outlined,
              color: AppColors.secondaryERP,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cập nhật kết quả kiểm kê',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${_orDash(item.productName)}  •  ${_orDash(item.productCode)}',
                  style: const TextStyle(fontSize: 12, color: AppColors.gray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (_difference != null) ...[
                  const SizedBox(height: 6),
                  InventoryCheckDifferenceChip(difference: _difference),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, size: 20, color: AppColors.gray),
            tooltip: 'Đóng',
          ),
        ],
      ),
    );
  }

  /// Dải thông tin số lượng của sản phẩm.
  ///
  /// Gồm tồn trong kho / đang mượn / khách mượn (3 thành phần cộng lại thành
  /// số lượng kỳ vọng) và chênh lệch so với số lượng thực tế đang nhập.
  Widget _buildInfoRow(InventoryCountSheetItem item) {
    final difference = _difference;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _InfoCell(
              label: 'Tồn trong kho',
              value: _formatQty(item.numberInStore),
            ),
          ),
          Expanded(
            child: _InfoCell(
              label: 'Đang mượn',
              value: _formatQty(item.numberBorrowing),
            ),
          ),
          Expanded(
            child: _InfoCell(
              label: 'Khách mượn',
              value: _formatQty(item.quantityExportMuon),
            ),
          ),
          Expanded(
            child: _InfoCell(
              label: 'Chênh lệch',
              value: difference == null ? '--' : _formatQty(difference),
              valueColor: _differenceColor(difference),
            ),
          ),
        ],
      ),
    );
  }

  /// Ô nhập số lượng thực tế.
  Widget _buildQuantityField() {
    return TextField(
      controller: _quantityController,
      autofocus: true,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      ],
      onChanged: (value) {
        final quantity = _parseQty(value);
        if (_quantityError == null && quantity == _quantity) return;
        setState(() {
          _quantity = quantity;
          _quantityError = null;
        });
      },
      decoration: formInputDecoration(
        context,
        label: 'Số lượng thực tế',
        icon: Icons.numbers_outlined,
        isRequired: true,
        hasError: _quantityError != null,
        errorText: _quantityError,
      ),
    );
  }

  /// Số lượng kỳ vọng của hệ thống = tồn trong kho + đang mượn + khách mượn.
  ///
  /// Công thức chênh lệch theo API:
  /// `Difference = QuantityActual - (NumberInStore + NumberBorrowing + QuantityExportMuon)`.
  static double _expectedQuantity(InventoryCountSheetItem item) {
    return (item.numberInStore +
            item.numberBorrowing +
            item.quantityExportMuon)
        .toDouble();
  }

  /// Màu chênh lệch: xanh khi khớp, đỏ khi lệch, xám khi chưa nhập.
  static Color? _differenceColor(double? difference) {
    if (difference == null) return null;
    if (difference == 0) return AppColors.stateSuccessColor;
    return AppColors.stateErrorColor;
  }

  /// Ô nhập ghi chú — tự giãn theo nội dung khi nhập.
  Widget _buildNoteField() {
    return TextField(
      controller: _noteController,
      minLines: 1,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: formInputDecoration(
        context,
        label: 'Ghi chú',
        icon: Icons.notes_outlined,
      ),
    );
  }

  /// Hành động: huỷ / lưu kết quả kiểm kê.
  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.gray,
                  side: const BorderSide(color: AppColors.borderColor),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Huỷ'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Lưu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Validate số lượng thực tế rồi trả kết quả về màn gọi API.
  void _handleSave() {
    final quantity = _parseQty(_quantityController.text);

    if (quantity == null || quantity < 0) {
      setState(() => _quantityError = 'Vui lòng nhập số lượng thực tế hợp lệ');
      return;
    }

    Navigator.pop(
      context,
      InventoryCountItemEditResult(
        quantityActual: quantity,
        note: _noteController.text.trim(),
      ),
    );
  }

  /// Parse số lượng từ chuỗi nhập (chấp nhận cả dấu phẩy thập phân).
  static double? _parseQty(String raw) {
    return double.tryParse(raw.trim().replaceAll(',', '.'));
  }

  /// Text hiển thị, `--` nếu rỗng.
  static String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '--' : trimmed;
  }

  /// Format số lượng — bỏ phần thập phân `,00` nếu là số nguyên.
  static String _formatQty(num? value) {
    if (value == null) return '--';
    if (value == value.roundToDouble()) return value.toStringAsFixed(0);
    return value.toStringAsFixed(2);
  }
}

/// Một ô thông tin nhỏ trong dải tồn kho.
class _InfoCell extends StatelessWidget {
  const _InfoCell({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;

  /// Màu hiển thị giá trị (dùng cho ô chênh lệch).
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10.5, color: AppColors.gray),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w800,
            color: valueColor ?? AppColors.enableText,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
