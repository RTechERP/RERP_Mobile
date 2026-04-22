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

int approvedInOutPayloadValue(ApproverItem item) => item.employeeId ?? item.id;



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

  static const List<FormChoiceOption<String>> _inOutTypes = [
    FormChoiceOption(value: 'late_personal', label: 'Đi muộn việc cá nhân', selectedColor: AppColors.primaryERP),
    FormChoiceOption(value: 'early_personal', label: 'Về sớm việc cá nhân', selectedColor: AppColors.primaryERP),
    FormChoiceOption(value: 'late_company', label: 'Đi muộn việc công ty', selectedColor: AppColors.primaryERP),
    FormChoiceOption(value: 'early_company', label: 'Về sớm việc công ty', selectedColor: AppColors.primaryERP),
  ];
  final _formKey = GlobalKey<FormBuilderState>();
  final _typeFieldKey = GlobalKey<FormBuilderFieldState>();

  late final DateTime _todayStart;

  int _mapType(String? raw) {
    switch (raw) {
      case 'late_personal':
        return 1;
      case 'early_personal':
        return 2;
      case 'early_company':
        return 3;
      case 'late_company':
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
    final typeField = _typeFieldKey.currentState;
    if (typeField == null) return;

    final rawType = '${typeField.value ?? ''}'.trim();

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

    final option = _inOutTypes.firstWhere(
      (e) => e.value == pickKey,
      orElse: () => _inOutTypes.first,
    );

    typeField.didChange(option.value);
    _autoSetTimeByType(option.value);
  }

  void _autoSetTimeByType(String? type) {
    if (type == null || type.isEmpty) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final selectedDate =
          form.fields['regwork_inout_add_date']?.value as DateTime?;

      final base = selectedDate ?? DateTime.now();

      return DateTime(base.year, base.month, base.day, h, m);
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

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.approvers
        .where((e) => e.isDeleted != true)
        .toList();

    if (items.isEmpty) {
      context.showMessage('Chưa có người duyệt', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
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
        MultiBlocListener(
          listeners: [
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
            ),
              BlocListener<InOutBloc, InOutState>(
                listenWhen: (previous, current) =>
                    previous.approveId != current.approveId ||
                    previous.approvers != current.approvers,
                listener: (context, state) {
                  if (state.approveId != null && state.approvers.isNotEmpty) {
                    final form = _formKey.currentState;
                    if (form == null) return;

                    final targetId = state.approveId!.approveId;
                    final match = state.approvers.cast<ApproverItem?>().firstWhere(
                      (a) {
                        if (a == null || a.isDeleted == true) return false;
                        return _approvedTpPayloadValue(a) == targetId;
                      },
                      orElse: () => null,
                    );

                    if (match != null) {
                      final tpValue = _approvedTpPayloadValue(match);
                      final line =
                          '${match.code ?? ''} - ${match.fullName ?? ''}'.trim();
                      form.fields['regwork_inout_add_approver_tp']?.didChange(
                        tpValue.toString(),
                      );
                      form.fields['regwork_inout_add_approver_text']?.didChange(line);
                    }
                  }
                },
              ),
          ],
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo đơn đi muộn - về sớm')),
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
                                  child: Column(
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
                                            isRequired: true,
                                            validator: (v) {
                                              if (v == null || v.trim().isEmpty) {
                                                return 'Vui lòng chọn người duyệt';
                                              }
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      FormDateTimePicker(
                                        nameForm: 'regwork_inout_add_date',
                                        // Inner field: không dùng khi submit (chỉ dùng `nameForm`).
                                        nameTimePicker:
                                            'inout_add_date_time_inner_unused',
                                        label: 'Ngày',
                                        icon: Icons.date_range_outlined,
                                        inputType: InputType.date,
                                        format: DateFormat('dd/MM/yyyy'),
                                        firstDate: _todayStart,
                                        initialValue: _todayStart,
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

                                      const SizedBox(height: 12),

                                      FormChoiceGroup<String>(
                                        fieldKey: _typeFieldKey,
                                        name: 'regwork_inout_add_type',
                                        label: 'Loại',
                                        icon: Icons.swap_vert_outlined,
                                        options: _inOutTypes,
                                        onChanged: (value) {
                                          _autoSetTimeByType(value);
                                        },
                                      ),

                                      const SizedBox(height: 12),

                                      FormInputField(
                                        nameForm: 'regwork',
                                        nameTextField:
                                        'regwork_inout_add_reason',
                                        label: 'Lý do',
                                        icon: Icons.note_alt_outlined,
                                        autoExpand: true,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.trim().isEmpty) {
                                            return 'Vui lòng nhập lý do';
                                          }
                                          return null;
                                        },
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                      ),
                                    ],
                                  ),
                                ),
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

                            // Ngày: chỉ lấy `regwork_inout_add_date` (outer) -> fallback hôm nay nếu null.
                            // Giờ: lấy theo `inout_add_from` / `inout_add_to` (inner) như auto-set.
                            final dateOuter =
                                values['regwork_inout_add_date'] as DateTime?;
                            final date = dateOuter ?? _todayStart;

                            final fromInner =
                                values['inout_add_from'] as DateTime?;
                            final toInner = values['inout_add_to'] as DateTime?;
                            final typeRaw =
                                '${values['regwork_inout_add_type'] ?? ''}'
                                    .trim();
                            final approverTpRaw =
                                '${values['regwork_inout_add_approver_tp'] ?? ''}'
                                    .trim();
                            final reason =
                                '${values['regwork_inout_add_reason'] ?? ''}';

                            DateTime time(int h, int m) =>
                                DateTime(date.year, date.month, date.day, h, m);

                            final (defaultFrom, defaultTo) = switch (typeRaw) {
                              final t when t.contains('early') => (
                                time(16, 30),
                                time(17, 30),
                              ),
                              final t when t.contains('late') => (
                                time(8, 0),
                                time(9, 0),
                              ),
                              _ => (time(8, 0), time(9, 0)),
                            };

                            final from = fromInner ?? defaultFrom;
                            final to = toInner ?? defaultTo;

                            final dateStart = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              from.hour,
                              from.minute,
                            );
                            final dateEnd = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              to.hour,
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
