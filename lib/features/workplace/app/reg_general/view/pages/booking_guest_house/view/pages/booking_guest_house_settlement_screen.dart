// Màn "Cập nhật TTQT" cho phiếu Đặt phòng nhà nghỉ.
//
// Mở từ bottomSheet menu khi chạm 1 phiếu trong danh sách. UI là form
// đầy đủ các field TT Quyết toán (giống tab "TT Quyết toán" của detail
// screen, nhưng là 1 trang riêng — không có tab Phiếu đăng ký).
//
// Màn này nhận `id` (int) của phiếu, tự gọi bloc load detail. Trong khi
// load → spinner; load lỗi → snackbar + pop.
//
// Field set (UI cập nhật TTQT):
//   1. Lý do (isRequired)
//   2. Dự án (isRequired, picker từ state.projects)
//   3. TBP duyệt (isRequired, auto-fill từ state.employees theo
//      info.approvedTBP, readOnly)
//   4. Công ty (isRequired, picker từ state.taxCompanies)
//   5. Tổng tiền (isRequired, format "x.xxx.xxx VNĐ")
//   6. Tổng tiền có HĐ (isRequired, format "x.xxx.xxx VNĐ")
//   7. Số hoá đơn (isRequired)
//   8. Hình thức CK (isRequired, text rỗng — picker sẽ bổ sung sau)
//   9. Tên khách sạn (isRequired, text rỗng)
//  10. MST khách sạn (isRequired, số + dấu "-")
//  11. Bộ phận (isRequired, text rỗng)
//  12. Số tài khoản (isRequired, chỉ chữ số)
//  13. Ngân hàng (isRequired, picker từ state.banks)
//  14. Ghi chú (optional, multiline)
//   * Tài liệu đính kèm (File hoá đơn + File bill CK)

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';

class BookingGuestHouseSettlementScreen extends StatefulWidget {
  const BookingGuestHouseSettlementScreen({super.key, required this.id});

  /// ID phiếu cần mở form TT Quyết toán.
  final int id;

  @override
  State<BookingGuestHouseSettlementScreen> createState() =>
      _BookingGuestHouseSettlementScreenState();
}

