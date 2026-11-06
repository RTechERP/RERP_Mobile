import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/bloc/bloc_status.dart';
import 'package:rtc_erp/base/network/errors/extension.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/enums/index.dart';
import 'package:rtc_erp/common/helpers/index.dart';
import 'package:rtc_erp/common/utils/snack_bar_helper.dart' show SnackBarType;
import 'package:rtc_erp/common/widgets/form/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';

import '../bloc/inventory_check_bloc.dart';
import '../widgets/inventory_check_form.dart';

/// Màn chỉnh sửa đợt kiểm kê kho.
///
/// Giao diện và flow giống màn tạo mới, khác ở chỗ: dữ liệu được fill sẵn
/// từ API `get-by-id` và payload gửi lên kèm `ID` của phiếu cần sửa.
class InventoryCheckEditScreen extends StatefulWidget {
  const InventoryCheckEditScreen({super.key, required this.id});

  /// Id của đợt kiểm kê cần chỉnh sửa.
  final int id;

  @override
  State<InventoryCheckEditScreen> createState() =>
      _InventoryCheckEditScreenState();
}

class _InventoryCheckEditScreenState
    extends
        BaseState<
          InventoryCheckEditScreen,
          InventoryCheckEvent,
          InventoryCheckState,
          InventoryCheckBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Controller của ô mã đợt — nhận mã đợt đã có của phiếu.
  final _codeController = TextEditingController();

  /// Controller của ô người kiểm kê — nhận tên NV được chọn trong sheet.
  final _employeeController = TextEditingController();

  /// Ngày kiểm kê đang chọn.
  late DateTime _dateCount;

  /// Tên đợt kiểm kê fill từ API.
  late String _name;

  /// Ghi chú fill từ API.
  late String _note;

  /// Id kho kiểm kê fill từ API.
  late int _warehouseId;

  /// Id nhân viên kiểm kê fill từ API.
  int? _employeeId;

  /// Trạng thái hoàn thành fill từ API.
  late bool _isComplete;

  /// Đã fill form từ chi tiết phiếu hay chưa.
  bool _filled = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateCount = DateTime(now.year, now.month, now.day);
    _name = '';
    _note = '';
    _warehouseId = 1;
    _isComplete = false;

    bloc.add(InventoryCheckEvent.getById(widget.id));
    bloc.add(const InventoryCheckEvent.fetchEmployees());
  }

  @override
  void dispose() {
    _codeController.dispose();
    _employeeController.dispose();
    super.dispose();
  }

  @override
  bool listenWhen(
    InventoryCheckState previous,
    InventoryCheckState current,
  ) {
    return previous.detail != current.detail ||
        previous.employees != current.employees ||
        previous.saveSuccess != current.saveSuccess ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, InventoryCheckState state) {
    // Fill form lần đầu khi chi tiết phiếu về.
    final detail = state.detail;
    if (detail != null && !_filled) {
      _filled = true;
      _codeController.text = (detail.code ?? '').trim();
      _name = (detail.name ?? '').trim();
      _note = (detail.note ?? '').trim();
      _warehouseId = detail.warehouseId ?? 1;
      _employeeId = detail.employeeId;
      _isComplete = detail.isComplete ?? false;
      _dateCount = _parseDate(detail.dateCount);
      _syncEmployeeName(state.employees);
      if (mounted) setState(() {});
    } else if (_employeeId != null) {
      // Danh sách nhân viên về sau → bổ sung tên NV vào ô.
      _syncEmployeeName(state.employees);
    }

    if (state.saveSuccess) {
      context.showMessage(
        'Cập nhật đợt kiểm kê thành công',
        type: SnackBarType.success,
      );
      context.pop(true);
      return;
    }

    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      context.showMessage(state.message!, type: SnackBarType.error);
    }
  }

  /// Đồng bộ tên nhân viên kiểm kê vào ô nhập (từ danh sách NV đã tải).
  void _syncEmployeeName(List<InventoryCheckEmployee> employees) {
    final id = _employeeId;
    if (id == null) return;
    for (final employee in employees) {
      if (employee.id != id) continue;
      final fullName = (employee.fullName ?? '').trim();
      if (fullName.isEmpty || _employeeController.text == fullName) return;
      _employeeController.text = fullName;
      return;
    }
  }

  /// Parse ngày kiểm kê từ API (`yyyy-MM-ddTHH:mm:ss`) — lấy phần ngày.
  static DateTime _parseDate(String? raw) {
    final parsed = DateTime.tryParse(raw ?? '');
    if (parsed == null) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day);
    }
    return DateTime(parsed.year, parsed.month, parsed.day);
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Cập nhật đợt kiểm kê'),
        onBackTap: () => context.pop(),
      ),
      body: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
        bloc: bloc,
        buildWhen: (prev, curr) =>
            prev.detail != curr.detail ||
            prev.isLoadingDetail != curr.isLoadingDetail,
        builder: (context, state) {
          if (state.isLoadingDetail) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.detail == null) {
            return const Center(child: Text('Không tìm thấy đợt kiểm kê'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    InventoryCheckForm(
                      formKey: _formKey,
                      codeController: _codeController,
                      employeeController: _employeeController,
                      name: _name,
                      dateCount: _dateCount,
                      warehouseId: _warehouseId,
                      employeeId: _employeeId,
                      isComplete: _isComplete,
                      note: _note,
                      onDateChanged: (value) => _dateCount = value,
                      onTapEmployee: _openEmployeeSheet,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: BlocBuilder<InventoryCheckBloc, InventoryCheckState>(
                  bloc: bloc,
                  buildWhen: (prev, curr) => prev.isSaving != curr.isSaving,
                  builder: (context, state) {
                    return FormActions(
                      mode: FormActionMode.edit,
                      cancelText: 'Huỷ',
                      saveText: state.isSaving ? 'Đang lưu...' : 'Cập nhật',
                      saveEnabled: !state.isSaving,
                      onCancel: () => context.pop(),
                      onSave: state.isSaving ? null : _onSubmit,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Mở sheet chọn nhân viên kiểm kê rồi đồng bộ giá trị vào form.
  Future<void> _openEmployeeSheet() async {
    final employees = bloc.state.employees;
    if (employees.isEmpty) {
      context.showMessage(
        'Chưa có danh sách nhân viên kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    await openSelectBottomSheet<InventoryCheckEmployee>(
      context: context,
      title: 'Chọn người kiểm kê',
      items: employees,
      hintText: 'Tìm theo tên hoặc mã NV...',
      displayText: (item) =>
          '${item.code ?? ''} - ${item.fullName ?? ''}'.trim(),
      onSelected: (item) {
        setState(() => _employeeId = item.id);
        final fullName = (item.fullName ?? '').trim();
        if (_employeeController.text != fullName) {
          _employeeController.text = fullName;
        }
        _formKey.currentState?.fields['inventory_check_employee']?.didChange(
          fullName,
        );
      },
    );
  }

  /// Validate form rồi gửi payload cập nhật đợt kiểm kê.
  void _onSubmit() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!formState.saveAndValidate()) return;

    final values = formState.value;
    final employeeId = _employeeId;

    if (employeeId == null) {
      context.showMessage(
        'Vui lòng chọn người kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    final code = '${values['inventory_check_code'] ?? ''}'.trim();
    if (code.isEmpty) {
      context.showMessage(
        'Chưa có mã đợt kiểm kê, vui lòng thử lại',
        type: SnackBarType.error,
      );
      return;
    }

    final name = '${values['inventory_check_name'] ?? ''}'.trim();
    final note = '${values['inventory_check_note'] ?? ''}'.trim();
    final warehouseId = values['inventory_check_warehouse'] as int?;
    final isComplete = values['inventory_check_status'] as bool? ?? false;

    if (warehouseId == null) {
      context.showMessage(
        'Vui lòng chọn kho kiểm kê',
        type: SnackBarType.error,
      );
      return;
    }

    bloc.add(
      InventoryCheckEvent.save(
        InventoryCountSavePayload(
          id: widget.id,
          code: code,
          name: name,
          warehouseId: warehouseId,
          employeeId: employeeId,
          dateCount: _buildDateCount(),
          note: note.isEmpty ? null : note,
          isComplete: isComplete,
        ),
      ),
    );
  }

  /// `DateCount` gửi API = ngày kiểm kê đang chọn, giữ giờ hiện tại,
  /// chuyển sang UTC (server nhận chuẩn ISO `...Z`).
  String _buildDateCount() {
    final now = DateTime.now();
    return DateTime(
      _dateCount.year,
      _dateCount.month,
      _dateCount.day,
      now.hour,
      now.minute,
      now.second,
      now.millisecond,
    ).toUtc().toIso8601String();
  }
}
