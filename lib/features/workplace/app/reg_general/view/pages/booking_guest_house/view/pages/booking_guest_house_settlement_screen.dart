import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../common/app/app_config.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/formatter/thousands_input_formatter.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../features/auth/data/datasource/models/user_model.dart';
import '../../../../../../../../../features/auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';

/// Loại hình chuyển khoản cho TT Quyết toán (màn Cập nhật quyết toán).
/// Hiện chỉ hỗ trợ "Chuyển khoản cá nhân" (value = 1) — các loại khác
/// chưa có dữ liệu API nên không pick. Field "Hình thức CK" trên UI chỉ
/// hiển thị read-only, không mở picker.
enum TransferType {
  personal(1, 'Chuyển khoản cá nhân');

  const TransferType(this.value, this.label);

  /// Giá trị `TransferType` gửi BE.
  final int value;

  /// Label tiến Việt hiển thị trên UI.
  final String label;
}

class BookingGuestHouseSettlementScreen extends StatefulWidget {
  const BookingGuestHouseSettlementScreen({
    super.key,
    required this.id,
  });

  /// ID phiếu cần mở form TT Quyết toán. Dùng để gọi API
  /// `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`
  /// pre-fill form (nếu BE đã có TTQT trước đó với status 2/3/4/5).
  /// Status 0/null = chưa có TTQT → giữ form rỗng.
  final int id;

  @override
  State<BookingGuestHouseSettlementScreen> createState() =>
      _BookingGuestHouseSettlementScreenState();
}

