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
import '../../data/datasource/models/wfh_model.dart';
import '../bloc/wfh_bloc.dart';

class _WfhSessionOption {
  const _WfhSessionOption({required this.key, required this.label});

  final String key;
  final String label;
}

const _kWfhSessionOptions = <_WfhSessionOption>[
  _WfhSessionOption(key: 'morning', label: 'Buổi sáng'),
  _WfhSessionOption(key: 'afternoon', label: 'Buổi chiều'),
  _WfhSessionOption(key: 'full_day', label: 'Cả ngày'),
];

/// Trùng với [FormDateTimePicker.nameTimePicker] — chỉ dùng sync UI, không đọc khi submit.
const _kWfhDateInnerUnused = 'wfh_add_date_time_inner_unused';

/// Giá trị gửi API `ApprovedID` — đồng bộ In/Out: dùng **EmployeeID** (mã NV người duyệt),
/// không dùng `ID` dòng approver (BE hay trả `ID: -1` trong khi `EmployeeID` mới đúng).
int _approvedWfhPayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

class WfhAddScreen extends StatefulWidget {
  const WfhAddScreen({super.key});

  @override
  State<WfhAddScreen> createState() => _WfhAddScreenState();
}

class _WfhAddScreenState
    extends BaseState<WfhAddScreen, WfhEvent, WfhState, WfhBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late final DateTime _todayStart;
  late final DateTime _firstWfhDate;
  late final DateTime _initialWfhDate;

  /// Khớp mẫu API: TimeWFH + TotalDay (có thể chỉnh mapping theo contract BE).
  ({int timeWFH, double totalDay}) _mapSession(String? v) {
    switch (v) {
      case 'afternoon':
        return (timeWFH: 2, totalDay: 0.5);
      case 'full_day':
        return (timeWFH: 3, totalDay: 1.0);
      case 'morning':
      default:
        return (timeWFH: 1, totalDay: 0.5);
    }
  }

  bool _isWfhSelectableDay(DateTime day) {
    final d = DateTime(day.year, day.month, day.day);
    final t = DateTime.now();
    final todayStart = DateTime(t.year, t.month, t.day);
    return d.isAfter(todayStart);
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    final today = _todayStart;
    _firstWfhDate = today.add(const Duration(days: 1));
    _initialWfhDate = _firstWfhDate;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WfhEvent.clearSubmitState());
      bloc.add(const WfhEvent.initAdd());
    });
  }

  Future<void> _openSessionSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<_WfhSessionOption>(
      context: context,
      title: 'Chọn thời gian',
      items: _kWfhSessionOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['regwork_wfh_add_session']?.didChange(o.key);
        form.fields['regwork_wfh_add_session_text']?.didChange(o.label);
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
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final idValue = _approvedWfhPayloadValue(item);
        final line = '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['regwork_wfh_add_approver_id']?.didChange(
          idValue.toString(),
        );
        form.fields['regwork_wfh_add_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    final lastDate = _firstWfhDate.add(const Duration(days: 365 * 5));

    return Stack(
      children: [
        MultiBlocListener(
          listeners: [
            BlocListener<WfhBloc, WfhState>(
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
                  bloc.add(const WfhEvent.clearSubmitState());
                  context.pop(true);
                }
              },
            ),
            BlocListener<WfhBloc, WfhState>(
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
                      return _approvedWfhPayloadValue(a) == targetId;
                    },
                    orElse: () => null,
                  );

                  if (match != null) {
                    final idValue = _approvedWfhPayloadValue(match);
                    final line =
                        '${match.code ?? ''} - ${match.fullName ?? ''}'.trim();
                    form.fields['regwork_wfh_add_approver_id']?.didChange(
                      idValue.toString(),
                    );
                    form.fields['regwork_wfh_add_approver_text']?.didChange(line);
                  }
                }
              },
            ),
          ],
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo đơn WFH')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<WfhBloc, WfhState>(
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
                                  title: 'Thông tin làm việc tại nhà',
                                  child: Column(
                                    children: [
                                      FormDateTimePicker(
                                        nameForm: 'regwork_wfh_add_date',
                                        nameTimePicker: _kWfhDateInnerUnused,
                                        label: 'Ngày',
                                        icon: Icons.date_range_outlined,
                                        inputType: InputType.date,
                                        format: DateFormat('dd/MM/yyyy'),
                                        initialValue: _initialWfhDate,
                                        initialDate: _initialWfhDate,
                                        firstDate: _firstWfhDate,
                                        lastDate: lastDate,
                                        selectableDayPredicate:
                                            _isWfhSelectableDay,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null) return 'Vui lòng chọn ngày';
                                          return null;
                                        },
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                      ),

                                      const SizedBox(height: 12),

                                      FormBuilderField<String>(
                                        name: 'regwork_wfh_add_session',
                                        initialValue: 'morning',
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: _openSessionSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm:
                                                'regwork_wfh_add_session_text',
                                            nameTextField:
                                                'regwork_wfh_add_session_text_field',
                                            label: 'Thời gian',
                                            icon: Icons.schedule_outlined,
                                            initialValue: 'Buổi sáng',
                                            isRequired: true,
                                            validator: (v) {
                                              if (v == null || v.isEmpty) return 'Vui lòng chọn thời gian';
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      FormBuilderField<String>(
                                        name: 'regwork_wfh_add_approver_id',
                                        initialValue: '',
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: _openApproverSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm:
                                            'regwork_wfh_add_approver_text',
                                            nameTextField:
                                            'regwork_wfh_add_approver_text_field',
                                            label: 'Người duyệt',
                                            icon: Icons
                                                .supervisor_account_outlined,
                                            isRequired: true,
                                            validator: (v) {
                                              if (v == null || v.trim().isEmpty) return 'Vui lòng chọn người duyệt';
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      FormInputField(
                                        nameForm: 'wfh_add_content',
                                        nameTextField: 'wfh_add_content_tf',
                                        label: 'Nội dung/Kế hoạch',
                                        icon: Icons.content_paste,
                                        textInputAction: TextInputAction.newline,
                                        autoExpand: true,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.trim().isEmpty) return 'Vui lòng nhập nội dung/kế hoạch';
                                          return null;
                                        },
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                      ),
                                      const SizedBox(height: 12),

                                      FormInputField(
                                        nameForm: 'wfh_add_reason',
                                        nameTextField: 'wfh_add_reason_tf',
                                        label: 'Lý do',
                                        icon: Icons.note_alt_outlined,
                                        textInputAction: TextInputAction.newline,
                                        autoExpand: true,
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.trim().isEmpty) return 'Vui lòng nhập lý do';
                                          return null;
                                        },
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                      ),
                                      const SizedBox(height: 12),

                                      FormInputField(
                                        nameForm: 'wfh_add_note',
                                        nameTextField: 'wfh_add_note_tf',
                                        label: 'Ghi chú',
                                        textInputAction: TextInputAction.newline,
                                        autoExpand: true,
                                        icon: Icons.comment_outlined,
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

                            final dateOuter =
                                values['regwork_wfh_add_date'] as DateTime?;
                            final date = dateOuter ?? _initialWfhDate;

                            final sessionRaw =
                                '${values['regwork_wfh_add_session'] ?? ''}';
                            final approverIdRaw =
                                '${values['regwork_wfh_add_approver_id'] ?? ''}';
                            final content =
                                '${values['wfh_add_content'] ?? ''}';
                            final reason = '${values['wfh_add_reason'] ?? ''}';
                            final note = '${values['wfh_add_note'] ?? ''}';


                            final approvedId =
                                int.tryParse(approverIdRaw.trim()) ?? 0;
                            final slot =
                                _mapSession(sessionRaw.trim());
                            context.read<WfhBloc>().add(
                                  WfhEvent.submit(
                                    approvedId: approvedId,
                                    dateWFH: date,
                                    timeWFH: slot.timeWFH,
                                    totalDay: slot.totalDay,
                                    contentWork: content,
                                    reason: reason,
                                    note: note.trim().isEmpty
                                        ? null
                                        : note.trim(),
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
        BlocBuilder<WfhBloc, WfhState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) return const SizedBox.shrink();
            return Positioned.fill(
              child: AbsorbPointer(
                child: Container(
                  color: Colors.black.withValues(alpha:0.45),
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
