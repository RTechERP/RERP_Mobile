import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_sale_model.dart';
import 'lead_sale_attachments_field.dart';

/// Kết quả nhập trong bottom sheet chuyển PO.
class LeadSaleTransferPoSelection {
  /// Danh sách file PO người dùng chọn.
  final List<PlatformFile> files;

  /// Ghi chú gửi kèm file PO.
  final String note;

  const LeadSaleTransferPoSelection({required this.files, required this.note});
}

/// Bottom sheet chuyển PO cho phiếu lead.
///
/// Hiển thị thông tin khách hàng, người liên hệ, Sale phụ trách, giá trị dự
/// kiến; cho phép chọn file PO (chụp ảnh / chọn ảnh / chọn tệp) và nhập ghi
/// chú. Màn danh sách nhận kết quả để gọi `POST /Lead/customer-po` với
/// `fileType = 2`.
class LeadSaleTransferPoSheet extends StatefulWidget {
  /// Mở bottom sheet chuyển PO.
  ///
  /// Trả về file + ghi chú đã nhập, `null` nếu người dùng huỷ.
  static Future<LeadSaleTransferPoSelection?> show(
    BuildContext context, {
    required LeadSaleItem item,
  }) {
    return showModalBottomSheet<LeadSaleTransferPoSelection>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => LeadSaleTransferPoSheet(item: item),
    );
  }

  /// Phiếu lead cần chuyển PO.
  final LeadSaleItem item;

  const LeadSaleTransferPoSheet({super.key, required this.item});

  @override
  State<LeadSaleTransferPoSheet> createState() =>
      _LeadSaleTransferPoSheetState();
}

class _LeadSaleTransferPoSheetState extends State<LeadSaleTransferPoSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// File PO đã chọn, chưa upload.
  final List<PlatformFile> _files = [];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: Padding(
        // Nới chiều cao sheet khi bàn phím mở để ô nhập không bị che.
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gray.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),
              _buildHeader(),
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLeadInfo(),
                        const SizedBox(height: 18),
                        LeadSaleAttachmentsField(
                          label: 'File PO',
                          pendingFiles: _files,
                          onPickFiles: _onPickFiles,
                          onPreviewPending: (file) =>
                              showPendingFilePreview(context, file),
                          onRemovePending: (file) =>
                              setState(() => _files.remove(file)),
                        ),
                        const SizedBox(height: 18),
                        FormInputField(
                          nameForm: 'lead_transfer_po_note',
                          nameTextField: 'lead_transfer_po_note_field',
                          label: 'Ghi chú',
                          icon: Icons.edit_note,
                          maxLines: 4,
                          autoExpand: true,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLength: 500,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  /// Header: icon + tiêu đề + mã phiếu lead.
  Widget _buildHeader() {
    final code = (widget.item.leadCode ?? '').trim();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.request_quote_outlined,
              size: 20,
              color: _accentColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chuyển PO',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  code.isEmpty ? 'Đẩy file PO cho phiếu lead' : 'Lead: $code',
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
          ),
        ],
      ),
    );
  }

  /// Thông tin phiếu lead: khách hàng, người liên hệ, Sale, giá trị dự kiến.
  Widget _buildLeadInfo() {
    final item = widget.item;
    final contact = [
      _orEmpty(item.contactName),
      _orEmpty(item.contactPhone),
    ].where((e) => e.isNotEmpty).join(' - ');

    return FormLeftBorderCard(
      icon: Icons.assignment_outlined,
      iconColor: _accentColor,
      borderColor: _accentColor,
      backgroundColor: _accentColor.withValues(alpha: 0.08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            label: 'Khách hàng / Công ty',
            value: _orEmpty(item.companyName ?? item.customerName),
          ),
          _InfoRow(label: 'Người liên hệ - SĐT', value: contact),
          _InfoRow(
            label: 'Sale phụ trách',
            value: _orEmpty(item.saleEmployeeName),
          ),
          _InfoRow(
            label: 'Giá trị dự kiến',
            value: _formatMoney(item.estimatedValue),
            isLast: true,
          ),
        ],
      ),
    );
  }

  /// Footer: nút huỷ bỏ + xác nhận chuyển PO.
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderColor, width: 0.6),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1.2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Huỷ bỏ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.enableText,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _accentColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _onConfirm,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload_file, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Chuyển PO',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Thêm file PO vừa chọn, bỏ qua file trùng tên.
  void _onPickFiles(List<PlatformFile> picked) {
    final names = _files.map((f) => f.name).toSet();
    setState(() {
      _files.addAll(picked.where((f) => !names.contains(f.name)));
    });
  }

  /// Xác nhận — bắt buộc có ít nhất 1 file PO.
  void _onConfirm() {
    final state = _formKey.currentState;
    if (!(state?.saveAndValidate() ?? false)) return;

    if (_files.isEmpty) {
      context.showMessage(
        'Vui lòng chọn file PO cần đẩy lên',
        type: SnackBarType.info,
      );
      return;
    }

    final note = state!.value['lead_transfer_po_note']?.toString() ?? '';
    Navigator.of(context).pop(
      LeadSaleTransferPoSelection(files: List.of(_files), note: note.trim()),
    );
  }

  /// Màu nhận diện thao tác chuyển PO.
  static const Color _accentColor = Color(0xFF3949AB);

  String _orEmpty(String? value) => (value ?? '').trim();

  /// Định dạng giá trị tiền.
  String _formatMoney(double? value) {
    if (value == null) return '';
    final formatter = NumberFormat('#,##0', 'vi_VN');
    return '${formatter.format(value)} đ';
  }
}

/// Một dòng thông tin: nhãn ở trên, giá trị ở dưới.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.body2.copyWith(
              fontSize: 11.5,
              color: AppColors.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value.isEmpty ? '-' : value,
            style: AppStyles.body2.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.neutralText,
            ),
          ),
        ],
      ),
    );
  }
}
