import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../features/auth/data/repository/auth_repo.dart';
import '../../../../../../../../../features/workplace/app/reg_general/view/pages/booking_guest_house/data/datasource/models/booking_guest_house_form_shift.dart';
import '../../../../../../../../../features/workplace/app/reg_general/view/pages/booking_guest_house/data/datasource/models/booking_guest_house_model.dart';
import '../../../../../../../../../features/workplace/app/reg_general/view/pages/booking_guest_house/data/repository/booking_guest_house_repo.dart';
import 'package:get_it/get_it.dart';

import '../bloc/booking_guest_house_bloc.dart';
import '../widgets/roommate_info_item.dart';

class BookingGuestHouseAddScreen extends StatefulWidget {
  const BookingGuestHouseAddScreen({super.key});

  @override
  State<BookingGuestHouseAddScreen> createState() =>
      _BookingGuestHouseAddScreenState();
}

class _BookingGuestHouseAddScreenState
    extends
        BaseState<
          BookingGuestHouseAddScreen,
          BookingGuestHouseEvent,
          BookingGuestHouseState,
          BookingGuestHouseBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  //---(Controllers cho các field read-only do chọn từ picker/sheet)---//
  // Hiển thị trong FormInputField + dùng để FormBuilder validator đọc value.
  final _startDateCtrl = TextEditingController();
  final _endDateCtrl = TextEditingController();
  final _projectCtrl = TextEditingController();
  final _tbpCtrl = TextEditingController();
  final _provinceCtrl = TextEditingController();

  //---(Lookup data)---//
  List<ProjectFilterItem> _projects = const [];
  List<EmployeeFilterItem> _employees = const [];
  List<ProvinceFilterItem> _provinces = const [];
  bool _loadingLookups = false;

  //---(Current user dùng để auto-fill người ở 1 + RegisterID payload)---//
  /// EmployeeID của user đang đăng nhập — dùng làm `RegisterID` trong payload.
  int? _currentEmployeeId;

  //---(Form state — Card 1)---//
  // DateTime/Object state vẫn giữ để build payload; FormInputField chỉ là
  // UI cho value text.
  ProjectFilterItem? _selectedProject;
  EmployeeFilterItem? _selectedTbp; // TBP duyệt
  ProvinceFilterItem? _selectedProvince;
  DateTime? _startDate;
  DateTime? _endDate;

  //---(Form state — Card 2: list người ở)---//
  // Pattern theo booking_vehicle: source-of-truth là FormBuilder values
  // (infoFieldValues) + EmployeeFilterItem? cho mỗi dòng (đã chọn nhân viên hay
  // chưa). Không còn _RoommateDraft riêng.
  int _roommateLineCount = 1;

  /// Map lưu EmployeeFilterItem đã chọn cho từng dòng (null = chưa chọn/nhập tay).
  final Map<int, EmployeeFilterItem?> _selectedRoommateEmployees = {0: null};

  /// Map các giá trị hiện tại của form để RoommateInfoItem hydrate khi rebuild.
  /// Key: 'roommate_*_$i' / 'roommate_*_text_$i'.
  Map<String, dynamic> _infoFieldValues = {};

  /// Tăng mỗi lần add/delete để force rebuild tất cả RoommateInfoItem.
  int _roommateFormGeneration = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadLookups();
      _loadCurrentUser();
    });
  }

  @override
  void dispose() {
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    _projectCtrl.dispose();
    _tbpCtrl.dispose();
    _provinceCtrl.dispose();
    super.dispose();
  }

  //---(Loaders)---//

  Future<void> _loadLookups() async {
    if (_loadingLookups) return;
    setState(() => _loadingLookups = true);
    final repo = GetIt.I<BookingGuestHouseRepo>();

    final projectsRes = await repo.getProjects();
    final employeesRes = await repo.getEmployees();
    final provincesRes = await repo.getProvinces();

    if (!mounted) return;
    setState(() {
      _projects = projectsRes.fold((_) => <ProjectFilterItem>[], (d) => d);
      _employees = employeesRes.fold((_) => <EmployeeFilterItem>[], (d) => d);
      _provinces = provincesRes.fold((_) => <ProvinceFilterItem>[], (d) => d);
      _loadingLookups = false;
    });
  }

  Future<void> _loadCurrentUser() async {
    final authRepo = GetIt.I<AuthRepo>();
    final res = await authRepo.getCurrentUser();
    if (!mounted) return;
    final user = res.getOrElse(() => null);
    if (user == null) return;

    // Lưu EmployeeID làm RegisterID cho payload.
    _currentEmployeeId = user.employeeId;

    // Gọi Employee API để lấy SĐT + phòng ban (User model không có).
    final repo = GetIt.I<BookingGuestHouseRepo>();
    final empRes = await repo.getEmployees(keyword: user.code);
    if (!mounted) return;
    final employees = empRes.fold((_) => <EmployeeFilterItem>[], (d) => d);

    // Ưu tiên match theo employeeId, fallback theo mã, sau đó theo tên.
    EmployeeFilterItem? matched = employees.firstWhereOrNull(
      (e) => e.id == user.employeeId,
    );
    matched ??= employees.firstWhereOrNull((e) => e.code == user.code);
    matched ??= employees.firstWhereOrNull((e) => e.fullName == user.fullName);

    if (_roommateLineCount < 1) return;

    // PatchValue cho dòng 0 (currentUser) trong cùng setState.
    // `roommate_roommate_name_0` phải có ở đây vì field "Tên người ở cùng" dùng
    // key riêng, không tự suy ra từ `roommate_full_name_0`.
    setState(() {
      _selectedRoommateEmployees[0] = matched;
      _infoFieldValues = {
        ..._infoFieldValues,
        'roommate_full_name_0': user.fullName,
        'roommate_full_name_text_0': user.fullName,
        'roommate_roommate_name_0': user.fullName,
        'roommate_roommate_name_text_0': user.fullName,
        'roommate_code_0': user.code,
        'roommate_code_text_0': user.code,
        'roommate_phone_0': matched?.sdtCaNhan ?? '',
        'roommate_phone_text_0': matched?.sdtCaNhan ?? '',
        'roommate_department_0': matched?.departmentName ?? '',
        'roommate_department_text_0': matched?.departmentName ?? '',
      };
    });

    _formKey.currentState?.patchValue({
      'roommate_full_name_0': user.fullName,
      'roommate_full_name_text_0': user.fullName,
      'roommate_roommate_name_0': user.fullName,
      'roommate_roommate_name_text_0': user.fullName,
      'roommate_code_0': user.code,
      'roommate_code_text_0': user.code,
      'roommate_phone_0': matched?.sdtCaNhan ?? '',
      'roommate_phone_text_0': matched?.sdtCaNhan ?? '',
      'roommate_department_0': matched?.departmentName ?? '',
      'roommate_department_text_0': matched?.departmentName ?? '',
    });
  }

  //---(UI)---//

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Đặt phòng nhà nghỉ'),
        onBackTap: () => context.pop(),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<BookingGuestHouseBloc, BookingGuestHouseState>(
            listenWhen: (prev, curr) =>
                prev.submitSuccess != curr.submitSuccess && curr.submitSuccess,
            listener: (context, state) {
              // Submit thành công → pop về màn list, list sẽ tự reload qua
              // BookingGuestHousePage.initState (đã chạy init() ngay khi vào).
              showMessage(
                context,
                state.lastSubmittedId != null
                    ? 'Lưu phiếu thành công (#${state.lastSubmittedId})'
                    : 'Lưu phiếu thành công',
                type: SnackBarType.success,
              );
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
          BlocListener<BookingGuestHouseBloc, BookingGuestHouseState>(
            listenWhen: (prev, curr) =>
                prev.isSubmitting != curr.isSubmitting &&
                curr.isSubmitting == false &&
                !curr.submitSuccess &&
                (curr.message ?? '').isNotEmpty,
            listener: (context, state) {
              showMessage(
                context,
                state.message ?? 'Lưu phiếu thất bại',
                type: SnackBarType.error,
              );
            },
          ),
        ],
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  children: [
                    _buildRegistrationCard(),
                    const SizedBox(height: 12),
                    _buildRoommateCard(),
                  ],
                ),
              ),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  //---(Card 1)---//

  Widget _buildRegistrationCard() {
    return FormCard(
      title: 'Thông tin đăng ký',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              FormInputField(
                nameForm: 'start_date',
                nameTextField: 'start_date_text',
                label: 'Ở từ ngày',
                icon: Icons.calendar_today_outlined,
                controller: _startDateCtrl,
                readOnly: true,
                isRequired: true,
                onTap: _pickStartDate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v == null || v.isEmpty
                    ? 'Chọn ngày ở'
                    : null,
              ),
              const SizedBox(height: 12),
              FormInputField(
                nameForm: 'end_date',
                nameTextField: 'end_date_text',
                label: 'Đến ngày',
                icon: Icons.calendar_today_outlined,
                controller: _endDateCtrl,
                readOnly: true,
                isRequired: true,
                onTap: _pickEndDate,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v == null || v.isEmpty
                    ? 'Chọn ngày về'
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 12),

          FormInputField(
            nameForm: 'project',
            nameTextField: 'project_text',
            label: 'Dự án',
            icon: Icons.account_tree_outlined,
            controller: _projectCtrl,
            readOnly: true,
            isRequired: true,
            onTap: _openProjectSheet,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => v == null || v.isEmpty
                ? 'Vui lòng chọn dự án'
                : null,
          ),
          const SizedBox(height: 12),

          FormInputField(
            nameForm: 'tbp',
            nameTextField: 'tbp_text',
            label: 'TBP Duyệt',
            icon: Icons.verified_user_outlined,
            controller: _tbpCtrl,
            readOnly: true,
            isRequired: true,
            onTap: _openTbpSheet,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => v == null || v.isEmpty
                ? 'Vui lòng chọn TBP duyệt'
                : null,
          ),
          const SizedBox(height: 12),

          FormInputField(
            nameForm: 'province',
            nameTextField: 'province_text',
            label: 'Tỉnh lưu trú',
            icon: Icons.location_city_outlined,
            controller: _provinceCtrl,
            readOnly: true,
            isRequired: true,
            onTap: _openProvinceSheet,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => v == null || v.isEmpty
                ? 'Vui lòng chọn tỉnh lưu trú'
                : null,
          ),
          const SizedBox(height: 12),

          FormInputField(
            nameForm: 'address',
            nameTextField: 'address_text',
            label: 'Địa chỉ cụ thể',
            icon: Icons.place_outlined,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            isRequired: true,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) =>
                v?.isNotEmpty == true ? null : 'Vui lòng nhập địa chỉ cụ thể',
          ),
          const SizedBox(height: 12),

          FormInputField(
            nameForm: 'note',
            nameTextField: 'note_text',
            label: 'Ghi chú',
            icon: Icons.note_outlined,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
          ),
        ],
      ),
    );
  }

  //---(Card 2)---//

  Widget _buildRoommateCard() {
    return FormCard(
      title: 'Thông tin người ở',
      actions: [
        TextButton.icon(
          onPressed: _addRoommate,
          icon: const Icon(Icons.add_circle_outline, size: 20),
          label: const Text('Thêm người ở'),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryERP,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < _roommateLineCount; i++) ...[
            _buildRoommateItem(index: i),
            if (i != _roommateLineCount - 1) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildRoommateItem({required int index}) {
    return RoommateInfoItem(
      key: ValueKey('roommate_${index}_$_roommateFormGeneration'),
      index: index,
      employeeOptions: _employees,
      infoFieldValues: _infoFieldValues,
      prefillEmployee: index == 0 ? _selectedRoommateEmployees[0] : null,
      onChanged: (patch) {
        if (!mounted) return;
        // Resolve EmployeeFilterItem từ employeeId vừa pick để dùng khi submit
        // (cần fullName / code / phone / department từ server).
        final pickedId = patch['roommate_employee_id_$index'] as int?;
        EmployeeFilterItem? resolvedEmployee;
        if (pickedId != null && pickedId > 0) {
          resolvedEmployee = _employees.firstWhereOrNull(
            (e) => e.id == pickedId,
          );
        }
        setState(() {
          _infoFieldValues = {..._infoFieldValues, ...patch};
          _selectedRoommateEmployees[index] = resolvedEmployee;
        });
      },
      // Chỉ cho phép xoá slip 1 trở đi — slip 0 luôn là currentUser.
      onRemove: index >= 1 ? () => _removeRoommate(index) : null,
    );
  }

  //---(Bottom bar)---//

  void _onSave() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    // FormBuilder tự kích hoạt validate xuyên suốt form khi saveAndValidate()
    // → render error inline cho mọi field chưa pass validator.
    if (!formState.saveAndValidate()) {
      showMessage(
        context,
        'Vui lòng điền đầy đủ các trường bắt buộc',
        type: SnackBarType.error,
      );
      return;
    }

    if (_currentEmployeeId == null || _currentEmployeeId == 0) {
      showMessage(
        context,
        'Không xác định được nhân viên đăng ký. Vui lòng thử lại.',
        type: SnackBarType.error,
      );
      return;
    }

    // Build payload và dispatch submit event — UI chờ BlocListener phản hồi.
    final payload = _buildSubmitPayload();
    bloc.add(BookingGuestHouseEvent.submit(payload: payload));
  }

  /// Build 1 dòng `accommodationBookingDetails` từ dữ liệu form của dòng người ở i.
  ///
  /// Ưu tiên resolve EmployeeID / PhoneNumber / DepartmentName / EmployeeCode
  /// từ EmployeeFilterItem (nếu đã chọn nhân viên), fallback về value nhập tay
  /// từ FormBuilder (đã được sync vào [_infoFieldValues]).
  Map<String, dynamic> _buildRoommateDetail({
    required int index,
    required int accommodationBookingId,
  }) {
    // Resolve Employee cho MỌI slip — slip 0 = currentUser (auto-fill lúc init),
    // slip n >= 1 = user chọn từ picker (patch cập nhật map ngay khi chọn).
    final emp = _selectedRoommateEmployees[index];

    final fullName =
        (emp?.fullName ?? _infoFieldValues['roommate_full_name_$index'] ?? '')
            .toString()
            .trim();
    final code = (emp?.code ?? _infoFieldValues['roommate_code_$index'] ?? '')
        .toString()
        .trim();
    final phone =
        (emp?.sdtCaNhan ?? _infoFieldValues['roommate_phone_$index'] ?? '')
            .toString()
            .trim();
    final department =
        (emp?.departmentName ??
                _infoFieldValues['roommate_department_$index'] ??
                '')
            .toString()
            .trim();
    final note = (_infoFieldValues['roommate_note_$index'] ?? '')
        .toString()
        .trim();

    return <String, dynamic>{
      'ID': 0,
      'AccommodationBookingID': accommodationBookingId,
      // Ưu tiên EmployeeID từ EmployeeFilterItem đã chọn (resolve thật từ
      // server), fallback về ID trong infoFieldValues nếu user nhập tay.
      'EmployeeID':
          emp?.id ?? _infoFieldValues['roommate_employee_id_$index'] ?? 0,
      'PhoneNumber': phone,
      'FullName': fullName,
      'DepartmentName': department,
      'Note': note.isEmpty ? null : note,
      'EmployeeCode': code,
    };
  }

  /// Build payload cuối cùng theo schema `/AccommodationBooking/save-data`.
  Map<String, dynamic> _buildSubmitPayload() {
    final accommodationBooking = <String, dynamic>{
      'ID': 0,
      'RegisterID': _currentEmployeeId,
      'ProjectID': _selectedProject?.id ?? 0,
      'ProvinceID': _selectedProvince?.id ?? 0,
      'StartDate': _toApiIso(_startDate),
      'EndDate': _toApiIso(_endDate),
      'Note': _readFormText('note'),
      'ApprovedTBP': _selectedTbp?.id ?? 0,
      'SpecificDestinationAddress': _readFormText('address'),
      'Address': _readFormText('address'),
    };

    final details = <Map<String, dynamic>>[];
    for (var i = 0; i < _roommateLineCount; i++) {
      final name = (_infoFieldValues['roommate_full_name_$i'] ?? '')
          .toString()
          .trim();
      final phone = (_infoFieldValues['roommate_phone_$i'] ?? '')
          .toString()
          .trim();
      // Bỏ qua dòng rỗng hoàn toàn (sau shift / trước khi nhập) để không tạo
      // detail rỗng gửi lên server.
      if (name.isEmpty && phone.isEmpty) continue;
      details.add(_buildRoommateDetail(index: i, accommodationBookingId: 0));
    }

    return <String, dynamic>{
      'accommodationBooking': accommodationBooking,
      'accommodationBookingDetails': details,
      'idDeleteds': <int>[],
    };
  }

  String _readFormText(String name) {
    final v = _formKey.currentState?.value[name];
    if (v == null) return '';
    return v.toString().trim();
  }

  /// Convert DateTime → chuỗi `yyyy-MM-ddTHH:mm:ss.000Z` (UTC) khớp payload mẫu.
  String _toApiIso(DateTime? d) {
    if (d == null) return '';
    final utc = d.toUtc();
    final y = utc.year.toString().padLeft(4, '0');
    final m = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final h = utc.hour.toString().padLeft(2, '0');
    final mi = utc.minute.toString().padLeft(2, '0');
    final s = utc.second.toString().padLeft(2, '0');
    return '$y-$m-${day}T$h:$mi:$s.000Z';
  }

  Widget _buildBottomBar() {
    return BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
      buildWhen: (prev, curr) =>
          prev.isSubmitting != curr.isSubmitting ||
          prev.submitSuccess != curr.submitSuccess,
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    )
                  : const Text(
                      'Lưu phiếu',
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

  //---(Actions)---//

  void _addRoommate() {
    final oldCount = _roommateLineCount;
    final newCount = oldCount + 1;
    setState(() {
      _roommateLineCount = newCount;
      _selectedRoommateEmployees[oldCount] = null;
      _roommateFormGeneration++;
    });
  }

  void _removeRoommate(int index) {
    // Luôn giữ ít nhất 1 slip (slip(0) = currentUser).
    if (_roommateLineCount <= 1) return;
    final formState = _formKey.currentState;
    if (formState == null) return;

    final oldCount = _roommateLineCount;
    final shifted = BookingGuestHouseRoommateFormShift.computeShiftedFields(
      form: formState,
      deletedIndex: index,
      oldLineCount: oldCount,
    );
    formState.patchValue(shifted);

    // Đồng bộ state local.
    setState(() {
      _roommateLineCount = oldCount - 1;
      _selectedRoommateEmployees.remove(index);
      // Re-index map liên tục.
      final remapped = <int, EmployeeFilterItem?>{};
      _selectedRoommateEmployees.forEach((key, value) {
        if (key > index) {
          remapped[key - 1] = value;
        } else {
          remapped[key] = value;
        }
      });
      _selectedRoommateEmployees
        ..clear()
        ..addAll(remapped);

      // Đồng bộ infoFieldValues theo shifted.
      _infoFieldValues = {..._infoFieldValues, ...shifted};
      _roommateFormGeneration++;
    });
  }

  Future<void> _pickStartDate() async {
    final picked = await _showDatePicker(_startDate);
    if (picked == null || !mounted) return;
    setState(() {
      _startDate = picked;
      _startDateCtrl.text = DateFormat('dd/MM/yyyy').format(picked);
      // Đảm bảo đến ngày không trước từ ngày.
      if (_endDate != null && picked.isAfter(_endDate!)) {
        _endDate = picked;
        _endDateCtrl.text = DateFormat('dd/MM/yyyy').format(picked);
      }
      _formKey.currentState?.patchValue({
        'start_date': _startDateCtrl.text,
        'start_date_text': _startDateCtrl.text,
      });
    });
  }

  Future<void> _pickEndDate() async {
    final picked = await _showDatePicker(_endDate, firstDate: _startDate);
    if (picked == null || !mounted) return;
    setState(() {
      _endDate = picked;
      _endDateCtrl.text = DateFormat('dd/MM/yyyy').format(picked);
      _formKey.currentState?.patchValue({
        'end_date': _endDateCtrl.text,
        'end_date_text': _endDateCtrl.text,
      });
    });
  }

  Future<DateTime?> _showDatePicker(
    DateTime? value, {
    DateTime? firstDate,
  }) async {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: firstDate ?? DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
  }

  Future<void> _openProjectSheet() async {
    if (_projects.isEmpty) {
      await _loadLookups();
    }
    if (!mounted) return;
    await openSelectBottomSheet<ProjectFilterItem>(
      context: context,
      title: 'Chọn dự án',
      hintText: 'Tìm theo mã / tên dự án',
      items: _projects,
      initialSelectedItem: _selectedProject,
      displayText: (p) => _projectText(p),
      onSelected: (p) {
        if (!mounted) return;
        setState(() {
          _selectedProject = p;
          _projectCtrl.text = _projectText(p);
          _formKey.currentState?.patchValue({
            'project': _projectCtrl.text,
            'project_text': _projectCtrl.text,
          });
        });
      },
    );
  }

  Future<void> _openTbpSheet() async {
    if (_employees.isEmpty) {
      await _loadLookups();
    }
    if (!mounted) return;
    await openSelectBottomSheet<EmployeeFilterItem>(
      context: context,
      title: 'Chọn TBP duyệt',
      hintText: 'Tìm theo tên nhân viên',
      items: _employees,
      initialSelectedItem: _selectedTbp,
      displayText: (e) => e.fullName ?? 'N/A',
      onSelected: (e) {
        if (!mounted) return;
        setState(() {
          _selectedTbp = e;
          _tbpCtrl.text = e.fullName ?? '';
          _formKey.currentState?.patchValue({
            'tbp': _tbpCtrl.text,
            'tbp_text': _tbpCtrl.text,
          });
        });
      },
    );
  }

  Future<void> _openProvinceSheet() async {
    if (_provinces.isEmpty) {
      await _loadLookups();
    }
    if (!mounted) return;
    await openSelectBottomSheet<ProvinceFilterItem>(
      context: context,
      title: 'Chọn tỉnh lưu trú',
      hintText: 'Tìm theo tên tỉnh',
      items: _provinces,
      initialSelectedItem: _selectedProvince,
      displayText: (p) => p.provinceName ?? 'N/A',
      onSelected: (p) {
        if (!mounted) return;
        setState(() {
          _selectedProvince = p;
          _provinceCtrl.text = p.provinceName ?? '';
          _formKey.currentState?.patchValue({
            'province': _provinceCtrl.text,
            'province_text': _provinceCtrl.text,
          });
        });
      },
    );
  }

  //---(Helpers)---//

  String _projectText(ProjectFilterItem p) {
    if (p.projectCode != null && p.projectCode!.isNotEmpty) {
      return '${p.projectCode} - ${p.projectName ?? ''}';
    }
    return p.projectName ?? 'N/A';
  }
}
