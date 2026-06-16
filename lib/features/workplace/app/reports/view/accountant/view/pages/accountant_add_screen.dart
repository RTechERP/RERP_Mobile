import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/accountant_bloc.dart';

class AccountantAddScreen extends StatefulWidget {
  const AccountantAddScreen({super.key});

  @override
  State<AccountantAddScreen> createState() => _AccountantAddScreenState();
}

class _AccountantAddScreenState
    extends
        BaseState<
          AccountantAddScreen,
          AccountantEvent,
          AccountantState,
          AccountantBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  late final List<_SlipMeta> _slips;
  int _selectedSlipIndex = 0;

  /// Cụm "Lỗi/vi phạm, Vấn đề tồn đọng, Việc gấp/phát sinh"
  bool _isExtraExpanded = false;

  @override
  void initState() {
    super.initState();
    final today = _dateOnly(DateTime.now());
    _slips = [_SlipMeta(date: today)];
  }

  static DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  int get _safeSlipIndex {
    if (_slips.isEmpty) return 0;
    return _selectedSlipIndex.clamp(0, _slips.length - 1);
  }

  void _addSlip() {
    final newDate = _slips.last.date;
    setState(() {
      _slips.add(_SlipMeta(date: newDate));
      _selectedSlipIndex = _slips.length - 1;
    });
  }

  void _removeSlipAt(int index) {
    if (_slips.length <= 1 || index < 0 || index >= _slips.length) return;
    setState(() {
      _slips.removeAt(index);
      if (_selectedSlipIndex >= _slips.length) {
        _selectedSlipIndex = _slips.length - 1;
      } else if (index < _selectedSlipIndex) {
        _selectedSlipIndex -= 1;
      }
    });
  }

  void _selectSlip(int index) {
    if (index < 0 || index >= _slips.length) return;
    setState(() => _selectedSlipIndex = index);
  }

  String _slipTabLabel(int index) {
    if (index < 0 || index >= _slips.length) return '—';
    return 'Báo cáo #${index + 1}';
  }

  void _onDateChanged(_SlipMeta slip, DateTime? date) {
    if (date == null) return;
    setState(() => slip.date = _dateOnly(date));
  }

  void _onSubmit(AccountantState state) {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      context.showMessage(
        'Vui lòng điền đầy đủ thông tin các phiếu',
        type: SnackBarType.error,
      );
      FormHelper.focusFirstError(
        formState: formState,
        slipPrefix: 'ac_slip_',
        slipKeys: _slips.map((s) => s.key).toList(),
        onSlipError: (idx) => setState(() => _selectedSlipIndex = idx),
      );
      return;
    }

    formState.save();
    final v = formState.value;

    final items = <AccountantSubmitItem>[];
    for (final slip in _slips) {
      final dt = slip.date;
      final now = DateTime.now();
      final reportDate = DateTime(
        dt.year,
        dt.month,
        dt.day,
        now.hour,
        now.minute,
        now.second,
      );
      items.add(
        AccountantSubmitItem(
          reportDate: reportDate,
          content: '${v['ac_slip_${slip.key}_mission'] ?? ''}',
          result: '${v['ac_slip_${slip.key}_results'] ?? ''}',
          nextPlan: '${v['ac_slip_${slip.key}_plan_next'] ?? ''}',
          pendingIssues: '${v['ac_slip_${slip.key}_backlog'] ?? ''}',
          urgent: '${v['ac_slip_${slip.key}_urgent'] ?? ''}',
          mistakeOrViolation: '${v['ac_slip_${slip.key}_note'] ?? ''}',
        ),
      );
    }
    bloc.add(
          const AccountantEvent.resetSubmitStatus(),
        );
    bloc.add(
          AccountantEvent.submit(items: items),
        );
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Tạo báo cáo kế toán'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<AccountantBloc, AccountantState>(
              bloc: bloc,
              builder: (context, state) {
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
                                title: 'Thông tin báo cáo',
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    _AccountantSlipTabsBar(
                                      labels: List.generate(
                                        _slips.length,
                                        _slipTabLabel,
                                      ),
                                      selectedIndex: _safeSlipIndex,
                                      onSelect: _selectSlip,
                                      onRemoveAt: _removeSlipAt,
                                      onAdd: _addSlip,
                                    ),
                                    const SizedBox(height: 12),
                                    IndexedStack(
                                      index: _safeSlipIndex,
                                      sizing: StackFit.loose,
                                      children: [
                                        for (final slip in _slips)
                                          _AccountantSlipFormFields(
                                            key: ValueKey(slip.key),
                                            slip: slip,
                                            isExtraExpanded: _isExtraExpanded,
                                            onToggleExtra: () => setState(
                                              () => _isExtraExpanded =
                                                  !_isExtraExpanded,
                                            ),
                                            onDateChanged: _onDateChanged,
                                          ),
                                      ],
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
                        onSubmit: state.isSubmitting
                            ? null
                            : () => _onSubmit(state),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        BlocListener<AccountantBloc, AccountantState>(
          bloc: bloc,
          listenWhen: (p, c) =>
          p.submitSuccess != c.submitSuccess ||
              p.status != c.status ||
              p.message != c.message,
          listener: (context, state) {
            if (state.status == BaseStateStatus.failed &&
                state.message != null &&
                state.message!.isNotEmpty) {
              showMessage(context, state.message!, type: SnackBarType.error);
              return;
            }
            if (state.submitSuccess == true) {
              if(context.mounted){
                showMessage(
                  context,
                  'Tạo báo cáo công việc thành công',
                  type: SnackBarType.success,
                );
                context.pop(true);
              }
            }
          },
          child: const SizedBox.shrink(),
        ),
        BlocBuilder<AccountantBloc, AccountantState>(
          bloc: bloc,
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.45),
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

class _SlipMeta {
  _SlipMeta({required this.date}) : key = 'k_${date.millisecondsSinceEpoch}';

  final String key;
  DateTime date;
}

class _AccountantSlipTabsBar extends StatelessWidget {
  const _AccountantSlipTabsBar({
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.onRemoveAt,
    required this.onAdd,
  });

  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onSelect;
  final void Function(int) onRemoveAt;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: i == selectedIndex
                        ? AppColors.primaryERP.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: i == selectedIndex
                          ? AppColors.primaryERP
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 13,
                          color: i == selectedIndex
                              ? AppColors.primaryERP
                              : Colors.black87,
                          fontWeight: i == selectedIndex
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                      if (labels.length > 1) ...[
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => onRemoveAt(i),
                          child: const Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add_circle_outline),
            color: AppColors.primaryERP,
          ),
        ],
      ),
    );
  }
}