class _BookingGuestHouseSettlementScreenState
    extends State<BookingGuestHouseSettlementScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  //---(Định dạng file cho phép)---//
  /// File hóa đơn: PDF / ảnh / excel.
  static const List<String> _invoiceAllowedExtensions = <String>[
    'pdf',
    'png', 'jpg', 'jpeg', 'webp', 'heic', 'bmp',
    'xls', 'xlsx',
  ];

  /// File bill CK: PDF / ảnh (không cho excel).
  static const List<String> _billCkAllowedExtensions = <String>[
    'pdf',
    'png', 'jpg', 'jpeg', 'webp', 'heic', 'bmp',
  ];

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

  /// Hình thức CK — chọn từ `TransferType` qua `openSelectBottomSheet`.
  /// Controller lưu label để FormBuilder/UI đọc; enum lưu value (gửi BE).
  /// Mặc định `TransferType.personal` (value = 1).
  TransferType _transferType = TransferType.personal;
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

  /// Guard: chỉ pre-fill từ `Payment*` MỘT LẦN (khi detail load xong
  /// lần đầu + `PaymentDetailStatus == 2`). Không fill lại khi state
  /// phụ trợ thay đổi (TBP, banks...) — tránh đè value user đang gõ.
  bool _prefilledPayment = false;

  /// Current user — load song song với loadDetail để auto-fill Công ty
  /// (TaxCompanyID) + Bộ phận (DepartmentName). User không sửa được 2
  /// field này (`enabled: false`) vì lấy cứng từ tài khoản đang đăng nhập.
  User? _currentUser;

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
    _transferTypeCtrl = TextEditingController(text: _transferType.label);
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
    // Đồng thời load currentUser để auto-fill Công ty + Bộ phận (readonly).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final bloc = context.read<BookingGuestHouseBloc>();
      bloc.add(BookingGuestHouseEvent.loadDetail(id: widget.id));
      // Tải chi tiết TTQT theo `accommodationBookingId` để pre-fill
      // form (thay thế cho việc truyền `BookingGuestHouseItem` qua
      // widget). `data == null` = chưa có TTQT → giữ form rỗng.
      bloc.add(BookingGuestHouseEvent.loadPaymentDetail(id: widget.id));
      _loadCurrentUser();
    });
  }

  /// Lấy thông tin user đang đăng nhập (TaxCompanyID + DepartmentName) để
  /// auto-fill vào form TT Quyết toán. 2 field này KHÔNG cho user sửa —
  /// gắn cứng theo tài khoản.
  Future<void> _loadCurrentUser() async {
    final res = await GetIt.I<AuthRepo>().getCurrentUser();
    if (!mounted) return;
    final user = res.getOrElse(() => null);
    if (user == null) return;
    setState(() {
      _currentUser = user;
      // Auto-fill Bộ phận ngay khi có user (không phụ thuộc lookup).
      if (_departmentCtrl.text.isEmpty) {
        _departmentCtrl.text = user.departmentName.trim();
      }
      // Công ty chỉ fill khi state.taxCompanies có data (xem listener).
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

  /// Mở bottom sheet chọn hình thức chuyển khoản (`TransferType`). Hiện
  /// chỉ có 1 giá trị "Chuyển khoản cá nhân" (value = 1) nhưng vẫn
  /// dùng `openSelectBottomSheet` cho đồng bộ UX với các picker khác
  /// (TBP, Project, Bank…). Khi BE bổ sung loại mới → mở rộng enum.
  Future<void> _pickTransferType() async {
    await openSelectBottomSheet<TransferType>(
      context: context,
      title: 'Chọn hình thức chuyển khoản',
      hintText: 'Tìm theo tên loại chuyển khoản',
      items: TransferType.values,
      initialSelectedItem: _transferType,
      displayText: (t) => t.label,
      onSelected: (type) {
        setState(() {
          _transferType = type;
          _transferTypeCtrl.text = type.label;
        });
      },
    );
  }

  /// Parse ngược từ text hiển thị (có `.`) → chỉ chữ số.
  /// Format thực hiện trong `ThousandsInputFormatter` lúc gõ — chỉ còn
  /// helper này cho validator/submit.
  String _parseVndToDigits(String text) =>
      text.replaceAll(RegExp(r'[^0-9]'), '');

  //---(File pickers)---//

  /// Mở bottom sheet cho user chọn nguồn (camera / gallery / file đa
  /// năng) rồi dispatch sang helper tương ứng. [allowedExtensions]
  /// dùng cho nhánh FilePicker (PDF / ảnh / excel tuỳ loại).
  /// [applyResult] được gọi với danh sách `PlatformFile` mới (không
  /// rỗng) — UI tự setState cập nhật `_invoiceFiles` / `_billCkFiles`.
  Future<void> _showFileSourceAndPick({
    required List<String> allowedExtensions,
    required void Function(List<PlatformFile> files) applyResult,
  }) async {
    final source = await showModalBottomSheet<_FileSource>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      builder: (_) => const _FileSourceBottomSheet(),
    );
    if (source == null || !mounted) return;

    switch (source) {
      case _FileSource.camera:
        await _pickFromCamera(applyResult);
        break;
      case _FileSource.gallery:
        await _pickFromGallery(applyResult);
        break;
      case _FileSource.files:
        await _pickFromFilePicker(
          allowedExtensions: allowedExtensions,
          applyResult: applyResult,
        );
        break;
    }
  }

  /// Chụp 1 ảnh từ camera, wrap thành `PlatformFile` rồi gọi
  /// [applyResult]. User hủy (không chụp) → bỏ qua.
  Future<void> _pickFromCamera(
    void Function(List<PlatformFile> files) applyResult,
  ) async {
    final picker = ImagePicker();
    final XFile? shot = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );
    if (shot == null || !mounted) return;
    final file = _xfileToPlatformFile(shot);
    if (file == null) return;
    applyResult([file]);
  }

  /// Chọn nhiều ảnh từ thư viện, wrap thành `List<PlatformFile>` rồi
  /// gọi [applyResult]. User không chọn gì → bỏ qua.
  Future<void> _pickFromGallery(
    void Function(List<PlatformFile> files) applyResult,
  ) async {
    final picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(
      imageQuality: 90,
    );
    if (images.isEmpty || !mounted) return;
    final files = <PlatformFile>[];
    for (final x in images) {
      final f = _xfileToPlatformFile(x);
      if (f != null) files.add(f);
    }
    if (files.isEmpty) return;
    applyResult(files);
  }

  /// Mở FilePicker đa năng (PDF / ảnh / excel) theo
  /// [allowedExtensions] (whitelist của loại file tương ứng).
  Future<void> _pickFromFilePicker({
    required List<String> allowedExtensions,
    required void Function(List<PlatformFile> files) applyResult,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result == null || result.files.isEmpty || !mounted) return;
    applyResult(result.files);
  }

  /// Convert `XFile` (image_picker) → `PlatformFile` (file_picker) để
  /// tận dụng lại luồng upload hiện tại (chỉ cần `path` + `name`).
  /// Trả `null` nếu `XFile` không có path trên local filesystem
  /// (vd từ URL bên ngoài) — trường hợp này hiếm gặp với camera /
  /// gallery, nhưng defensive để tránh exception.
  PlatformFile? _xfileToPlatformFile(XFile xfile) {
    final path = xfile.path;
    if (path.trim().isEmpty) return null;
    final file = File(path);
    if (!file.existsSync()) return null;
    return PlatformFile(
      path: path,
      name: xfile.name,
      size: file.lengthSync(),
    );
  }

  Future<void> _pickInvoiceFiles() async {
    // File hóa đơn — cho phép PDF / ảnh / excel. Bottom sheet cho
    // user chọn nguồn (camera / gallery / file đa năng).
    await _showFileSourceAndPick(
      allowedExtensions: _invoiceAllowedExtensions,
      applyResult: (files) {
        if (!mounted) return;
        setState(() => _invoiceFiles = files);
      },
    );
  }

  Future<void> _pickBillCkFiles() async {
    // Bill CK — chỉ cho phép PDF / ảnh (không cho excel).
    await _showFileSourceAndPick(
      allowedExtensions: _billCkAllowedExtensions,
      applyResult: (files) {
        if (!mounted) return;
        setState(() => _billCkFiles = files);
      },
    );
  }

  //---(Xem / xoá file trước khi lưu)---//

  /// Xem file mới (chưa upload) tại [index] trong `_invoiceFiles` /
  /// `_billCkFiles`. Mở dialog preview với local path.
  void _viewNewInvoiceFile(int index) =>
      _viewNewPlatformFile(_invoiceFiles, index);
  void _viewNewBillCkFile(int index) =>
      _viewNewPlatformFile(_billCkFiles, index);

  void _viewNewPlatformFile(
    List<PlatformFile> source,
    int index,
  ) {
    if (index < 0 || index >= source.length) return;
    final path = source[index].path;
    if (path == null || path.trim().isEmpty) {
      context.showMessage(
        'File không có đường dẫn local để xem',
        type: SnackBarType.error,
      );
      return;
    }
    _openFilePreview(
      title: source[index].name,
      preview: _FilePreviewSource.local(path),
    );
  }

  /// Xem file đã upload từ `state.paymentDetail.files`. Resolve URL
  /// remote từ `Url` / `FilePath` rồi mở WebView.
  void _viewExistingFile(BookingGuestHouseFileItem item) {
    final url = _resolveRemoteFileUrl(item);
    if (url == null || url.isEmpty) {
      context.showMessage(
        'Không tìm thấy đường dẫn file đã upload',
        type: SnackBarType.error,
      );
      return;
    }
    _openFilePreview(
      title: (item.fileName?.trim().isNotEmpty == true)
          ? item.fileName!.trim()
          : 'Xem file',
      preview: _FilePreviewSource.remote(url),
    );
  }

  /// Mở dialog preview full-screen.
  Future<void> _openFilePreview({
    required String title,
    required _FilePreviewSource preview,
  }) async {
    await showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (_) => _FilePreviewDialog(
        title: title,
        source: preview,
      ),
    );
  }

  /// Quyết định file đã upload có được phép xoá hay không — chỉ
  /// file do `currentUser` tạo (`CreatedBy` == `currentUser.code`).
  /// Trả `false` nếu chưa load được `currentUser`.
  bool _canDeleteExistingFile(BookingGuestHouseFileItem item) {
    final userCode = _currentUser?.code.trim();
    if (userCode == null || userCode.isEmpty) return false;
    final createdBy = (item.createdBy ?? '').trim();
    if (createdBy.isEmpty) return false;
    return createdBy == userCode;
  }

  /// Handler khi user nhấn nút xoá trên file đã upload. UI đã đảm
  /// bảo chỉ gọi cho file của `currentUser` (ẩn nút 🗑️ cho file
  /// của người khác) — nhưng vẫn check lại 1 lần ở đây (defense in
  /// depth) trước khi dispatch event.
  void _onRemoveExistingFile(BookingGuestHouseFileItem item) {
    if (item.id == null || item.id! <= 0) return;
    if (!_canDeleteExistingFile(item)) {
      context.showMessage(
        'Bạn chỉ được xoá file do chính bạn upload',
        type: SnackBarType.error,
      );
      return;
    }
    context.read<BookingGuestHouseBloc>().add(
          BookingGuestHouseEvent.removeFile(
            fileId: item.id!,
            accommodationBookingId: widget.id,
          ),
        );
  }

  /// Xoá file mới (chưa upload) khỏi danh sách — không cần xác nhận
  /// vì chỉ là thao tác trên state local (chưa gửi BE).
  void _removeInvoiceAt(int index) =>
      _removeAt(_invoiceFiles, index, onUpdate: (v) => _invoiceFiles = v);
  void _removeBillCkAt(int index) =>
      _removeAt(_billCkFiles, index, onUpdate: (v) => _billCkFiles = v);

  void _removeAt(
    List<PlatformFile> source,
    int index, {
    required void Function(List<PlatformFile>) onUpdate,
  }) {
    if (index < 0 || index >= source.length) return;
    final next = [...source]..removeAt(index);
    setState(() => onUpdate(next));
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

    final totalAmount = _amountValue(_totalAmountCtrl.text);
    if (totalAmount == null || totalAmount <= 0) {
      context.showMessage(
        'Số tiền tổng không hợp lệ',
        type: SnackBarType.error,
      );
      return;
    }

    final totalWithInvoice = _amountValue(_totalWithInvoiceCtrl.text);
    if (totalWithInvoice == null || totalWithInvoice <= 0) {
      context.showMessage(
        'Số tiền có hóa đơn không hợp lệ',
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
    final companyId = _companySelected?.id ?? _currentUser?.taxCompanyId;

    //---(Dispatch event thuần — bloc tự build payload + validate +
    //    resolve currentUser.)---//
    context.read<BookingGuestHouseBloc>().add(
      BookingGuestHouseEvent.submitSettlementForm(
        accommodationBookingId: widget.id,
        totalAmount: totalAmount,
        totalAmountWithInvoice: totalWithInvoice,
        invoiceNumber: _invoiceCtrl.text.trim(),
        bankAccount: _bankAccountCtrl.text.trim(),
        bankListId: bank.id ?? 0,
        bankName: _bankNameCtrl.text.trim(),
        transferType: _transferType.value,
        approvedTbpId: _tbpSelected?.id,
        reason: _reasonCtrl.text.trim(),
        projectId: _projectSelected?.id,
        companyId: companyId,
        companyName: _companyCtrl.text.trim(),
        departmentName: _departmentCtrl.text.trim(),
        note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
        hotelName: _hotelCtrl.text.trim(),
        hotelTaxCode: _hotelMstCtrl.text.trim(),
        invoiceFiles: _invoiceFiles,
        billCkFiles: _billCkFiles,
      ),
    );
  }

  /// Parse text "x.xxx.xxx" → int. Trả `null` nếu không parse được.
  int? _amountValue(String text) {
    final digits = _parseVndToDigits(text);
    if (digits.isEmpty) return null;
    return int.tryParse(digits);
  }

  /// Format `num` (vd `1111111.00`) → chuỗi "x.xxx.xxx" để hiển thị
  /// trong TextField (match `ThousandsInputFormatter`). Nếu [value] =
  /// null/0/âm → trả chuỗi rỗng.
  String _formatThousands(num? value) {
    if (value == null) return '';
    final n = value.toInt();
    if (n <= 0) return '';
    final s = n.toString();
    final buf = StringBuffer();
    final len = s.length;
    for (var i = 0; i < len; i++) {
      if (i > 0 && (len - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return buf.toString();
  }

  /// Pre-fill form từ chi tiết TTQT trả về từ API
  /// `GET /AccommodationBookingPaymentOrder/get-detail-by-booking-id?accommodationBookingId=<id>`.
  /// Chỉ chạy 1 lần (được guard bằng `_prefilledPayment`).
  ///
  /// Điều kiện: `detailStatus` khác 0/null — tức là BE đã có dữ liệu
  /// TTQT từ trước (2 = chờ duyệt file, 3 = file đã duyệt, 4 = đã tạo
  /// ĐNTT, 5 = yêu cầu bổ sung...). Trường hợp 0/null (= chưa có
  /// TTQT) → KHÔNG fill, để form rỗng cho user tự nhập mới.
  ///
  /// Mapping các field của `BookingGuestHousePaymentDetailItem`:
  /// - totalAmount / totalAmountWithInvoice → 2 ô tiền
  /// - invoiceNumber → "Số hóa đơn"
  /// - reason → "Lý do quyết toán"
  /// - note → "Ghi chú"
  /// - approvedTbpId → TBP (match trong state.employees → set
  ///   `_tbpSelected`; fallback lookup bằng id, nếu không có thì để
  ///   user tự chọn)
  /// - bankName / bankListId / bankAccount → ngân hàng + số TK
  ///   (match trong state.banks → set `_bankSelected`)
  /// - hotelName / companyName / companyId → "Khách sạn" / "Công ty"
  ///   (match state.taxCompanies → set `_companySelected`)
  /// - files → đếm theo `FileType` (INVOICE / BILL_CK) để hiển thị
  ///   hint "(đã có N file)" — không tự load nội dung file cũ về.
  void _prefillFromPayment(
    BookingGuestHousePaymentDetailItem detail,
    BookingGuestHouseState state,
  ) {
    if (_prefilledPayment) return;
    final s = detail.detailStatus;
    if (s == null || s == 0) return;
    _prefilledPayment = true;

    //---(TBP)---//
    final tbpId = detail.approvedTbpId;
    if (tbpId != null && tbpId > 0 && state.employees.isNotEmpty) {
      final t = state.employees.firstWhereOrNull((e) => e.id == tbpId);
      if (t != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _tbpSelected = t;
          _tbpCtrl.text = t.fullName ?? '';
        });
      }
    }

    //---(Công ty)---//
    final companyId = detail.companyId;
    if (companyId != null && companyId > 0 && state.taxCompanies.isNotEmpty) {
      final c = state.taxCompanies.firstWhereOrNull(
        (e) => e.id == companyId,
      );
      if (c != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _companySelected = c;
          _companyCtrl.text = (c.name ?? '').trim().isNotEmpty
              ? c.name!.trim()
              : (detail.companyName ?? '').trim();
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _companyCtrl.text = (detail.companyName ?? '').trim();
        });
      }
    } else if ((detail.companyName ?? '').trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _companyCtrl.text = detail.companyName!.trim();
      });
    }

    //---(Ngân hàng + số TK)---//
    final bankName = (detail.bankName ?? '').trim();
    final bankListId = detail.bankListId;
    if (bankListId != null && bankListId > 0 && state.banks.isNotEmpty) {
      final b = state.banks.firstWhereOrNull((e) => e.id == bankListId);
      if (b != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _bankSelected = b;
          _bankNameCtrl.text = (b.bankName ?? '').trim();
        });
      } else if (bankName.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _bankNameCtrl.text = bankName;
        });
      }
    } else if (bankName.isNotEmpty && state.banks.isNotEmpty) {
      // Fallback: match theo tên (không phân biệt hoa thường) khi không
      // có bankListId hợp lệ.
      final b = state.banks.firstWhereOrNull(
        (e) =>
            (e.bankName ?? '').trim().toLowerCase() ==
            bankName.toLowerCase(),
      );
      if (b != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _bankSelected = b;
          _bankNameCtrl.text = (b.bankName ?? '').trim();
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _bankNameCtrl.text = bankName;
        });
      }
    } else if (bankName.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _bankNameCtrl.text = bankName;
      });
    }
    final bankAcc = (detail.bankAccount ?? '').trim();
    if (bankAcc.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _bankAccountCtrl.text = bankAcc;
      });
    }

    //---(Số hóa đơn)---//
    final inv = (detail.invoiceNumber ?? '').trim();
    if (inv.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _invoiceCtrl.text = inv;
      });
    }

    //---(2 ô tiền)---//
    final totalStr = _formatThousands(detail.totalAmount);
    if (totalStr.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _totalAmountCtrl.text = totalStr;
      });
    }
    final withInvStr = _formatThousands(detail.totalAmountWithInvoice);
    if (withInvStr.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _totalWithInvoiceCtrl.text = withInvStr;
      });
    }

    //---(Lý do quyết toán)---//
    final reason = (detail.reason ?? '').trim();
    if (reason.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _reasonCtrl.text = reason;
      });
    }

    //---(Ghi chú)---//
    final note = (detail.note ?? '').trim();
    if (note.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _noteCtrl.text = note;
      });
    }

    //---(Tên khách sạn)---//
    final hotel = (detail.hotelName ?? '').trim();
    if (hotel.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _hotelCtrl.text = hotel;
      });
    }

    //---(MST khách sạn)---//
    final hotelMst = (detail.hotelTaxCode ?? '').trim();
    if (hotelMst.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _hotelMstCtrl.text = hotelMst;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingGuestHouseBloc, BookingGuestHouseState>(
      //---(Listen khi state thay đổi: show lỗi / snackbar success / reset.)---//
      listenWhen: (prev, curr) =>
          (prev.detailData != curr.detailData && curr.detailData != null) ||
          (prev.detailMessage != curr.detailMessage &&
              curr.detailMessage != null) ||
          //---(Pre-fill khi `paymentDetail` mới load xong)---//
          (prev.paymentDetail != curr.paymentDetail) ||
          (prev.paymentDetailMessage != curr.paymentDetailMessage &&
              curr.paymentDetailMessage != null) ||
          //---(Success → show toast + clear + pop)---//
          (!prev.settlementSuccess && curr.settlementSuccess) ||
          //---(Remove file success / fail)---//
          (!prev.removeFileSuccess && curr.removeFileSuccess) ||
          (prev.removeFileMessage != curr.removeFileMessage &&
              curr.removeFileMessage != null) ||
          //---(Submit fail)---//
          (prev.isSubmittingSettlement &&
              !curr.isSubmittingSettlement &&
              !curr.settlementSuccess &&
              (curr.message ?? '').isNotEmpty),
      listener: (context, state) {
        if (state.detailMessage != null && state.detailMessage!.isNotEmpty) {
          context.showMessage(state.detailMessage!, type: SnackBarType.error);
        }
        // Fill lý do mặc định ngay khi detail vừa load xong (chỉ fill khi
        // controller rỗng — tránh đè value user đang gõ).
        if (state.detailData != null && _reasonCtrl.text.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _reasonCtrl.text = _defaultReasonText(state.detailData!.info);
          });
        }

        //---(Pre-fill form từ `state.paymentDetail` (API
        //    `get-detail-by-booking-id` trả về) khi
        //    `paymentDetail.detailStatus` khác 0/null — tức BE đã có
        //    dữ liệu TTQT (status 2/3/4/5). Chỉ fill 1 lần
        //    (guard bằng `_prefilledPayment`) tránh đè value user;
        //    status 0/null = chưa có TTQT → giữ form rỗng cho user
        //    tự nhập mới.)---//
        if (state.paymentDetail != null && !_prefilledPayment) {
          _prefillFromPayment(state.paymentDetail!, state);
        }

        //---(Show lỗi load payment detail nếu có)---//
        if (state.paymentDetailMessage != null &&
            state.paymentDetailMessage!.isNotEmpty) {
          context.showMessage(
            state.paymentDetailMessage!,
            type: SnackBarType.error,
          );
        }

        //---(Submit success → show toast + clear state + pop.)---//
        // Có 2 trường hợp:
        // 1. Cả save-detail + upload file OK → success đơn thuần.
        // 2. Save-detail OK nhưng có file upload fail → success + warning
        //    (`state.settlementMessage` không rỗng). UI hiển thị cả
        //    2 snackbar (success trước, warning sau).
        if (state.settlementSuccess) {
          final res = state.lastSettlementResponse;
          final id = res?.id;
          final successMsg = (state.message ?? '').trim().isNotEmpty
              ? state.message!.trim()
              : (id != null
                  ? 'Lưu cập nhật TTQT thành công (#$id) — chờ duyệt'
                  : 'Lưu cập nhật TTQT thành công — chờ duyệt');
          context.showMessage(successMsg, type: SnackBarType.success);

          final warn = (state.settlementMessage ?? '').trim();
          if (warn.isNotEmpty) {
            // delay nhỏ để 2 snackbar không đè lên nhau.
            Future<void>.delayed(const Duration(milliseconds: 350), () {
              if (!context.mounted) return;
              context.showMessage(warn, type: SnackBarType.info);
            });
          }

          // Clear cờ để lần sau mở lại màn thấy form sạch.
          context
              .read<BookingGuestHouseBloc>()
              .add(const BookingGuestHouseEvent.clearSettlementSubmitState());
          if (context.canPop()) context.pop();
        }

        //---(Submit fail)---//
        if (state.message != null &&
            state.message!.isNotEmpty &&
            !state.settlementSuccess &&
            !state.isSubmittingSettlement) {
          context.showMessage(
            state.message!,
            type: SnackBarType.error,
          );
        }

        //---(Remove file success)---//
        if (state.removeFileSuccess) {
          context.showMessage(
            'Đã xoá file đính kèm',
            type: SnackBarType.success,
          );
          context
              .read<BookingGuestHouseBloc>()
              .add(const BookingGuestHouseEvent.clearRemoveFileState());
        }

        //---(Remove file fail)---//
        if (state.removeFileMessage != null &&
            state.removeFileMessage!.isNotEmpty &&
            !state.removeFileSuccess &&
            !state.isRemovingFile) {
          context.showMessage(
            state.removeFileMessage!,
            type: SnackBarType.error,
          );
        }
      },
      //---(Build UI từ state)---//
      buildWhen: (prev, curr) =>
          prev.isDetailLoading != curr.isDetailLoading ||
          prev.detailData != curr.detailData ||
          prev.detailMessage != curr.detailMessage ||
          prev.paymentDetail != curr.paymentDetail ||
          prev.isLoadingPaymentDetail != curr.isLoadingPaymentDetail ||
          prev.isSubmittingSettlement != curr.isSubmittingSettlement,
      builder: (context, state) {
        final detail = state.detailData;
        final isLoading = state.isDetailLoading && detail == null;
        final errorMsg = (detail == null && !isLoading)
            ? state.detailMessage
            : null;
        final paymentDetail = state.paymentDetail;

        return Scaffold(
          backgroundColor: const Color(0xFFF0F2F5),
          appBar: AppBarCommon(
            title: const Text('Cập nhật quyết toán'),
            onBackTap: () => context.pop(),
          ),
          // Dismiss keyboard khi user tap ra ngoài field text/number —
          // giống `advance_request_screen` để UX đồng bộ giữa 2 màn.
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: _buildBody(
              isLoading: isLoading,
              errorMsg: errorMsg,
              detail: detail,
              paymentDetail: paymentDetail,
            ),
          ),
          bottomNavigationBar: _buildBottomBar(),
        );
      },
    );
  }

  /// Lấy danh sách file đính kèm cũ theo loại trong
  /// `paymentDetail.files`. Dùng cho cả đếm (`oldCount`) lẫn hiển thị
  /// danh sách "đã upload" với nút xem.
  List<BookingGuestHouseFileItem> _existingFilesOfType(String type) {
    final files = _paymentDetailFiles();
    if (files == null || files.isEmpty) return const [];
    final t = type.toLowerCase();
    return files
        .where((f) => (f.fileType ?? '').toLowerCase() == t)
        .toList(growable: false);
  }

  /// Lấy danh sách file đính kèm từ `state.paymentDetail` (current
  /// snapshot trong builder). Trả null nếu chưa load.
  List<BookingGuestHouseFileItem>? _paymentDetailFiles() {
    return context.read<BookingGuestHouseBloc>().state.paymentDetail?.files;
  }

  /// Build URL tuyệt đối từ `rawPath` trong `BookingGuestHouseFileItem`.
  /// - Nếu đã là `http(s)://` → trả nguyên.
  /// - Nếu là relative path → nối với `AppConfig.baseUrl`.
  /// - Nếu rỗng / null → trả null.
  ///
  /// Hỗ trợ cả 2 dạng path mà BE có thể trả về:
  /// - `Url` (URL đầy đủ) — ưu tiên 1.
  /// - `FilePath` (relative path lưu trên server).
  String? _resolveRemoteFileUrl(BookingGuestHouseFileItem f) {
    final raw = (f.url?.trim().isNotEmpty == true)
        ? f.url!.trim()
        : (f.filePath?.trim() ?? '');
    if (raw.isEmpty) return null;
    if (raw.startsWith('http://') || raw.startsWith('https://')) return raw;

    var base = AppConfig.baseUrl.trim();
    if (base.endsWith('/')) {
      base = base.substring(0, base.length - 1);
    }
    final normalized = raw.replaceAll('\\', '/');
    if (normalized.startsWith('/')) {
      return '$base$normalized';
    }
    return '$base/$normalized';
  }

  Widget _buildBody({
    required bool isLoading,
    required String? errorMsg,
    required BookingGuestHouseDetailData? detail,
    required BookingGuestHousePaymentDetailItem? paymentDetail,
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
                            // Defer gán controller ra sau build phase để
                            // tránh `setState during build`.
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!mounted) return;
                              _projectSelected = p;
                              _projectCtrl.text = (p.projectCode ?? '')
                                      .isNotEmpty
                                  ? '${p.projectCode} - ${p.projectName ?? ''}'
                                  : (p.projectName ?? '');
                            });
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
                      // Defer gán controller ra sau build phase — gán
                      // trực tiếp trong builder sẽ trigger
                      // `FormState._fieldDidChange` → setState trong
                      // build → exception (xem
                      // `FormState._forceRebuild`).
                      if (detail.info.approvedTBP != null &&
                          _tbpCtrl.text.isEmpty) {
                        final name = _resolveTbpName(
                          detail.info.approvedTBP,
                          state.employees,
                        );
                        if (name != null) {
                          final emp = state.employees.firstWhereOrNull(
                            (e) => e.id == detail.info.approvedTBP,
                          );
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (!mounted) return;
                            _tbpCtrl.text = name;
                            // Lưu lại employee đã chọn để
                            // initialSelectedItem đúng khi mở bottom
                            // sheet.
                            _tbpSelected ??= emp;
                          });
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

                  //---(4. Công ty — auto-fill từ currentUser.TaxCompanyID lookup
                  //    state.taxCompanies. ReadOnly + không cho mở picker
                  //    (lấy cứng từ tài khoản đang đăng nhập).)---//
                  BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
                    buildWhen: (prev, curr) =>
                        prev.taxCompanies != curr.taxCompanies,
                    builder: (context, state) {
                      // Defer gán controller ra sau build phase — gán
                      // trực tiếp trong builder sẽ trigger
                      // `FormState._fieldDidChange` → setState trong
                      // build → exception.
                      if (_companySelected == null &&
                          _currentUser != null &&
                          state.taxCompanies.isNotEmpty) {
                        final matched = state.taxCompanies.firstWhereOrNull(
                          (c) => c.id == _currentUser!.taxCompanyId,
                        );
                        if (matched != null) {
                          // Chỉ map `name` (tên viết tắt), bỏ qua `fullName`.
                          final name = (matched.name ?? '').trim();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (!mounted) return;
                            _companySelected = matched;
                            _companyCtrl.text = name;
                          });
                        }
                      }
                      return FormInputField(
                        nameForm: 'payment_company',
                        nameTextField: 'payment_company_text',
                        label: 'Công ty',
                        icon: Icons.business_outlined,
                        controller: _companyCtrl,
                        isRequired: true,
                        // Lấy cứng từ tài khoản → không cho user sửa hay mở
                        // picker chọn lại.
                        enabled: false,
                        readOnly: true,
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Vui lòng chọn công ty'
                            : null,
                      );
                    },
                  ),

                  const SizedBox(height: 12),
                  //---(11. Bộ phận — auto-fill từ currentUser.DepartmentName,
                  //    vẫn cho sửa nếu cần override.)---//
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


                  //---(5. Tổng tiền — isRequired, format "x.xxx.xxx" do
                  //    ThousandsInputFormatter áp dụng ngay khi user gõ.
                  //    Đơn vị "VNĐ" hiển thị ở suffixIcon, không chèn vào
                  //    text. Tránh set controller trong onChanged gây
                  //    StackOverflow với FormBuilder.)---//
                  FormInputField(
                    nameForm: 'payment_total',
                    nameTextField: 'payment_total_text',
                    label: 'Tổng tiền',
                    icon: Icons.payments_outlined,
                    controller: _totalAmountCtrl,
                    isRequired: true,
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
                        return 'Vui lòng nhập tổng tiền';
                      }
                      if (_parseVndToDigits(v).isEmpty) {
                        return 'Tổng tiền không hợp lệ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  //---(6. Tổng tiền có HĐ — isRequired, format tương tự
                  //    field (5).)---//
                  FormInputField(
                    nameForm: 'payment_total_with_invoice',
                    nameTextField: 'payment_total_with_invoice_text',
                    label: 'Tổng tiền có HĐ',
                    icon: Icons.receipt_outlined,
                    controller: _totalWithInvoiceCtrl,
                    isRequired: true,
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
                        return 'Vui lòng nhập tổng tiền có HĐ';
                      }
                      if (_parseVndToDigits(v).isEmpty) {
                        return 'Tổng tiền có HĐ không hợp lệ';
                      }
                      return null;
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

                  //---(8. Hình thức CK — chỉ hỗ trợ "Chuyển khoản cá nhân"
                  //    (value = 1). Vẫn dùng `openSelectBottomSheet` cho
                  //    đồng bộ UX, dù danh sách chỉ có 1 phần tử.)---//
                  FormInputField(
                    nameForm: 'payment_transfer_type',
                    nameTextField: 'payment_transfer_type_text',
                    label: 'Hình thức CK',
                    icon: Icons.swap_horiz,
                    controller: _transferTypeCtrl,
                    isRequired: true,
                    readOnly: true,
                    onTap: _pickTransferType,
                    validator: (v) => v == null || v.trim().isEmpty
                        ? 'Vui lòng chọn hình thức CK'
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

                  //---(12. Số tài khoản — isRequired)---//
                  FormInputField(
                    nameForm: 'payment_bank_account',
                    nameTextField: 'payment_bank_account_text',
                    label: 'Số tài khoản',
                    icon: Icons.account_balance_outlined,
                    controller: _bankAccountCtrl,
                    isRequired: true,
                    keyboardType: TextInputType.text,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Vui lòng nhập số tài khoản';
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
            child: BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
              buildWhen: (prev, curr) =>
                  prev.isRemovingFile != curr.isRemovingFile ||
                  prev.removingFileId != curr.removingFileId ||
                  prev.paymentDetail != curr.paymentDetail,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FilePickerTile(
                      icon: Icons.description_outlined,
                      label: 'File hoá đơn',
                      files: _invoiceFiles,
                      onPick: _pickInvoiceFiles,
                      existingFiles: _existingFilesOfType('INVOICE'),
                      onViewNew: _viewNewInvoiceFile,
                      onRemoveNew: _removeInvoiceAt,
                      onViewExisting: _viewExistingFile,
                      canDeleteExistingFile: _canDeleteExistingFile,
                      onRemoveExisting: _onRemoveExistingFile,
                      isRemovingId: state.isRemovingFile
                          ? state.removingFileId
                          : null,
                    ),
                    const SizedBox(height: 12),
                    _FilePickerTile(
                      icon: Icons.receipt_outlined,
                      label: 'File bill chuyển khoản',
                      files: _billCkFiles,
                      onPick: _pickBillCkFiles,
                      existingFiles: _existingFilesOfType('BILL_CK'),
                      onViewNew: _viewNewBillCkFile,
                      onRemoveNew: _removeBillCkAt,
                      onViewExisting: _viewExistingFile,
                      canDeleteExistingFile: _canDeleteExistingFile,
                      onRemoveExisting: _onRemoveExistingFile,
                      isRemovingId: state.isRemovingFile
                          ? state.removingFileId
                          : null,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
      buildWhen: (prev, curr) =>
          prev.isSubmittingSettlement != curr.isSubmittingSettlement,
      builder: (context, state) {
        final isSubmitting = state.isSubmittingSettlement;
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

//---(Chọn nguồn file: ảnh từ camera/gallery hay FilePicker đa năng)---//

/// Nguồn file user chọn ở bottom sheet.
enum _FileSource {
  /// Mở camera chụp ảnh (1 ảnh).
  camera,

  /// Mở thư viện chọn nhiều ảnh.
  gallery,

  /// Mở FilePicker đa năng (PDF / ảnh / excel theo extension rule).
  files,
}

/// Bottom sheet cho phép user chọn giữa 3 nguồn: camera, thư viện
/// ảnh, hoặc FilePicker đa năng. Trả về `_FileSource` qua
/// `Navigator.pop`. Trả `null` nếu user dismiss.
class _FileSourceBottomSheet extends StatelessWidget {
  const _FileSourceBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Chọn file',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryERP,
                ),
              ),
              title: const Text('Chụp ảnh'),
              subtitle: const Text('Mở camera để chụp ảnh'),
              onTap: () =>
                  Navigator.of(context).pop(_FileSource.camera),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.photo_library_outlined,
                  color: Colors.orange,
                ),
              ),
              title: const Text('Chọn ảnh từ thư viện'),
              subtitle: const Text('Chọn ảnh có sẵn trên thiết bị'),
              onTap: () =>
                  Navigator.of(context).pop(_FileSource.gallery),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  color: Colors.blue,
                ),
              ),
              title: const Text('Chọn file (PDF / excel)'),
              subtitle: const Text('Chọn nhiều định dạng'),
              onTap: () =>
                  Navigator.of(context).pop(_FileSource.files),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

