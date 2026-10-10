// Màn "Đề nghị tạm ứng" cho phiếu Đặt phòng nhà nghỉ.
//
// Mở từ bottomSheet menu khi chạm 1 phiếu trong danh sách. UI form
// theo yêu cầu bổ sung — tách riêng với "Cập nhật TTQT" (UI cũ, còn
// bill/file đính kèm). Màn này chỉ gồm 10 field TT tạm ứng, không có
// file đính kèm.
//
// Màn này nhận `id` (int) của phiếu, tự gọi bloc load detail. Trong khi
// load → spinner; load lỗi → snackbar + pop.
//
// Field set (theo yêu cầu bổ sung):
//   - TBP duyệt (isRequired, readonly, auto-fill từ info.approvedTBP)
//   - Dự án (isRequired, picker từ state.projects)
//   - Công ty (optional, picker từ state.taxCompanies)
//   - Bộ phận (optional, text rỗng)
//   - Lý do (isRequired, auto-fill theo khoảng ngày)
//   - Loại chuyển khoản (isRequired, picker: Chuyển khoản / Tiền mặt)
//   - Số tài khoản (isRequired, text, chỉ chữ số)
//   - Ngân hàng (isRequired, picker từ state.banks)
//   - Số tiền tạm ứng (isRequired, number, format "x.xxx.xxx VNĐ")
//   - Ghi chú (optional, multiline)

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

/// Loại chuyển khoản cho đề nghị tạm ứng.
enum TransferType { bankTransfer, cash }

class BookingGuestHouseAdvanceRequestScreen extends StatefulWidget {
  const BookingGuestHouseAdvanceRequestScreen({super.key, required this.id});

  /// ID phiếu cần mở form đề nghị tạm ứng.
  final int id;

  @override
  State<BookingGuestHouseAdvanceRequestScreen> createState() =>
      _BookingGuestHouseAdvanceRequestScreenState();
}

