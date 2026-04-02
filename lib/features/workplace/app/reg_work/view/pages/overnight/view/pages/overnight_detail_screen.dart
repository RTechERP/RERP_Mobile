import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/overnight_model.dart';
import '../bloc/overnight_bloc.dart';

const _kStartHourMin = ValidateHelper.overnightStartHourMin;

class OvernightDetailScreen extends StatefulWidget {
  const OvernightDetailScreen({super.key, this.item});

  final OvernightItem? item;

  @override
  State<OvernightDetailScreen> createState() => _OvernightDetailScreenState();
}

class _OvernightDetailScreenState extends BaseState<OvernightDetailScreen,
    OvernightEvent, OvernightState, OvernightBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _breakController = TextEditingController(text: '0.00');
  late final FocusNode _breakFocusNode;

  bool get _isProblem =>
      (_formKey.currentState?.fields['det_is_problem']?.value as bool?) ??
      false;

  late DateTime _slipDate;
  late DateTime _initialTimeStart;
  late DateTime _initialTimeEnd;

  @override
  void initState() {
    super.initState();
    _slipDate = widget.item?.dateRegister ?? DateTime.now();
    _slipDate = DateTime(_slipDate.year, _slipDate.month, _slipDate.day);

    _initialTimeStart = widget.item?.dateStart ??
        DateTime(
          _slipDate.year,
          _slipDate.month,
          _slipDate.day,
          _kStartHourMin,
        );
    _initialTimeEnd = widget.item?.dateEnd ??
        DateTime(
          _slipDate.year,
          _slipDate.month,
          _slipDate.day,
          _kStartHourMin,
        );
    _breakController.text = (widget.item?.breaksTime ?? 0).toStringAsFixed(2);

    _breakFocusNode = FocusNode();
    _breakFocusNode.addListener(_onBreakFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const OvernightEvent.clearSubmitState());
      bloc.add(const OvernightEvent.initAdd());
    });
  }

  void _onBreakFocusChange() {
    if (_breakFocusNode.hasFocus) {
      _breakController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _breakController.text.length,
      );
    } else {
      final v = _breakController.text.trim();
      if (v.isEmpty || double.tryParse(v) == null) {
        _breakController.text = '0.00';
      }
    }
  }

  @override
  void dispose() {
    _breakFocusNode.removeListener(_onBreakFocusChange);
    _breakFocusNode.dispose();
    _breakController.dispose();
    super.dispose();
  }

  String _approverText(OvernightState state, int? approvedId) {
    final fallback = widget.item!.approvedTbpName ?? widget.item!.approvedHrName ?? '';
    if (approvedId == null) return fallback;
    if (state.approvers.isEmpty) return fallback;

    for (final a in state.approvers) {
      final idValue = a.employeeId ?? a.id;
      if (idValue == approvedId) {
        return '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
      }
    }
    return fallback;
  }

  double? _computeSlipHours() {
    final form = _formKey.currentState;
    if (form == null) return null;
    final start = form.fields['det_time_start']?.value as DateTime?;
    final end = form.fields['det_time_end']?.value as DateTime?;
    if (start == null || end == null) return null;

    final breakHours = double.tryParse(_breakController.text) ?? 0;
    final diff = end.difference(start).inMinutes / 60.0;
    if (diff <= 0) return null;
    return (diff - breakHours).clamp(0.0, diff);
  }

  // Submit enabled check
  bool _computeSubmitEnabled() {
    final form = _formKey.currentState;
    if (form == null) return false;
    form.save();
    final v = form.value;

    final breakHours = double.tryParse(_breakController.text) ?? 0;
    final rows = <OvernightAddSlipRow>[
      (
        date: _slipDate,
        timeStart: v['det_time_start'] as DateTime?,
        timeEnd: v['det_time_end'] as DateTime?,
        breakHours: breakHours,
        location: '${v['det_location'] ?? ''}',
      ),
    ];
    return ValidateHelper.isOvernightAddSubmitEnabled(
      approverIdRaw: '${v['det_approver_id'] ?? ''}',
      slips: rows,
    );
  }

  void _onDateChanged(DateTime? date) {
    if (date == null) return;
    final today = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final selected = DateTime(date.year, date.month, date.day);
    if (!_isProblem && selected != today) {
      context.showMessage(
        'Chỉ được đăng ký làm đêm cho ngày hôm nay khi không tích đăng ký bổ sung.',
        type: SnackBarType.error,
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState?.fields['det_date']?.didChange(_slipDate);
      });
      return;
    }
    setState(() => _slipDate = selected);
  }

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items =
        bloc.state.approvers.where((e) => e.isDeleted != true).toList();
    if (items.isEmpty) {
      context.showMessage('Chưa có người kiểm duyệt', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final idValue = item.employeeId ?? item.id;
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['det_approver_id']?.didChange(idValue.toString());
        form.fields['det_approver_text']?.didChange(line);
        setState(() {});
      },
    );
  }

  void _onSubmit(OvernightState state) {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (!_computeSubmitEnabled()) return;
    formState.save();
    final v = formState.value;

    final isProblem = (v['det_is_problem'] as bool?) ?? false;
    final breakHours = double.tryParse(_breakController.text) ?? 0;

    final row = (
      date: _slipDate,
      timeStart: v['det_time_start'] as DateTime?,
      timeEnd: v['det_time_end'] as DateTime?,
      breakHours: breakHours,
      location: '${v['det_location'] ?? ''}',
    );

    final err = ValidateHelper.validateOvernightAddSubmit(
      approverIdRaw: '${v['det_approver_id'] ?? ''}',
      slips: [row],
      isProblem: isProblem,
    );

    if (err != null) {
      context.showMessage(err, type: SnackBarType.error);
      final slipErr = ValidateHelper.overnightValidateSlip(
          slip: row, label: '', isProblem: isProblem);
      if (slipErr != null) {
        context.showMessage(slipErr, type: SnackBarType.error);
      }
      return;
    }

    final approvedId = int.tryParse('${v['det_approver_id'] ?? ''}') ?? 0;

    final slip = (
      timeStart: v['det_time_start'] as DateTime,
      endTime: v['det_time_end'] as DateTime,
      breakHours: breakHours,
      location: '${v['det_location'] ?? ''}',
      reason: '${v['det_note'] ?? ''}',
    );

    bloc.add(OvernightEvent.submitEdit(
      id: widget.item!.id,
      approvedId: approvedId,
      dateRegister: _slipDate,
      isProblem: isProblem,
      slip: slip,
    ));
  }

  @override
  Widget renderUI(BuildContext context) {
    if (widget.item == null) {
      return BaseScaffold(
        appBar: AppBarCommon(
          onBackTap: () => context.pop(),
          title: const Text('Sửa đơn qua đêm'),
        ),
        body: const Center(child: Text('Không có dữ liệu')),
      );
    }

    return Stack(
      children: [
        BlocListener<OvernightBloc, OvernightState>(
          listenWhen: (p, c) =>
              p.editSuccess != c.editSuccess ||
              p.message != c.message ||
              p.status != c.status ||
              p.approvers != c.approvers,
          listener: (context, state) {
            if (state.status == BaseStateStatus.failed &&
                (state.message ?? '').isNotEmpty &&
                !state.isSubmitting) {
              context.showMessage(state.message!, type: SnackBarType.error);
            }
            if ((state.message ?? '').isNotEmpty && state.editSuccess) {
              context.showMessage(state.message!, type: SnackBarType.success);
            }
            if (state.editSuccess) {
              bloc.add(const OvernightEvent.clearSubmitState());
              context.pop(true);
            }

            // Cập nhật lại text người duyệt khi load xong list
            if (state.approvers.isNotEmpty) {
              final approvedId = widget.item!.approvedTbp ?? widget.item!.approvedHr;
              final newText = _approverText(state, approvedId);
              final field = _formKey.currentState?.fields['det_approver_text'];
              if (field != null && field.value != newText) {
                field.didChange(newText);
              }
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Sửa đơn qua đêm'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocBuilder<OvernightBloc, OvernightState>(
                builder: (context, state) {
                  final submitOk = _computeSubmitEnabled();
                  final dateFmt = DateFormat('dd/MM/yyyy');
                  final bothFmt = DateFormat('dd/MM/yyyy HH:mm');
                  final h = _computeSlipHours();
                  final totalText =
                      (h != null && h >= 0) ? h.toStringAsFixed(2) : '0.00';

                  final today = DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day);
                  final firstDateAllowed = _isProblem
                      ? DateTime(today.year, today.month, 1)
                      : today;

                  final approvedId = widget.item!.approvedTbp ?? widget.item!.approvedHr;
                  final approverText = _approverText(state, approvedId);

                  return FormBuilder(
                    key: _formKey,
                    onChanged: () => setState(() {}),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // ── Card 1: Người duyệt + Bổ sung ──────
                                FormCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      FormBuilderField<String>(
                                        name: 'det_approver_id',
                                        initialValue: (widget.item!.approvedTbp ??
                                                widget.item!.approvedHr)
                                            ?.toString() ??
                                            '',
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: state.status ==
                                                BaseStateStatus.loading
                                            ? null
                                            : _openApproverSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            key: ValueKey(approverText),
                                            readOnly: true,
                                            nameForm: 'det_approver_text',
                                            nameTextField:
                                                'det_approver_text_tf',
                                            label: 'Người duyệt',
                                            icon: Icons.person_outlined,
                                            initialValue: approverText,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      FormCheckbox(
                                        name: 'det_is_problem',
                                        title: const Text(
                                          'Đăng ký bổ sung',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        initialValue:
                                            widget.item!.isProblem ?? false,
                                        onChanged: (value) {
                                          if (value == true &&
                                              !state
                                                  .isSupplementaryRegistrationOpen) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              if (!mounted) return;
                                              _formKey.currentState
                                                  ?.fields['det_is_problem']
                                                  ?.didChange(false);
                                            });
                                            context.showMessage(
                                              'Nhân sự chưa mở đăng ký bổ sung',
                                              type: SnackBarType.error,
                                            );
                                            return;
                                          }
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // ── Card 2: Thông tin đăng ký ──────────────
                                FormCard(
                                  title: 'Thông tin đăng ký',
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      FormBuilderDateTimePicker(
                                        name: 'det_date',
                                        inputType: InputType.date,
                                        format: dateFmt,
                                        initialValue: _slipDate,
                                        firstDate: firstDateAllowed,
                                        lastDate: today,
                                        decoration: formInputDecoration(
                                          context,
                                          label: 'Ngày',
                                          icon: Icons.date_range_outlined,
                                        ),
                                        onChanged: _onDateChanged,
                                      ),
                                      const SizedBox(height: 12),
                                      FormDateTimePicker(
                                        nameForm: 'det_time_start',
                                        nameTimePicker: 'det_time_start_inner',
                                        label: 'Thời gian bắt đầu',
                                        icon: Icons.access_time_outlined,
                                        inputType: InputType.both,
                                        format: bothFmt,
                                        initialValue: _initialTimeStart,
                                        initialDate: _slipDate,
                                        firstDate: _slipDate,
                                        lastDate: _slipDate.add(const Duration(
                                            hours: 23, minutes: 59)),
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        onChanged: (_) => setState(() {}),
                                      ),
                                      const SizedBox(height: 12),
                                      FormDateTimePicker(
                                        nameForm: 'det_time_end',
                                        nameTimePicker: 'det_time_end_inner',
                                        label: 'Thời gian kết thúc',
                                        icon: Icons.access_time_filled_outlined,
                                        inputType: InputType.both,
                                        format: bothFmt,
                                        initialValue: _initialTimeEnd,
                                        initialDate: _slipDate,
                                        firstDate: _slipDate,
                                        lastDate: _slipDate.add(const Duration(
                                            days: 1, hours: 8)),
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        onChanged: (_) => setState(() {}),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _breakController,
                                              focusNode: _breakFocusNode,
                                              keyboardType:
                                                  const TextInputType
                                                      .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        r'^\d*\.?\d{0,2}')),
                                              ],
                                              decoration: formInputDecoration(
                                                context,
                                                label: 'Giờ nghỉ giữa giờ',
                                                icon: Icons
                                                    .free_breakfast_outlined,
                                              ),
                                              onChanged: (_) => setState(() {}),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: TextFormField(
                                              key: ValueKey(totalText),
                                              initialValue: totalText,
                                              enabled: false,
                                              decoration: formInputDecoration(
                                                context,
                                                label: 'Tổng số giờ',
                                                icon: Icons.more_time_outlined,
                                              ),
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      FormInputField(
                                        label: 'Địa điểm',
                                        nameForm: 'det_location',
                                        nameTextField: 'det_location_tf',
                                        icon: Icons.location_on_outlined,
                                        maxLines: 1,
                                        initialValue: widget.item!.location ?? '',
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                      ),
                                      const SizedBox(height: 12),
                                      FormInputField(
                                        label: 'Ghi chú',
                                        nameForm: 'det_note',
                                        nameTextField: 'det_note_tf',
                                        icon: Icons.note_alt_outlined,
                                        maxLines: 3,
                                        initialValue: widget.item!.note ?? '',
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),

                        // Form Actions
                        FormActions(
                          mode: FormActionMode.edit,
                          saveEnabled: submitOk && !state.isSubmitting,
                          onSave: () => _onSubmit(state),
                          onCancel: () => context.pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Loading overlay
        BlocBuilder<OvernightBloc, OvernightState>(
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