//---(File preview dialog)---//

/// Nguồn preview file:
/// - [localPath]: file mới user vừa chọn (chưa upload) — mở bằng
///   `Image.file` nếu là ảnh, hoặc `WebView` nếu là PDF.
/// - [remoteUrl]: file đã upload (lưu trên server) — luôn dùng
///   `WebView` (ảnh load thẳng trong WebView, PDF dùng Google Docs
///   viewer hoặc native PDF viewer của WebView).
class _FilePreviewSource {
  const _FilePreviewSource.local(this.localPath) : remoteUrl = null;
  const _FilePreviewSource.remote(this.remoteUrl) : localPath = null;

  final String? localPath;
  final String? remoteUrl;

  bool get isLocal => localPath != null;
  bool get isRemote => remoteUrl != null;
}

/// Dialog xem trước file: ảnh dùng `Image.file` (chất lượng gốc,
/// zoom/pan native), PDF/file dùng `WebView` (load URL).
class _FilePreviewDialog extends StatefulWidget {
  const _FilePreviewDialog({
    required this.title,
    required this.source,
  });

  final String title;
  final _FilePreviewSource source;

  @override
  State<_FilePreviewDialog> createState() => _FilePreviewDialogState();
}

class _FilePreviewDialogState extends State<_FilePreviewDialog> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black);
    if (widget.source.isRemote) {
      _controller.loadRequest(Uri.parse(widget.source.remoteUrl!));
    }
  }

  /// Đoán định dạng theo extension — ảnh thì trả true để dùng
  /// `Image.file`, ngược lại dùng `WebView` (PDF / unknown).
  bool _isImagePath(String path) {
    final p = path.toLowerCase();
    return p.endsWith('.png') ||
        p.endsWith('.jpg') ||
        p.endsWith('.jpeg') ||
        p.endsWith('.webp') ||
        p.endsWith('.heic') ||
        p.endsWith('.bmp') ||
        p.endsWith('.gif');
  }

  @override
  Widget build(BuildContext context) {
    final src = widget.source;
    Widget body;
    if (src.isLocal) {
      final path = src.localPath!;
      if (_isImagePath(path)) {
        body = InteractiveViewer(
          minScale: 1,
          maxScale: 5,
          child: Center(
            child: Image.file(
              File(path),
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const _PreviewError(
                message: 'Không đọc được ảnh',
              ),
            ),
          ),
        );
      } else {
        // PDF / file khác — WebView hỗ trợ mở local file qua
        // `file://` URL.
        _controller.loadRequest(Uri.parse('file://$path'));
        body = const WebViewWidgetPlaceholder();
      }
    } else {
      body = WebViewWidget(controller: _controller);
    }

    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(child: ColoredBox(color: Colors.black, child: body)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Placeholder khi WebView chưa sẵn sàng (initState load sau frame
/// đầu) — tránh crash nếu build sớm.
class WebViewWidgetPlaceholder extends StatelessWidget {
  const WebViewWidgetPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}

class _PreviewError extends StatelessWidget {
  const _PreviewError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 48),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 14),
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
    required this.onPick,
    this.existingFiles = const <BookingGuestHouseFileItem>[],
    this.onViewNew,
    this.onRemoveNew,
    this.onViewExisting,
    this.canDeleteExistingFile,
    this.onRemoveExisting,
    this.isRemovingId,
  });

  final IconData icon;
  final String label;
  final List<PlatformFile> files;
  final VoidCallback onPick;

  /// Danh sách file đính kèm cũ đã upload từ lần lưu TTQT trước
  /// (filter theo `FileType` ở caller). Hiển thị riêng ở section
  /// "Đã upload" với nút xem.
  final List<BookingGuestHouseFileItem> existingFiles;

  /// Xem file mới tại index — mở `_FilePreviewDialog` (local path).
  final void Function(int index)? onViewNew;

  /// Xoá file mới tại index — gọi từ UI trước khi lưu.
  final void Function(int index)? onRemoveNew;

  /// Xem file đã upload (URL remote).
  final void Function(BookingGuestHouseFileItem item)? onViewExisting;

  /// Quyết định file cũ nào được phép xoá (vd chỉ file do
  /// `currentUser` tạo). Nếu `true` → hiện nút xoá; nếu `false`
  /// hoặc `null` → chỉ hiện nút xem. Gắn với [onRemoveExisting].
  final bool Function(BookingGuestHouseFileItem item)? canDeleteExistingFile;

  /// Xoá file đã upload — caller quyết định rule (vd chỉ file của
  /// `currentUser`). Handler gọi API xoá rồi cập nhật lại danh sách
  /// trong `state.paymentDetail.files`.
  final void Function(BookingGuestHouseFileItem item)? onRemoveExisting;

  /// ID file đang được xoá (đang chờ API) — nếu trùng với `f.id`
  /// trong list, hiển thị spinner thay icon xoá.
  final int? isRemovingId;

  @override
  Widget build(BuildContext context) {
    final hasNewFiles = files.isNotEmpty;
    final hasExistingFiles = existingFiles.isNotEmpty;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                        _buildSummary(),
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
            if (hasNewFiles) ...[
              const SizedBox(height: 12),
              _SectionLabel(
                text: 'File mới (${files.length})',
                color: AppColors.primaryERP,
              ),
              const SizedBox(height: 6),
              ...List.generate(files.length, (i) {
                final f = files[i];
                return _FileChip(
                  name: f.name,
                  sizeBytes: f.size,
                  onView: onViewNew == null ? null : () => onViewNew!(i),
                  onRemove: onRemoveNew == null
                      ? null
                      : () => onRemoveNew!(i),
                );
              }),
            ],
            if (hasExistingFiles) ...[
              const SizedBox(height: 6),
              ...existingFiles.map((f) {
                final canDelete = canDeleteExistingFile?.call(f) ?? false;
                final removing = isRemovingId != null && f.id == isRemovingId;
                return _FileChip(
                  name: f.fileName ?? 'File không tên',
                  sizeBytes: f.fileSize,
                  onView: onViewExisting == null
                      ? null
                      : () => onViewExisting!(f),
                  onRemove: (canDelete && onRemoveExisting != null)
                      ? () => onRemoveExisting!(f)
                      : null,
                  isRemoving: removing,
                );
              }),
            ],
          ],
        ),
      ),
    );
  }

  String _buildSummary() {
    final parts = <String>[];
    if (files.isNotEmpty) {
      parts.add('${files.length} file mới');
    } else {
      parts.add('Chưa có file mới');
    }
    if (existingFiles.isNotEmpty) {
      parts.add('đã có ${existingFiles.length} file');
    }
    return parts.join(' • ');
  }
}

