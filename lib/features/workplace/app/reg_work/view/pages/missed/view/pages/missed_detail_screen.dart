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
import '../../data/datasource/models/missed_model.dart';
import '../bloc/missed_bloc.dart';

int _approvedMissedPayloadValue(ApproverItem item) =>
    item.employeeId ?? item.id;

const _kMissedDetailDatePickerInner = 'missed_detail_date_time_inner';

class MissedDetailScreen extends StatefulWidget {
  const MissedDetailScreen({super.key});

  @override
  State<MissedDetailScreen> createState() => _MissedDetailScreenState();
}

class _MissedDetailScreenState extends BaseState<MissedDetailScreen, MissedEvent,
    MissedState, MissedBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  MissedItem? _item;
  bool _invalidRoute = false;

  late DateTime _todayStart;
  late DateTime _lastSelectableDate;

  bool _isHrApproved(MissedItem item) {
    if (item.statusHRNumber == 1) return true;
    final text = (item.statusHRText ?? '').toLowerCase();
    if (text.contains('duyệt') && !text.contains('chờ')) return true;
    return false;
  }

  bool get _lockedByApproval {
    final i = _item;
    if (i == null) return true;
    return i.isApprovedTP == true || _isHrApproved(i);
  }

  bool get _canEdit => _item != null && !_lockedByApproval;

  bool get _showFormActions => _canEdit;

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

      final extra = GoRouterState.of(context).extra;
      if (extra is! MissedItem) {
        setState(() => _invalidRoute = true);
        return;
      }
      if (extra.dayWork == null) {
        setState(() {
          _item = extra;
          _invalidRoute = true;
        });
        return;
      }

      setState(() => _item = extra);
    });
  }

  String _typeKeyFromItem(MissedItem item) {
    if (item.type == 2) return 'check_out';
    return 'check_in';
  }

  String _typeDisplayLabel(MissedItem item) {
    final t = (item.typeText ?? '').trim();
    if (t.isNotEmpty) return t;
    switch (item.type) {
      case 1:
        return 'Quên lúc đến';
      case 2:
        return 'Quên lúc về';
      default:
        return 'Quên chấm công';
    }
  }

  String _approverDisplayLine(MissedItem item) {
    final name = (item.approvedName ?? '').trim();
    if (name.isNotEmpty) return name;
    final id = item.approvedTP;
    return id != null ? 'Mã duyệt: $id' : '';
  }

  DateTime _dateFromDayWork(MissedItem item) {
    final d = item.dayWork!;
    return DateTime(d.year, d.month, d.day);
  }

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
    if (!_canEdit) return;
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
        form.fields['regwork_missed_detail_approver_id']?.didChange(
          idValue.toString(),
        );
        form.fields['regwork_missed_detail_approver_text']?.didChange(line);
      },
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    if (_invalidRoute) {
      return BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết đơn quên chấm công'),
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
          title: const Text('Chi tiết đơn quên chấm công'),
          onBackTap: () => context.pop(false),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final item = _item!;
    final decline = (item.reasonDeciline ?? '').trim();
    final showDecline = decline.isNotEmpty;
    final day = _dateFromDayWork(item);
    final typeKey = _typeKeyFromItem(item);
    final approverIdStr =
        item.approvedTP != null ? '${item.approvedTP}' : '';
    final legacyPastDay = day.isBefore(_todayStart);
    final datePickerFirstDate =
        legacyPastDay ? day : _todayStart;
    final dateValidatorEarliest =
        legacyPastDay ? null : _todayStart;

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
              title: const Text('Chi tiết đơn quên chấm công'),
              onBackTap: () => context.pop(false),
            ),
            body: Column(
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
                              nameForm: 'missed_detail_decline',
                              nameTextField: 'missed_detail_decline_tf',
                              label: 'Lý do',
                              icon: Icons.note_alt_outlined,
                              maxLines: 3,
                              initialValue: decline,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        FormCard(
                          title: 'Thông tin quên chấm công',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              FormDateTimePicker(
                                nameForm: 'regwork_missed_detail_date',
                                nameTimePicker: _kMissedDetailDatePickerInner,
                                label: 'Ngày',
                                icon: Icons.date_range_outlined,
                                inputType: InputType.date,
                                format: DateFormat('dd/MM/yyyy'),
                                initialValue: day,
                                initialDate: day,
                                firstDate: datePickerFirstDate,
                                lastDate: _lastSelectableDate,
                              ),
                              const SizedBox(height: 12),
                              if (_canEdit) ...[
                                FormBuilderField<String>(
                                  name: 'regwork_missed_detail_approver_id',
                                  initialValue: approverIdStr,
                                  builder: (_) => const SizedBox.shrink(),
                                ),
                                GestureDetector(
                                  onTap: _openApproverSheet,
                                  child: AbsorbPointer(
                                    child: FormInputField(
                                      readOnly: true,
                                      nameForm:
                                      'regwork_missed_detail_approver_text',
                                      nameTextField:
                                      'regwork_missed_detail_approver_text_field',
                                      label: 'Người duyệt',
                                      icon: Icons.supervisor_account_outlined,
                                      initialValue:
                                      _approverDisplayLine(item),
                                      isRequired: true,
                                      validator: (v){
                                        if (v == null || v.trim().isEmpty) return 'Vui lòng chọn người duyệt';
                                        return null;
                                      }
                                    ),
                                  ),
                                ),
                              ] else
                                FormReadonlyField(
                                  name: 'regwork_missed_detail_approver_ro',
                                  label: 'Người duyệt',
                                  icon: Icons.supervisor_account_outlined,
                                  initialValue: _approverDisplayLine(item),
                                ),
                              const SizedBox(height: 12),
                              if (_canEdit) ...[
                                FormRadioGroup(
                                  name: 'regwork_missed_detail_type',
                                  label: 'Loại',
                                  initialValue: typeKey,
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

                              ] else ...[
                                FormReadonlyField(
                                  name: 'regwork_missed_detail_type_ro',
                                  label: 'Loại',
                                  icon: Icons.fingerprint_outlined,
                                  initialValue: _typeDisplayLabel(item),
                                ),
                              ],

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
                    child: BlocBuilder<MissedBloc, MissedState>(
                      buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
                      builder: (context, state) {
                        return FormActions(
                          mode: FormActionMode.edit,
                          onCancel: () => context.pop(false),
                          onSave: state.isSubmitting
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();

                                  final formState = _formKey.currentState;
                                  if (formState == null) return;
                                  if (!formState.saveAndValidate()) return;

                                  final values = formState.value;

                                  final summaryErr =
                                      ValidateHelper.validateMissed(
                                    dateMissed: values[
                                            'regwork_missed_detail_date']
                                        as DateTime?,
                                    typeRaw: values[
                                            'regwork_missed_detail_type']
                                        as String?,
                                    approverIdRaw:
                                        '${values['regwork_missed_detail_approver_id'] ?? ''}',
                                    earliestSelectableDay:
                                        dateValidatorEarliest,
                                  );
                                  if (summaryErr != null) {
                                    context.showMessage(
                                      summaryErr,
                                      type: SnackBarType.error,
                                    );
                                    return;
                                  }

                                  final typeStr = values[
                                          'regwork_missed_detail_type']
                                      as String;
                                  final approvedId = int.parse(
                                    '${values['regwork_missed_detail_approver_id']}'
                                        .trim(),
                                  );
                                  final dateMissed = values[
                                          'regwork_missed_detail_date']
                                      as DateTime;
                                  final reason =
                                      '${values['regwork_missed_detail_reason'] ?? ''}'
                                          .trim();
                                  final note =
                                      '${values['regwork_missed_detail_note'] ?? ''}'
                                          .trim();

                                  bloc.add(
                                    MissedEvent.onEditSubmit(
                                      id: item.id,
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