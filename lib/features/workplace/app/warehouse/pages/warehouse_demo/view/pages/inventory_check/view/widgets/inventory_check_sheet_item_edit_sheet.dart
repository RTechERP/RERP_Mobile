import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart';
import 'package:rtc_erp/common/widgets/form/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_difference_chip.dart';

import '../../../../../../../../../../../base/network/errors/extension.dart';

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

/// Cầu nối để màn ngoài điều khiển bottom sheet nhập số lượng ở tab sản
/// phẩm.
///
/// Màn ngoài dùng controller để:
/// - đẩy số lần quét vào sheet (sheet tự tăng số lượng và báo kết quả),
/// - đọc số lượng + ghi chú đang nhập để lưu nháp khi chuyển sang sản phẩm
///   khác.
class InventoryCheckSheetItemEditController {
  /// Bottom sheet đang mở hay không.
  bool get isOpen => _isOpen;
  bool _isOpen = false;

  /// Tăng số lượng thực tế của sản phẩm đang mở.
  void Function()? incrementQuantity;

  /// Đọc số lượng + ghi chú đang nhập (null = chưa nhập gì).
  InventoryCountItemEditResult? Function()? readResult;

  /// Số lần tăng được gửi trước khi sheet mở (áp dụng ngay khi mở).
  int _pendingIncrements = 0;

  /// Mã lần đăng ký hiện tại — dùng để sheet cũ không huỷ đăng ký của sheet mới.
  int _attachmentId = 0;

  /// Màn ngoài gọi để tăng số lượng.
  ///
  /// Nếu sheet chưa mở xong thì ghi nhận lại, áp dụng ngay khi sheet mount.
  void increment() {
    final callback = incrementQuantity;
    if (callback == null) {
      _pendingIncrements++;
      return;
    }
    callback();
  }

  /// Xoá các lần tăng chưa được áp dụng.
  void resetPending() {
    _pendingIncrements = 0;
  }

  /// Huỷ đăng ký của sheet đang đóng và xoá lượt tăng chờ.
  ///
  /// Gọi trước khi mở sheet mới trong chế độ quét nhanh: sheet cũ có thể còn
  /// giữ callback tăng số lượng (đang chạy animation đóng) → nếu không huỷ,
  /// lượt tăng của sản phẩm mới sẽ bị sheet cũ nhận mất và sản phẩm mới mở
  /// ra vẫn là 0.
  void resetAttachment() {
    _isOpen = false;
    incrementQuantity = null;
    readResult = null;
    _pendingIncrements = 0;
  }

  /// Bottom sheet đăng ký callback khi mount.
  ///
  /// Trả về mã lần đăng ký — sheet dùng mã này khi huỷ đăng ký để không xoá
  /// nhầm callback của sheet mới hơn.
  int _attach({
    required void Function() increment,
    required InventoryCountItemEditResult? Function() read,
  }) {
    _isOpen = true;
    _attachmentId++;
    incrementQuantity = increment;
    readResult = read;

    final pending = _pendingIncrements;
    _pendingIncrements = 0;
    final attachmentId = _attachmentId;

    if (pending > 0) {
      // Áp dụng sau frame đầu tiên: `_attach` chạy trong `initState` của sheet,
      // tức đang trong lúc framework build → gọi `increment()` ở đây sẽ
      // `showTopSnackBar` (insert OverlayEntry) và sinh lỗi
      // "setState() or markNeedsBuild() called during build".
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Sheet đã bị thay thế trong lúc chờ frame → bỏ qua lượt tăng này.
        if (attachmentId != _attachmentId) return;

        for (var i = 0; i < pending; i++) {
          increment();
        }
      });
    }

    return _attachmentId;
  }

  /// Bottom sheet huỷ đăng ký callback khi dispose.
  ///
  /// Không xoá [_pendingIncrements] vì lần tăng có thể đã được gửi trước khi
  /// sheet kịp mount — xoá ở here sẽ làm mất lượt quét đó.
  ///
  /// Chỉ huỷ đăng ký khi đây là lần đăng ký mới nhất — trường hợp sheet cũ
  /// dispose sau khi sheet mới đã mount thì không được xoá callback của sheet
  /// mới.
  void _detach(int attachmentId) {
    if (attachmentId != _attachmentId) return;
    _isOpen = false;
    incrementQuantity = null;
    readResult = null;
  }
}

