import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/in_out_model.dart';
import '../bloc/in_out_bloc.dart';

class _InOutTypeOption {
  const _InOutTypeOption({required this.key, required this.label});

  final String key;
  final String label;
}

const _kInOutTypeOptions = <_InOutTypeOption>[
  _InOutTypeOption(key: 'early_company', label: 'Về sớm việc công ty'),
  _InOutTypeOption(key: 'early_personal', label: 'Về sớm việc cá nhân'),
  _InOutTypeOption(key: 'late_company', label: 'Đi muộn việc công ty'),
  _InOutTypeOption(key: 'late_personal', label: 'Đi muộn việc cá nhân'),
];

/// Trùng với [FormDateTimePicker.nameTimePicker] — cần [didChange] cả hai mới sync UI.
const _kInOutTimeFromInner = 'inout_add_from';
const _kInOutTimeToInner = 'inout_add_to';

/// Giá trị gửi API `ApprovedTP` — đồng bộ TBP đặt xe: dùng **EmployeeID** (mã NV người duyệt),
/// không dùng [Type] (thường là cấp/loại, hay trùng `1` cho nhiều dòng).
int _approvedTpPayloadValue(ApproverItem item) => item.employeeId ?? item.id;

class InOutAddScreenPage extends StatefulWidget {
  const InOutAddScreenPage({super.key});

  @override
  State<InOutAddScreenPage> createState() => _InOutAddScreenPageState();
}

