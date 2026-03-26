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
import '../../data/datasource/models/in_out_model.dart';
import '../bloc/in_out_bloc.dart';

int _approverPayloadValue(ApproverItem item) => item.employeeId ?? item.id;

class _InOutDetailTypeOption {
  const _InOutDetailTypeOption({required this.key, required this.label});

  final String key;
  final String label;
}

const _kInOutDetailTypeOptions = <_InOutDetailTypeOption>[
  _InOutDetailTypeOption(key: 'early_company', label: 'Về sớm việc công ty'),
  _InOutDetailTypeOption(key: 'early_personal', label: 'Về sớm việc cá nhân'),
  _InOutDetailTypeOption(key: 'late_company', label: 'Đi muộn việc công ty'),
  _InOutDetailTypeOption(key: 'late_personal', label: 'Đi muộn việc cá nhân'),
];

String? _typeKeyFromInt(int? t) {
  switch (t) {
    case 1:
      return 'late_company';
    case 2:
      return 'early_company';
    case 3:
      return 'late_personal';
    case 4:
      return 'early_personal';
    default:
      return null;
  }
}

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

String _typeLabel(InOutItem item) {
  final text = (item.typeText ?? '').trim();
  if (text.isNotEmpty) return text;
  final key = _typeKeyFromInt(item.type);
  return switch (key) {
    'early_company' => 'Về sớm việc công ty',
    'early_personal' => 'Về sớm việc cá nhân',
    'late_company' => 'Đi muộn việc công ty',
    'late_personal' => 'Đi muộn việc cá nhân',
    _ => '--',
  };
}

/// Khớp badge HR / [InOutScreenPage].
bool _isHrApproved(InOutItem item) {
  if (item.statusHRNumber == 1) return true;
  final text = (item.statusHRText ?? '').toLowerCase();
  if (text.contains('duyệt') && !text.contains('chờ')) return true;
  return false;
}

/// Dòng hiển thị người duyệt (đồng bộ add: `code - fullName` / `approvedName`).
String _approverDisplayLine(InOutItem item) {
  final name = (item.approvedName ?? '').trim();
  if (name.isNotEmpty) return name;
  final c = (item.code ?? '').trim();
  final f = (item.fullName ?? '').trim();
  if (c.isNotEmpty && f.isNotEmpty) return '$c - $f';
  if (c.isNotEmpty) return c;
  if (f.isNotEmpty) return f;
  final tp = item.approvedTP;
  return tp != null ? '$tp' : '';
}

class InOutDetailScreenPage extends StatefulWidget {
  const InOutDetailScreenPage({super.key});

  @override
  State<InOutDetailScreenPage> createState() => _InOutDetailScreenPageState();
}

