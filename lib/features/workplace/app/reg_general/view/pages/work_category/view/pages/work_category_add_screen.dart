import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/work_category_model.dart';
import '../bloc/work_category_bloc.dart';
import '../widgets/work_category_add_constants.dart';
import '../widgets/work_category_add_slip_form_fields.dart';
import '../widgets/work_category_add_tabs_bar.dart';

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------
class WorkCategoryAddScreen extends StatefulWidget {
  const WorkCategoryAddScreen({super.key});

  @override
  State<WorkCategoryAddScreen> createState() => _WorkCategoryAddScreenState();
}

class _WorkCategoryAddScreenState
    extends BaseState<WorkCategoryAddScreen, WorkCategoryEvent,
        WorkCategoryState, WorkCategoryBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  late List<String> _slipKeys;
  int _selectedSlipIndex = 0;
  WorkAssignItem? _defaultAssigner;

  @override
  void initState() {
    super.initState();
    _slipKeys = ['k_${DateTime.now().millisecondsSinceEpoch}'];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WorkCategoryEvent.clearSubmitState());
      bloc.add(const WorkCategoryEvent.initAdd());
      _tryPrefillAssigner(bloc.state);
    });
  }

  void _tryPrefillAssigner(WorkCategoryState state) {
    if (_defaultAssigner != null) return;
    if (state.assigners.isEmpty || state.defaultAssignerId == null) return;
    
    final match = state.assigners.cast<WorkAssignItem?>().firstWhere(
          (e) => e?.id == state.defaultAssignerId,
          orElse: () => null,
        );
    if (match != null) {
      _defaultAssigner = match;
      for (final k in _slipKeys) {
        _formKey.currentState?.fields[kAssignerId(k)]?.didChange('${match.id}');
        _formKey.currentState?.fields[kAssignerText(k)]?.didChange(match.fullName);
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Slip management
  // ---------------------------------------------------------------------------
  int get _safeSlipIndex {
    if (_slipKeys.isEmpty) return 0;
    if (_selectedSlipIndex < 0) return 0;
    if (_selectedSlipIndex >= _slipKeys.length) return _slipKeys.length - 1;
    return _selectedSlipIndex;
  }

  void _addSlip() {
    setState(() {
      final key = 'k_${DateTime.now().microsecondsSinceEpoch}_${_slipKeys.length}';
      _slipKeys.add(key);
      _selectedSlipIndex = _slipKeys.length - 1;

      if (_defaultAssigner != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final form = _formKey.currentState;
          form?.fields[kAssignerId(key)]?.didChange('${_defaultAssigner!.id}');
          form?.fields[kAssignerText(key)]?.didChange(_defaultAssigner!.fullName);
        });
      }
    });
  }

  void _removeSlipAt(int index) {
    if (_slipKeys.length <= 1 || index < 0 || index >= _slipKeys.length) return;
    setState(() {
      _slipKeys.removeAt(index);
      if (_selectedSlipIndex >= _slipKeys.length) {
        _selectedSlipIndex = _slipKeys.length - 1;
      } else if (index < _selectedSlipIndex) {
        _selectedSlipIndex -= 1;
      }
    });
  }

  void _selectSlip(int index) {
    if (index < 0 || index >= _slipKeys.length) return;
    setState(() => _selectedSlipIndex = index);
  }

  // ---------------------------------------------------------------------------
  // Bottom-sheet pickers (project)
  // ---------------------------------------------------------------------------
  Future<void> _openProjectSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items = bloc.state.projects;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có dữ liệu dự án', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<WorkProjectItem>(
      context: context,
      title: 'Chọn dự án',
      items: items,
      displayText: (p) => '${p.projectCode} - ${p.projectName}',
      onSelected: (p) {
        form.fields[kProjectId]?.didChange('${p.id}');
        form.fields[kProjectText]?.didChange('${p.projectCode} - ${p.projectName}');
        // Reset parent when project changes
        for (final k in _slipKeys) {
          form.fields[kParentId(k)]?.didChange('');
          form.fields[kParentText(k)]?.didChange('');
        }
        bloc.add(WorkCategoryEvent.fetchParents(projectId: p.id));
        setState(() {});
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Per-slip pickers
  // ---------------------------------------------------------------------------
  Future<void> _openTypeSheet(String key) async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items = bloc.state.projectTypes;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có kiểu hạng mục', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<WorkProjectTypeItem>(
      context: context,
      title: 'Chọn kiểu hạng mục',
      items: items,
      displayText: (t) => t.projectTypeName,
      onSelected: (t) {
        form.fields[kTypeId(key)]?.didChange('${t.id}');
        form.fields[kTypeText(key)]?.didChange(t.projectTypeName);
        setState(() {});
      },
    );
  }

  Future<void> _openAssignerSheet(String key) async {
    final form = _formKey.currentState;
    if (form == null) return;
    final assigners = bloc.state.assigners;
    if (assigners.isEmpty) {
      showMessage(context, 'Chưa có danh sách người giao việc', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<WorkAssignItem>(
      context: context,
      title: 'Chọn người giao việc',
      items: assigners,
      displayText: (a) => '${a.code} - ${a.fullName}',
      onSelected: (a) {
        form.fields[kAssignerId(key)]?.didChange('${a.id}');
        form.fields[kAssignerText(key)]?.didChange(a.fullName);
        setState(() {});
      },
    );
  }

  Future<void> _openParentSheet(String key) async {
    final form = _formKey.currentState;
    if (form == null) return;
    final parents = bloc.state.parents;
    if (parents.isEmpty) {
      showMessage(context, 'Chưa có hạng mục cấp cha', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<WorkParentItem>(
      context: context,
      title: 'Chọn hạng mục cấp cha',
      items: parents,
      displayText: (p) => '${p.code} - ${p.mission}',
      onSelected: (p) {
        form.fields[kParentId(key)]?.didChange('${p.id}');
        form.fields[kParentText(key)]?.didChange('${p.code} - ${p.mission}');
        setState(() {});
      },
    );
  }

  void _submit(WorkCategoryState state) {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;
    if (!form.saveAndValidate()) {
      final errors = form.errors;
      for (var i = 0; i < _slipKeys.length; i++) {
        final k = _slipKeys[i];
        if (errors.keys.any((key) => key.contains(k))) {
          showMessage(context, 'Vui lòng điền thông tin ở Hạng mục ${i + 1}', type: SnackBarType.error);
          return;
        }
      }
      showMessage(context, 'Vui lòng kiểm tra lại thông tin biểu mẫu', type: SnackBarType.error);
      return;
    }
    final v = form.value;

    final projectId = int.parse('${v[kProjectId]}'.trim());
    final selectedProject = state.projects.cast<WorkProjectItem?>().firstWhere(
      (p) => p?.id == projectId,
      orElse: () => null,
    );
    final projectCode = selectedProject?.projectCode ?? '';

    final slips = <WorkCategorySubmitSlip>[];
    for (final k in _slipKeys) {
      final typeId = int.parse('${v[kTypeId(k)]}'.trim());
      final assignerId = int.tryParse('${v[kAssignerId(k)] ?? ''}') ?? 0;
      final parentId = int.tryParse('${v[kParentId(k)] ?? ''}') ?? 0;
      final mission = '${v[kMission(k)] ?? ''}'.trim();
      final planStart = v[kPlanStart(k)] as DateTime;
      final planEnd = v[kPlanEnd(k)] as DateTime;
      final status = int.tryParse('${v[kStatus(k)] ?? '1'}') ?? 1;
      final actualStart = v[kActualStart(k)] as DateTime?;
      final actualEnd = v[kActualEnd(k)] as DateTime?;
      final percentageActual =
          double.tryParse('${v[kPercent(k)] ?? '0'}'.trim()) ?? 0.0;
      // Location
      final locType = '${v[kLocationType(k)] ?? kLocVtc}';
      final location = locType == kLocVtc
          ? kDefaultLocation
          : '${v[kLocationField(k)] ?? ''}'.trim();

      // Days plan = input by user
      final totalDayPlan = double.tryParse('${v[kPlanDays(k)] ?? ''}'.trim()) ?? 1.0;

      slips.add((
        projectId: projectId,
        projectCode: projectCode,
        typeProjectItem: typeId,
        parentId: parentId,
        mission: mission,
        status: status,
        planStartDate: planStart,
        planEndDate: planEnd,
        actualStartDate: actualStart,
        actualEndDate: actualEnd,
        percentageActual: percentageActual,
        employeeIdRequest: assignerId,
        employeeCreateId: state.employeeId ?? 0,
        totalDayPlan: totalDayPlan,
        note: '',
        location: location,
      ));
    }

    bloc.add(WorkCategoryEvent.submitBatch(slips: slips));
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------
  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<WorkCategoryBloc, WorkCategoryState>(
          listenWhen: (p, c) =>
              p.submitSuccess != c.submitSuccess ||
              p.message != c.message ||
              p.status != c.status,
          listener: (context, state) {
            if (state.status == BaseStateStatus.failed &&
                (state.message ?? '').isNotEmpty &&
                !state.isSubmitting) {
              showMessage(context, state.message!, type: SnackBarType.error);
            }
            if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
              showMessage(context, state.message!, type: SnackBarType.success);
            }
            if (state.submitSuccess) {
              bloc.add(const WorkCategoryEvent.clearSubmitState());
              context.pop(true);
            }

            // Pre-fill default assigner once loaded
            if (state.status == BaseStateStatus.success) {
              _tryPrefillAssigner(state);
            }
          },
          child: BlocBuilder<WorkCategoryBloc, WorkCategoryState>(
            bloc: bloc,
            builder: (context, state) {
              return BaseScaffold(
                appBar: AppBarCommon(
                  title: const Text('Tạo hạng mục công việc'),
                  onBackTap: () => context.pop(),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12),
                  child: FormBuilder(
                    key: _formKey,
                    onChanged: () => setState(() {}),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // ───────────────── Card 1: Dự án ─────────────────
                                FormCard(
                                  child: Column(
                                    children: [
                                      // Hidden: project id
                                      FormBuilderField<String>(
                                        name: kProjectId,
                                        initialValue: '',
                                        autovalidateMode: AutovalidateMode.disabled,
                                        builder: (_) => const SizedBox.shrink(),
                                      ),
                                      GestureDetector(
                                        onTap: _openProjectSheet,
                                        child: AbsorbPointer(
                                          child: FormInputField(
                                            readOnly: true,
                                            nameForm: kProjectText,
                                            nameTextField: 'wc_add_project_text_tf',
                                            label: 'Dự án',
                                            isRequired: true,
                                            icon: Icons.business_outlined,
                                            validator: (val) =>
                                                (val == null || val.isEmpty)
                                                    ? 'Vui lòng chọn dự án'
                                                    : null,
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // ───────────────── Card 2: Hạng mục ─────────────────
                                FormCard(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // --- Tabs bar ---
                                      WorkCategorySlipTabsBar(
                                        count: _slipKeys.length,
                                        selectedIndex: _safeSlipIndex,
                                        onSelect: _selectSlip,
                                        onRemoveAt: _removeSlipAt,
                                        onAdd: _addSlip,
                                      ),
                                      const SizedBox(height: 12),

                                      // --- Slip forms ---
                                      AnimatedSize(
                                        duration: const Duration(milliseconds: 250),
                                        curve: Curves.easeInOut,
                                        alignment: Alignment.topCenter,
                                        child: IndexedStack(
                                          index: _safeSlipIndex,
                                          sizing: StackFit.loose,
                                          children: [
                                            for (final key in _slipKeys)
                                              WorkCategorySlipFormFields(
                                                slipKey: key,
                                                onTypeTap: () => _openTypeSheet(key),
                                                onAssignerTap: () => _openAssignerSheet(key),
                                                onParentTap: () => _openParentSheet(key),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),

                        // ── Submit button ──
                        FormActions(
                          mode: FormActionMode.add,
                          submitEnabled: true,
                          onSubmit: () => _submit(state),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // ── Loading overlay ──
        BlocBuilder<WorkCategoryBloc, WorkCategoryState>(
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
