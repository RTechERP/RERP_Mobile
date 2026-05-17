import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_card.dart';
import '../../../../../../../../../common/widgets/form/form_date_time_picker.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/helpers/multi_select_employee_sheet.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_tab_enum.dart';
import '../widgets/index.dart';
import '../../week_plan_extra.dart';

/// Màn hình chi tiết công việc - hiển thị toàn bộ dữ liệu task
/// để xem và cập nhật.
class WeekPlanDetailScreen extends StatefulWidget {
  const WeekPlanDetailScreen({
    super.key,
    required this.taskId,
    this.extra,
  });

  final int taskId;
  final Object? extra;

  @override
  State<WeekPlanDetailScreen> createState() => _WeekPlanDetailScreenState();
}

class _WeekPlanDetailScreenState
    extends BaseState<WeekPlanDetailScreen, WeekPlanEvent, WeekPlanState, WeekPlanBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  bool _isBugTask(WeekPlanState s) {
    final name = s.headerWorkTypeName?.toLowerCase() ?? '';
    return s.headerWorkType == 2 || name.contains('bug');
  }

  int _totalSteps(WeekPlanState s) => _isBugTask(s) ? 7 : 6;

  List<String> _stepLabels(WeekPlanState s) =>
      WeekPlanAddStep.stepLabels(isTTChung: _isBugTask(s));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final extra = widget.extra;
      if (extra is WeekPlanAddExtra) {
        if (extra.projects.isNotEmpty) bloc.add(const WeekPlanEvent.fetchProjects());
        if (extra.taskTypes.isNotEmpty) bloc.add(const WeekPlanEvent.fetchTaskTypes());
        if (extra.projectTypes.isNotEmpty) bloc.add(const WeekPlanEvent.fetchProjectTypes());
        if (extra.employees.isNotEmpty) bloc.add(const WeekPlanEvent.fetchEmployees());
      } else {
        bloc.add(const WeekPlanEvent.fetchProjects());
        bloc.add(const WeekPlanEvent.fetchTaskTypes());
        bloc.add(const WeekPlanEvent.fetchProjectTypes());
        bloc.add(const WeekPlanEvent.fetchEmployees());
      }

      bloc.add(WeekPlanEvent.initDetailScreen(taskId: widget.taskId));
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<WeekPlanBloc, WeekPlanState>(
      listenWhen: (p, c) =>
          p.submitSuccess != c.submitSuccess ||
          p.message != c.message ||
          p.status != c.status,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed &&
            (state.message ?? '').isNotEmpty &&
            !state.isSubmitting) {
          showMessage(context, state.message ?? '', type: SnackBarType.error);
        }
        if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
          showMessage(context, state.message ?? '', type: SnackBarType.success);
        }
        if (state.submitSuccess) {
          bloc.add(const WeekPlanEvent.clearSubmitState());
          context.pop(true);
        }
      },
      child: Scaffold(
        appBar: AppBarCommon(
          title: const Text('Chi tiết công việc'),
          onBackTap: () => context.pop(),
        ),
        body: BlocBuilder<WeekPlanBloc, WeekPlanState>(
          builder: (context, state) {
            if (state.status == BaseStateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                SizedBox(height: 100, child: _buildStepper(state)),
                Expanded(
                  child: FormBuilder(
                    key: _formKey,
                    child: _buildStepContent(),
                  ),
                ),
                _buildBottomActions(),
              ],
            );
          },
        ),
      ),
    );
  }

  //===============================================================
  // STEPPER
  //===============================================================
  Widget _buildStepper(WeekPlanState state) {
    final totalSteps = _totalSteps(state);
    final labels = _stepLabels(state);
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(10),
      child: EasyStepper(
        activeStep: _currentStep,
        stepShape: StepShape.circle,
        stepRadius: 28,
        activeStepBorderColor: AppColors.primaryERP,
        activeStepIconColor: AppColors.primaryERP,
        activeStepTextColor: AppColors.primaryERP,
        activeStepBackgroundColor: AppColors.white,
        activeStepBorderType: BorderType.normal,
        finishedStepBorderColor: AppColors.stateSuccessColor,
        finishedStepIconColor: AppColors.stateSuccessColor,
        finishedStepTextColor: AppColors.stateSuccessColor,
        finishedStepBackgroundColor: AppColors.white,
        finishedStepBorderType: BorderType.normal,
        unreachedStepBorderColor: AppColors.borderColor,
        unreachedStepIconColor: AppColors.hintText,
        unreachedStepTextColor: AppColors.hintText,
        unreachedStepBackgroundColor: AppColors.bgCard,
        unreachedStepBorderType: BorderType.normal,
        lineStyle: const LineStyle(
          lineLength: 25,
          lineThickness: 1.2,
          activeLineColor: AppColors.primaryERP,
          finishedLineColor: AppColors.stateSuccessColor,
          unreachedLineColor: AppColors.borderColor,
        ),
        borderThickness: 2,
        showStepBorder: true,
        enableStepTapping: true,
        showScrollbar: false,
        steps: List.generate(totalSteps, (idx) {
          return EasyStep(
            icon: Icon(_stepIconByIndex(idx, state), size: 16),
            customTitle: Text(
              labels[idx],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: _currentStep == idx
                    ? AppColors.primaryERP
                    : AppColors.hintText,
                fontWeight: _currentStep == idx ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          );
        }),
        onStepReached: _goToStep,
      ),
    );
  }

  IconData _stepIconByIndex(int idx, WeekPlanState state) {
    if (_isBugTask(state)) {
      switch (idx) {
        case 0: return Icons.folder_outlined;
        case 1: return Icons.lightbulb_outline;
        case 2: return Icons.assignment_outlined;
        case 3: return Icons.playlist_add_check_outlined;
        case 4: return Icons.checklist_outlined;
        case 5: return Icons.attach_file_outlined;
        case 6: return Icons.warning_outlined;
        default: return Icons.circle;
      }
    }
    switch (idx) {
      case 0: return Icons.folder_outlined;
      case 1: return Icons.assignment_outlined;
      case 2: return Icons.playlist_add_check_outlined;
      case 3: return Icons.checklist_outlined;
      case 4: return Icons.attach_file_outlined;
      case 5: return Icons.warning_outlined;
      default: return Icons.circle;
    }
  }

  //===============================================================
  // STEP CONTENT
  //===============================================================
  Widget _buildStepContent() {
    return BlocBuilder<WeekPlanBloc, WeekPlanState>(
      builder: (context, state) => _buildStepContentByIndex(_currentStep, state),
    );
  }

  Widget _buildStepContentByIndex(int step, WeekPlanState state) {
    if (_isBugTask(state)) {
      switch (step) {
        case 0: return _buildProjectInfoStep(state);
        case 1: return _buildReasonSolutionStep(state);
        case 2: return _buildContentStep(state);
        case 3: return _buildSubTaskStep(state);
        case 4: return _buildChecklistStep(state);
        case 5: return _buildAttachmentStep(state);
        case 6: return _buildIncidentStep(state);
        default: return const SizedBox.shrink();
      }
    }
    switch (step) {
      case 0: return _buildProjectInfoStep(state);
      case 1: return _buildContentStep(state);
      case 2: return _buildSubTaskStep(state);
      case 3: return _buildChecklistStep(state);
      case 4: return _buildAttachmentStep(state);
      case 5: return _buildIncidentStep(state);
      default: return const SizedBox.shrink();
    }
  }

  //===============================================================
  // STEP WIDGETS
  //===============================================================

  //---(_Step: Project Info)---//
  Widget _buildProjectInfoStep(WeekPlanState state) {
    if (state.projects.isEmpty) bloc.add(const WeekPlanEvent.fetchProjects());
    if (state.taskTypes.isEmpty) bloc.add(const WeekPlanEvent.fetchTaskTypes());
    if (state.projectTypes.isEmpty) bloc.add(const WeekPlanEvent.fetchProjectTypes());
    if (state.employees.isEmpty) bloc.add(const WeekPlanEvent.fetchEmployees());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FormInputField(
            nameForm: 'task_name',
            nameTextField: 'task_name_field',
            label: 'Tên công việc',
            icon: Icons.assignment_outlined,
            isRequired: true,
            initialValue: state.taskName,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập tên công việc',
            ),
            onChanged: (value) {
              if (value != null) {
                bloc.add(WeekPlanEvent.updateContentTaskName(value.toString()));
              }
            },
          ),
          const SizedBox(height: 10),
          WeekPlanProjectCard(
            selectedId: state.headerProjectId,
            projects: state.projects,
            onChanged: (project) {
              bloc.add(WeekPlanEvent.updateHeaderProject(
                projectId: project.id ?? 0,
                projectName: project.projectName ?? '',
              ));
            },
          ),
          const SizedBox(height: 10),
          WeekPlanTapCard(
            label: 'Công việc cha',
            value: state.headerParentTaskName,
            icon: Icons.account_tree_outlined,
            onTap: () => _showParentTaskPicker(context, state),
          ),
          const SizedBox(height: 10),
          WeekPlanMultiSelectChips<EmployeeTaskItem>(
            label: 'Người thực hiện',
            icon: Icons.people_outline,
            selected: state.selectedAssignees,
            onAdd: () => _showEmployeePicker(
              context,
              title: 'Chọn người thực hiện',
              allEmployees: state.employees,
              selectedEmployees: state.selectedAssignees,
              onConfirm: (selected) {
                bloc.add(WeekPlanEvent.setAssignees(selected));
              },
            ),
            onRemove: (id) => bloc.add(WeekPlanEvent.removeAssignee(id)),
            isEmployee: true,
          ),
          const SizedBox(height: 10),
          WeekPlanTapCard(
            label: 'Người giao việc',
            value: state.headerAssignerName,
            icon: Icons.assignment_ind_outlined,
            onTap: () => _showSingleEmployeePicker(
              context,
              title: 'Chọn người giao việc',
              allEmployees: state.employees,
              selectedId: state.headerAssignerId,
              onConfirm: (employee) {
                if (employee != null) {
                  bloc.add(WeekPlanEvent.updateHeaderAssigner(
                    assignerId: employee.id ?? 0,
                    assignerName: '${employee.code ?? ''} - ${employee.fullName ?? ''}',
                  ));
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          WeekPlanMultiSelectChips<EmployeeTaskItem>(
            label: 'Người liên quan',
            icon: Icons.group_outlined,
            selected: state.selectedRelatedPersons,
            onAdd: () => _showEmployeePicker(
              context,
              title: 'Chọn người liên quan',
              allEmployees: state.employees,
              selectedEmployees: state.selectedRelatedPersons,
              onConfirm: (selected) {
                bloc.add(WeekPlanEvent.setRelatedPersons(selected));
              },
            ),
            onRemove: (id) => bloc.add(WeekPlanEvent.removeRelatedPerson(id)),
            isEmployee: true,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: WeekPlanProjectTypeCard(
                  selectedId: state.headerTaskCategory,
                  projectTypes: state.projectTypes,
                  onChanged: (pt) {
                    bloc.add(WeekPlanEvent.updateHeaderTaskCategory(
                      categoryId: pt.id ?? 0,
                      categoryName: pt.projectTypeName ?? '',
                    ));
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WeekPlanTaskTypeCard(
                  selectedId: state.headerWorkType,
                  taskTypes: state.taskTypes,
                  onChanged: (taskType) {
                    bloc.add(WeekPlanEvent.updateHeaderWorkTypeAndStatus(
                      workTypeId: taskType.id ?? 0,
                      workTypeName: taskType.typeName ?? '',
                      statusId: state.headerStatus ?? 0,
                      statusName: state.headerStatusName ?? 'Chưa làm',
                    ));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormDateTimePicker(
                      nameForm: 'plan_start_date',
                      nameTimePicker: 'plan_start_date_picker',
                      label: 'Dự kiến BĐ',
                      icon: Icons.calendar_today,
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      initialValue: state.contentStartDate,
                      onChanged: (value) {
                        bloc.add(WeekPlanEvent.updateContentDates(
                          startDate: value,
                          endDate: state.contentEndDate,
                          actualStartDate: state.contentActualStartDate,
                          actualEndDate: state.contentActualEndDate,
                          deadline: state.contentDeadline,
                        ));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FormDateTimePicker(
                      nameForm: 'plan_end_date',
                      nameTimePicker: 'plan_end_date_picker',
                      label: 'Dự kiến KT',
                      icon: Icons.event,
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      initialValue: state.contentEndDate,
                      onChanged: (value) {
                        bloc.add(WeekPlanEvent.updateContentDates(
                          startDate: state.contentStartDate,
                          endDate: value,
                          actualStartDate: state.contentActualStartDate,
                          actualEndDate: state.contentActualEndDate,
                          deadline: state.contentDeadline,
                        ));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: FormInputField(
                      nameForm: 'expected_hours',
                      nameTextField: 'expected_hours_field',
                      label: 'Dự kiến (giờ)',
                      icon: Icons.access_time,
                      keyboardType: TextInputType.number,
                      initialValue: _formatHoursInt(state.headerTimeEstimate),
                      onChanged: (value) {
                        final hours = double.tryParse(value?.toString() ?? '');
                        bloc.add(WeekPlanEvent.updateHeaderTimeEstimate(hours));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FormDateTimePicker(
                      nameForm: 'deadline',
                      nameTimePicker: 'deadline_picker',
                      label: 'Thời hạn',
                      icon: Icons.flag_outlined,
                      inputType: InputType.date,
                      format: DateFormat('dd/MM/yyyy'),
                      initialValue: state.contentDeadline,
                      onChanged: (value) {
                        bloc.add(WeekPlanEvent.updateContentDates(
                          startDate: state.contentStartDate,
                          endDate: state.contentEndDate,
                          actualStartDate: state.contentActualStartDate,
                          actualEndDate: state.contentActualEndDate,
                          deadline: value,
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FormDateTimePicker(
                  nameForm: 'actual_start_date',
                  nameTimePicker: 'actual_start_date_picker',
                  label: 'Thực tế BĐ',
                  icon: Icons.play_arrow_outlined,
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  initialValue: state.contentActualStartDate,
                  onChanged: (value) {
                    bloc.add(WeekPlanEvent.updateContentDates(
                      startDate: state.contentStartDate,
                      endDate: state.contentEndDate,
                      actualStartDate: value,
                      actualEndDate: state.contentActualEndDate,
                      deadline: state.contentDeadline,
                    ));
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FormDateTimePicker(
                  nameForm: 'actual_end_date',
                  nameTimePicker: 'actual_end_date_picker',
                  label: 'Thực tế KT',
                  icon: Icons.stop_outlined,
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  initialValue: state.contentActualEndDate,
                  onChanged: (value) {
                    bloc.add(WeekPlanEvent.updateContentDates(
                      startDate: state.contentStartDate,
                      endDate: state.contentEndDate,
                      actualStartDate: state.contentActualStartDate,
                      actualEndDate: value,
                      deadline: state.contentDeadline,
                    ));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //---(_Step: Reason Solution)---//
  Widget _buildReasonSolutionStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: _ReasonSolutionCard(
        initialValue: state.contentReasonSolution ?? '',
        onChanged: (v) => bloc.add(WeekPlanEvent.updateContentReasonSolution(v)),
      ),
    );
  }

  //---(_Step: Content)---//
  Widget _buildContentStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Column(
        children: [
          FormCard(
            child: Column(
              children: [
                FormInputField(
                  nameForm: 'description',
                  nameTextField: 'description_field',
                  label: 'Mô tả chi tiết',
                  icon: Icons.description_outlined,
                  autoExpand: true,
                  keyboardType: TextInputType.multiline,
                  initialValue: state.contentDescription,
                  onChanged: (value) {
                    if (value != null) {
                      bloc.add(WeekPlanEvent.updateContentDescription(value.toString()));
                    }
                  },
                ),
                const SizedBox(height: 10),
                FormInputField(
                  nameForm: 'expected_result',
                  nameTextField: 'expected_result_field',
                  label: 'Kết quả công việc',
                  keyboardType: TextInputType.multiline,
                  icon: Icons.check_circle_outline,
                  autoExpand: true,
                  initialValue: state.contentResult,
                  onChanged: (value) {
                    if (value != null) {
                      bloc.add(WeekPlanEvent.updateContentResult(value.toString()));
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          WeekPlanChoiceRow(
            options: const [
              WeekPlanChoiceOption(label: 'Cá nhân', value: true),
              WeekPlanChoiceOption(label: 'Phê duyệt', value: false),
            ],
            selected: state.headerIsPersonalTask,
            onChanged: (v) => bloc.add(WeekPlanEvent.updateHeaderPersonalTask(v)),
          ),
          const SizedBox(height: 10),
          WeekPlanComplexityRow(
            selected: state.headerComplexity,
            onChanged: (v) => bloc.add(WeekPlanEvent.updateHeaderComplexity(v)),
          ),
          const SizedBox(height: 10),
          WeekPlanPriorityCard(
            selected: state.headerPriority,
            onChanged: (v) => bloc.add(WeekPlanEvent.updateHeaderPriority(v)),
          ),
          const SizedBox(height: 10),
          WeekPlanStatusCard(
            selected: state.headerStatus ?? 0,
            onChanged: (v) => bloc.add(WeekPlanEvent.updateHeaderStatus(
              statusId: v,
              statusName: WeekPlanStatusCard.labels[v],
            )),
          ),
        ],
      ),
    );
  }

  //---(_Step: SubTask)---//
  Widget _buildSubTaskStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          if (state.subTasks.isEmpty)
            _emptyState(
              icon: Icons.playlist_add,
              title: 'Chưa có công việc con nào',
            )
          else
            ...List.generate(state.subTasks.length, (i) {
              return WeekPlanSubTaskCard(
                key: ValueKey(state.subTasks[i].id ?? i),
                index: i,
                subTask: state.subTasks[i],
                onTap: () {},
                onDelete: () => bloc.add(WeekPlanEvent.removeSubTask(i)),
              );
            }),
        ],
      ),
    );
  }

  //---(_Step: Checklist)---//
  Widget _buildChecklistStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          if (state.detailChecklists.isEmpty)
            _emptyState(icon: Icons.checklist, title: 'Chưa có checklist nào')
          else
            ...List.generate(state.detailChecklists.length, (i) {
              final item = state.detailChecklists[i];
              return WeekPlanChecklistItem(
                index: i,
                content: item.checklistTitle ?? '',
                isDone: item.isDone ?? false,
                onToggle: () {
                  bloc.add(WeekPlanEvent.updateDetailChecklistItem(
                    checklistId: item.id ?? 0,
                    checklistTitle: item.checklistTitle ?? '',
                    orderIndex: item.orderIndex ?? (i + 1),
                    isDone: !(item.isDone ?? false),
                  ));
                },
                onEdit: () => _showEditDetailChecklistDialog(context, item, i),
                onDelete: () {
                  if (item.id != null) {
                    bloc.add(WeekPlanEvent.markChecklistDeleted(
                      checklistId: item.id!,
                    ));
                  }
                },
              );
            }),
        ],
      ),
    );
  }

  //---(_Step: Attachment)---//
  Widget _buildAttachmentStep(WeekPlanState state) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              labelColor: AppColors.primaryERP,
              unselectedLabelColor: AppColors.hintText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Tệp'),
                Tab(text: 'Link'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildFileTab(state),
                _buildLinkTab(state),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileTab(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (state.attachments.isEmpty)
            _emptyState(icon: Icons.attachment, title: 'Chưa có tệp đính kèm')
          else
            ...List.generate(state.attachments.length, (i) {
              return WeekPlanAttachmentCard(
                index: i,
                attachment: state.attachments[i],
                onDelete: () {},
              );
            }),
        ],
      ),
    );
  }

  Widget _buildLinkTab(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (state.links.isEmpty)
            _emptyState(icon: Icons.link_off, title: 'Chưa có link đính kèm')
          else
            ...List.generate(state.links.length, (i) {
              return WeekPlanLinkCard(
                index: i,
                link: state.links[i],
                onDelete: () {},
              );
            }),
        ],
      ),
    );
  }

  Widget _emptyState({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(icon, size: 48, color: AppColors.hintText),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14, color: AppColors.hintText)),
        ],
      ),
    );
  }

  void _showEditDetailChecklistDialog(
    BuildContext context,
    ChecklistWeekPlanResponse item,
    int index,
  ) {
    final formKey = GlobalKey<FormBuilderState>();
    final controller = TextEditingController(text: item.checklistTitle ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chỉnh sửa checklist'),
        content: FormBuilder(
          key: formKey,
          child: FormInputField(
            nameForm: 'checklist_content',
            nameTextField: 'checklist_content_field',
            label: 'Nội dung checklist',
            icon: Icons.check_box_outlined,
            initialValue: item.checklistTitle ?? '',
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập nội dung',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.dispose();
              Navigator.pop(ctx);
            },
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              formKey.currentState?.save();
              if (formKey.currentState?.validate() ?? false) {
                final vals = formKey.currentState?.value;
                final text = vals?['checklist_content']?.toString().trim() ?? '';
                bloc.add(WeekPlanEvent.updateDetailChecklistItem(
                  checklistId: item.id ?? 0,
                  checklistTitle: text,
                  orderIndex: item.orderIndex ?? (index + 1),
                  isDone: item.isDone,
                ));
                controller.dispose();
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              foregroundColor: Colors.white,
            ),
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  //---(_Step: Incident)---//
  Widget _buildIncidentStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.add_alert_outlined,
                          size: 18, color: AppColors.warning),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Phát sinh',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                          color: AppColors.heading),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (state.incidents.isEmpty)
            _emptyState(icon: Icons.add_alert_outlined, title: 'Không có sự phát sinh nào')
          else
            ...List.generate(state.incidents.length, (i) {
              return WeekPlanIncidentForm(
                key: ValueKey(state.incidents[i].id ?? i),
                index: i,
                incident: state.incidents[i],
                isExpanded: state.expandedIncidentIndex == i,
                onChanged: (updated) => bloc.add(WeekPlanEvent.updateIncident(i, updated)),
                onDelete: () {},
                onToggleExpand: () => bloc.add(WeekPlanEvent.toggleIncidentExpand(i)),
              );
            }),
        ],
      ),
    );
  }

  //===============================================================
  // PICKERS
  //===============================================================
  Future<void> _showParentTaskPicker(BuildContext context, WeekPlanState state) async {
    if (state.headerProjectId == null || state.headerProjectId == 0) {
      showMessage(context, 'Vui lòng chọn dự án trước', type: SnackBarType.info);
      return;
    }
    if (state.parentProjectTasks.isEmpty) {
      showMessage(context, 'Danh sách công việc cha trống', type: SnackBarType.info);
      return;
    }

    final initialSelected = state.headerParentTaskId != null
        ? state.parentProjectTasks
            .where((p) => p.id == state.headerParentTaskId)
            .firstOrNull
        : null;

    await openSelectBottomSheet<ParentProjectTaskItem>(
      context: context,
      title: 'Chọn công việc cha',
      items: state.parentProjectTasks,
      displayText: (p) => '${p.code ?? ''} - ${p.mission ?? ''}',
      onSelected: (parent) {
        bloc.add(WeekPlanEvent.updateHeaderParentTask(
          parentTaskId: parent.id ?? 0,
          parentTaskName: '${parent.code ?? ''} - ${parent.mission ?? ''}',
        ));
      },
      initialSelectedItem: initialSelected,
    );
  }

  Future<void> _showEmployeePicker(
    BuildContext context, {
    required String title,
    required List<EmployeeTaskItem> allEmployees,
    required List<EmployeeTaskItem> selectedEmployees,
    required void Function(List<EmployeeTaskItem>) onConfirm,
  }) async {
    if (allEmployees.isEmpty) {
      showMessage(context, 'Danh sách nhân viên trống', type: SnackBarType.info);
      return;
    }
    await openMultiSelectEmployeeSheet(
      context: context,
      title: title,
      allEmployees: allEmployees,
      selectedEmployees: selectedEmployees,
      onConfirm: onConfirm,
    );
  }

  Future<void> _showSingleEmployeePicker(
    BuildContext context, {
    required String title,
    required List<EmployeeTaskItem> allEmployees,
    required int? selectedId,
    required void Function(EmployeeTaskItem?) onConfirm,
  }) async {
    if (allEmployees.isEmpty) {
      showMessage(context, 'Danh sách nhân viên trống', type: SnackBarType.info);
      return;
    }
    final initialSelected = selectedId != null
        ? allEmployees.where((e) => e.id == selectedId).firstOrNull
        : null;
    await openSelectBottomSheet<EmployeeTaskItem>(
      context: context,
      title: title,
      items: allEmployees,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}',
      onSelected: (employee) => onConfirm(employee),
      initialSelectedItem: initialSelected,
    );
  }

  //===============================================================
  // BOTTOM ACTIONS
  //===============================================================
  Widget _buildBottomActions() {
    return BlocBuilder<WeekPlanBloc, WeekPlanState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.secondaryERP),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: AppColors.secondaryERP,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, size: 16),
                        SizedBox(width: 4),
                        Text('Quay lại'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: state.isSubmitting ? null : () => _onUpdate(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: state.isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Cập nhật',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goToStep(int step) {
    final total = _totalSteps(bloc.state);
    if (step >= 0 && step < total) {
      bloc.add(WeekPlanEvent.changeStep(step));
      setState(() => _currentStep = step);
    }
  }

  String? _formatHoursInt(double? hours) {
    if (hours == null) return null;
    if (hours == hours.toInt()) return hours.toInt().toString();
    return hours.toString();
  }

  void _onUpdate() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    formState.save();
    if (!formState.validate()) return;

    final vals = formState.value;

    bloc.add(WeekPlanEvent.updateContentTaskName(vals['task_name']?.toString() ?? ''));
    bloc.add(WeekPlanEvent.updateContentDescription(vals['description']?.toString() ?? ''));
    bloc.add(WeekPlanEvent.updateContentResult(vals['expected_result']?.toString() ?? ''));

    // Trigger update — createTask với ID của task hiện tại
    bloc.add(const WeekPlanEvent.createTask());
  }
}

//---(_Reason Solution Card)---//

class _ReasonSolutionCard extends StatefulWidget {
  const _ReasonSolutionCard({
    required this.initialValue,
    required this.onChanged,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<_ReasonSolutionCard> createState() => _ReasonSolutionCardState();
}

class _ReasonSolutionCardState extends State<_ReasonSolutionCard> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFD92B46);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        boxShadow: [
          BoxShadow(
            color: borderColor.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: borderColor.withValues(alpha: 0.06),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(16)),
            ),
            child: const Text(
              'Sự cố / Khắc phục',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: borderColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              decoration: BoxDecoration(
                color: borderColor.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor.withValues(alpha: 0.2), width: 1.2),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 6,
                minLines: 4,
                style: const TextStyle(fontSize: 13, height: 1.5),
                decoration: InputDecoration(
                  hintText: 'Mô tả sự cố và phương án khắc phục...',
                  hintStyle: TextStyle(fontSize: 12, color: AppColors.hintText, fontStyle: FontStyle.italic),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12),
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
