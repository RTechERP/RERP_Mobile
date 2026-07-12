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
import '../../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/overnight_model.dart';
import '../bloc/overnight_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Constants (giờ giới hạn tái sử dụng từ ValidateHelper)
// ─────────────────────────────────────────────────────────────────────────────

const _kStartHourMin = ValidateHelper.overnightStartHourMin;

/// Parse giờ nghỉ — chấp nhận cả dấu `.` lẫn `,` làm dấu thập phân
/// (`1.50`, `1,50`, `2.0`, `2,0` đều OK). Trả về `null` nếu không hợp lệ.
double? _parseBreakHours(String? raw) {
  if (raw == null) return null;
  final s = raw.trim();
  if (s.isEmpty) return null;
  final normalized = (s.contains('.') && s.contains(','))
      ? s
      : s.replaceAll(',', '.');
  return double.tryParse(normalized);
}

/// Parse giờ nghỉ — trả về `fallback` khi input rỗng / không hợp lệ.
double parseBreakHoursOr(String? raw, double fallback) =>
    _parseBreakHours(raw) ?? fallback;

// ─────────────────────────────────────────────────────────────────────────────
// Main screen
// ─────────────────────────────────────────────────────────────────────────────

class OvernightAddScreen extends StatefulWidget {
  const OvernightAddScreen({super.key});

  @override
  State<OvernightAddScreen> createState() => _OvernightAddScreenState();
}