/// Bottom sheet nhập số lượng thực tế và ghi chú cho một dòng sản phẩm trong
/// phiếu kiểm kê.
///
/// Số lượng được điều khiển bởi màn ngoài (xem
/// [InventoryCheckSheetItemEditController]) — màn ngoài là nguồn quét duy nhất
/// nên mỗi lượt quét đúng sản phẩm đang kiểm sẽ tăng số lượng thực tế lên 1.
///
/// Bấm "Lưu" sẽ trả về [InventoryCountItemEditResult] để màn nhập vào nháp
/// (chưa gửi lên server — server chỉ nhận khi bấm "Xác nhận đã kiểm vị trí").
class InventoryCheckSheetItemEditSheet extends StatefulWidget {
  const InventoryCheckSheetItemEditSheet({
    super.key,
    required this.item,
    this.stagedQuantity,
    this.stagedNote,
    this.controller,
    this.onScanned,
  });

  /// Dòng sản phẩm cần cập nhật kết quả kiểm kê.
  final InventoryCountSheetItem item;

  /// Số lượng đã nhập trong nháp (chưa lưu lên server) — hiển thị sẵn.
  final double? stagedQuantity;

  /// Ghi chú đã nhập trong nháp (chưa lưu lên server) — hiển thị sẵn.
  final String? stagedNote;

  /// Cầu nối để màn ngoài điều khiển sheet (tăng số lượng khi quét mã).
  final InventoryCheckSheetItemEditController? controller;

  /// Callback khi quét mã khớp đúng sản phẩm đang kiểm.
  ///
  /// Màn ngoài dùng để đánh dấu dòng "đã quét" (chip + đẩy xuống cuối danh
  /// sách).
  final void Function(String rowKey)? onScanned;

  /// Mở bottom sheet. Trả về kết quả nhập hoặc null nếu người dùng huỷ.
  static Future<InventoryCountItemEditResult?> show(
    BuildContext context,
    InventoryCountSheetItem item, {
    double? stagedQuantity,
    String? stagedNote,
    InventoryCheckSheetItemEditController? controller,
    void Function(String rowKey)? onScanned,
  }) {
    return showModalBottomSheet<InventoryCountItemEditResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InventoryCheckSheetItemEditSheet(
        item: item,
        stagedQuantity: stagedQuantity,
        stagedNote: stagedNote,
        controller: controller,
        onScanned: onScanned,
      ),
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

  /// Số lượng thực tế đang nhập.
  ///
  /// `null` = người dùng chưa nhập/quét gì (ô nhập mới mở, đang ở giá trị 0).
  /// Lần kiểm kê này đếm lại từ đầu nên không cộng dồn vào số liệu cũ của
  /// server — nếu đã có nháp trong phiếu thì lấy giá trị đã nhập để không mất
  /// dữ liệu.
  double? _quantity;

  /// Mã lần đăng ký của sheet này với controller (dùng khi huỷ đăng ký).
  int? _attachmentId;

  /// Chênh lệch giữa số lượng thực tế đang nhập và số lượng kỳ vọng.
  ///
  /// `null` = chưa nhập số lượng → chưa hiển thị chênh lệch (số liệu cũ của
  /// server không còn liên quan vì lần này đếm lại từ 0).
  double? get _difference {
    final quantity = _quantity;
    if (quantity == null) return null;
    return quantity - widget.item.expectedQuantity;
  }

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    // Số lượng thực tế luôn bắt đầu từ 0 — người dùng đang đếm lại số lượng
    // thực tế của sản phẩm này nên không cộng dồn vào số liệu cũ của server.
    // Nếu đã có nháp trong phiếu thì lấy giá trị đã nhập để không mất dữ liệu.
    final staged = widget.stagedQuantity;
    _quantityController = TextEditingController(text: _formatQty(staged ?? 0));
    _noteController = TextEditingController(
      text: widget.stagedNote ?? item.note ?? '',
    );
    _quantity = staged;

    // Màn ngoài điều khiển sheet → đăng ký callback.
    _attachmentId = widget.controller?._attach(
      increment: _incrementQuantity,
      read: _readResult,
    );
  }

