import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/logger/index.dart';
import '../../../../../../../../../common/utils/formatter/thousands_input_formatter.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../../../../features/auth/data/datasource/models/user_model.dart';
import '../../../../../../../../../features/auth/data/repository/auth_repository.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';

/// Loại chuyển khoản cho đề nghị tạm ứng (theo mục 2.5 spec).
///
/// Mapping `value` (gửi BE) ↔ label (hiển thị trên UI):
/// - 1 → "Chuyển khoản cá nhân" (mặc định)
/// - 2 → "Chuyển khoản RTC"
/// - 3 → "Chuyển khoản MVI"
/// - 4 → "Chuyển khoản APR"
/// - 5 → "Chuyển khoản Yonko"
/// - 6 → "Chuyển khoản R-Tech"
enum TransferType {
  personal(1, 'Chuyển khoản cá nhân'),
  rtc(2, 'Chuyển khoản RTC'),
  mvi(3, 'Chuyển khoản MVI'),
  apr(4, 'Chuyển khoản APR'),
  yonko(5, 'Chuyển khoản Yonko'),
  rTech(6, 'Chuyển khoản R-Tech');

  const TransferType(this.value, this.label);

  /// Giá trị `TransferType` gửi BE.
  final int value;

  /// Label tiếng Việt hiển thị trên UI.
  final String label;

