import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/missed_model.dart';
import '../bloc/missed_bloc.dart';

/// Giá trị gửi API `ApprovedTP` — cùng quy ước WFH/InOut: ưu tiên `EmployeeID` người duyệt.
int _approvedMissedPayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

class MissedAddScreen extends StatefulWidget {
  const MissedAddScreen({super.key});

  @override
  State<MissedAddScreen> createState() => _MissedAddScreenState();
}

class _MissedAddScreenState
    extends BaseState<MissedAddScreen, MissedEvent, MissedState, MissedBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  /// Ngày muộn nhất có thể chọn trên lịch (cho phép đăng ký trước tương lai gần).
  late final DateTime _lastSelectableDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _lastSelectableDate = DateTime(_todayStart.year + 2, 12, 31);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const MissedEvent.clearSubmitState());
      bloc.add(const MissedEvent.fetchApprovers());
    });
  }

  /// Phút trong ngày gửi API — mặc định theo loại (không có ô chọn giờ riêng).
  int _timeMissedMinutesForType(String type) {
    switch (type.trim()) {
      case 'check_out':
        return 17 * 60 + 30;
      case 'check_in':
      default:
        return 8 * 60;
    }
  }

  Future<void> _openApproverSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    final items =
        bloc.state.approvers.where((e) => e.isDeleted != true).toList();

    if (items.isEmpty) {
      context.showMessage(
        'Chưa có người duyệt.',
        type: SnackBarType.error,
      );
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final idValue = _approvedMissedPayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['regwork_missed_add_approver_id']?.didChange(
          idValue.toString(),
        );
        form.fields['regwork_missed_add_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MissedBloc, MissedState>(
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
              bloc.add(const MissedEvent.clearSubmitState());
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo đơn quên chấm công'),
              onBackTap: () => context.pop(),
            ),
            body: Column(
              children: [
                Expanded(
                  child: FormBuilder(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        FormCard(
                          title: 'Thông tin quên chấm công',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormDateTimePicker(
                                nameForm: 'regwork_missed_add_date',
                                nameTimePicker: 'missed_add_date_time',
                                label: 'Ngày',
                                icon: Icons.date_range_outlined,
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                initialValue: _todayStart,
                                initialDate: _todayStart,
                                firstDate: _todayStart,
                                lastDate: _lastSelectableDate,
                              ),
                              const SizedBox(height: 12),
                              FormRadioGroup(
                                name: 'regwork_missed_add_type',
                                label: 'Loại',
                                options: const [
                                  FormRadioOption(
                                    value: 'check_in',
                                    icon: Icons.login_rounded,
                                    label: 'Quên lúc đến',
                                  ),
                                  FormRadioOption(
                                    value: 'check_out',
                                    icon: Icons.logout_rounded,
                                    label: 'Quên lúc về',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              FormBuilderField<String>(
                                name: 'regwork_missed_add_approver_id',
                                initialValue: '',
                                builder: (_) => const SizedBox.shrink(),
                              ),
                              GestureDetector(
                                onTap: _openApproverSheet,
                                child: AbsorbPointer(
                                  child: FormInputField(
                                    readOnly: true,
                                    nameForm:
                                        'regwork_missed_add_approver_text',
                                    nameTextField:
                                        'regwork_missed_add_approver_text_field',
                                    label: 'Người duyệt',
                                    icon: Icons.supervisor_account_outlined,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: BlocBuilder<MissedBloc, MissedState>(
                    buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
                    builder: (context, state) {
                      return FormActions(
                        mode: FormActionMode.add,
                        onSubmit: state.isSubmitting
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();

                                final formState = _formKey.currentState;
                                if (formState == null) return;
                                if (!formState.saveAndValidate()) return;

                                final values = formState.value;

                                final summaryErr =
                                    ValidateHelper.validateMissed(
                                  dateMissed: values['regwork_missed_add_date']
                                      as DateTime?,
                                  typeRaw: values['regwork_missed_add_type']
                                      as String?,
                                  approverIdRaw:
                                      '${values['regwork_missed_add_approver_id'] ?? ''}',
                                  earliestSelectableDay: _todayStart,
                                );
                                if (summaryErr != null) {
                                  context.showMessage(
                                    summaryErr,
                                    type: SnackBarType.error,
                                  );
                                  return;
                                }

                                final typeStr =
                                    values['regwork_missed_add_type']
                                        as String;
                                final approvedId = int.parse(
                                  '${values['regwork_missed_add_approver_id']}'
                                      .trim(),
                                );
                                final dateMissed =
                                    values['regwork_missed_add_date']
                                        as DateTime;
                                final reason =
                                    '${values['regwork_missed_add_reason'] ?? ''}'
                                        .trim();
                                final note =
                                    '${values['regwork_missed_add_note'] ?? ''}'
                                        .trim();

                                bloc.add(
                                  MissedEvent.submit(
                                    approvedId: approvedId,
                                    dateMissed: DateTime(
                                      dateMissed.year,
                                      dateMissed.month,
                                      dateMissed.day,
                                    ),
                                    timeMissed:
                                        _timeMissedMinutesForType(typeStr),
                                    totalDay: 1.0,
                                    contentWork: typeStr,
                                    reason: reason,
                                    note: note.isEmpty ? null : note,
                                  ),
                                );
                              },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<MissedBloc, MissedState>(
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