class _InOutAddScreenPageState
    extends BaseState<InOutAddScreenPage, InOutEvent, InOutState, InOutBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;

  int _mapType(String? raw) {
    switch (raw) {
      case 'late_company':
        return 1;
      case 'early_company':
        return 2;
      case 'late_personal':
        return 3;
      case 'early_personal':
        return 4;
      default:
        return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const InOutEvent.clearSubmitState());
      bloc.add(const InOutEvent.initAdd());
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _autoSelectTypeByTimeWindow();
      });
    });
  }

  void _autoSelectTypeByTimeWindow() {
    final form = _formKey.currentState;
    if (form == null) return;

    final rawType =
        '${form.fields['regwork_inout_add_type']?.value ?? ''}'.trim();

    // User đã chọn sẵn thì không auto override.
    if (rawType.isNotEmpty) return;

    final now = DateTime.now();
    final minutes = now.hour * 60 + now.minute;

    String? pickKey;
    // (8h-12h) => đi muộn việc cá nhân
    if (minutes >= 8 * 60 && minutes <= 12 * 60) {
      pickKey = 'late_personal';
    }

    // (12h10 - 17h30) => về sớm việc cá nhân
    if (minutes >= 12 * 60 + 10 && minutes <= 17 * 60 + 30) {
      pickKey = 'early_personal';
    }

    if (pickKey == null) return;

    final option = _kInOutTypeOptions.firstWhere(
      (e) => e.key == pickKey,
      orElse: () => _kInOutTypeOptions.first,
    );

    form.fields['regwork_inout_add_type']?.didChange(option.key);
    form.fields['regwork_inout_add_type_text']?.didChange(option.label);
    _autoSetTimeByType(option.key);
  }

  void _autoSetTimeByType(String? type) {
    if (type == null || type.isEmpty) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      return DateTime(today.year, today.month, today.day, h, m);
    }

    late final DateTime from;
    late final DateTime to;
    if (type.contains('early')) {
      from = time(16, 30);
      to = time(17, 30);
    } else if (type.contains('late')) {
      from = time(8, 0);
      to = time(9, 0);
    } else {
      return;
    }

    // FormDateTimePicker cần sync cả 2 field (nameForm + nameTimePicker).
    form.fields['regwork_inout_add_from']?.didChange(from);
    form.fields[_kInOutTimeFromInner]?.didChange(from);
    form.fields['regwork_inout_add_to']?.didChange(to);
    form.fields[_kInOutTimeToInner]?.didChange(to);
  }

  Future<void> _openTypeSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<_InOutTypeOption>(
      context: context,
      title: 'Chọn loại',
      items: _kInOutTypeOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['regwork_inout_add_type']?.didChange(o.key);
        form.fields['regwork_inout_add_type_text']?.didChange(o.label);
        _autoSetTimeByType(o.key);
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
        'Chưa có người duyệt',
        type: SnackBarType.error,
      );
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) =>
          '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final tpValue = _approvedTpPayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['regwork_inout_add_approver_tp']?.didChange(
          tpValue.toString(),
        );
        form.fields['regwork_inout_add_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<InOutBloc, InOutState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess ||
              previous.message != current.message,
          listener: (context, state) {
            if ((state.message ?? '').isNotEmpty) {
              context.showMessage(
                state.message!,
                type: state.submitSuccess
                    ? SnackBarType.success
                    : SnackBarType.error,
              );
            }
            if (state.submitSuccess) {
              bloc.add(const InOutEvent.clearSubmitState());
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo đơn')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<InOutBloc, InOutState>(
                builder: (context, state) {
                  return FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                FormCard(
                                  title: 'Thông tin đi muộn - về sớm',
                                  child: Column(
                                    children: [
                                      FormDateTimePicker(
                                        nameForm: 'regwork_inout_add_date',
                                        nameTimePicker: 'input_add_date_time',
                                        label: 'Ngày',
                                        icon: Icons.date_range_outlined,
                                        inputType: InputType.date,
                                        format: DateFormat('dd/MM/yyyy'),
                                        firstDate: _todayStart,
                                        initialValue: _todayStart,
                                      ),

                                      const SizedBox(height: 12),

                                      FormBuilderField<String>(
                                        name: 'regwork_inout_add_type',
                                        initialValue: '',
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: () => _openTypeSheet(),
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm:
                                                'regwork_inout_add_type_text',
                                            nameTextField:
                                                'regwork_inout_add_type_text_field',
                                            label: 'Loại',
                                            icon: Icons.swap_vert_outlined,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: FormDateTimePicker(
                                              nameForm:
                                                  'regwork_inout_add_from',
                                              nameTimePicker: 'inout_add_from',
                                              label: 'Từ',
                                              icon: Icons.schedule_outlined,
                                              inputType: InputType.time,
                                              format: DateFormat('HH:mm'),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: FormDateTimePicker(
                                              nameForm: 'regwork_inout_add_to',
                                              nameTimePicker: 'inout_add_to',
                                              label: 'Đến',
                                              icon: Icons.schedule_outlined,
                                              inputType: InputType.time,
                                              format: DateFormat('HH:mm'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                FormCard(
                                  title: 'Người kiểm duyệt',
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      FormBuilderField<String>(
                                        name: 'regwork_inout_add_approver_tp',
                                        initialValue: '',
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: () => _openApproverSheet(),
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm:
                                                'regwork_inout_add_approver_text',
                                            nameTextField:
                                                'regwork_inout_add_approver_text_field',
                                            label: 'Người duyệt',
                                            icon: Icons
                                                .supervisor_account_outlined,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                FormCard(
                                  title: 'Lý do',
                                  child: FormInputField(
                                    nameForm: 'regwork',
                                    nameTextField: 'regwork_inout_add_reason',
                                    label: '',
                                    icon: Icons.note_alt_outlined,
                                    maxLines: 5,
                                  ),
                                ),

                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),

                        FormActions(
                          mode: FormActionMode.add,
                          onSubmit: () {
                            FocusScope.of(context).unfocus();

                            final formState = _formKey.currentState;
                            if (formState == null) return;
                            if (!formState.saveAndValidate()) return;

                            final values = formState.value;

                            final date =
                                values['regwork_inout_add_date'] as DateTime?;
                            final from =
                                values['regwork_inout_add_from'] as DateTime?;
                            final to =
                                values['regwork_inout_add_to'] as DateTime?;
                            final typeRaw =
                                '${values['regwork_inout_add_type'] ?? ''}'
                                    .trim();
                            final approverTpRaw =
                                '${values['regwork_inout_add_approver_tp'] ?? ''}'
                                    .trim();
                            final reason =
                                '${values['regwork_inout_add_reason'] ?? ''}';
                            final validateErr = ValidateHelper.validateInOut(
                              todayStart: _todayStart,
                              date: date,
                              from: from,
                              to: to,
                              typeRaw: typeRaw,
                              approverTpRaw: approverTpRaw,
                              reason: reason,
                            );
                            if (validateErr != null) {
                              context.showMessage(
                                validateErr,
                                type: SnackBarType.error,
                              );
                              return;
                            }

                            final dateStart = DateTime(
                              date!.year,
                              date.month,
                              date.day,
                              from!.hour,
                              from.minute,
                            );
                            final dateEnd = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              to!.hour,
                              to.minute,
                            );

                            final timeRegister = dateEnd
                                .difference(dateStart)
                                .inMinutes;

                            final type = _mapType(typeRaw);
                            final approvedTP = int.tryParse(approverTpRaw) ?? 0;

                            context.read<InOutBloc>().add(
                              InOutEvent.submit(
                                type: type,
                                approvedTP: approvedTP,
                                dateStart: dateStart,
                                dateEnd: dateEnd,
                                timeRegister: timeRegister,
                                reason: reason,
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
        BlocBuilder<InOutBloc, InOutState>(
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