class _OvernightAddScreenState
    extends
        BaseState<
          OvernightAddScreen,
          OvernightEvent,
          OvernightState,
          OvernightBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  late final List<_SlipMeta> _slips;
  int _selectedSlipIndex = 0;

  /// Đăng ký bổ sung = cho phép chọn ngày quá khứ (trong tháng hiện tại).
  bool get _isProblem =>
      (_formKey.currentState?.fields['on_is_problem']?.value as bool?) ?? false;

  @override
  void initState() {
    super.initState();
    final today = _dateOnly(DateTime.now());
    _slips = [_SlipMeta(date: today)];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const OvernightEvent.clearSubmitState());
      bloc.add(const OvernightEvent.initAdd());
    });
  }

  static DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  // ── Slip management ─────────────────────────────────────────────────────
  int get _safeSlipIndex {
    if (_slips.isEmpty) return 0;
    return _selectedSlipIndex.clamp(0, _slips.length - 1);
  }

  void _addSlip() {
    final lastDate = _slips.last.date;
    final nextDate = lastDate.add(const Duration(days: 1));
    setState(() {
      _slips.add(_SlipMeta(date: nextDate));
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
    return DateFormat('dd/MM/yyyy').format(_slips[index].date);
  }

  // ── Hours calculation ───────────────────────────────────────────────────

  /// TotalHours = (DateEnd - DateStart) - BreaksTime
  /// Trả về null nếu thiếu dữ liệu, trả về giá trị âm nếu invalid (hiển thị lỗi).
  double? _computeSlipHours(_SlipMeta slip) {
    final form = _formKey.currentState;
    if (form == null) return null;
    final start =
        form.fields['on_slip_${slip.key}_time_start']?.value as DateTime?;
    final end = form.fields['on_slip_${slip.key}_time_end']?.value as DateTime?;
    if (start == null || end == null) return null;

    final breakHours = parseBreakHoursOr(
          '${form.fields['on_slip_${slip.key}_break_hours']?.value ?? '0'}',
          0,
        );
    final diff = end.difference(start).inMinutes / 60.0;
    if (diff <= 0) return null; // end không sau start
    return (diff - breakHours).clamp(0.0, diff);
  }

  // ── Callbacks ───────────────────────────────────────────────────────────
  void _onDateChanged(_SlipMeta slip, DateTime? date) {
    if (date == null) return;
    // Nếu không phải đăng ký bổ sung, ép về hôm nay
    final today = _dateOnly(DateTime.now());
    final selected = _dateOnly(date);
    if (!_isProblem && selected != today) {
      context.showMessage(
        'Chỉ được đăng ký làm đêm cho ngày hôm nay khi không tích đăng ký bổ sung.',
        type: SnackBarType.error,
      );
      // Reset field về ngày slip hiện tại
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState?.fields['on_slip_${slip.key}_date']?.didChange(
          slip.date,
        );
      });
      return;
    }
    setState(() => slip.date = selected);
  }

  void _onTimeChanged(_SlipMeta slip) => setState(() {});

  // ── Approver sheet ──────────────────────────────────────────────────────
  Future<void> _openApproverSheet() async {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.approvers
        .where((e) => e.isDeleted != true)
        .toList();
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
        form.fields['on_approver_id']?.didChange(idValue.toString());
        form.fields['on_approver_text']?.didChange(line);
        setState(() {});
      },
    );
  }

  // ── Submit ──────────────────────────────────────────────────────────────
  void _onSubmit(OvernightState state) {
    FocusScope.of(context).unfocus();
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (!formState.validate()) {
      bool hasSlipError = formState.fields.entries.any(
        (e) => e.key.startsWith('on_slip_') && e.value.hasError,
      );

      if (hasSlipError && _slips.length >= 2) {
        context.showMessage(
          'Vui lòng điền đầy đủ thông tin các phiếu',
          type: SnackBarType.error,
        );
      }

      FormHelper.focusFirstError(
        formState: formState,
        slipPrefix: 'on_slip_',
        slipKeys: _slips.map((s) => s.key).toList(),
        onSlipError: (idx) => setState(() => _selectedSlipIndex = idx),
      );
      return;
    }

    formState.save();
    final v = formState.value;

    final isProblem = (v['on_is_problem'] as bool?) ?? false;

    // Xây danh sách phiếu để validate business rules
    final rows = <OvernightAddSlipRow>[];
    for (final slip in _slips) {
      final breakHours = parseBreakHoursOr(
        '${v['on_slip_${slip.key}_break_hours'] ?? '0'}',
        0,
      );
      rows.add((
        date: slip.date,
        timeStart: v['on_slip_${slip.key}_time_start'] as DateTime?,
        timeEnd: v['on_slip_${slip.key}_time_end'] as DateTime?,
        breakHours: breakHours,
        location: '${v['on_slip_${slip.key}_location'] ?? ''}',
      ));
    }

    // Full validation với business rules qua ValidateHelper
    final err = ValidateHelper.validateOvernightAddSubmit(
      approverIdRaw: '${v['on_approver_id'] ?? ''}',
      slips: rows,
      isProblem: isProblem,
    );
    if (err != null) {
      // Chỉ showMessage khi lỗi thuộc về slip (có gắn label Phiếu)
      if (err.contains('Phiếu')) {
        context.showMessage(err, type: SnackBarType.error);
      }

      // Chuyển sang tab phiếu lỗi (dựa vào index từ danh sách)
      for (var i = 0; i < rows.length; i++) {
        final slipErr = ValidateHelper.overnightValidateSlip(
          slip: rows[i],
          label: '',
          isProblem: isProblem,
        );
        if (slipErr != null) {
          setState(() => _selectedSlipIndex = i);
          break;
        }
      }
      return;
    }

    final approvedId = int.tryParse('${v['on_approver_id'] ?? ''}') ?? 0;
    final dateRegister = _slips.first.date;

    final payloadSlips = <OvernightSubmitSlip>[];
    for (final slip in _slips) {
      final breakHours = parseBreakHoursOr(
        '${v['on_slip_${slip.key}_break_hours'] ?? '0'}',
        0,
      );
      final location = '${v['on_slip_${slip.key}_location'] ?? ''}';
      final note = '${v['on_slip_${slip.key}_note'] ?? ''}';

      payloadSlips.add((
        timeStart: v['on_slip_${slip.key}_time_start'] as DateTime,
        endTime: v['on_slip_${slip.key}_time_end'] as DateTime,
        breakHours: breakHours,
        location: location,
        reason: note,
      ));
    }

    bloc.add(
      OvernightEvent.submitBatch(
        approvedId: approvedId,
        dateRegister: dateRegister,
        isProblem: isProblem,
        slips: payloadSlips,
      ),
    );
  }

  // ── UI ──────────────────────────────────────────────────────────────────
  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        MultiBlocListener(
          listeners: [
            BlocListener<OvernightBloc, OvernightState>(
              listenWhen: (p, c) =>
                  p.submitSuccess != c.submitSuccess ||
                  p.message != c.message ||
                  p.status != c.status,
              listener: (context, state) {
                if (state.status == BaseStateStatus.failed &&
                    (state.message ?? '').isNotEmpty &&
                    !state.isSubmitting) {
                  context.showMessage(state.message!, type: SnackBarType.error);
                }
                if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
                  context.showMessage(
                    state.message!,
                    type: SnackBarType.success,
                  );
                }
                if (state.submitSuccess) {
                  bloc.add(const OvernightEvent.clearSubmitState());
                  context.pop(true);
                }
              },
            ),
            BlocListener<OvernightBloc, OvernightState>(
              listenWhen: (previous, current) =>
                  previous.approveId != current.approveId ||
                  previous.approvers != current.approvers,
              listener: (context, state) {
                if (state.approveId != null && state.approvers.isNotEmpty) {
                  final form = _formKey.currentState;
                  if (form == null) return;

                  final targetId = state.approveId!.approveId;
                  final match = state.approvers
                      .cast<ApproverItem?>()
                      .firstWhere((a) {
                        if (a == null || a.isDeleted == true) return false;
                        final idValue = a.employeeId ?? a.id;
                        return idValue == targetId;
                      }, orElse: () => null);

                  if (match != null) {
                    final idValue = match.employeeId ?? match.id;
                    final line = '${match.code ?? ''} - ${match.fullName ?? ''}'
                        .trim();
                    form.fields['on_approver_id']?.didChange(
                      idValue.toString(),
                    );
                    form.fields['on_approver_text']?.didChange(line);
                    setState(() {});
                  }
                }
              },
            ),
          ],
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo đơn làm đêm'),
              actions: [
                IconButton(
                  onPressed: () => context.push(RouteNames.regworkOvertimeAdd),
                  icon: const Icon(Icons.add_circle_outline_outlined),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocBuilder<OvernightBloc, OvernightState>(
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
                                // ── Card 1: Người duyệt + Bổ sung ──────
                                FormCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),

                                      // Hidden approver id
                                      FormBuilderField<String>(
                                        name: 'on_approver_id',
                                        initialValue: '',
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        builder: (_) => const SizedBox.shrink(),
                                      ),

                                      FormInputField(
                                        readOnly: true,
                                        nameForm: 'on_approver_text',
                                        nameTextField: 'on_approver_text_tf',
                                        label: 'Người duyệt',
                                        icon: Icons.person_outlined,
                                        initialValue: '',
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        isRequired: true,
                                        onTap:
                                            state.status ==
                                                BaseStateStatus.loading
                                            ? null
                                            : _openApproverSheet,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) {
                                            return 'Vui lòng chọn người duyệt';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 8),

                                      // Checkbox đăng ký bổ sung
                                      FormCheckbox(
                                        name: 'on_is_problem',
                                        title: const Text(
                                          'Đăng ký bổ sung',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        onChanged: (value) {
                                          if (value == true &&
                                              !state
                                                  .isSupplementaryRegistrationOpen) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                                  if (!mounted) return;
                                                  _formKey
                                                      .currentState
                                                      ?.fields['on_is_problem']
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

                                // ── Card 2: Các phiếu ngày ──────────────
                                FormCard(
                                  title: 'Thông tin đăng ký',
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),

                                      // Tab bar phiếu ngày
                                      _OvernightSlipTabsBar(
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

                                      // Nội dung từng phiếu
                                      IndexedStack(
                                        index: _safeSlipIndex,
                                        sizing: StackFit.loose,
                                        children: [
                                          for (final slip in _slips)
                                            _OvernightSlipFormFields(
                                              key: ValueKey(slip.key),
                                              slip: slip,
                                              computedHours: _computeSlipHours(
                                                slip,
                                              ),
                                              isProblem: _isProblem,
                                              onDateChanged: _onDateChanged,
                                              onTimeChanged: _onTimeChanged,
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

                        // Submit button
                        FormActions(
                          mode: FormActionMode.add,
                          // submitEnabled: submitOk,
                          onSubmit: () => _onSubmit(state),
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

// ═══════════════════════════════════════════════════════════════════════════
// Slip metadata
// ═══════════════════════════════════════════════════════════════════════════

class _SlipMeta {
  _SlipMeta({required this.date}) : key = 'k_${date.millisecondsSinceEpoch}';

  final String key;
  DateTime date;
}

// ═══════════════════════════════════════════════════════════════════════════
// Widget: Tab bar phiếu theo ngày
// ═══════════════════════════════════════════════════════════════════════════

class _OvernightSlipTabsBar extends StatelessWidget {
  const _OvernightSlipTabsBar({
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

// ═══════════════════════════════════════════════════════════════════════════
// Widget: Form fields cho 1 phiếu ngày
// ═══════════════════════════════════════════════════════════════════════════

class _OvernightSlipFormFields extends StatefulWidget {
  const _OvernightSlipFormFields({
    super.key,
    required this.slip,
    required this.isProblem,
    required this.onDateChanged,
    required this.onTimeChanged,
    this.computedHours,
  });

  final _SlipMeta slip;

  /// isProblem = true → cho phép chọn ngày trong quá khứ (trong tháng).
  final bool isProblem;

  final void Function(_SlipMeta slip, DateTime? date) onDateChanged;
  final void Function(_SlipMeta slip) onTimeChanged;
  final double? computedHours;

  @override
  State<_OvernightSlipFormFields> createState() =>
      _OvernightSlipFormFieldsState();
}

class _OvernightSlipFormFieldsState extends State<_OvernightSlipFormFields> {
  final _breakController = TextEditingController(text: '0.00');
  late final FocusNode _breakFocusNode;

  String get _pref => 'on_slip_${widget.slip.key}';

  @override
  void initState() {
    super.initState();
    _breakFocusNode = FocusNode();
    _breakFocusNode.addListener(_onBreakFocusChange);
  }

  void _onBreakFocusChange() {
    if (_breakFocusNode.hasFocus) {
      // Select all khi focus để người dùng không cần xóa thủ công
      _breakController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _breakController.text.length,
      );
    } else {
      // Restore '0.00' nếu bỏ trống hoặc nhập không parse được
      // (cho phép cả dấu `.` lẫn `,`).
      final v = _breakController.text.trim();
      if (v.isEmpty || _parseBreakHours(v) == null) {
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

  // ── Date bounds ─────────────────────────────────────────────────────────
  DateTime get _today {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }

  /// Ngày mở picker cho giờ bắt đầu / kết thúc:
  /// - Về cơ bản lấy theo slip.date (form Ngày).
  /// - Nếu slip.date < hôm nay thì kéo về hôm nay để picker không mở
  ///   ngày quá khứ (mặc định giờ cũng sẽ được đẩy về hôm nay 20:00).
  DateTime get _timeFirstDate =>
      widget.slip.date.isBefore(_today) ? _today : widget.slip.date;

  DateTime get _timeLastDate => _today.add(const Duration(days: 365));

  /// Predicate dùng cho [FormBuilderDateTimePicker.selectableDayPredicate]:
  /// chỉ cho phép chọn ngày >= [_timeFirstDate] (chặn quá khứ).
  bool _isFutureOrToday(DateTime day) {
    final d = DateTime(day.year, day.month, day.day);
    return !d.isBefore(_timeFirstDate);
  }

  /// Giờ bắt đầu mặc định: 20:00 ngày [_timeFirstDate] — luôn tương lai
  /// và hợp lệ theo rule [ValidateHelper.overnightStartHourMin].
  DateTime _defaultStart() {
    final t = _timeFirstDate;
    return DateTime(t.year, t.month, t.day, _kStartHourMin);
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd/MM/yyyy');
    final bothFmt = DateFormat('dd/MM/yyyy HH:mm');

    // Hiển thị tổng giờ
    final h = widget.computedHours;
    final totalText = (h != null && h >= 0) ? h.toStringAsFixed(2) : '0.00';

    return KeyedSubtree(
      key: ValueKey(widget.slip.key),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Ngày ────────────────────────────────────────────────────────
          FormBuilderDateTimePicker(
            name: '${_pref}_date',
            inputType: InputType.date,
            format: dateFmt,
            initialValue: widget.slip.date,
            decoration: formInputDecoration(
              context,
              label: 'Ngày',
              icon: Icons.date_range_outlined,
            ),
            onChanged: (date) => widget.onDateChanged(widget.slip, date),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 12),

          // Thời gian bắt đầu (>= 20:00, không cho phép ngày quá khứ).
          FormDateTimePicker(
            nameForm: '${_pref}_time_start',
            nameTimePicker: '${_pref}_time_start_inner',
            label: 'Thời gian bắt đầu',
            icon: Icons.access_time_outlined,
            inputType: InputType.both,
            format: bothFmt,
            initialValue: _defaultStart(),
            initialDate: _timeFirstDate,
            firstDate: _timeFirstDate,
            lastDate: _timeLastDate,
            selectableDayPredicate: _isFutureOrToday,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (_) => widget.onTimeChanged(widget.slip),
            isRequired: true,
            validator: (v) {
              if (v == null) return 'Vui lòng chọn thời gian bắt đầu';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // Thời gian kết thúc (cùng ràng buộc với thời gian bắt đầu).
          FormDateTimePicker(
            nameForm: '${_pref}_time_end',
            nameTimePicker: '${_pref}_time_end_inner',
            label: 'Thời gian kết thúc',
            icon: Icons.access_time_filled_outlined,
            inputType: InputType.both,
            format: bothFmt,
            lastDate: _timeLastDate,
            selectableDayPredicate: _isFutureOrToday,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (_) => widget.onTimeChanged(widget.slip),
            isRequired: true,
            validator: (v) {
              if (v == null) return 'Vui lòng chọn thời gian kết thúc';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Row: Giờ nghỉ + Tổng giờ ────────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Giờ nghỉ giữa giờ (0 → 8, < totalHours)
              Expanded(
                child: FormBuilderField<String>(
                  name: '${_pref}_break_hours',
                  initialValue: '0.00',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: _breakFocusNode,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Vui lòng nhập giờ nghỉ';
                    }
                    final breakHours = _parseBreakHours(v);
                    if (breakHours == null || breakHours < 0) {
                      return 'Giờ nghỉ không hợp lệ';
                    }
                    if (breakHours > ValidateHelper.overnightMaxTotalHours) {
                      return 'Giờ nghỉ không vượt quá ${ValidateHelper.overnightMaxTotalHours.toInt()}h';
                    }

                    final formState = FormBuilder.of(context);
                    if (formState != null) {
                      final start =
                          formState.fields['${_pref}_time_start']?.value
                              as DateTime?;
                      final end =
                          formState.fields['${_pref}_time_end']?.value
                              as DateTime?;
                      if (start != null && end != null) {
                        final diffHours =
                            end.difference(start).inMinutes / 60.0;
                        if (breakHours >= diffHours && diffHours > 0) {
                          return 'Giờ nghỉ phải nhỏ hơn thời gian làm';
                        }
                      }
                    }
                    return null;
                  },
                  builder: (field) {
                    return TextFormField(
                      controller: _breakController,
                      focusNode: _breakFocusNode,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*([.,]?\d{0,2})?'),
                        ),
                      ],
                      decoration: formInputDecoration(
                        context,
                        label: 'Giờ nghỉ giữa giờ',
                        icon: Icons.free_breakfast_outlined,
                        isRequired: true,
                        hasError: field.hasError,
                        errorText: field.errorText,
                      ),
                      onChanged: (v) {
                        field.didChange(v);
                        widget.onTimeChanged(widget.slip);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),

              // Tổng số giờ (disabled, tự động tính)
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

          // ── Địa điểm ────────────────────────────────────────────────────
          FormInputField(
            label: 'Địa điểm',
            nameForm: '${_pref}_location',
            nameTextField: '${_pref}_location_tf',
            icon: Icons.location_on_outlined,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isRequired: true,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Vui lòng nhập địa điểm';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Ghi chú ─────────────────────────────────────────────────────
          FormInputField(
            label: 'Ghi chú',
            nameForm: '${_pref}_note',
            nameTextField: '${_pref}_note_tf',
            icon: Icons.note_alt_outlined,
            textInputAction: TextInputAction.newline,
            autoExpand: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}