class _AccountantSlipFormFields extends StatefulWidget {
  const _AccountantSlipFormFields({
    super.key,
    required this.slip,
    required this.isExtraExpanded,
    required this.onToggleExtra,
    required this.onDateChanged,
  });

  final _SlipMeta slip;
  final bool isExtraExpanded;
  final VoidCallback onToggleExtra;
  final void Function(_SlipMeta slip, DateTime? date) onDateChanged;

  @override
  State<_AccountantSlipFormFields> createState() =>
      _AccountantSlipFormFieldsState();
}

class _AccountantSlipFormFieldsState
    extends State<_AccountantSlipFormFields> {
  String get _pref => 'ac_slip_${widget.slip.key}';

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd/MM/yyyy');
    final today = DateTime.now();

    return KeyedSubtree(
      key: ValueKey(widget.slip.key),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Ngày báo cáo (luôn init hôm nay, isRequired)
          FormBuilderDateTimePicker(
            name: '${_pref}_date',
            inputType: InputType.date,
            format: dateFmt,
            initialValue: widget.slip.date,
            firstDate: DateTime(today.year, today.month - 1, 1),
            lastDate: today,
            decoration: formInputDecoration(
              context,
              label: 'Ngày báo cáo',
              icon: Icons.date_range_outlined,
              isRequired: true,
            ),
            onChanged: (date) => widget.onDateChanged(widget.slip, date),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 12),

          // Việc đã làm (isRequired, autoExpand)
          FormInputField(
            label: 'Việc đã làm',
            nameForm: '${_pref}_mission',
            nameTextField: '${_pref}_mission_tf',
            icon: Icons.work_outline_rounded,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Vui lòng nhập việc đã làm';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Kết quả (isRequired, autoExpand)
          FormInputField(
            label: 'Kết quả',
            nameForm: '${_pref}_results',
            nameTextField: '${_pref}_results_tf',
            icon: Icons.check_circle_outline_rounded,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Vui lòng nhập kết quả';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Kế hoạch tiếp theo (isRequired, autoExpand)
          FormInputField(
            label: 'Kế hoạch tiếp theo',
            nameForm: '${_pref}_plan_next',
            nameTextField: '${_pref}_plan_next_tf',
            icon: Icons.event_note_outlined,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Vui lòng nhập kế hoạch tiếp theo';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          // Lỗi/vi phạm (autoExpand)
          FormInputField(
            label: 'Lỗi/vi phạm',
            nameForm: '${_pref}_note',
            nameTextField: '${_pref}_note_tf',
            icon: Icons.warning_amber_rounded,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 12),

          // ── Cụm thu gọn: Lỗi/vi phạm + Tồn đọng + Việc gấp ─────────────
          InkWell(
            onTap: widget.onToggleExtra,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Row(
                children: [
                  Icon(
                    widget.isExtraExpanded
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_right_rounded,
                    color: AppColors.primaryERP,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Thông tin bổ sung',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.heading,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.isExtraExpanded) ...[
            const SizedBox(height: 12),
            // Vấn đề tồn đọng (autoExpand)
            FormInputField(
              label: 'Vấn đề tồn đọng',
              nameForm: '${_pref}_backlog',
              nameTextField: '${_pref}_backlog_tf',
              icon: Icons.help_outline_rounded,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 12),
            // Việc gấp/phát sinh (autoExpand)
            FormInputField(
              label: 'Việc gấp/phát sinh',
              nameForm: '${_pref}_urgent',
              nameTextField: '${_pref}_urgent_tf',
              icon: Icons.priority_high_rounded,
              textInputAction: TextInputAction.newline,
              autoExpand: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ],
      ),
    );
  }
}