  @override
  void dispose() {
    final attachmentId = _attachmentId;
    if (attachmentId != null) {
      widget.controller?._detach(attachmentId);
    }
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

  /// Ô nhập số lượng thực tế dạng: nút `-` | giá trị | nút `+`.
  ///
  /// Nút `+` / `-` hoạt động ở cả 2 chế độ (quét mã / nhập tay) — mỗi lần
  /// bấm tăng hoặc giảm số lượng thực tế đúng 1 đơn vị.
  Widget _buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Số lượng thực tế *',
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _StepButton(
              icon: Icons.remove,
              onPressed: () => _changeQuantity(-1),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _quantityError != null
                        ? Colors.redAccent
                        : AppColors.hintText,
                    width: 1.4,
                  ),
                ),
                child: TextField(
                  controller: _quantityController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.enableText,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
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
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 14,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorText: _quantityError,
                  ),
                ),
              ),
            ),
            _StepButton(icon: Icons.add, onPressed: () => _changeQuantity(1)),
          ],
        ),
      ],
    );
  }

  /// Tăng / giảm số lượng thực tế theo [delta] đơn vị.
  ///
  /// Số lượng luôn tính từ 0 khi chưa có giá trị nào — lần đầu bấm `+` sẽ ra 1.
  void _changeQuantity(int delta) {
    final current = _quantity ?? _parseQty(_quantityController.text) ?? 0;
    final next = current + delta;
    if (next < 0) return;

    setState(() {
      _quantity = next;
      _quantityError = null;
      _quantityController.text = _formatQty(next);
    });
  }

  /// Tăng số lượng thực tế lên 1 đơn vị + cập nhật thông báo kết quả quét.
  ///
  /// Dùng chung cho cả quét bằng phần cứng lẫn quét nhanh từ màn ngoài.
  void _incrementQuantity() {
    if (!mounted) return;

    final next = (_quantity ?? 0) + 1;
    setState(() {
      _quantity = next;
      _quantityError = null;
      _quantityController.text = _formatQty(next);
    });
    context.showMessage(
      'Đã cộng 1 "${widget.item.productCode ?? ''}" — số lượng thực tế: $next',
      type: SnackBarType.success,
    );
  }

  /// Đọc số lượng + ghi chú đang nhập (null = người dùng chưa nhập/quét gì).
  ///
  /// Màn ngoài dùng để lưu nháp sản phẩm đang mở trước khi chuyển sang sản
  /// phẩm khác.
  InventoryCountItemEditResult? _readResult() {
    final quantity = _quantity;
    if (quantity == null) return null;
    return InventoryCountItemEditResult(
      quantityActual: quantity,
      note: _noteController.text.trim(),
    );
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

  /// Validate số lượng thực tế rồi trả kết quả về màn (chỉ lưu giá trị, chưa
  /// gửi lên server).
  ///
  /// Dùng [_quantity] (null khi người dùng chưa nhập/quét gì) để bắt buộc
  /// nhập liệu trước khi lưu — tránh lưu nhầm 0 cho dòng chưa kiểm. Muốn lưu
  /// kết quả 0 thì gõ "0" vào ô nhập.
  void _handleSave() {
    final quantity = _quantity;

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

/// Nút tăng / giảm số lượng thực tế.
class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onPressed});

  /// Icon hiển thị trên nút.
  final IconData icon;

  /// Callback khi bấm nút.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryERP.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 46,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primaryERP.withValues(alpha: 0.4),
            ),
          ),
          child: Icon(icon, size: 22, color: AppColors.primaryERP),
        ),
      ),
    );
  }
}

/// Một ô thông tin nhỏ trong dải tồn kho.
class _InfoCell extends StatelessWidget {
  const _InfoCell({required this.label, required this.value, this.valueColor});

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