class _InOutDetailScreenPageState extends BaseState<
    InOutDetailScreenPage,
    InOutEvent,
    InOutState,
    InOutBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  InOutItem? _item;
  bool _invalidRoute = false;
  late DateTime _todayStart;
  late DateTime _selectedDate;

  bool get _tbpOrHrApproved {
    final i = _item;
    if (i == null) return false;
    return i.isApprovedTP == true || _isHrApproved(i);
  }

  /// Chỉ khóa khi TBP hoặc HR đã duyệt (bỏ qua Senior / IsApproved).
  bool get _canEdit => _item != null && !_tbpOrHrApproved;

  /// Ẩn Huỷ / Cập nhật khi TBP hoặc HR đã duyệt.
  bool get _showFormActions => !_tbpOrHrApproved;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _todayStart = DateTime(now.year, now.month, now.day);
    _selectedDate = _todayStart;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;
      bloc.add(const InOutEvent.clearSubmitState());
      bloc.add(const InOutEvent.fetchApprovers());

      final extra = GoRouterState.of(context).extra;
      if (extra is! InOutItem) {
        setState(() => _invalidRoute = true);
        return;
      }

      final ds = extra.dateStart;
      final de = extra.dateEnd;
      if (ds == null || de == null) {
        setState(() {
          _item = extra;
          _invalidRoute = true;
        });
        return;
      }

      setState(() {
        _item = extra;
        _selectedDate = DateTime(ds.year, ds.month, ds.day);
      });
    });
  }

  void _autoSetTimeByType(String? value) {
    if (!_canEdit || value == null) return;

    final form = _formKey.currentState;
    if (form == null) return;

    final day = _selectedDate;

    DateTime time(int h, int m) =>
        DateTime(day.year, day.month, day.day, h, m);

    if (value.contains('early')) {
      form.fields['regwork_inout_detail_from']?.didChange(time(16, 30));
      form.fields['inout_detail_from']?.didChange(time(16, 30));
      form.fields['regwork_inout_detail_to']?.didChange(time(17, 30));
      form.fields['inout_detail_to']?.didChange(time(17, 30));
    }

    if (value.contains('late')) {
      form.fields['regwork_inout_detail_from']?.didChange(time(8, 0));
      form.fields['inout_detail_from']?.didChange(time(8, 0));
      form.fields['regwork_inout_detail_to']?.didChange(time(9, 0));
      form.fields['inout_detail_to']?.didChange(time(9, 0));
    }
  }

  Future<void> _openTypeSheet() async {
    if (!_canEdit) return;
    final form = _formKey.currentState;
    if (form == null) return;

    await openSelectBottomSheet<_InOutDetailTypeOption>(
      context: context,
      title: 'Chọn loại',
      items: _kInOutDetailTypeOptions,
      displayText: (o) => o.label,
      onSelected: (o) {
        form.fields['regwork_inout_detail_type']?.didChange(o.key);
        form.fields['regwork_inout_detail_type_text']?.didChange(o.label);
        _autoSetTimeByType(o.key);
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
        final tp = _approverPayloadValue(a);
        final line = '${a.code ?? ''} - ${a.fullName ?? ''}'.trim();
        form.fields['regwork_inout_detail_approver']?.didChange('$tp');
        form.fields['regwork_inout_detail_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    if (_invalidRoute) {
      return BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết đơn'),
          onBackTap: () => context.pop(false),
        ),
        body: const Center(child: Text('Không tìm thấy đơn hoặc dữ liệu không hợp lệ')),
      );
    }

    if (_item == null) {
      return BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết đơn'),
          onBackTap: () => context.pop(false),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final item = _item!;
    final decline = (item.reasonDeciline ?? '').trim();
    final showDecline = decline.isNotEmpty;

    final ds = item.dateStart!;
    final de = item.dateEnd!;
    final day = DateTime(ds.year, ds.month, ds.day);
    final fromInitial =
        DateTime(day.year, day.month, day.day, ds.hour, ds.minute);
    final toInitial = DateTime(day.year, day.month, day.day, de.hour, de.minute);
    final typeKey = _typeKeyFromInt(item.type);
    final approverValue = item.approvedTP != null ? '${item.approvedTP}' : null;

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
            appBar: AppBarCommon(
              title: const Text('Chi tiết đơn'),
              onBackTap: () => context.pop(false),
            ),
            body: BlocBuilder<InOutBloc, InOutState>(
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
                                  nameForm: 'inout_reason_not_approved',
                                  nameTextField:
                                      'regwork_inout_detail_reason_not_approved',
                                  label: 'Lý do',
                                  icon: Icons.note_alt_outlined,
                                  maxLines: 3,
                                  initialValue: decline,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                            FormCard(
                              title: 'Thông tin đi muộn - về sớm',
                              child: Column(
                                children: [
                                  if (_canEdit) ...[
                                    FormBuilderField<String>(
                                      name: 'regwork_inout_detail_type',
                                      initialValue: typeKey ?? '',
                                      builder: (_) => const SizedBox.shrink(),
                                    ),
                                    GestureDetector(
                                      onTap: _openTypeSheet,
                                      child: AbsorbPointer(
                                        child: FormInputField(
                                          readOnly: true,
                                          nameForm:
                                              'regwork_inout_detail_type_text',
                                          nameTextField:
                                              'regwork_inout_detail_type_text_field',
                                          label: 'Loại',
                                          icon: Icons.swap_vert_outlined,
                                          initialValue: _typeLabel(item),
                                        ),
                                      ),
                                    ),
                                  ] else
                                    FormReadonlyField(
                                      name: 'regwork_inout_detail_type_readonly',
                                      label: 'Loại',
                                      icon: Icons.swap_vert_outlined,
                                      initialValue: _typeLabel(item),
                                    ),
                                  const SizedBox(height: 12),
                                  FormDateTimePicker(
                                    nameForm: 'regwork_inout_detail_date',
                                    nameTimePicker: 'inout_detail_date_time',
                                    label: 'Ngày',
                                    icon: Icons.date_range_outlined,
                                    inputType: InputType.date,
                                    format: DateFormat('dd/MM/yyyy'),
                                    initialValue: day,
                                    firstDate: DateTime(2000),
                                    enabled: _canEdit,
                                    onChanged: (v) {
                                      if (v == null) return;
                                      final safe =
                                          DateTime(v.year, v.month, v.day);
                                      if (safe == _selectedDate) return;
                                      setState(() => _selectedDate = safe);
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FormDateTimePicker(
                                          nameForm: 'regwork_inout_detail_from',
                                          nameTimePicker: 'inout_detail_from',
                                          label: 'Từ',
                                          icon: Icons.schedule_outlined,
                                          inputType: InputType.time,
                                          format: DateFormat('HH:mm'),
                                          initialValue: fromInitial,
                                          enabled: _canEdit,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: FormDateTimePicker(
                                          nameForm: 'regwork_inout_detail_to',
                                          nameTimePicker: 'inout_detail_to',
                                          label: 'Đến',
                                          icon: Icons.schedule_outlined,
                                          inputType: InputType.time,
                                          format: DateFormat('HH:mm'),
                                          initialValue: toInitial,
                                          enabled: _canEdit,
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
                              child: _canEdit
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        FormBuilderField<String>(
                                          name: 'regwork_inout_detail_approver',
                                          initialValue: approverValue ?? '',
                                          builder: (_) =>
                                              const SizedBox.shrink(),
                                        ),
                                        GestureDetector(
                                          onTap: _openApproverSheet,
                                          child: AbsorbPointer(
                                            child: FormInputField(
                                              readOnly: true,
                                              nameForm:
                                                  'regwork_inout_detail_approver_text',
                                              nameTextField:
                                                  'regwork_inout_detail_approver_text_field',
                                              label: 'Người duyệt',
                                              icon: Icons
                                                  .supervisor_account_outlined,
                                              initialValue:
                                                  _approverDisplayLine(item),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : FormReadonlyField(
                                      name: 'regwork_inout_detail_approver_readonly',
                                      label: 'Người kiểm duyệt',
                                      icon: Icons.supervisor_account_outlined,
                                      initialValue: _approverDisplayLine(item),
                                    ),
                            ),
                            const SizedBox(height: 8),
                            FormCard(
                              child: FormInputField(
                                enabled: _canEdit,
                                nameForm: 'regwork_inout_detail_reason',
                                nameTextField:
                                    'regwork_inout_detail_reason_field',
                                label: 'Lý do',
                                icon: Icons.note_alt_outlined,
                                maxLines: 3,
                                initialValue: item.reason ?? '',
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

                                final dateOuter = values['regwork_inout_detail_date']
                                    as DateTime?;
                                final date = dateOuter ?? _selectedDate;

                                final fromInner =
                                    values['inout_detail_from'] as DateTime?;
                                final toInner =
                                    values['inout_detail_to'] as DateTime?;

                                final typeRaw =
                                    '${values['regwork_inout_detail_type'] ?? ''}'
                                        .trim();
                                final approverTpRaw =
                                    '${values['regwork_inout_detail_approver'] ?? ''}'
                                        .trim();
                                final reason =
                                    '${values['regwork_inout_detail_reason'] ?? ''}';

                                DateTime time(int h, int m) => DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      h,
                                      m,
                                    );

                                final (defaultFrom, defaultTo) =
                                    switch (typeRaw) {
                                  final t when t.contains('early') =>
                                    (time(16, 30), time(17, 30)),
                                  final t when t.contains('late') =>
                                    (time(8, 0), time(9, 0)),
                                  _ => (time(8, 0), time(9, 0)),
                                };

                                final from = fromInner ?? defaultFrom;
                                final to = toInner ?? defaultTo;

                                final validateErr =
                                    ValidateHelper.validateInOut(
                                  todayStart: _todayStart,
                                  date: date,
                                  from: from,
                                  to: to,
                                  typeRaw: typeRaw,
                                  approverTpRaw: approverTpRaw,
                                  reason: reason,
                                  disallowPastDates: false,
                                );
                                if (validateErr != null) {
                                  context.showMessage(
                                    validateErr,
                                    type: SnackBarType.error,
                                  );
                                  return;
                                }

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
                                final approvedTP =
                                    int.tryParse(approverTpRaw) ?? 0;

                                bloc.add(
                                  InOutEvent.onEditSubmit(
                                    id: item.id,
                                    type: type,
                                    approvedTP: approvedTP,
                                    dateStart: dateStart,
                                    dateEnd: dateEnd,
                                    timeRegister: timeRegister,
                                    reason: reason.trim(),
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
