// Tab "TT Quyết toán" trong BookingGuestHouseDetailScreen.
//
// Theo yêu cầu:
// - Field duy nhất có icon tròn tích xanh/chấm than là
//   [BookingGuestHouseStatusIndicator] (dùng cờ IsApprovedTBP — cùng tiêu
//   chí với Phiếu đăng ký).
// - Khi phiếu CHƯA được TBP duyệt (chấm than) → tất cả field UI dưới đây
//   disable màu xám, không cho thao tác (đặc biệt 2 file picker hoá đơn /
//   bill CK).
// - Khi đã duyệt → tất cả field enable bình thường, user có thể nhập liệu
//   & đẩy file.
// - Lý do (required) được fill sẵn nội dung
//   `"Thanh toán tiền nhà nghỉ từ startDate đến endDate"` dựa trên
//   startDate/endDate của phiếu.

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';
import 'booking_guest_house_status_indicator.dart';

/// Tab TT Quyết toán — Phiếu đăng ký đã được TBP duyệt thì cho nhập,
/// chưa duyệt thì toàn bộ field disable màu xám.
class BookingGuestHouseSettlementTab extends StatefulWidget {
  const BookingGuestHouseSettlementTab({
    super.key,
    required this.detail,
  });

  final BookingGuestHouseDetailData detail;

  @override
  State<BookingGuestHouseSettlementTab> createState() =>
      _BookingGuestHouseSettlementTabState();
}

