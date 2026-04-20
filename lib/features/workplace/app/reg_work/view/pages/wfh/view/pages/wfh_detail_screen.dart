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
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/wfh_model.dart';
import '../bloc/wfh_bloc.dart';

int _approverPayloadValue(ApproverItem item) => item.employeeId ?? item.id;

class _WfhDetailSessionOption {
  const _WfhDetailSessionOption({required this.key, required this.label});

  final String key;
  final String label;
}

const _kWfhDetailSessionOptions = <_WfhDetailSessionOption>[
  _WfhDetailSessionOption(key: 'morning', label: 'Buổi sáng'),
  _WfhDetailSessionOption(key: 'afternoon', label: 'Buổi chiều'),
  _WfhDetailSessionOption(key: 'full_day', label: 'Cả ngày'),
];

const _kWfhDetailDateInnerUnused = 'wfh_detail_date_time_inner_unused';

String _sessionKeyFromItem(WfhItem item) {
  switch (item.timeWFH) {
    case 2:
      return 'afternoon';
    case 3:
      return 'full_day';
    case 1:
    default:
      return 'morning';
  }
}

String _sessionDisplayLabel(WfhItem item) {
  final t = (item.timeWFHText ?? '').trim();
  if (t.isNotEmpty) return t;
  return switch (_sessionKeyFromItem(item)) {
    'afternoon' => 'Buổi chiều',
    'full_day' => 'Cả ngày',
    _ => 'Buổi sáng',
  };
}

bool _isHrApproved(WfhItem item) {
  if (item.statusHRNumber == 1) return true;
  final text = (item.statusHRText ?? '').toLowerCase();
  if (text.contains('duyệt') && !text.contains('chờ')) return true;
  return false;
}

String _approverDisplayLine(WfhItem item) {
  final name = (item.approvedName ?? '').trim();
  if (name.isNotEmpty) return name;
  final aid = item.approvedId;
  return aid != null ? 'Mã duyệt: $aid' : '';
}

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

class WfhDetailScreen extends StatefulWidget {
  const WfhDetailScreen({super.key});

  @override
  State<WfhDetailScreen> createState() => _WfhDetailScreenState();
}