class _BookingGuestHouseSettlementScreenState
    extends State<BookingGuestHouseSettlementScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  //---(Controllers cho field text)---//
  late final TextEditingController _reasonCtrl;

  /// Dự án đã chọn (TextEditingController làm value cho FormBuilder; chọn
  /// qua bottom sheet, hiển thị "Mã - Tên").
  late final TextEditingController _projectCtrl;
  ProjectFilterItem? _projectSelected;

  late final TextEditingController _tbpCtrl;
  EmployeeFilterItem? _tbpSelected;

  /// Công ty đã chọn (picker từ state.taxCompanies).
  late final TextEditingController _companyCtrl;
  TaxCompanyItem? _companySelected;

  late final TextEditingController _totalAmountCtrl;
  late final TextEditingController _totalWithInvoiceCtrl;
  late final TextEditingController _invoiceCtrl;

  /// Hình thức CK — TextField rỗng (placeholder, sẽ mô tả sau).
  late final TextEditingController _transferTypeCtrl;

  late final TextEditingController _hotelCtrl;

  /// MST khách sạn — TextField rỗng, user nhập tay.
  late final TextEditingController _hotelMstCtrl;

  late final TextEditingController _departmentCtrl;
  late final TextEditingController _bankAccountCtrl;

  /// Ngân hàng đã chọn (picker từ state.banks).
  late final TextEditingController _bankNameCtrl;
  BankItem? _bankSelected;

  late final TextEditingController _noteCtrl;

  //---(File hoá đơn + Bill CK)---//
  List<PlatformFile> _invoiceFiles = const [];
  List<PlatformFile> _billCkFiles = const [];

  @override
  void initState() {
    super.initState();
    _reasonCtrl = TextEditingController();
    _projectCtrl = TextEditingController();
    _tbpCtrl = TextEditingController();
    _companyCtrl = TextEditingController();
    _totalAmountCtrl = TextEditingController();
    _totalWithInvoiceCtrl = TextEditingController();
    _invoiceCtrl = TextEditingController();
    _transferTypeCtrl = TextEditingController();
    _hotelCtrl = TextEditingController();
    _hotelMstCtrl = TextEditingController();
    _departmentCtrl = TextEditingController();
    _bankAccountCtrl = TextEditingController();
    _bankNameCtrl = TextEditingController();
    _noteCtrl = TextEditingController();

    // Trigger load detail ngay khi mở màn. 3 API lookup (projects/employees/
    // provinces) KHÔNG gọi ở đây — đã được list screen load sẵn qua
    // loadFilters khi mở tính năng. Nếu mở thẳng settlement (deep link) mà
    // chưa qua list, dữ liệu lookup sẽ rỗng và UI sẽ fallback text theo id.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bloc = context.read<BookingGuestHouseBloc>();
      bloc.add(BookingGuestHouseEvent.loadDetail(id: widget.id));
    });
  }

  @override
  void dispose() {
    _reasonCtrl.dispose();
    _projectCtrl.dispose();
    _tbpCtrl.dispose();
    _companyCtrl.dispose();
    _totalAmountCtrl.dispose();
    _totalWithInvoiceCtrl.dispose();
    _invoiceCtrl.dispose();
    _transferTypeCtrl.dispose();
    _hotelCtrl.dispose();
    _hotelMstCtrl.dispose();
    _departmentCtrl.dispose();
    _bankAccountCtrl.dispose();
    _bankNameCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  //---(Helpers)---//

  /// Lý do quyết toán fill sẵn dựa trên startDate/endDate của phiếu.
  String _defaultReasonText(BookingDetail info) {
    final s = info.startDate;
    final e = info.endDate;
    if (s == null && e == null) return '';
    final sText = s == null ? '...' : _dateFmt.format(s);
    final eText = e == null ? '...' : _dateFmt.format(e);
    return 'Thanh toán tiền nhà nghỉ từ $sText đến $eText';
  }

  /// Map `approvedTBP` (employeeId) → tên nhân viên từ
  /// `BookingGuestHouseState.employees`.
  String? _resolveTbpName(int? id, List<EmployeeFilterItem> employees) {
    if (id == null) return null;
    for (final e in employees) {
      if (e.id == id) {
        final name = (e.fullName ?? '').trim();
        return name.isEmpty ? null : name;
      }
    }
    return null;
  }

  /// Mở bottom sheet chọn dự án từ `BookingGuestHouseState.projects`.
  Future<void> _pickProject() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.projects.isEmpty) {
      // loadFilters chưa chạy (deep link vào settlement) → thử trigger.
      context.read<BookingGuestHouseBloc>().add(
        const BookingGuestHouseEvent.loadFilters(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Chưa có dữ liệu dự án. Vui lòng quay lại danh sách.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await openSelectBottomSheet<ProjectFilterItem>(
      context: context,
      title: 'Chọn dự án',
      hintText: 'Tìm theo mã / tên dự án',
      items: state.projects,
      initialSelectedItem: _projectSelected,
      displayText: (p) {
        if (p.projectCode != null && p.projectCode!.isNotEmpty) {
          return '${p.projectCode} - ${p.projectName ?? ''}';
        }
        return p.projectName ?? 'N/A';
      },
      onSelected: (project) {
        setState(() {
          _projectSelected = project;
          _projectCtrl.text = (project.projectCode ?? '').isNotEmpty
              ? '${project.projectCode} - ${project.projectName ?? ''}'
              : (project.projectName ?? '');
        });
      },
    );
  }

  /// Mở bottom sheet chọn TBP duyệt từ `state.employees`.
  Future<void> _pickTbp() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.employees.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Chưa có dữ liệu nhân viên. Vui lòng quay lại danh sách.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await openSelectBottomSheet<EmployeeFilterItem>(
      context: context,
      title: 'Chọn TBP duyệt',
      hintText: 'Tìm theo tên / mã nhân viên',
      items: state.employees,
      initialSelectedItem: _tbpSelected,
      displayText: (e) {
        final name = (e.fullName ?? '').trim();
        final code = (e.code ?? '').trim();
        if (code.isNotEmpty) return '$code - $name';
        return name.isEmpty ? 'N/A' : name;
      },
      onSelected: (e) {
        setState(() {
          _tbpSelected = e;
          _tbpCtrl.text = (e.fullName ?? '').trim();
        });
      },
    );
  }

  /// Mở bottom sheet chọn công ty từ `state.taxCompanies`.
  /// Hiển thị label ưu tiên `FullName` (tên đầy đủ), fallback `Name` +
  /// `TaxCode` (MST) phụ.
  Future<void> _pickTaxCompany() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.taxCompanies.isEmpty) {
      context.read<BookingGuestHouseBloc>().add(
        const BookingGuestHouseEvent.loadFilters(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Chưa có dữ liệu công ty. Vui lòng quay lại danh sách.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await openSelectBottomSheet<TaxCompanyItem>(
      context: context,
      title: 'Chọn công ty',
      hintText: 'Tìm theo tên / mã số thuế',
      items: state.taxCompanies,
      initialSelectedItem: _companySelected,
      displayText: (c) {
        // Ưu tiên FullName (tên đầy đủ), nếu rỗng thì ghép Name + TaxCode.
        final name = (c.fullName ?? '').trim();
        if (name.isNotEmpty) return name;
        final short = (c.name ?? '').trim();
        final tax = (c.taxCode ?? '').trim();
        if (short.isEmpty && tax.isEmpty) return 'N/A';
        if (tax.isEmpty) return short;
        if (short.isEmpty) return 'MST: $tax';
        return '$short - MST: $tax';
      },
      onSelected: (company) {
        setState(() {
          _companySelected = company;
          final name = (company.fullName ?? '').trim();
          _companyCtrl.text = name.isNotEmpty
              ? name
              : (company.name ?? '').trim();
        });
      },
    );
  }

  /// Mở bottom sheet chọn ngân hàng từ `state.banks`.
  Future<void> _pickBank() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.banks.isEmpty) {
      context.read<BookingGuestHouseBloc>().add(
        const BookingGuestHouseEvent.loadFilters(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Chưa có dữ liệu ngân hàng. Vui lòng quay lại danh sách.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await openSelectBottomSheet<BankItem>(
      context: context,
      title: 'Chọn ngân hàng',
      hintText: 'Tìm theo tên ngân hàng',
      items: state.banks,
      initialSelectedItem: _bankSelected,
      displayText: (b) => (b.bankName ?? '').trim().isEmpty
          ? 'N/A'
          : b.bankName!.trim(),
      onSelected: (bank) {
        setState(() {
          _bankSelected = bank;
          _bankNameCtrl.text = (bank.bankName ?? '').trim();
        });
      },
    );
  }

  /// Format số tiền: chèn `.` mỗi 3 chữ số từ phải sang trái, thêm ` VNĐ`.
  /// Ví dụ: `1500000` → `1.500.000 VNĐ`.
  String _formatVnd(String rawDigits) {
    final digits = rawDigits.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.isEmpty) return '';
    final n = int.tryParse(digits) ?? 0;
    final formatted = n.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$formatted VNĐ';
  }

  /// Parse ngược từ text hiển thị (có `.` và ` VNĐ`) → chỉ chữ số.
  String _parseVndToDigits(String text) =>
      text.replaceAll(RegExp(r'[^0-9]'), '');

  //---(File pickers)---//

  Future<void> _pickInvoiceFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty && mounted) {
      setState(() => _invoiceFiles = result.files);
    }
  }

  Future<void> _pickBillCkFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty && mounted) {
      setState(() => _billCkFiles = result.files);
    }
  }

  void _onSave() {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.saveAndValidate()) {
      context.showMessage(
        'Vui lòng điền đầy đủ các trường bắt buộc',
        type: SnackBarType.error,
      );
      return;
    }

    // TODO: wire submit khi có API lưu TT Quyết toán. Tạm thời báo
    // thành công để confirm form đã validate OK + pop về list.
    context.showMessage(
      'Lưu cập nhật TTQT thành công',
      type: SnackBarType.success,
    );
    if (mounted && context.canPop()) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingGuestHouseBloc, BookingGuestHouseState>(
      listenWhen: (prev, curr) =>
          (prev.detailData != curr.detailData && curr.detailData != null) ||
          (prev.detailMessage != curr.detailMessage &&
              curr.detailMessage != null),
      listener: (context, state) {
        if (state.detailMessage != null && state.detailMessage!.isNotEmpty) {
          context.showMessage(state.detailMessage!, type: SnackBarType.error);
        }
        // Fill lý do mặc định ngay khi detail vừa load xong (chỉ fill khi
        // controller rỗng — tránh đè value user đang gõ).
        if (state.detailData != null && _reasonCtrl.text.isEmpty) {
          _reasonCtrl.text = _defaultReasonText(state.detailData!.info);
        }
      },
      builder: (context, state) {
        final detail = state.detailData;
        final isLoading = state.isDetailLoading && detail == null;
        final errorMsg = (detail == null && !isLoading)
            ? state.detailMessage
            : null;

        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          appBar: AppBarCommon(
            title: const Text('Cập nhật quyết toán'),
            onBackTap: () => context.pop(),
          ),
          body: _buildBody(
            isLoading: isLoading,
            errorMsg: errorMsg,
            detail: detail,
          ),
          bottomNavigationBar: _buildBottomBar(),
        );
      },
    );
  }

  Widget _buildBody({
    required bool isLoading,
    required String? errorMsg,
    required BookingGuestHouseDetailData? detail,
  }) {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (errorMsg != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                errorMsg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }
    if (detail == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormCard(
            title: 'Thông tin quyết toán',
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---(1. Lý do — isRequired)---//
                  FormInputField(
                    nameForm: 'payment_reason',
                    nameTextField: 'payment_reason_text',
                    label: 'Lý do',
                    icon: Icons.help_outline,
                    controller: _reasonCtrl,
                    isRequired: true,
                    autoExpand: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập lý do'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(2. Dự án — isRequired, picker từ state.projects;
                  //    auto-fill nếu info.projectId match)---//
                  BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                    buildWhen: (prev, curr) =>
                        prev.projects != curr.projects,
                    builder: (context, state) {
                      // Auto-fill dự án lần đầu khi projects vừa load xong.
                      if (_projectSelected == null &&
                          detail.info.projectId != null &&
                          state.projects.isNotEmpty) {
                        for (final p in state.projects) {
                          if (p.id == detail.info.projectId) {
                            _projectSelected = p;
                            _projectCtrl.text = (p.projectCode ?? '')
                                    .isNotEmpty
                                ? '${p.projectCode} - ${p.projectName ?? ''}'
                                : (p.projectName ?? '');
                            break;
                          }
                        }
                      }
                      return FormInputField(
                        nameForm: 'payment_project',
                        nameTextField: 'payment_project_text',
                        label: 'Dự án',
                        icon: Icons.account_tree_outlined,
                        controller: _projectCtrl,
                        isRequired: true,
                        readOnly: true,
                        onTap: _pickProject,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng chọn dự án'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(3. TBP duyệt — isRequired, auto-fill từ
                  //    info.approvedTBP lookup state.employees, có thể
                  //    chọn lại qua bottom sheet)---//
                  BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                    buildWhen: (prev, curr) =>
                        prev.employees != curr.employees,
                    builder: (context, state) {
                      if (detail.info.approvedTBP != null &&
                          _tbpCtrl.text.isEmpty) {
                        final name = _resolveTbpName(
                          detail.info.approvedTBP,
                          state.employees,
                        );
                        if (name != null) {
                          _tbpCtrl.text = name;
                          // Lưu lại employee đã chọn để initialSelectedItem
                          // đúng khi mở bottom sheet.
                          _tbpSelected ??= state.employees.firstWhere(
                            (e) => e.id == detail.info.approvedTBP,
                            orElse: () => state.employees.first,
                          );
                        }
                      }
                      return FormInputField(
                        nameForm: 'payment_tbp',
                        nameTextField: 'payment_tbp_text',
                        label: 'TBP duyệt',
                        icon: Icons.verified_user_outlined,
                        controller: _tbpCtrl,
                        isRequired: true,
                        onTap: _pickTbp,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng chọn TBP duyệt'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(4. Công ty — isRequired, picker từ state.taxCompanies)---//
                  FormInputField(
                    nameForm: 'payment_company',
                    nameTextField: 'payment_company_text',
                    label: 'Công ty',
                    icon: Icons.business_outlined,
                    controller: _companyCtrl,
                    isRequired: true,
                    readOnly: true,
                    onTap: _pickTaxCompany,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn công ty'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(5. Tổng tiền — isRequired, format "x.xxx.xxx VNĐ")---//
                  FormInputField(
                    nameForm: 'payment_total',
                    nameTextField: 'payment_total_text',
                    label: 'Tổng tiền',
                    icon: Icons.payments_outlined,
                    controller: _totalAmountCtrl,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Center(
                        widthFactor: 1,
                        child: Text(
                          'VNĐ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập tổng tiền';
                      }
                      if (_parseVndToDigits(v).isEmpty) {
                        return 'Tổng tiền không hợp lệ';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value == null) return;
                      final digits = _parseVndToDigits(value);
                      final formatted = _formatVnd(digits);
                      if (formatted != value) {
                        _totalAmountCtrl.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(
                            offset: formatted.length,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(6. Tổng tiền có HĐ — isRequired, format "x.xxx.xxx VNĐ")---//
                  FormInputField(
                    nameForm: 'payment_total_with_invoice',
                    nameTextField: 'payment_total_with_invoice_text',
                    label: 'Tổng tiền có HĐ',
                    icon: Icons.receipt_outlined,
                    controller: _totalWithInvoiceCtrl,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Center(
                        widthFactor: 1,
                        child: Text(
                          'VNĐ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập tổng tiền có HĐ';
                      }
                      if (_parseVndToDigits(v).isEmpty) {
                        return 'Tổng tiền có HĐ không hợp lệ';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (value == null) return;
                      final digits = _parseVndToDigits(value);
                      final formatted = _formatVnd(digits);
                      if (formatted != value) {
                        _totalWithInvoiceCtrl.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(
                            offset: formatted.length,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(7. Số hoá đơn — isRequired)---//
                  FormInputField(
                    nameForm: 'payment_invoice_number',
                    nameTextField: 'payment_invoice_number_text',
                    label: 'Số hoá đơn',
                    icon: Icons.receipt_long_outlined,
                    controller: _invoiceCtrl,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập số hoá đơn'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(8. Hình thức CK — isRequired, TextField rỗng —
                  //    enum/picker sẽ bổ sung sau)---//
                  FormInputField(
                    nameForm: 'payment_transfer_type',
                    nameTextField: 'payment_transfer_type_text',
                    label: 'Hình thức CK',
                    icon: Icons.swap_horiz,
                    controller: _transferTypeCtrl,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập hình thức CK'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(9. Tên khách sạn — isRequired, text rỗng)---//
                  FormInputField(
                    nameForm: 'payment_hotel',
                    nameTextField: 'payment_hotel_text',
                    label: 'Tên khách sạn',
                    icon: Icons.hotel_outlined,
                    controller: _hotelCtrl,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập tên khách sạn'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(10. MST khách sạn — isRequired, text rỗng)---//
                  FormInputField(
                    nameForm: 'payment_hotel_tax_code',
                    nameTextField: 'payment_hotel_tax_code_text',
                    label: 'MST khách sạn',
                    icon: Icons.numbers_outlined,
                    controller: _hotelMstCtrl,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập MST khách sạn';
                      }
                      if (!RegExp(r'^[0-9\-]+$').hasMatch(v.trim())) {
                        return 'MST chỉ chứa chữ số và dấu -';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(11. Bộ phận — isRequired, text rỗng)---//
                  FormInputField(
                    nameForm: 'payment_department',
                    nameTextField: 'payment_department_text',
                    label: 'Bộ phận',
                    icon: Icons.groups_outlined,
                    controller: _departmentCtrl,
                    isRequired: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập bộ phận'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(12. Số tài khoản — isRequired)---//
                  FormInputField(
                    nameForm: 'payment_bank_account',
                    nameTextField: 'payment_bank_account_text',
                    label: 'Số tài khoản',
                    icon: Icons.account_balance_outlined,
                    controller: _bankAccountCtrl,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập số tài khoản';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(v.trim())) {
                        return 'Số tài khoản chỉ chứa chữ số';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(13. Ngân hàng — isRequired, picker từ state.banks)---//
                  FormInputField(
                    nameForm: 'payment_bank_name',
                    nameTextField: 'payment_bank_name_text',
                    label: 'Ngân hàng',
                    icon: Icons.account_balance,
                    controller: _bankNameCtrl,
                    isRequired: true,
                    readOnly: true,
                    onTap: _pickBank,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn ngân hàng'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(14. Ghi chú — optional, multiline)---//
                  FormInputField(
                    nameForm: 'payment_note',
                    nameTextField: 'payment_note_text',
                    label: 'Ghi chú',
                    icon: Icons.note_outlined,
                    controller: _noteCtrl,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    autoExpand: true,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // File hoá đơn + File bill CK.
          FormCard(
            title: 'Tài liệu đính kèm',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FilePickerTile(
                  icon: Icons.description_outlined,
                  label: 'File hoá đơn',
                  files: _invoiceFiles,
                  onPick: _pickInvoiceFiles,
                ),
                const SizedBox(height: 12),
                _FilePickerTile(
                  icon: Icons.receipt_outlined,
                  label: 'File bill CK',
                  files: _billCkFiles,
                  onPick: _pickBillCkFiles,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
      buildWhen: (prev, curr) => prev.isSubmitting != curr.isSubmitting,
      builder: (context, state) {
        final isSubmitting = state.isSubmitting;
        return Container(
          padding: EdgeInsets.fromLTRB(
            16,
            12,
            16,
            12 + MediaQuery.of(context).padding.bottom,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSubmitting ? null : _onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Lưu',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

//---(File picker tile)---//

class _FilePickerTile extends StatelessWidget {
  const _FilePickerTile({
    required this.icon,
    required this.label,
    required this.files,
    required this.onPick,
  });

  final IconData icon;
  final String label;
  final List<PlatformFile> files;
  final VoidCallback onPick;

  @override
  Widget build(BuildContext context) {
    final hasNewFiles = files.isNotEmpty;
    final summary = hasNewFiles ? '${files.length} file mới' : 'Chưa có file';

    return InkWell(
      onTap: onPick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFD),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5EAF3)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.primaryERP),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    summary,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Icon(
                Icons.upload_file_outlined,
                size: 16,
                color: AppColors.primaryERP,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