class _BookingGuestHouseSettlementTabState
    extends State<BookingGuestHouseSettlementTab> {
  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  /// Đã được TBP duyệt thì cho nhập; ngược lại disable toàn bộ form.
  bool get _canEdit => widget.detail.info.isApprovedTBP == true;

  BookingGuestHouseApprovalStatus get _status =>
      bookingGuestHouseApprovalStatusFromBool(
        widget.detail.info.isApprovedTBP,
      );

  //---(Text controllers — đặt trước build để FormInputField nhận external
  //---controller làm source-of-truth; FormInputField tự sync xuống field.)---//
  late final TextEditingController _reasonCtrl;
  late final TextEditingController _recipientCtrl;
  late final TextEditingController _hotelCtrl;
  late final TextEditingController _tbpCtrl;
  late final TextEditingController _invoiceCtrl;
  late final TextEditingController _bankNameCtrl;
  late final TextEditingController _bankAccountCtrl;
  late final TextEditingController _totalAmountCtrl;
  late final TextEditingController _totalWithInvoiceCtrl;
  late final TextEditingController _noteCtrl;

  /// File hoá đơn + Bill CK (chỉ chọn được khi [_canEdit]).
  List<PlatformFile> _invoiceFiles = const [];
  List<PlatformFile> _billCkFiles = const [];

  @override
  void initState() {
    super.initState();
    _reasonCtrl = TextEditingController(text: _defaultReasonText());
    _recipientCtrl = TextEditingController();
    _hotelCtrl = TextEditingController();
    // Field "TBP duyệt" trên tab Quyết toán: Khi phiếu đã được TBP duyệt
    // (isApprovedTBP == true) → tự lookup tên TBP từ
    // [BookingGuestHouseBloc.state.employees] theo `info.approvedTBP`
    // (employeeId) để fill sẵn, không cho user chọn lại. Khi chưa duyệt →
    // giữ rỗng. Controller được fill qua [BlocListener] dưới đây (listen
    // employees) để chắc chắn chạy sau khi state.employees đã có data từ
    // list screen.
    _tbpCtrl = TextEditingController();
    _invoiceCtrl = TextEditingController();
    _bankNameCtrl = TextEditingController();
    _bankAccountCtrl = TextEditingController();
    _totalAmountCtrl = TextEditingController();
    _totalWithInvoiceCtrl = TextEditingController();
    _noteCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _reasonCtrl.dispose();
    _recipientCtrl.dispose();
    _hotelCtrl.dispose();
    _tbpCtrl.dispose();
    _invoiceCtrl.dispose();
    _bankNameCtrl.dispose();
    _bankAccountCtrl.dispose();
    _totalAmountCtrl.dispose();
    _totalWithInvoiceCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  /// Lý do quyết toán fill sẵn:
  /// `"Thanh toán tiền nhà nghỉ từ startDate đến endDate"`.
  /// Nếu cả startDate/endDate đều null thì fallback về chuỗi rỗng.
  String _defaultReasonText() {
    final s = widget.detail.info.startDate;
    final e = widget.detail.info.endDate;
    if (s == null && e == null) return '';
    final sText = s == null ? '...' : _dateFmt.format(s);
    final eText = e == null ? '...' : _dateFmt.format(e);
    return 'Thanh toán tiền nhà nghỉ từ $sText đến $eText';
  }

  /// Map `approvedTBP` (employeeId) → tên nhân viên từ
  /// `BookingGuestHouseState.employees` (đã load qua `loadFilters`).
  /// Trả về `null` nếu id null hoặc không tìm thấy / name rỗng.
  String? _resolveTbpName(
    int? id,
    List<EmployeeFilterItem> employees,
  ) {
    if (id == null) return null;
    for (final e in employees) {
      if (e.id == id) {
        final name = (e.fullName ?? '').trim();
        return name.isEmpty ? null : name;
      }
    }
    return null;
  }

  //---(File pickers — chỉ enable khi đã duyệt TBP)---//

  Future<void> _pickInvoiceFiles() async {
    if (!_canEdit) return;
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty && mounted) {
      setState(() => _invoiceFiles = result.files);
    }
  }

  Future<void> _pickBillCkFiles() async {
    if (!_canEdit) return;
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty && mounted) {
      setState(() => _billCkFiles = result.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingGuestHouseStatusIndicator(status: _status),
          const SizedBox(height: 14),

          FormCard(
            title: 'Thông tin quyết toán',
            child: FormBuilder(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormInputField(
                    nameForm: 'payment_reason',
                    nameTextField: 'payment_reason_text',
                    label: 'Lý do',
                    icon: Icons.help_outline,
                    controller: _reasonCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    autoExpand: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập lý do'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_recipient',
                    nameTextField: 'payment_recipient_text',
                    label: 'Người nhận tiền',
                    icon: Icons.person_outline,
                    controller: _recipientCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập người nhận tiền'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_hotel',
                    nameTextField: 'payment_hotel_text',
                    label: 'Tên khách sạn/nhà nghỉ',
                    icon: Icons.hotel_outlined,
                    controller: _hotelCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập tên khách sạn/nhà nghỉ'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  // Field "TBP duyệt" trên tab Quyết toán — tự fill tên TBP
                  // từ bloc state.employees (lookup theo info.approvedTBP)
                  // khi phiếu đã được TBP duyệt. Wrap BlocBuilder để
                  // rebuild khi employees có data (load từ list screen).
                  BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                    buildWhen: (prev, curr) =>
                        prev.employees != curr.employees,
                    builder: (context, state) {
                      if (widget.detail.info.isApprovedTBP == true &&
                          _tbpCtrl.text.isEmpty) {
                        final name = _resolveTbpName(
                          widget.detail.info.approvedTBP,
                          state.employees,
                        );
                        if (name != null) _tbpCtrl.text = name;
                      }
                      return FormInputField(
                        nameForm: 'payment_tbp',
                        nameTextField: 'payment_tbp_text',
                        label: 'TBP duyệt',
                        icon: Icons.verified_user_outlined,
                        controller: _tbpCtrl,
                        enabled: _canEdit,
                        readOnly: !_canEdit,
                        isRequired: true,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng nhập TBP duyệt'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_invoice_number',
                    nameTextField: 'payment_invoice_number_text',
                    label: 'Số hoá đơn',
                    icon: Icons.receipt_long_outlined,
                    controller: _invoiceCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập số hoá đơn'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_bank_account',
                    nameTextField: 'payment_bank_account_text',
                    label: 'Số tài khoản',
                    icon: Icons.account_balance_outlined,
                    controller: _bankAccountCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập số tài khoản'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_bank_name',
                    nameTextField: 'payment_bank_name_text',
                    label: 'Ngân hàng',
                    icon: Icons.account_balance,
                    controller: _bankNameCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập ngân hàng'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_total',
                    nameTextField: 'payment_total_text',
                    label: 'Tổng tiền',
                    icon: Icons.payments_outlined,
                    controller: _totalAmountCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập tổng tiền'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_total_with_invoice',
                    nameTextField: 'payment_total_with_invoice_text',
                    label: 'Tổng tiền có HĐ',
                    icon: Icons.receipt_outlined,
                    controller: _totalWithInvoiceCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập tổng tiền có HĐ'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  FormInputField(
                    nameForm: 'payment_note',
                    nameTextField: 'payment_note_text',
                    label: 'Ghi chú QT',
                    icon: Icons.note_outlined,
                    controller: _noteCtrl,
                    enabled: _canEdit,
                    readOnly: !_canEdit,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    autoExpand: true,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // File hoá đơn + File bill CK — disable khi chưa duyệt.
          FormCard(
            title: 'Tài liệu đính kèm',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FilePickerTile(
                  icon: Icons.description_outlined,
                  label: 'File hoá đơn',
                  files: _invoiceFiles,
                  enabled: _canEdit,
                  onPick: _pickInvoiceFiles,
                  existingCount: 0,
                ),
                const SizedBox(height: 12),
                _FilePickerTile(
                  icon: Icons.receipt_outlined,
                  label: 'File bill CK',
                  files: _billCkFiles,
                  enabled: _canEdit,
                  onPick: _pickBillCkFiles,
                  existingCount: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//---(File picker tile)---//

class _FilePickerTile extends StatelessWidget {
  const _FilePickerTile({
    required this.icon,
    required this.label,
    required this.files,
    required this.enabled,
    required this.onPick,
    required this.existingCount,
  });

  final IconData icon;
  final String label;
  final List<PlatformFile> files;
  final bool enabled;
  final VoidCallback onPick;
  final int existingCount;

  @override
  Widget build(BuildContext context) {
    final hasNewFiles = files.isNotEmpty;
    final hasExisting = existingCount > 0;
    final summary = hasNewFiles
        ? '${files.length} file mới'
        : hasExisting
            ? '$existingCount file đã có'
            : 'Chưa có file';

    return Opacity(
      opacity: enabled ? 1 : 0.6,
      child: InkWell(
        onTap: enabled ? onPick : null,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: enabled
                ? const Color(0xFFF8FAFD)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: enabled
                  ? const Color(0xFFE5EAF3)
                  : Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: enabled
                      ? AppColors.primaryERP.withValues(alpha: 0.12)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: enabled
                      ? AppColors.primaryERP
                      : Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: enabled
                            ? AppColors.heading
                            : Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary,
                      style: TextStyle(
                        fontSize: 12,
                        color: enabled
                            ? AppColors.gray
                            : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: enabled ? onPick : null,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: enabled
                        ? AppColors.primaryERP.withValues(alpha: 0.10)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Icon(
                    Icons.upload_file_outlined,
                    size: 16,
                    color: enabled
                        ? AppColors.primaryERP
                        : Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}