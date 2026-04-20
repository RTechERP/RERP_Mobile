import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/dialog/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/leave_model.dart';

import '../bloc/leave_bloc.dart';
import '../widgets/leave_add_constants.dart';
import '../widgets/leave_registration_card.dart';
import '../widgets/leave_slip_form_fields.dart';

LeaveTimeItem? _firstLeaveTime(LeaveState s) {
  if (s.leaveTime.isEmpty) return null;
  return s.leaveTime.first;
}

/// Một phiếu trên form (get-multi đã lọc đúng [detailId]).
const _kDetailSlipKey = 'detail_single';

class LeaveDetailScreenPage extends StatefulWidget {
  const LeaveDetailScreenPage({
    super.key,
    required this.phaseId,
    required this.detailId,
    this.listStartDate,
    this.listTimeOnLeave,
  });

  final int phaseId;
  final int detailId;
  final DateTime? listStartDate;
  final int? listTimeOnLeave;

  @override
  State<LeaveDetailScreenPage> createState() => _LeaveDetailScreenPageState();
}

class _LeaveDetailScreenPageState extends BaseState<LeaveDetailScreenPage,
    LeaveEvent, LeaveState, LeaveBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  bool _appliedDetail = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.phaseId <= 0 || widget.detailId <= 0) return;
      bloc.add(const LeaveEvent.clearSubmitState());
      bloc.add(
        LeaveEvent.initDetail(
          phaseId: widget.phaseId,
          detailId: widget.detailId,
          listStartDate: widget.listStartDate,
          listTimeOnLeave: widget.listTimeOnLeave,
        ),
      );
    });
  }

  @override
  void didUpdateWidget(covariant LeaveDetailScreenPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phaseId != widget.phaseId ||
        oldWidget.detailId != widget.detailId) {
      _appliedDetail = false;
      if (widget.phaseId > 0 && widget.detailId > 0) {
        bloc.add(
          LeaveEvent.initDetail(
            phaseId: widget.phaseId,
            detailId: widget.detailId,
            listStartDate: widget.listStartDate,
            listTimeOnLeave: widget.listTimeOnLeave,
          ),
        );
      }
    }
  }

  LeaveEditSlip? _focusedSlip(LeaveState state) {
    if (state.detailEditSlips.isEmpty) return null;
    return state.detailEditSlips.first;
  }

  bool _slipReadOnly(LeaveState state) {
    final slip = _focusedSlip(state);
    if (slip == null) return true;
    if (SwipeHelper.isPhaseApprovalLocked(
          phaseIsApprovedBGD: state.detailPhaseIsApprovedBGD,
          phaseIsApprovedTP: state.detailPhaseIsApprovedTP,
          phaseIsApprovedHR: state.detailPhaseIsApprovedHR,
          phaseStatusHRNumber: state.detailPhaseStatusHRNumber,
          phaseStatusHRText: state.detailPhaseStatusHRText,
        )) {
      return true;
    }
    return SwipeHelper.isDetailSlipReadOnly(
      slip,
      phaseIsApprovedBGD: state.detailPhaseIsApprovedBGD,
      phaseIsApprovedTP: state.detailPhaseIsApprovedTP,
      phaseIsApprovedHR: state.detailPhaseIsApprovedHR,
      phaseStatusHRNumber: state.detailPhaseStatusHRNumber,
      phaseStatusHRText: state.detailPhaseStatusHRText,
    );
  }

  /// Quá mốc đăng ký buổi (giống không cho xoá), theo giá trị form hiện tại.
  bool _pastSessionDeadline(Map<String, dynamic> v, LeaveState state) {
    if (state.skipLeaveDateConstraints) return false;
    final date = v['leave_slip_${_kDetailSlipKey}_date'] as DateTime?;
    final session =
        int.tryParse('${v['leave_slip_${_kDetailSlipKey}_session'] ?? ''}') ??
            0;
    if (date == null) return true;
    return SwipeHelper.isSwipeBlockedByDateTime(
      startDate: date,
      endDate: date,
      timeOnLeave: session,
    );
  }

  List<LeaveAddSlipRow> _collectOneSlipRow(Map<String, dynamic> values) {
    return [
      (
        date: values['leave_slip_${_kDetailSlipKey}_date'] as DateTime?,
        timeRegister: int.tryParse(
              '${values['leave_slip_${_kDetailSlipKey}_session'] ?? ''}',
            ) ??
            0,
        type: int.tryParse(
              '${values['leave_slip_${_kDetailSlipKey}_type'] ?? ''}',
            ) ??
            0,
        reason: '${values['leave_slip_${_kDetailSlipKey}_reason'] ?? ''}',
      ),
    ];
  }

  /// Các dòng đợt còn tính trùng buổi (bỏ đã xóa / huỷ); dòng đang sửa lấy ngày + buổi từ form.
  static bool _slipCountsForPhaseDuplicate(LeaveEditSlip s) {
    if (s.deleteFlag == true) return false;
    if (s.isCancelRegister == true || s.isCancelTP == true) return false;
    return true;
  }

  List<({DateTime date, int timeRegister})> _phaseRowsAfterEdit({
    required List<LeaveEditSlip> allSlips,
    required int editedDetailId,
    required DateTime editedDate,
    required int editedSession,
  }) {
    final out = <({DateTime date, int timeRegister})>[];
    final d0 = DateTime(editedDate.year, editedDate.month, editedDate.day);
    for (final s in allSlips) {
      if (s.detailId == editedDetailId) {
        out.add((date: d0, timeRegister: editedSession));
        continue;
      }
      if (!_slipCountsForPhaseDuplicate(s)) continue;
      out.add((
        date: DateTime(s.date.year, s.date.month, s.date.day),
        timeRegister: s.timeRegister,
      ));
    }
    return out;
  }

  void _applyDetailToForm(LeaveState state, VoidCallback onApplied) {
    final slip = _focusedSlip(state);
    if (slip == null) return;

    void patchForm([int attempt = 0]) {
      if (!mounted || attempt > 24) return;
      final f = _formKey.currentState;
      if (f == null) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => patchForm(attempt + 1));
        return;
      }

      f.fields['leave_add_department']
          ?.didChange(state.departmentName ?? '');
      f.fields['leave_add_employee']
          ?.didChange(state.employeeDisplayLine ?? '');

      if (state.skipLeaveDateConstraints) {
        f.fields['regwork_leave_employee_text']
            ?.didChange(state.employeeDisplayLine ?? '');
        f.fields['regwork_leave_employee_id']
            ?.didChange('${state.employeeId ?? ''}');
      }

      final rawTp = state.detailApprovedTP ?? 0;
      final appr = leaveResolveApproverForForm(state.approvers, rawTp);
      f.fields['regwork_leave_add_approver_id']?.didChange(
        appr.payloadForForm > 0 ? '${appr.payloadForForm}' : '',
      );
      f.fields['regwork_leave_add_approver_text']?.didChange(
        appr.displayLine,
      );

      final dr = state.detailPhaseDateRegister ?? slip.date;
      f.fields['regwork_leave_detail_date']?.didChange(dr);

      f.fields['leave_slip_${_kDetailSlipKey}_date']?.didChange(slip.date);
      // FormDateTimePicker: UI nằm ở field nameTimePicker — phải sync cả hai.
      f.fields['leave_slip_${_kDetailSlipKey}_date_inner']?.didChange(slip.date);
      f.fields['leave_slip_${_kDetailSlipKey}_session']
          ?.didChange('${slip.timeRegister}');
      f.fields['leave_slip_${_kDetailSlipKey}_type']?.didChange('${slip.type}');
      f.fields['leave_slip_${_kDetailSlipKey}_reason']?.didChange(slip.reason);

      setState(() {});
      onApplied();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => patchForm());
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

  void _submit(LeaveState state) {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null) return;
    if (state.detailPhaseAllSlips.isEmpty) return;
    
    if (!formState.validate()) {
      FormHelper.focusFirstError(formState: formState);

      context.showMessage(
        'Vui lòng điền đầy đủ thông tin các phiếu',
        type: SnackBarType.error,
      );
      return;
    }

    final values = formState.value;
    if (_pastSessionDeadline(values, state)) return;
    if (_slipReadOnly(state)) return;

    final stat2 = _firstLeaveTime(state);
    final err = ValidateHelper.validateLeaveAddSubmit(
      departmentName: '${values['leave_add_department'] ?? ''}',
      employeeDisplay: '${values['leave_add_employee'] ?? ''}',
      approverIdRaw: '${values['regwork_leave_add_approver_id'] ?? ''}',
      slips: _collectOneSlipRow(values),
      todayStart: _todayStart,
      bypassDateRules: state.skipLeaveDateConstraints,
      totalDayRemain: stat2?.totalDayRemain,
      clock: DateTime.now(),
    );
    if (err != null) {
      context.showMessage(err, type: SnackBarType.error);
      return;
    }

    final date = values['leave_slip_${_kDetailSlipKey}_date'] as DateTime;
    final sessionRaw =
        '${values['leave_slip_${_kDetailSlipKey}_session'] ?? ''}';
    final editedSession = int.parse(sessionRaw.trim());

    final dupAcrossPhase = ValidateHelper.validateLeaveSlipsDuplicateSessions(
      _phaseRowsAfterEdit(
        allSlips: state.detailPhaseAllSlips,
        editedDetailId: widget.detailId,
        editedDate: date,
        editedSession: editedSession,
      ),
    );
    if (dupAcrossPhase != null) {
      context.showMessage(dupAcrossPhase, type: SnackBarType.error);
      return;
    }

    final approvedTP = int.tryParse(
          '${values['regwork_leave_add_approver_id'] ?? ''}'.trim(),
        ) ??
        0;

    final typeRaw = '${values['leave_slip_${_kDetailSlipKey}_type'] ?? ''}';
    final reason =
        '${values['leave_slip_${_kDetailSlipKey}_reason'] ?? ''}'.trim();

    final base = state.detailPhaseAllSlips.firstWhere(
      (s) => s.detailId == widget.detailId,
      orElse: () => _focusedSlip(state)!,
    );

    final typeParsed = int.parse(typeRaw.trim());
    final edited = LeaveEditSlip(
      detailId: base.detailId,
      date: date,
      endDate: LeaveEditSlip.computeEndDateCalendar(date, base),
      timeRegister: editedSession,
      type: typeParsed,
      reason: reason,
      apiType: typeParsed,
      apiTypeIsReal: typeParsed,
      approvedPayloadFromRow: base.approvedPayloadFromRow,
      deleteFlag: base.deleteFlag,
      isCancelRegister: base.isCancelRegister,
      isCancelTP: base.isCancelTP,
      isApprovedBGD: base.isApprovedBGD,
      isApprovedTP: base.isApprovedTP,
      isApprovedHR: base.isApprovedHR,
      statusHRNumber: base.statusHRNumber,
      statusHRText: base.statusHRText,
    );

    final merged = [
      for (final s in state.detailPhaseAllSlips)
        s.detailId == widget.detailId ? edited : s,
    ];

    bloc.add(
      LeaveEvent.onEditSubmit(
        phaseId: widget.phaseId,
        approvedTP: approvedTP,
        slips: merged,
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    if (widget.phaseId <= 0 || widget.detailId <= 0) {
      return BaseScaffold(
        appBar: AppBarCommon(title: const Text('Chi tiết đơn xin nghỉ')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Thiếu mã đợt nghỉ hoặc mã phiếu (Phase / Detail ID).'),
          ),
        ),
      );
    }

    return Stack(
      children: [
        BlocListener<LeaveBloc, LeaveState>(
          listenWhen: (p, c) =>
              p.departmentName != c.departmentName ||
              p.employeeDisplayLine != c.employeeDisplayLine,
          listener: (context, state) {
            if (!_appliedDetail) return;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              final f = _formKey.currentState;
              if (f == null) return;
              f.fields['leave_add_department']
                  ?.didChange(state.departmentName ?? '');
              f.fields['leave_add_employee']
                  ?.didChange(state.employeeDisplayLine ?? '');
              setState(() {});
            });
          },
          child: BlocListener<LeaveBloc, LeaveState>(
            listenWhen: (p, c) =>
                p.detailEditSlips != c.detailEditSlips ||
                p.isDetailLoading != c.isDetailLoading ||
                p.detailFocusDetailId != c.detailFocusDetailId,
            listener: (context, state) {
              if (state.isDetailLoading ||
                  state.detailPhaseId != widget.phaseId ||
                  state.detailFocusDetailId != widget.detailId) {
                return;
              }
              if (state.detailEditSlips.isEmpty) {
                if ((state.message ?? '').isNotEmpty) {
                  context.showMessage(
                    state.message!,
                    type: SnackBarType.error,
                  );
                }
                return;
              }
              if (_appliedDetail) return;
              _applyDetailToForm(state, () {
                if (mounted) setState(() => _appliedDetail = true);
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
                  if (!bloc.isClosed) {
                    bloc.add(const LeaveEvent.clearSubmitState());
                  }
                  context.pop(true);
                }
              },
              child: BaseScaffold(
                appBar: AppBarCommon(
                  title: const Text('Chi tiết / Sửa đơn xin nghỉ'),
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
                      if (state.isDetailLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!_appliedDetail && state.detailEditSlips.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              state.message ?? 'Không có dữ liệu chi tiết.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      final ro = _slipReadOnly(state);
                      final slipForForm = state.detailEditSlips.isEmpty
                          ? null
                          : state.detailEditSlips.first;

                      final form = _formKey.currentState;
                      form?.save();
                      final v = form?.value ?? {};
                      final pastDeadline = _pastSessionDeadline(v, state);
                      final saveEnabled = !pastDeadline && !ro;

                      return FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                              onPickApprover:
                                                  _openApproverSheet,
                                              approverPickerEnabled: !ro,
                                              regDatePickerEnabled: !ro &&
                                                  state
                                                      .skipLeaveDateConstraints,
                                              regDateInitialValue:
                                                  state.detailPhaseDateRegister,
                                              isAdminOrHr:
                                                  state.skipLeaveDateConstraints,
                                              onPickEmployee: !ro
                                                  ? _openEmployeeSheet
                                                  : null,
                                              employeePickerEnabled: !ro &&
                                                  state
                                                      .skipLeaveDateConstraints,
                                            ),
                                            const SizedBox(height: 8),
                                            LeaveSlipFormFields(
                                              key: ValueKey<int>(
                                                widget.detailId,
                                              ),
                                              slipKey: _kDetailSlipKey,
                                              todayStart: _todayStart,
                                              bypassDateRules: state
                                                  .skipLeaveDateConstraints,
                                              readOnly: ro,
                                              initialLeaveDate:
                                                  slipForForm?.date,
                                              initialSessionCode:
                                                  slipForForm != null
                                                      ? '${slipForForm.timeRegister}'
                                                      : null,
                                              initialTypeCode:
                                                  slipForForm != null
                                                      ? '${slipForForm.type}'
                                                      : null,
                                              initialReason:
                                                  slipForForm?.reason,
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
                                mode: FormActionMode.edit,
                                saveEnabled: saveEnabled,
                                onCancel: () => context.pop(),
                                onSave: () => _submit(state),
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