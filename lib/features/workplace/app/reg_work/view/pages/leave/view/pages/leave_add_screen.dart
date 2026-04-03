import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/leave_model.dart';
import '../bloc/leave_bloc.dart';
import '../widgets/leave_add_constants.dart';
import '../widgets/leave_registration_card.dart';
import '../widgets/leave_slip_form_fields.dart';
import '../widgets/leave_slip_tabs_bar.dart';

LeaveTimeItem? _firstLeaveTime(LeaveState s) {
  if (s.leaveTime.isEmpty) return null;
  return s.leaveTime.first;
}

class LeaveAddScreenPage extends StatefulWidget {
  const LeaveAddScreenPage({super.key});

  @override
  State<LeaveAddScreenPage> createState() => _LeaveAddScreenPageState();
}

class _LeaveAddScreenPageState
    extends BaseState<LeaveAddScreenPage, LeaveEvent, LeaveState, LeaveBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  late final List<String> _slipKeys;
  int _selectedSlipIndex = 0;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _slipKeys = ['k_${now.millisecondsSinceEpoch}'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeaveEvent.clearSubmitState());
      bloc.add(const LeaveEvent.initAdd());
    });
  }

  int get _safeSlipIndex {
    if (_slipKeys.isEmpty) return 0;
    if (_selectedSlipIndex < 0) return 0;
    if (_selectedSlipIndex >= _slipKeys.length) return _slipKeys.length - 1;
    return _selectedSlipIndex;
  }

  List<LeaveAddSlipRow> _collectSlipRows(Map<String, dynamic> values) {
    return [
      for (final key in _slipKeys)
        (
          date: values['leave_slip_${key}_date'] as DateTime?,
          timeRegister:
              int.tryParse('${values['leave_slip_${key}_session'] ?? ''}') ??
                  0,
          type: int.tryParse('${values['leave_slip_${key}_type'] ?? ''}') ?? 0,
          reason: '${values['leave_slip_${key}_reason'] ?? ''}',
        ),
    ];
  }

  bool _computeSubmitEnabled() {
    final form = _formKey.currentState;
    if (form == null) return false;
    form.save();
    final v = form.value;
    return ValidateHelper.isLeaveAddSubmitEnabled(
      departmentName: '${v['leave_add_department'] ?? ''}',
      employeeDisplay: '${v['leave_add_employee'] ?? ''}',
      approverIdRaw: '${v['regwork_leave_add_approver_id'] ?? ''}',
      slips: _collectSlipRows(v),
    );
  }

  void _addSlip() {
    setState(() {
      _slipKeys.add(
        'k_${DateTime.now().microsecondsSinceEpoch}_${_slipKeys.length}',
      );
      _selectedSlipIndex = _slipKeys.length - 1;
    });
  }

  void _removeSlipAt(int index) {
    if (_slipKeys.length <= 1 || index < 0 || index >= _slipKeys.length) {
      return;
    }
    setState(() {
      _slipKeys.removeAt(index);
      if (_selectedSlipIndex >= _slipKeys.length) {
        _selectedSlipIndex = _slipKeys.length - 1;
      } else if (index < _selectedSlipIndex) {
        _selectedSlipIndex -= 1;
      }
    });
  }

  void _selectSlip(int index) {
    if (index < 0 || index >= _slipKeys.length) return;
    setState(() => _selectedSlipIndex = index);
  }

  String _slipTabLabel(String slipKey) {
    final st = _formKey.currentState;
    final v = st?.fields['leave_slip_${slipKey}_date']?.value;
    if (v is! DateTime) return '—';
    return DateFormat('dd/MM/yyyy').format(v);
  }

  Future<void> _openEmployeeSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.employeeLeave;
    if (items.isEmpty) {
      context.showMessage('Chưa có danh sách nhân viên', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<EmployeeLeave>(
      context: context,
      title: 'Chọn nhân viên',
      items: items,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['regwork_leave_employee_id']?.didChange('${item.id}');
        form.fields['regwork_leave_employee_text']?.didChange(line);
        form.fields['leave_add_department']?.didChange(item.departmentName ?? '');
        form.fields['leave_add_employee']?.didChange(line);

        bloc.updateSelectedEmployee(
          employeeId: item.id,
          departmentName: item.departmentName,
          employeeDisplay: line,
        );
        setState(() {});
      },
    );
  }

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items =
        bloc.state.approvers.where((e) => e.isDeleted != true).toList();

    if (items.isEmpty) {
      context.showMessage(
        'Chưa có người kiểm duyệt',
        type: SnackBarType.error,
      );
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người kiểm duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final idValue = approvedLeavePayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['regwork_leave_add_approver_id']?.didChange(
          idValue.toString(),
        );
        form.fields['regwork_leave_add_approver_text']?.didChange(line);
        setState(() {});
      },
    );
  }

  Future<void> _openSessionSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<LeaveSessionOption>(
      context: context,
      title: 'Chọn buổi nghỉ',
      items: kLeaveSessionOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['leave_slip_${slipKey}_session']?.didChange(
          o.value.toString(),
        );
        form.fields['leave_slip_${slipKey}_session_text']?.didChange(o.label);
        setState(() {});
      },
    );
  }

  Future<void> _openLeaveTypeSheet(String slipKey) async {
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<LeaveTypeOption>(
      context: context,
      title: 'Chọn loại nghỉ',
      items: kLeaveTypeOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['leave_slip_${slipKey}_type']?.didChange(
          o.value.toString(),
        );
        form.fields['leave_slip_${slipKey}_type_text']?.didChange(o.label);
        setState(() {});
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<LeaveBloc, LeaveState>(
          listenWhen: (p, c) =>
              p.departmentName != c.departmentName ||
              p.employeeDisplayLine != c.employeeDisplayLine ||
              p.employeeId != c.employeeId ||
              p.skipLeaveDateConstraints != c.skipLeaveDateConstraints,
          listener: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              final f = _formKey.currentState;
              if (f == null) return;
              f.fields['leave_add_department']
                  ?.didChange(state.departmentName ?? '');
              f.fields['leave_add_employee']
                  ?.didChange(state.employeeDisplayLine ?? '');
              // Admin / HR: tự điền ô nhân viên bằng thông tin user hiện tại.
              if (state.skipLeaveDateConstraints) {
                f.fields['regwork_leave_employee_text']
                    ?.didChange(state.employeeDisplayLine ?? '');
                f.fields['regwork_leave_employee_id']
                    ?.didChange('${state.employeeId ?? ''}');
              }
              setState(() {});
            });
          },
          child: BlocListener<LeaveBloc, LeaveState>(
            listenWhen: (previous, current) =>
                previous.submitSuccess != current.submitSuccess ||
                previous.message != current.message ||
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == BaseStateStatus.failed &&
                  (state.message ?? '').isNotEmpty &&
                  !state.isSubmitting) {
                context.showMessage(
                  state.message!,
                  type: SnackBarType.error,
                );
              }
              if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
                context.showMessage(
                  state.message!,
                  type: SnackBarType.success,
                );
              }
              if (state.submitSuccess) {
                bloc.add(const LeaveEvent.clearSubmitState());
                context.pop(true);
              }
            },
            child: BaseScaffold(
              appBar: AppBarCommon(
                title: const Text('Tạo đơn xin nghỉ'),
                actions: [
                  IconButton(
                    onPressed: () {
                      DialogService.showNotificationLeave(context: context);
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: BlocBuilder<LeaveBloc, LeaveState>(
                  builder: (context, state) {
                    final submitOk = _computeSubmitEnabled();

                    return FormBuilder(
                      key: _formKey,
                      onChanged: () => setState(() {}),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  FormCard(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LeaveRegistrationCard(
                                          todayStart: _todayStart,
                                          onPickApprover: _openApproverSheet,
                                          regDatePickerEnabled:
                                              state.skipLeaveDateConstraints,
                                          isAdminOrHr:
                                              state.skipLeaveDateConstraints,
                                          onPickEmployee: _openEmployeeSheet,
                                          employeePickerEnabled:
                                              state.skipLeaveDateConstraints,
                                        ),
                                        const SizedBox(height: 8),
                                        LeaveSlipTabsBar(
                                          labels: _slipKeys
                                              .map(_slipTabLabel)
                                              .toList(),
                                          selectedIndex: _safeSlipIndex,
                                          onSelect: _selectSlip,
                                          onRemoveAt: _removeSlipAt,
                                          onAdd: _addSlip,
                                        ),
                                        const SizedBox(height: 8),
                                        AnimatedSize(
                                          duration: const Duration(
                                            milliseconds: 250,
                                          ),
                                          curve: Curves.easeInOut,
                                          alignment: Alignment.topCenter,
                                          child: IndexedStack(
                                            index: _safeSlipIndex,
                                            sizing: StackFit.loose,
                                            children: [
                                              for (final key in _slipKeys)
                                                LeaveSlipFormFields(
                                                  slipKey: key,
                                                  todayStart: _todayStart,
                                                  bypassDateRules: state
                                                      .skipLeaveDateConstraints,
                                                  onSessionTap:
                                                      _openSessionSheet,
                                                  onTypeTap:
                                                      _openLeaveTypeSheet,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                          FormActions(
                            mode: FormActionMode.add,
                            submitEnabled: submitOk,
                            onSubmit: () {
                              FocusScope.of(context).unfocus();

                              final formState = _formKey.currentState;
                              if (formState == null) return;
                              if (!_computeSubmitEnabled()) return;
                              formState.save();

                              final values = formState.value;
                              final stat = _firstLeaveTime(state);
                              final err = ValidateHelper.validateLeaveAddSubmit(
                                departmentName: '${values['leave_add_department'] ?? ''}',
                                employeeDisplay: '${values['leave_add_employee'] ?? ''}',
                                approverIdRaw: '${values['regwork_leave_add_approver_id'] ?? ''}',
                                slips: _collectSlipRows(values),
                                todayStart: _todayStart,
                                bypassDateRules: state.skipLeaveDateConstraints,
                                totalDayRemain: stat?.totalDayRemain,
                                clock: DateTime.now(),
                              );
                              if (err != null) {
                                context.showMessage(err, type: SnackBarType.error);
                                return;
                              }

                              final approvedTP =
                                  int.tryParse('${values['regwork_leave_add_approver_id'] ?? ''}'.trim()) ??
                                      0;
                              final slips = <LeaveAddSlip>[];
                              for (final key in _slipKeys) {
                                final date = values['leave_slip_${key}_date'] as DateTime;
                                final sessionRaw = '${values['leave_slip_${key}_session'] ?? ''}';
                                final typeRaw = '${values['leave_slip_${key}_type'] ?? ''}';
                                final reason = '${values['leave_slip_${key}_reason'] ?? ''}'.trim();
                                slips.add(
                                  LeaveAddSlip(
                                    date: date,
                                    timeRegister: int.parse(sessionRaw.trim()),
                                    type: int.parse(typeRaw.trim()),
                                    reason: reason,
                                  ),
                                );
                              }

                              bloc.add(
                                LeaveEvent.submitBatch(
                                  approvedTP: approvedTP,
                                  slips: slips,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<LeaveBloc, LeaveState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
                    repeat: true,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