class _BookingGuestHouseAdvanceRequestScreenState
    extends State<BookingGuestHouseAdvanceRequestScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  //---(Controllers cho 10 field text theo UI mới)---//
  /// TBP duyệt — auto-fill từ info.approvedTBP, có thể chọn lại qua
  /// bottom sheet.
  late final TextEditingController _tbpCtrl;
  EmployeeFilterItem? _tbpSelected;

  /// Dự án đã chọn (TextEditingController làm value cho FormBuilder; chọn
  /// qua bottom sheet, hiển thị "Mã - Tên").
  late final TextEditingController _projectCtrl;
  ProjectFilterItem? _projectSelected;

  late final TextEditingController _companyCtrl;
  TaxCompanyItem? _companySelected;

  late final TextEditingController _departmentCtrl;
  late final TextEditingController _reasonCtrl;

  /// Loại chuyển khoản — lưu enum + controller cho FormBuilder.
  TransferType _transferType = TransferType.bankTransfer;
  late final TextEditingController _transferTypeCtrl;
  String get _transferTypeLabel => _transferType == TransferType.bankTransfer
      ? 'Chuyển khoản'
      : 'Tiền mặt';

  late final TextEditingController _bankAccountCtrl;
  late final TextEditingController _bankNameCtrl;
  BankItem? _bankSelected;

  /// Số tiền tạm ứng — text có format "x.xxx.xxx VNĐ"; parse ngược về số
  /// khi cần submit.
  late final TextEditingController _amountCtrl;

  late final TextEditingController _noteCtrl;

  @override
  void initState() {
    super.initState();
    _tbpCtrl = TextEditingController();
    _projectCtrl = TextEditingController();
    _companyCtrl = TextEditingController();
    _departmentCtrl = TextEditingController();
    _reasonCtrl = TextEditingController();
    _transferTypeCtrl = TextEditingController();
    _bankAccountCtrl = TextEditingController();
    _bankNameCtrl = TextEditingController();
    _amountCtrl = TextEditingController();
    _noteCtrl = TextEditingController();

    // Trigger load detail ngay khi mở màn. 3 API lookup (projects/employees/
    // provinces) KHÔNG gọi ở đây — đã được list screen load sẵn qua
    // loadFilters khi mở tính năng. Nếu mở thẳng đề nghị tạm ứng (deep
    // link) mà chưa qua list, dữ liệu lookup sẽ rỗng và UI sẽ fallback
    // text theo id.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bloc = context.read<BookingGuestHouseBloc>();
      bloc.add(BookingGuestHouseEvent.loadDetail(id: widget.id));
    });
  }

  @override
  void dispose() {
    _tbpCtrl.dispose();
    _projectCtrl.dispose();
    _companyCtrl.dispose();
    _departmentCtrl.dispose();
    _reasonCtrl.dispose();
    _transferTypeCtrl.dispose();
    _bankAccountCtrl.dispose();
    _bankNameCtrl.dispose();
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  //---(Helpers)---//

  /// Lý do đề nghị fill sẵn dựa trên startDate/endDate của phiếu.
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

  /// Mở bottom sheet chọn dự án từ `BookingGuestHouseState.projects`.
  Future<void> _pickProject() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.projects.isEmpty) {
      // loadFilters chưa chạy (deep link vào settlement) → thử trigger.
      context.read<BookingGuestHouseBloc>().add(
        const BookingGuestHouseEvent.loadFilters(),
      );
      _showNoDataHint(context, 'dự án');
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

  /// Mở bottom sheet chọn TBP duyệt từ `state.employees`. Khi user chọn,
  /// lưu lại employeeId + tên để dùng cho submit.
  Future<void> _pickTbp() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.employees.isEmpty) {
      _showNoDataHint(context, 'nhân viên');
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
  Future<void> _pickTaxCompany() async {
    final state = context.read<BookingGuestHouseBloc>().state;
    if (state.taxCompanies.isEmpty) {
      context.read<BookingGuestHouseBloc>().add(
        const BookingGuestHouseEvent.loadFilters(),
      );
      _showNoDataHint(context, 'công ty');
      return;
    }
    await openSelectBottomSheet<TaxCompanyItem>(
      context: context,
      title: 'Chọn công ty',
      hintText: 'Tìm theo tên / mã số thuế',
      items: state.taxCompanies,
      initialSelectedItem: _companySelected,
      displayText: (c) {
        // Ưu tiên Name, fallback TaxCode.
        final name = (c.name ?? '').trim();
        if (name.isNotEmpty) return name;
        final tax = (c.taxCode ?? '').trim();
        if (tax.isEmpty) return 'N/A';
        return 'MST: $tax';
      },
      onSelected: (company) {
        setState(() {
          _companySelected = company;
          _companyCtrl.text = (company.name ?? '').trim().isEmpty
              ? 'MST: ${(company.taxCode ?? '').trim()}'
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
      _showNoDataHint(context, 'ngân hàng');
      return;
    }
    await openSelectBottomSheet<BankItem>(
      context: context,
      title: 'Chọn ngân hàng',
      hintText: 'Tìm theo tên ngân hàng',
      items: state.banks,
      initialSelectedItem: _bankSelected,
      displayText: (b) =>
          (b.bankName ?? '').trim().isEmpty ? 'N/A' : b.bankName!.trim(),
      onSelected: (bank) {
        setState(() {
          _bankSelected = bank;
          _bankNameCtrl.text = (bank.bankName ?? '').trim();
        });
      },
    );
  }

  /// Mở bottom sheet chọn loại chuyển khoản — 2 giá trị cố định.
  Future<void> _pickTransferType() async {
    final result = await showModalBottomSheet<TransferType>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        Widget tile(TransferType type, String label) {
          return InkWell(
            onTap: () => Navigator.of(sheetCtx).pop(type),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Icon(
                    _transferType == type
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: AppColors.primaryERP,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chọn loại chuyển khoản',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                tile(TransferType.bankTransfer, 'Chuyển khoản'),
                tile(TransferType.cash, 'Tiền mặt'),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
    if (result != null && mounted) {
      setState(() => _transferType = result);
    }
  }

  void _showNoDataHint(BuildContext context, String what) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chưa có dữ liệu $what. Vui lòng quay lại danh sách.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
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

    // TODO: wire submit khi có API lưu đề nghị tạm ứng. Tạm thời báo
    // thành công để confirm form đã validate OK + pop về list.
    context.showMessage(
      'Lưu đề nghị tạm ứng thành công',
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
            title: const Text('Đề nghị tạm ứng'),
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
            title: 'Thông tin tạm ứng',
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---(TBP duyệt — auto-fill từ info.approvedTBP, có thể
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
                        nameForm: 'advance_tbp',
                        nameTextField: 'advance_tbp_text',
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

                  //---(Dự án — picker từ state.projects; auto-fill nếu
                  //    info.projectId match)---//
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
                        nameForm: 'advance_project',
                        nameTextField: 'advance_project_text',
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

                  //---(Công ty — optional, picker từ state.taxCompanies)---//
                  FormInputField(
                    nameForm: 'advance_company',
                    nameTextField: 'advance_company_text',
                    label: 'Công ty',
                    icon: Icons.business_outlined,
                    controller: _companyCtrl,
                    readOnly: true,
                    onTap: _pickTaxCompany,
                  ),
                  const SizedBox(height: 12),

                  //---(Bộ phận — optional, text rỗng)---//
                  FormInputField(
                    nameForm: 'advance_department',
                    nameTextField: 'advance_department_text',
                    label: 'Bộ phận',
                    icon: Icons.groups_outlined,
                    controller: _departmentCtrl,
                  ),
                  const SizedBox(height: 12),

                  //---(Lý do — isRequired)---//
                  FormInputField(
                    nameForm: 'advance_reason',
                    nameTextField: 'advance_reason_text',
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

                  //---(Loại chuyển khoản — picker "Chuyển khoản" / "Tiền mặt")---//
                  Builder(
                    builder: (_) {
                      // Đồng bộ text controller với enum hiện tại mỗi lần
                      // rebuild (tránh stale text sau khi user đổi qua sheet).
                      if (_transferTypeCtrl.text != _transferTypeLabel) {
                        _transferTypeCtrl.text = _transferTypeLabel;
                      }
                      return FormInputField(
                        nameForm: 'advance_transfer_type',
                        nameTextField: 'advance_transfer_type_text',
                        label: 'Loại chuyển khoản',
                        icon: Icons.swap_horiz,
                        controller: _transferTypeCtrl,
                        isRequired: true,
                        readOnly: true,
                        onTap: _pickTransferType,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng chọn loại chuyển khoản'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(Số tài khoản — isRequired, chỉ cho nhập chữ số qua validator)---//
                  FormInputField(
                    nameForm: 'advance_bank_account',
                    nameTextField: 'advance_bank_account_text',
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

                  //---(Ngân hàng — isRequired, picker từ state.banks)---//
                  FormInputField(
                    nameForm: 'advance_bank_name',
                    nameTextField: 'advance_bank_name_text',
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

                  //---(Số tiền tạm ứng — isRequired, format "x.xxx.xxx VNĐ")---//
                  FormInputField(
                    nameForm: 'advance_amount',
                    nameTextField: 'advance_amount_text',
                    label: 'Số tiền tạm ứng',
                    icon: Icons.payments_outlined,
                    controller: _amountCtrl,
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
                        return 'Vui lòng nhập số tiền tạm ứng';
                      }
                      if (_parseVndToDigits(v).isEmpty) {
                        return 'Số tiền không hợp lệ';
                      }
                      return null;
                    },
                    // Hiển thị text có format "x.xxx.xxx VNĐ" ngay khi user gõ.
                    onChanged: (value) {
                      if (value == null) return;
                      final digits = _parseVndToDigits(value);
                      final formatted = _formatVnd(digits);
                      if (formatted != value) {
                        _amountCtrl.value = TextEditingValue(
                          text: formatted,
                          selection: TextSelection.collapsed(
                            offset: formatted.length,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(Ghi chú — optional, multiline)---//
                  FormInputField(
                    nameForm: 'advance_note',
                    nameTextField: 'advance_note_text',
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