  /// Map int → enum (BE trả về 1..6). Trả `personal` làm fallback.
  static TransferType fromValue(int? v) {
    for (final t in TransferType.values) {
      if (t.value == v) return t;
    }
    return TransferType.personal;
  }
}

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
  /// Mặc định "Chuyển khoản cá nhân" (TransferType = 5) theo spec 2.5.
  TransferType _transferType = TransferType.personal;
  late final TextEditingController _transferTypeCtrl;
  String get _transferTypeLabel => _transferType.label;

  late final TextEditingController _bankAccountCtrl;
  late final TextEditingController _bankNameCtrl;
  BankItem? _bankSelected;

  /// Số tiền tạm ứng — text có format "x.xxx.xxx" do
  /// `ThousandsInputFormatter` áp dụng ngay khi user gõ (đơn vị "VNĐ"
  /// hiển thị ở `suffixIcon` chứ không chèn vào text, để user xoá/backspace
  /// dễ). Tránh set controller trong `onChanged` gây StackOverflow.
  late final TextEditingController _amountCtrl;

  late final TextEditingController _noteCtrl;

  /// User đang đăng nhập — load qua `AuthRepository` ở `initState` để
  /// fill Công ty (lookup taxCompanyId trong state.taxCompanies) + Bộ
  /// phận. Lưu vào UI state (giống `LunchAddScreen._loadCurrentEmployeeId`).
  /// Bloc chỉ cần khi submit (qua `_onSubmitAdvanceForm`) — không cache.
  User? _currentUser;

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

    // Khởi tạo màn: load currentUser + dispatch load detail + load
    // filters (idempotent — bloc tự skip nếu đã có data). UI gọi
    // action qua `add(...)` — không đọc state trong method helper.
    _loadCurrentUser();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<BookingGuestHouseBloc>().add(
        BookingGuestHouseEvent.loadDetail(id: widget.id),
      );
      // Trigger loadFilters nếu list/employee/bank rỗng (deep link).
      if (context.read<BookingGuestHouseBloc>().state.projects.isEmpty ||
          context.read<BookingGuestHouseBloc>().state.employees.isEmpty ||
          context.read<BookingGuestHouseBloc>().state.banks.isEmpty) {
        context
            .read<BookingGuestHouseBloc>()
            .add(const BookingGuestHouseEvent.loadFilters());
      }
    });
  }

  /// Load `currentUser` qua `AuthRepository` — pattern giống
  /// `LunchAddScreen._loadCurrentEmployeeId`. Lưu vào UI state để
  /// auto-fill Bộ phận + lookup Công ty qua `state.taxCompanies`.
  Future<void> _loadCurrentUser() async {
    final user = await AuthRepository.fetchAndSaveCurrentUser(
      log: getIt.get<LogUtils>(),
    );
    if (!mounted) return;
    setState(() => _currentUser = user);
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
    return 'Tạm ứng tiền nhà nghỉ từ $sText đến $eText';
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

  /// Parse ngược từ text hiện thị (có dấu `.`) → chỉ chữ số.
  /// Dùng khi build payload submit và validate (xem validator amount).
  String _parseVndToDigits(String text) =>
      text.replaceAll(RegExp(r'[^0-9]'), '');

  //---(Auto-fill theo pattern BaseState)---//

  /// Fill Công ty + Bộ phận từ currentUser (UI state) + lookup tên
  /// công ty trong `state.taxCompanies`. Gọi từ `BlocBuilder` của field
  /// Công ty — nơi đã có `state` từ builder.
  ///
  /// Theo pattern của `LunchAddScreen._loadCurrentEmployeeId`: UI tự
  /// load user qua `AuthRepository`, lưu vào UI state, dùng để
  /// render/fill. Bloc không cần biết về user này — chỉ cần khi submit
  /// (qua `_onSubmitAdvanceForm`).
  void _autoFillCompanyAndDepartment(BookingGuestHouseState state) {
    final user = _currentUser;
    if (user == null) return;
    final deptName = user.departmentName.trim();
    if (deptName.isNotEmpty && _departmentCtrl.text.isEmpty) {
      _departmentCtrl.text = deptName;
    }
    if (_companyCtrl.text.isNotEmpty) return;
    final companyId = user.taxCompanyId;
    if (companyId == 0) return;
    final match = state.taxCompanies.firstWhereOrNull((c) => c.id == companyId);
    if (match == null) {
      // taxCompanies chưa load → trigger loadFilters (bloc tự skip nếu
      // đã loading). Đây là event action, hợp lệ trong event handler.
      if (state.taxCompanies.isEmpty) {
        context.read<BookingGuestHouseBloc>().add(
          const BookingGuestHouseEvent.loadFilters(),
        );
      }
      return;
    }
    final label = (match.name ?? '').trim();
    if (label.isNotEmpty) _companyCtrl.text = label;
  }

  /// Auto-fill form từ `detailData` (chế độ editable). Fill TBP +
  /// Dự án (lookup tên trong `state.employees` / `state.projects`) +
  /// Lý do mặc định theo khoảng ngày. Mỗi controller chỉ fill nếu
  /// còn rỗng — tránh đè value user đang gõ.
  void _autoFillFromDetail(
    BookingGuestHouseDetailData detail,
    BookingGuestHouseState state,
  ) {
    // TBP duyệt
    if (_tbpCtrl.text.isEmpty && detail.info.approvedTBP != null) {
      final name = _resolveTbpName(detail.info.approvedTBP, state.employees);
      if (name != null) {
        _tbpCtrl.text = name;
        _tbpSelected ??= state.employees.firstWhere(
          (e) => e.id == detail.info.approvedTBP,
          orElse: () => state.employees.first,
        );
      }
    }

    // Dự án
    if (_projectSelected == null &&
        detail.info.projectId != null &&
        state.projects.isNotEmpty) {
      for (final p in state.projects) {
        if (p.id == detail.info.projectId) {
          _projectSelected = p;
          _projectCtrl.text = (p.projectCode ?? '').isNotEmpty
              ? '${p.projectCode} - ${p.projectName ?? ''}'
              : (p.projectName ?? '');
          break;
        }
      }
    }

    // Lý do
    if (_reasonCtrl.text.isEmpty) {
      _reasonCtrl.text = _defaultReasonText(detail.info);
    }
  }

  /// Auto-fill form từ `sourceItem.advance*` (chế độ view-only khi
  /// `advanceDetailStatus == 4`). Lookup tên TBP/Dự án/Ngân hàng từ
  /// `state.employees`/`state.projects`/`state.banks`.
  ///
  /// `sourceItem` ở đây resolve từ `state.bookings.firstWhereOrNull`
  /// (gọi trong BlocBuilder khi widget build).
  void _autoFillFromSourceItem(
    BookingGuestHouseItem item,
    BookingGuestHouseState state,
  ) {
    // TBP
    final advanceTbpId = item.advanceApprovedTbpId;
    if (advanceTbpId != null && advanceTbpId != 0) {
      final match =
          state.employees.firstWhereOrNull((e) => e.id == advanceTbpId);
      _tbpCtrl.text = (match?.fullName ?? '').trim().isNotEmpty
          ? match!.fullName!.trim()
          : (item.advanceRecipientName ?? '');
      _tbpSelected = match;
    }

    // Dự án
    final advanceProjectId = item.advanceProjectId;
    if (advanceProjectId != null && advanceProjectId != 0) {
      final match =
          state.projects.firstWhereOrNull((p) => p.id == advanceProjectId);
      if (match != null) {
        _projectSelected = match;
        _projectCtrl.text = (match.projectCode ?? '').isNotEmpty
            ? '${match.projectCode} - ${match.projectName ?? ''}'
            : (match.projectName ?? '');
      }
    }

    // Công ty
    final advanceCompanyName = (item.advanceCompanyName ?? '').trim();
    if (advanceCompanyName.isNotEmpty) {
      _companyCtrl.text = advanceCompanyName;
    }

    // Bộ phận
    final advanceDeptName = (item.advanceDepartmentName ?? '').trim();
    if (advanceDeptName.isNotEmpty) {
      _departmentCtrl.text = advanceDeptName;
    }

    // Lý do
    _reasonCtrl.text = (item.advanceReason ?? '').trim();

    // Loại CK
    _transferType = TransferType.fromValue(item.advanceTransferType);
    _transferTypeCtrl.text = _transferType.label;

    // Số TK
    _bankAccountCtrl.text = (item.advanceBankAccount ?? '').trim();

    // Ngân hàng
    final advanceBankListId = item.advanceBankListId;
    if (advanceBankListId != null && advanceBankListId != 0) {
      final match =
          state.banks.firstWhereOrNull((b) => b.id == advanceBankListId);
      if (match != null) {
        _bankSelected = match;
        _bankNameCtrl.text = (match.bankName ?? '').trim();
      } else {
        _bankNameCtrl.text = (item.advanceBankName ?? '').trim();
      }
    } else {
      _bankNameCtrl.text = (item.advanceBankName ?? '').trim();
    }

    // Số tiền
    final totalAmount = item.advanceTotalAmount;
    if (totalAmount != null) {
      final digits = totalAmount.toInt().toString();
      final grouped = digits.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]}.',
      );
      _amountCtrl.text = grouped;
    }

    // Ghi chú
    _noteCtrl.text = (item.advanceNote ?? '').trim();
  }

  /// Parse số tiền hiện tại trong `_amountCtrl` (text "x.xxx.xxx") → int.
  int? get _amountValue {
    final digits = _parseVndToDigits(_amountCtrl.text);
    if (digits.isEmpty) return null;
    return int.tryParse(digits);
  }

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

  /// Mở bottom sheet chọn loại chuyển khoản — 6 giá trị theo mục 2.5
  /// spec. Dùng `openSelectBottomSheet` chuẩn của project để đồng bộ
  /// UX với các picker khác (Dự án, Ngân hàng, TBP).
  Future<void> _pickTransferType() async {
    await openSelectBottomSheet<TransferType>(
      context: context,
      title: 'Chọn loại chuyển khoản',
      hintText: 'Tìm theo tên loại chuyển khoản',
      items: TransferType.values,
      initialSelectedItem: _transferType,
      displayText: (t) => t.label,
      onSelected: (type) {
        setState(() => _transferType = type);
      },
    );
  }

  void _showNoDataHint(BuildContext context, String what) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chưa có dữ liệu $what. Vui lòng quay lại danh sách.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Submit đề nghị tạm ứng — build DTO `AdvancePaymentOrderRequest` từ
  /// giá trị form rồi dispatch `BookingGuestHouseEvent.submitAdvanceForm`.
  /// Bloc tự resolve `currentUser` + `detailData` + build payload Map cuối
  /// cùng + validate. UI chỉ lo thu thập giá trị form (10 field + 3 object
  /// đã chọn) — không build payload Map hay gọi AuthRepository.
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

    final amount = _amountValue;
    if (amount == null || amount <= 0) {
      context.showMessage(
        'Số tiền tạm ứng không hợp lệ',
        type: SnackBarType.error,
      );
      return;
    }

    final bank = _bankSelected;
    if (bank == null) {
      context.showMessage(
        'Vui lòng chọn ngân hàng',
        type: SnackBarType.error,
      );
      return;
    }

    // Công ty — lấy từ controller (đã auto-fill). Nếu user không có
    // taxCompanyId → fallback 0 cho companyId (bloc sẽ dùng giá trị này).
    // UI dùng `_currentUser` (UI state, load ở initState) thay vì đọc
    // từ bloc state — theo pattern của `LunchAddScreen`.
    final companyId = _companySelected?.id ?? _currentUser?.taxCompanyId;

    //---(Dispatch event thuần — bloc tự build payload + validate +
    //    resolve currentUser)---//
    context.read<BookingGuestHouseBloc>().add(
      BookingGuestHouseEvent.submitAdvanceForm(
        accommodationBookingId: widget.id,
        approvedTbpId: _tbpSelected?.id,
        projectId: _projectSelected?.id,
        companyId: companyId,
        companyName: _companyCtrl.text.trim(),
        departmentName: _departmentCtrl.text.trim(),
        reason: _reasonCtrl.text.trim(),
        transferType: _transferType.value,
        bankAccount: _bankAccountCtrl.text.trim(),
        bankListId: bank.id ?? 0,
        bankName: _bankNameCtrl.text.trim(),
        totalAmount: amount,
        note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingGuestHouseBloc, BookingGuestHouseState>(
      //---(Listen khi state thay đổi: fill form + show snackbar + reset)---//
      listenWhen: (prev, curr) =>
          //---(Fill form khi các phần state liên quan thay đổi)---//
          prev.employees != curr.employees ||
          prev.projects != curr.projects ||
          prev.banks != curr.banks ||
          prev.taxCompanies != curr.taxCompanies ||
          prev.detailData != curr.detailData ||
          //---(Snackbar lỗi)---//
          (prev.detailMessage != curr.detailMessage &&
              curr.detailMessage != null) ||
          //---(Success → show toast + reset + pop)---//
          (!prev.advanceSuccess && curr.advanceSuccess) ||
          //---(Submit fail)---//
          (prev.isSubmittingAdvance &&
              !curr.isSubmittingAdvance &&
              !curr.advanceSuccess &&
              (curr.message ?? '').isNotEmpty),
      listener: (context, state) {
        //---(Fill Công ty + Bộ phận từ currentUser + taxCompanies)---//
        _autoFillCompanyAndDepartment(state);

        //---(Fill TBP/Project/Lý do từ detailData — editable)---//
        if (state.detailData != null) {
          _autoFillFromDetail(state.detailData!, state);
        }

        //---(Fill view-only từ sourceItem trong state.bookings)---//
        final source = state.bookings.firstWhereOrNull(
          (b) => b.id == widget.id,
        );
        final isViewOnly =
            source != null && source.advanceDetailStatus == 4;
        if (isViewOnly) {
          _autoFillFromSourceItem(source, state);
        }

        //---(View-only → show snackbar cảnh báo 1 lần)---//
        // if (isViewOnly) {
        //   final code = (source.advancePaymentOrderCode ?? '').trim();
        //   final msg = code.isNotEmpty
        //       ? 'Đã tạo ĐNTT tạm ứng $code — không sửa được'
        //       : 'Đã tạo ĐNTT tạm ứng — không sửa được';
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     if (!mounted) return;
        //     context.showMessage(msg, type: SnackBarType.info);
        //   });
        // }

        //---(Lỗi load detail)---//
        if (state.detailMessage != null && state.detailMessage!.isNotEmpty) {
          context.showMessage(
            state.detailMessage!,
            type: SnackBarType.error,
          );
        }

        //---(Submit success → show toast + clear state + pop)---//
        if (state.advanceSuccess) {
          final res = state.lastAdvanceResponse;
          final code = (res?.code ?? '').trim();
          final isRecreated = res?.isRecreated == true;
          final msg = state.message?.trim().isNotEmpty == true
              ? state.message!.trim()
              : (isRecreated
                  ? 'Đã tạo lại đề nghị tạm ứng${code.isNotEmpty ? ' ($code)' : ''} — chờ TBP duyệt lại'
                  : 'Tạo đề nghị tạm ứng thành công${code.isNotEmpty ? ' ($code)' : ''}');
          context.showMessage(msg, type: SnackBarType.success);
          // Clear cờ để lần sau mở lại màn thấy form sạch (giống
          // pattern `LunchAddScreen` với `clearSubmitState`).
          context
              .read<BookingGuestHouseBloc>()
              .add(const BookingGuestHouseEvent.clearAdvanceSubmitState());
          if (context.canPop()) context.pop();
        }

        //---(Submit fail)---//
        if (state.message != null &&
            state.message!.isNotEmpty &&
            !state.advanceSuccess &&
            !state.isSubmittingAdvance) {
          context.showMessage(
            state.message!,
            type: SnackBarType.error,
          );
        }
      },
      //---(Build UI từ state)---//
      buildWhen: (prev, curr) =>
          prev.isDetailLoading != curr.isDetailLoading ||
          prev.detailData != curr.detailData ||
          prev.detailMessage != curr.detailMessage ||
          prev.taxCompanies != curr.taxCompanies ||
          prev.employees != curr.employees ||
          prev.projects != curr.projects ||
          prev.banks != curr.banks ||
          prev.bookings != curr.bookings ||
          prev.isSubmittingAdvance != curr.isSubmittingAdvance,
      builder: (context, state) {
        final detail = state.detailData;
        // View-only: resolve từ state.bookings theo widget.id.
        final source = state.bookings.firstWhereOrNull(
          (b) => b.id == widget.id,
        );
        final isViewOnly =
            source != null && source.advanceDetailStatus == 4;
        final isLoading =
            state.isDetailLoading && detail == null && !isViewOnly;
        final errorMsg = (!isLoading && detail == null && !isViewOnly)
            ? state.detailMessage
            : null;

        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          appBar: AppBarCommon(
            title: const Text('Đề nghị tạm ứng'),
            onBackTap: () => context.pop(),
          ),
          // Dismiss keyboard khi user tap ra ngoài field text/number.
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: _buildBody(
              state: state,
              isLoading: isLoading,
              errorMsg: errorMsg,
              detail: detail,
              isViewOnly: isViewOnly,
            ),
          ),
          bottomNavigationBar: _buildBottomBar(isViewOnly: isViewOnly),
        );
      },
    );
  }

  Widget _buildBody({
    required BookingGuestHouseState state,
    required bool isLoading,
    required String? errorMsg,
    required BookingGuestHouseDetailData? detail,
    required bool isViewOnly,
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
    if (detail == null && !isViewOnly) return const SizedBox.shrink();

    // `editable` = false khi đã có ĐNTT tạm ứng (view-only) → áp dụng
    // cho tất cả FormInputField bên dưới. 2 field "Công ty" + "Bộ phận"
    // vẫn `enabled: false` cố định vì user không bao giờ được sửa.
    final editable = !isViewOnly;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---(Banner cảnh báo khi view-only)---//
          if (isViewOnly)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFFFC107),
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    color: Color(0xFFB78103),
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Đã tạo ĐNTT tạm ứng'
                      '${(state.bookings.firstWhereOrNull((b) => b.id == widget.id)?.advancePaymentOrderCode ?? '').isNotEmpty ? ' ${state.bookings.firstWhereOrNull((b) => b.id == widget.id)!.advancePaymentOrderCode}' : ''}'
                      ' — không sửa được',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8A6100),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          FormCard(
            title: 'Thông tin tạm ứng',
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---(TBP duyệt)---//
                  FormInputField(
                    nameForm: 'advance_tbp',
                    nameTextField: 'advance_tbp_text',
                    label: 'TBP duyệt',
                    icon: Icons.verified_user_outlined,
                    controller: _tbpCtrl,
                    isRequired: true,
                    enabled: editable,
                    onTap: _pickTbp,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn TBP duyệt'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(Dự án)---//
                  FormInputField(
                    nameForm: 'advance_project',
                    nameTextField: 'advance_project_text',
                    label: 'Dự án',
                    icon: Icons.account_tree_outlined,
                    controller: _projectCtrl,
                    isRequired: true,
                    readOnly: true,
                    enabled: editable,
                    onTap: _pickProject,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn dự án'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(Công ty)---//
                  FormInputField(
                    nameForm: 'advance_company',
                    nameTextField: 'advance_company_text',
                    label: 'Công ty',
                    icon: Icons.business_outlined,
                    controller: _companyCtrl,
                    enabled: false,
                  ),
                  const SizedBox(height: 12),

                  //---(Bộ phận)---//
                  FormInputField(
                    nameForm: 'advance_department',
                    nameTextField: 'advance_department_text',
                    label: 'Bộ phận',
                    icon: Icons.groups_outlined,
                    controller: _departmentCtrl,
                    enabled: false,
                  ),
                  const SizedBox(height: 12),

                  //---(Lý do)---//
                  FormInputField(
                    nameForm: 'advance_reason',
                    nameTextField: 'advance_reason_text',
                    label: 'Lý do',
                    icon: Icons.help_outline,
                    controller: _reasonCtrl,
                    isRequired: true,
                    enabled: editable,
                    autoExpand: true,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng nhập lý do'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(Loại chuyển khoản)---//
                  Builder(
                    builder: (_) {
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
                        enabled: editable,
                        onTap: _pickTransferType,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng chọn loại chuyển khoản'
                            : null,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(Số tài khoản)---//
                  FormInputField(
                    nameForm: 'advance_bank_account',
                    nameTextField: 'advance_bank_account_text',
                    label: 'Số tài khoản',
                    icon: Icons.account_balance_outlined,
                    controller: _bankAccountCtrl,
                    isRequired: true,
                    enabled: editable,
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập số tài khoản';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(Ngân hàng)---//
                  FormInputField(
                    nameForm: 'advance_bank_name',
                    nameTextField: 'advance_bank_name_text',
                    label: 'Ngân hàng',
                    icon: Icons.account_balance,
                    controller: _bankNameCtrl,
                    isRequired: true,
                    readOnly: true,
                    enabled: editable,
                    onTap: _pickBank,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn ngân hàng'
                        : null,
                  ),
                  const SizedBox(height: 12),

                  //---(Số tiền tạm ứng)---//
                  FormInputField(
                    nameForm: 'advance_amount',
                    nameTextField: 'advance_amount_text',
                    label: 'Số tiền tạm ứng',
                    icon: Icons.payments_outlined,
                    controller: _amountCtrl,
                    isRequired: true,
                    enabled: editable,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    ),
                    inputFormatters: [ThousandsInputFormatter()],
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
                  ),
                  const SizedBox(height: 12),

                  //---(Ghi chú)---//
                  FormInputField(
                    nameForm: 'advance_note',
                    nameTextField: 'advance_note_text',
                    label: 'Ghi chú',
                    icon: Icons.note_outlined,
                    controller: _noteCtrl,
                    enabled: editable,
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

  Widget _buildBottomBar({required bool isViewOnly}) {
    // Khi view-only (đã có ĐNTT tạm ứng) → không hiển thị nút Lưu.
    if (isViewOnly) return const SizedBox.shrink();

    return BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
      buildWhen: (prev, curr) =>
          prev.isSubmittingAdvance != curr.isSubmittingAdvance,
      builder: (context, state) {
        final isSubmitting = state.isSubmittingAdvance;
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