/// Label nhỏ phân section trong `_FilePickerTile`.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

/// 1 dòng hiển thị file trong `_FilePickerTile` — có tên + size +
/// nút xem / xoá. Tự disable nút tương ứng nếu callback null hoặc
/// đang loading.
class _FileChip extends StatelessWidget {
  const _FileChip({
    required this.name,
    required this.onView,
    required this.onRemove,
    this.sizeBytes,
    this.isRemoving = false,
  });

  final String name;
  final int? sizeBytes;
  final VoidCallback? onView;
  final VoidCallback? onRemove;

  /// `true` khi file đang trong quá trình xoá (API call) — disable
  /// nút xoá, hiển thị spinner nhỏ thay icon thùng rác.
  final bool isRemoving;

  String _formatSize(int? bytes) {
    if (bytes == null || bytes <= 0) return '';
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE5EAF3)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.insert_drive_file_outlined,
              size: 18,
              color: AppColors.gray,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                    ),
                  ),
                  if (sizeBytes != null && sizeBytes! > 0)
                    Text(
                      _formatSize(sizeBytes),
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.gray,
                      ),
                    ),
                ],
              ),
            ),
            if (onView != null)
              IconButton(
                onPressed: onView,
                icon: const Icon(Icons.visibility_outlined, size: 20),
                color: AppColors.primaryERP,
                tooltip: 'Xem file',
                visualDensity: VisualDensity.compact,
              ),
            if (onRemove != null)
              SizedBox(
                width: 40,
                height: 40,
                child: isRemoving
                    ? const Center(
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red,
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: onRemove,
                        icon: const Icon(Icons.delete_outline, size: 20),
                        color: Colors.red.shade600,
                        tooltip: 'Xoá file',
                        visualDensity: VisualDensity.compact,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
