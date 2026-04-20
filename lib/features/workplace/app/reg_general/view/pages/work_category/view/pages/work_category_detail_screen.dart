import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart'
    show SnackBarType;
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/work_category_model.dart';
import '../bloc/work_category_bloc.dart';
import '../widgets/work_category_add_constants.dart';
import '../widgets/work_category_add_slip_form_fields.dart';

class WorkCategoryDetailScreen extends StatefulWidget {
  const WorkCategoryDetailScreen({super.key, required this.item});

  final WorkCategoryItem item;

  @override
  State<WorkCategoryDetailScreen> createState() =>
      _WorkCategoryDetailScreenState();
}

class _WorkCategoryDetailScreenState
    extends
        BaseState<
          WorkCategoryDetailScreen,
          WorkCategoryEvent,
          WorkCategoryState,
          WorkCategoryBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();
  final String _slipKey = 'detail_slip';
  bool _didPopulate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WorkCategoryEvent.clearSubmitState());
      bloc.add(const WorkCategoryEvent.initAdd());
      bloc.add(WorkCategoryEvent.fetchDetail(id: widget.item.id));
    });
  }

  /// Populate form fields from the detail API response.
  void _populateFromDetail(
    WorkCategoryDetailItem detail,
    WorkCategoryState state,
  ) {
    final form = _formKey.currentState;
    if (form == null) return;

    // --- Project ---
    final project = state.projects.cast<WorkProjectItem?>().firstWhere(
      (p) => p?.id == detail.projectId,
      orElse: () => null,
    );
    form.fields[kProjectId]?.didChange('${detail.projectId}');
    form.fields[kProjectText]?.didChange(
      project != null
          ? '${project.projectCode} - ${project.projectName}'
          : '${detail.projectId}',
    );

    // --- Type ---
    final type = state.projectTypes.cast<WorkProjectTypeItem?>().firstWhere(
      (t) => t?.id == detail.typeProjectItem,
      orElse: () => null,
    );
    form.fields[kTypeId(_slipKey)]?.didChange('${detail.typeProjectItem}');
    form.fields[kTypeText(_slipKey)]?.didChange(type?.projectTypeName ?? '');

    // --- Assigner (người giao việc / EmployeeIDRequest) ---
    final assigner = state.assigners.cast<WorkAssignItem?>().firstWhere(
      (a) => a?.id == detail.employeeIdRequest,
      orElse: () => null,
    );
    form.fields[kAssignerId(_slipKey)]?.didChange(
      '${detail.employeeIdRequest}',
    );
    form.fields[kAssignerText(_slipKey)]?.didChange(
      assigner?.fullName ?? detail.employeeRequestName ?? '',
    );

    // --- Parent ---
    final parent = state.parents.cast<WorkParentItem?>().firstWhere(
      (p) => p?.id == detail.parentId,
      orElse: () => null,
    );
    form.fields[kParentId(_slipKey)]?.didChange('${detail.parentId}');
    form.fields[kParentText(_slipKey)]?.didChange(
      parent != null ? '${parent.code} - ${parent.mission}' : '',
    );

    // --- Basic fields ---
    form.fields[kMission(_slipKey)]?.didChange(detail.mission);
    form.fields[kStatus(_slipKey)]?.didChange('${detail.status}');

    // --- Dates ---
    form.fields[kPlanStart(_slipKey)]?.didChange(detail.planStartDate);
    form.fields['${kPlanStart(_slipKey)}_inner']?.didChange(
      detail.planStartDate,
    );
    form.fields[kPlanEnd(_slipKey)]?.didChange(detail.planEndDate);
    form.fields['${kPlanEnd(_slipKey)}_inner']?.didChange(detail.planEndDate);
    form.fields[kActualStart(_slipKey)]?.didChange(detail.actualStartDate);
    form.fields['${kActualStart(_slipKey)}_inner']?.didChange(
      detail.actualStartDate,
    );
    form.fields[kActualEnd(_slipKey)]?.didChange(detail.actualEndDate);
    form.fields['${kActualEnd(_slipKey)}_inner']?.didChange(
      detail.actualEndDate,
    );

    // --- Numbers ---
    form.fields[kPercent(_slipKey)]?.didChange(
      detail.percentageActual == detail.percentageActual.toInt()
          ? detail.percentageActual.toInt().toString()
          : detail.percentageActual.toString(),
    );
    form.fields[kPlanDays(_slipKey)]?.didChange(
      detail.totalDayPlan == detail.totalDayPlan.toInt()
          ? detail.totalDayPlan.toInt().toString()
          : detail.totalDayPlan.toString(),
    );

    // --- Location ---
    final isVtc =
        detail.location == kDefaultLocation || detail.location.isEmpty;
    form.fields[kLocationType(_slipKey)]?.didChange(
      isVtc ? kLocVtc : kLocOther,
    );
    if (!isVtc) {
      form.fields[kLocationField(_slipKey)]?.didChange(detail.location);
    }

    // --- Problems ---
    if (state.problems.isNotEmpty) {
      final problemTxt = state.problems
          .map((e) => e.contentProblem)
          .where((e) => e.isNotEmpty)
          .join('\n');
      form.fields['wc_${_slipKey}_problem']?.didChange(problemTxt);
    }

    // --- Note ---
    form.fields['wc_${_slipKey}_note']?.didChange(detail.note);
  }

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
        form.fields[kProjectText]?.didChange(
          '${p.projectCode} - ${p.projectName}',
        );
        form.fields[kParentId(_slipKey)]?.didChange('');
        form.fields[kParentText(_slipKey)]?.didChange('');
        bloc.add(WorkCategoryEvent.fetchParents(projectId: p.id));
        setState(() {});
      },
    );
  }

  Future<void> _openTypeSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items = bloc.state.projectTypes;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có loại công việc', type: SnackBarType.error);
      return;
    }
    await openSelectBottomSheet<WorkProjectTypeItem>(
      context: context,
      title: 'Kiểu hạng mục',
      items: items,
      displayText: (p) => p.projectTypeName,
      onSelected: (p) {
        form.fields[kTypeId(_slipKey)]?.didChange('${p.id}');
        form.fields[kTypeText(_slipKey)]?.didChange(p.projectTypeName);
        setState(() {});
      },
    );
  }

  Future<void> _openAssignerSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final items = bloc.state.assigners;
    if (items.isEmpty) {
      showMessage(
        context,
        'Chưa có danh sách người giao',
        type: SnackBarType.error,
      );
      return;
    }
    await openSelectBottomSheet<WorkAssignItem>(
      context: context,
      title: 'Người giao việc',
      items: items,
      displayText: (p) => p.fullName,
      onSelected: (p) {
        form.fields[kAssignerId(_slipKey)]?.didChange('${p.id}');
        form.fields[kAssignerText(_slipKey)]?.didChange(p.fullName);
        setState(() {});
      },
    );
  }

  Future<void> _openParentSheet() async {
    final form = _formKey.currentState;
    if (form == null) return;
    final projectIdRaw = form.fields[kProjectId]?.value;
    if (projectIdRaw == null || '$projectIdRaw'.isEmpty) {
      showMessage(
        context,
        'Vui lòng chọn dự án trước',
        type: SnackBarType.error,
      );
      return;
    }
    final items = bloc.state.parents;
    if (items.isEmpty) {
      showMessage(
        context,
        'Dự án này không có hạng mục cha',
        type: SnackBarType.error,
      );
      return;
    }
    await openSelectBottomSheet<WorkParentItem>(
      context: context,
      title: 'Hạng mục cha',
      items: items,
      displayText: (p) => '${p.code} - ${p.mission}',
      onSelected: (p) {
        form.fields[kParentId(_slipKey)]?.didChange('${p.id}');
        form.fields[kParentText(_slipKey)]?.didChange(
          '${p.code} - ${p.mission}',
        );
        setState(() {});
      },
    );
  }

  Future<void> _submit(WorkCategoryState state) async {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;
    if (!form.saveAndValidate()) {
      final errors = form.errors;
      if (errors.containsKey(kProjectText)) {
        showMessage(
          context,
          'Vui lòng điền thông tin ở mục Dự án',
          type: SnackBarType.error,
        );
        return;
      }
      if (errors.keys.any((key) => key.contains(_slipKey))) {
        showMessage(
          context,
          'Vui lòng điền đầy đủ thông tin bắt buộc',
          type: SnackBarType.error,
        );
        return;
      }
      showMessage(
        context,
        'Vui lòng kiểm tra lại thông tin biểu mẫu',
        type: SnackBarType.error,
      );
      return;
    }
    final v = form.value;

    final projectId = int.parse('${v[kProjectId]}'.trim());
    final selectedProject = state.projects.cast<WorkProjectItem?>().firstWhere(
      (p) => p?.id == projectId,
      orElse: () => null,
    );
    final projectCode = selectedProject?.projectCode ?? '';

    final typeId = int.parse('${v[kTypeId(_slipKey)]}'.trim());
    final assignerId = int.tryParse('${v[kAssignerId(_slipKey)] ?? ''}') ?? 0;
    final parentId = int.tryParse('${v[kParentId(_slipKey)] ?? ''}') ?? 0;
    final mission = '${v[kMission(_slipKey)] ?? ''}'.trim();
    final planStart = v[kPlanStart(_slipKey)] as DateTime;
    final planEnd = v[kPlanEnd(_slipKey)] as DateTime;
    final status = int.tryParse('${v[kStatus(_slipKey)] ?? '1'}') ?? 1;
    final actualStart = v[kActualStart(_slipKey)] as DateTime?;
    final actualEnd = v[kActualEnd(_slipKey)] as DateTime?;
    final percentageActual =
        double.tryParse('${v[kPercent(_slipKey)] ?? '0'}'.trim()) ?? 0.0;
    final locType = '${v[kLocationType(_slipKey)] ?? kLocVtc}';
    final location = locType == kLocVtc
        ? kDefaultLocation
        : '${v[kLocationField(_slipKey)] ?? ''}'.trim();
    final totalDayPlan =
        double.tryParse('${v[kPlanDays(_slipKey)] ?? ''}'.trim()) ?? 1.0;
    final rawNote = '${v['wc_${_slipKey}_note'] ?? ''}'.trim();

    final slip = (
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
      note: rawNote,
      location: location,
    );

    bloc.add(WorkCategoryEvent.submitEdit(id: widget.item.id, slip: slip));
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        MultiBlocListener(
      listeners: [
        BlocListener<WorkCategoryBloc, WorkCategoryState>(
          listenWhen: (p, c) => p.editSuccess != c.editSuccess,
          listener: (context, state) {
            if (state.editSuccess == true) {
              showMessage(
                context,
                state.message ?? 'Cập nhật thành công',
                type: SnackBarType.success,
              );
              context.pop(true);
            }
          },
        ),
        BlocListener<WorkCategoryBloc, WorkCategoryState>(
          listenWhen: (p, c) =>
              p.detailItem != c.detailItem && c.detailItem != null,
          listener: (context, state) {
            if (!_didPopulate && mounted) {
              _didPopulate = true;
              // Defer by one frame so FormBuilder fields are registered
              Future.microtask(() {
                if (mounted) _populateFromDetail(state.detailItem!, state);
              });
            }
          },
        ),
        BlocListener<WorkCategoryBloc, WorkCategoryState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status == BaseStateStatus.failed,
          listener: (context, state) {
            if (state.message != null) {
              showMessage(context, state.message!, type: SnackBarType.error);
            }
          },
        ),
      ],
      child: BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết hạng mục'),
          onBackTap: () => context.pop(),
        ),
        body: FormBuilder(
              key: _formKey,
              child: BlocBuilder<WorkCategoryBloc, WorkCategoryState>(
                buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // ===== Dự án =====
                              FormCard(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Hidden field to store actual numeric ID safely
                                    FormBuilderField<String>(
                                      name: kProjectId,
                                      initialValue: '',
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      builder: (_) => const SizedBox.shrink(),
                                    ),
                                    GestureDetector(
                                      onTap: _openProjectSheet,
                                      child: AbsorbPointer(
                                        child: FormInputField(
                                          nameForm: kProjectText,
                                          nameTextField:
                                              'wc_add_project_text_tf',
                                          label: 'Dự án',
                                          icon: Icons.cases_outlined,
                                          readOnly: true,
                                          isRequired: true,
                                          validator: (val) =>
                                              (val == null || val.isEmpty)
                                              ? 'Vui lòng chọn dự án'
                                              : null,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // ===== Form chính =====
                              FormCard(
                                child: WorkCategorySlipFormFields(
                                  slipKey: _slipKey,
                                  onTypeTap: _openTypeSheet,
                                  onAssignerTap: _openAssignerSheet,
                                  onParentTap: _openParentSheet,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // ===== Thông tin thêm (Expansion) =====
                              Theme(
                                data: Theme.of(
                                  context,
                                ).copyWith(dividerColor: Colors.transparent),
                                child: Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  child: ExpansionTile(
                                    initiallyExpanded: false,
                                    maintainState: true,
                                    title: const Text('Thông tin thêm'),
                                    childrenPadding: const EdgeInsets.all(16),
                                    children: [
                                      // Vấn đề phát sinh
                                      FormInputField(
                                        nameForm: 'wc_${_slipKey}_problem',
                                        nameTextField: 'wc_${_slipKey}_problem_tf',
                                        label: 'Vấn đề phát sinh (nếu có)',
                                        icon: Icons.report_problem_outlined,
                                        readOnly: true,
                                        maxLines: 2,
                                        onTap: () async {
                                          final currentTxt =
                                              _formKey
                                                      .currentState
                                                      ?.fields['wc_${_slipKey}_problem']
                                                      ?.value
                                                  as String?;
                                          final res =
                                              await DialogService.showProblemDialog(
                                                context: context,
                                                initialProblems: currentTxt,
                                                problems: state.problems,
                                                onSave: (content) {
                                                  bloc.add(
                                                    WorkCategoryEvent.saveProblem(
                                                      projectItemId:
                                                          widget.item.id,
                                                      content: content,
                                                    ),
                                                  );
                                                },
                                              );
                                          if (res != null && mounted) {
                                            _formKey
                                                .currentState
                                                ?.fields['wc_${_slipKey}_problem']
                                                ?.didChange(res);
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 12),
                                      // Ghi chú
                                      FormInputField(
                                        nameForm: 'wc_${_slipKey}_note',
                                        nameTextField: 'wc_${_slipKey}_note_tf',
                                        label: 'Ghi chú (nếu có)',
                                        icon: Icons.note_alt_outlined,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 12),
                                      // Ngày cập nhật
                                      FormInputField(
                                        nameForm: 'wc_${_slipKey}_update_date',
                                        nameTextField:
                                            'wc_${_slipKey}_update_date_tf',
                                        label: 'Ngày cập nhật',
                                        icon: Icons.calendar_today_outlined,
                                        readOnly: true,
                                        initialValue: DateFormat(
                                          'dd/MM/yyyy',
                                        ).format(DateTime.now()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ===== Pinned Submit button =====
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: FormActions(
                          mode: FormActionMode.edit,
                          onSave: () => _submit(state),
                          onCancel: () => context.pop(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        
        // ── Loading overlay — phủ toàn bộ màn hình ──
        BlocBuilder<WorkCategoryBloc, WorkCategoryState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isFetchingDetail && !state.isSubmitting) {
              return const SizedBox.shrink();
            }
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