class _WfhDetailScreenState
    extends BaseState<WfhDetailScreen, WfhEvent, WfhState, WfhBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  WfhItem? _item;
  bool _invalidRoute = false;
  late DateTime _todayStart;
  late DateTime _selectedDate;

  /// Khóa sửa khi TBP / BGD / HR đã duyệt (đồng bộ danh sách WFH).
  bool get _lockedByApproval {
    final i = _item;
    if (i == null) return true;
    return i.isApproved == true ||
        i.isApprovedBGD == true ||
        _isHrApproved(i);
  }

  bool get _canEdit => _item != null && !_lockedByApproval;

  bool get _showFormActions => !_lockedByApproval;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _selectedDate = _todayStart;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      bloc.add(const WfhEvent.clearSubmitState());
      bloc.add(const WfhEvent.fetchApprovers());

      final extra = GoRouterState.of(context).extra;
      if (extra is! WfhItem) {
        setState(() => _invalidRoute = true);
        return;
      }

      final d = extra.dateWFH;
      if (d == null) {
        setState(() {
          _item = extra;
          _invalidRoute = true;
        });
        return;
      }

      setState(() {
        _item = extra;
        _selectedDate = DateTime(d.year, d.month, d.day);
      });
    });
  }

  Future<void> _openSessionSheet() async {
    if (!_canEdit) return;
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<_WfhDetailSessionOption>(
      context: context,
      title: 'Chọn thời gian',
      items: _kWfhDetailSessionOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['regwork_wfh_detail_session']?.didChange(o.key);
        form.fields['regwork_wfh_detail_session_text']?.didChange(o.label);
      },
    );
  }

  Future<void> _openApproverSheet() async {
    if (!_canEdit) return;
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
      onSelected: (a) {
        final idStr = _approverPayloadValue(a).toString();
        final line = '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
        form.fields['regwork_wfh_detail_approver_id']?.didChange(idStr);
        form.fields['regwork_wfh_detail_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    if (_invalidRoute) {
      return BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết đơn WFH'),
          onBackTap: () => context.pop(false),
        ),
        body: const Center(
          child: Text('Không tìm thấy đơn hoặc dữ liệu không hợp lệ'),
        ),
      );
    }

    if (_item == null) {
      return BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết đơn WFH'),
          onBackTap: () => context.pop(false),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final item = _item!;
    final decline = (item.reasonDeciline ?? '').trim();
    final showDecline = decline.isNotEmpty;
    final day = _selectedDate;
    final sessionKey = _sessionKeyFromItem(item);
    final approverIdStr = item.approvedId != null ? '${item.approvedId}' : '';
    final lastDate = _todayStart.add(const Duration(days: 365 * 8));

    return Stack(
      children: [
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
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Chi tiết đơn WFH'),
              onBackTap: () => context.pop(false),
            ),
            body: BlocBuilder<WfhBloc, WfhState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            if (showDecline) ...[
                              FormCard(
                                title: 'Lý do không đồng ý duyệt',
                                child: FormInputField(
                                  enabled: false,
                                  nameForm: 'wfh_detail_decline',
                                  nameTextField: 'wfh_detail_decline_tf',
                                  label: 'Lý do',
                                  icon: Icons.note_alt_outlined,
                                  maxLines: 3,
                                  initialValue: decline,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            FormCard(
                              title: 'Thông tin làm việc tại nhà',
                              child: Column(
                                children: [
                                  if (_canEdit) ...[
                                    FormBuilderField<String>(
                                      name: 'regwork_wfh_detail_session',
                                      initialValue: sessionKey,
                                      builder: (_) => const SizedBox.shrink(),
                                    ),
                                    GestureDetector(
                                      onTap: _openSessionSheet,
                                      child: AbsorbPointer(
                                        child: FormInputField(
                                          readOnly: true,
                                          nameForm:
                                              'regwork_wfh_detail_session_text',
                                          nameTextField:
                                              'regwork_wfh_detail_session_text_field',
                                          label: 'Thời gian',
                                          icon: Icons.schedule_outlined,
                                          initialValue:
                                              _sessionDisplayLabel(item),
                                          isRequired: true,
                                          validator: (v) {
                                            if (v == null || v.isEmpty) return 'Vui lòng chọn thời gian';
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                        ),
                                      ),
                                    ),
                                  ] else
                                    FormReadonlyField(
                                      name: 'regwork_wfh_detail_session_ro',
                                      label: 'Thời gian',
                                      icon: Icons.schedule_outlined,
                                      initialValue: _sessionDisplayLabel(item),
                                    ),
                                  const SizedBox(height: 12),
                                  FormDateTimePicker(
                                    nameForm: 'regwork_wfh_detail_date',
                                    nameTimePicker: _kWfhDetailDateInnerUnused,
                                    label: 'Ngày',
                                    icon: Icons.date_range_outlined,
                                    inputType: InputType.date,
                                    format: DateFormat('dd/MM/yyyy'),
                                    initialValue: day,
                                    firstDate: DateTime(2000),
                                    lastDate: lastDate,
                                    enabled: _canEdit,
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null) return 'Vui lòng chọn ngày';
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    onChanged: (v) {
                                      if (v == null) return;
                                      final safe =
                                          DateTime(v.year, v.month, v.day);
                                      if (safe == _selectedDate) return;
                                      setState(() => _selectedDate = safe);
                                    },
                                  ),
                                  const SizedBox(height: 12),

                                  _canEdit
                                      ? Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      FormBuilderField<String>(
                                        name:
                                        'regwork_wfh_detail_approver_id',
                                        initialValue: approverIdStr,
                                        builder: (_) =>
                                        const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: _openApproverSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm:
                                            'regwork_wfh_detail_approver_text',
                                            nameTextField:
                                            'regwork_wfh_detail_approver_text_field',
                                            label: 'Người duyệt',
                                            icon: Icons
                                                .supervisor_account_outlined,
                                            initialValue:
                                            _approverDisplayLine(item),
                                            isRequired: true,
                                            validator: (v) {
                                              if (v == null || v.trim().isEmpty) return 'Vui lòng chọn người duyệt';
                                              return null;
                                            },
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      : FormReadonlyField(
                                    name:
                                    'regwork_wfh_detail_approver_ro',
                                    label: 'Người duyệt',
                                    icon: Icons.supervisor_account_outlined,
                                    initialValue:
                                    _approverDisplayLine(item),
                                  ),

                                  const SizedBox(height: 12),

                                  FormInputField(
                                    enabled: _canEdit,
                                    nameForm: 'wfh_detail_content',
                                    nameTextField: 'wfh_detail_content_tf',
                                    label: 'Nội dung/Kế hoạch',
                                    icon: Icons.content_paste,
                                    maxLines: 4,
                                    initialValue: item.contentWork ?? '',
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) return 'Vui lòng nhập nội dung/kế hoạch';
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                  const SizedBox(height: 12),

                                  FormInputField(
                                    enabled: _canEdit,
                                    nameForm: 'wfh_detail_reason',
                                    nameTextField: 'wfh_detail_reason_tf',
                                    label: 'Lý do',
                                    icon: Icons.note_alt_outlined,
                                    maxLines: 3,
                                    initialValue: item.reason ?? '',
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) return 'Vui lòng nhập lý do';
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                  const SizedBox(height: 12),

                                  FormInputField(
                                    enabled: _canEdit,
                                    nameForm: 'wfh_detail_note',
                                    nameTextField: 'wfh_detail_note_tf',
                                    label: 'Ghi chú',
                                    icon: Icons.comment_outlined,
                                    maxLines: 3,
                                    initialValue: item.note ?? '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_showFormActions)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: FormActions(
                          mode: FormActionMode.edit,
                          onCancel: () => context.pop(false),
                          onSave: (!_canEdit || state.isSubmitting)
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();

                                  final formState = _formKey.currentState;
                                  if (formState == null) return;
                                  if (!formState.saveAndValidate()) return;

                                  final values = formState.value;

                                  final dateOuter = values['regwork_wfh_detail_date']
                                      as DateTime?;
                                  final date = dateOuter ?? _selectedDate;

                                  final sessionRaw =
                                      '${values['regwork_wfh_detail_session'] ?? ''}';
                                  final approverIdRaw =
                                      '${values['regwork_wfh_detail_approver_id'] ?? ''}';
                                  final content =
                                      '${values['wfh_detail_content'] ?? ''}';
                                  final reason =
                                      '${values['wfh_detail_reason'] ?? ''}';
                                  final note =
                                      '${values['wfh_detail_note'] ?? ''}';



                                  final approvedId =
                                      int.tryParse(approverIdRaw.trim()) ?? 0;
                                  final slot =
                                      _mapSession(sessionRaw.trim());

                                  bloc.add(
                                    WfhEvent.onEditSubmit(
                                      id: item.id,
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
                      ),
                  ],
                );
              },
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