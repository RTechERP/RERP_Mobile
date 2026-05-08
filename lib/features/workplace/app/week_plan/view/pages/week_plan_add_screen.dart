import 'package:easy_stepper/easy_stepper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/form_date_time_picker.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../../../../../../../../common/helpers/multi_select_employee_sheet.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_tab_enum.dart';
import '../widgets/index.dart';

/// Data truyền từ WeekPlanScreen qua route extra.
/// Chứa projects/taskTypes/employees đã fetch sẵn để dùng ngay trên màn add.
class WeekPlanAddExtra {
  const WeekPlanAddExtra({
    required this.projects,
    required this.taskTypes,
    required this.employees,
    this.projectTypes = const [],
  });

  final List<ProjectTaskItem> projects;
  final List<TaskTypeItem> taskTypes;
  final List<EmployeeTaskItem> employees;
  final List<ProjectTypeItem> projectTypes;
}

class WeekPlanAddScreen extends StatefulWidget {
  const WeekPlanAddScreen({super.key, this.extra});

  final Object? extra;

  @override
  State<WeekPlanAddScreen> createState() => _WeekPlanAddScreenState();
}

class _WeekPlanAddScreenState
    extends
        BaseState<WeekPlanAddScreen, WeekPlanEvent, WeekPlanState, WeekPlanBloc> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // Merge data từ route extra (được pass từ FAB WeekPlanScreen).
      final extra = widget.extra;
      if (extra is WeekPlanAddExtra) {
        if (extra.projects.isNotEmpty) {
          bloc.add(const WeekPlanEvent.fetchProjects());
        }
        if (extra.taskTypes.isNotEmpty) {
          bloc.add(const WeekPlanEvent.fetchTaskTypes());
        }
        if (extra.projectTypes.isNotEmpty) {
          bloc.add(const WeekPlanEvent.fetchProjectTypes());
        }
        if (extra.employees.isNotEmpty) {
          bloc.add(const WeekPlanEvent.fetchEmployees());
        }
      }

      bloc.add(const WeekPlanEvent.initAddScreen());
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
          title: const Text('Tạo công việc'),
          onBackTap: () => context.pop(),
        ),
        body: Column(
          children: [
            SizedBox(height: 100, child: _buildStepper()),
            Expanded(
              child: FormBuilder(key: _formKey, child: _buildStepContent()),
            ),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  //===============================================================
  // STEP 1: STEPPER
  //===============================================================
  Widget _buildStepper() {
    const steps = WeekPlanAddStep.values;
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(10),
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
        steps: steps.map((s) {
          return EasyStep(
            icon: Icon(_stepIcon(s), size: 16),
            customTitle: Text(
              s.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: _currentStep == s.step
                    ? AppColors.primaryERP
                    : AppColors.hintText,
                fontWeight: _currentStep == s.step
                    ? FontWeight.w700
                    : FontWeight.w400,
              ),
            ),
          );
        }).toList(),
        onStepReached: _goToStep,
      ),
    );
  }

  IconData _stepIcon(WeekPlanAddStep step) {
    switch (step) {
      case WeekPlanAddStep.projectInfo:
        return Icons.folder_outlined;
      case WeekPlanAddStep.content:
        return Icons.assignment_outlined;
      case WeekPlanAddStep.subTask:
        return Icons.playlist_add_check_outlined;
      case WeekPlanAddStep.checklist:
        return Icons.checklist_outlined;
      case WeekPlanAddStep.attachment:
        return Icons.attach_file_outlined;
      case WeekPlanAddStep.incident:
        return Icons.warning_outlined;
    }
  }

  //===============================================================
  // STEP 2: STEP CONTENT
  //===============================================================
  Widget _buildStepContent() {
    return BlocBuilder<WeekPlanBloc, WeekPlanState>(
      builder: (context, state) {
        return switch (WeekPlanAddStep.values[_currentStep]) {
          WeekPlanAddStep.projectInfo => _buildProjectInfoStep(state),
          WeekPlanAddStep.content => _buildContentStep(state),
          WeekPlanAddStep.subTask => _buildSubTaskStep(state),
          WeekPlanAddStep.checklist => _buildChecklistStep(state),
          WeekPlanAddStep.attachment => _buildAttachmentStep(state),
          WeekPlanAddStep.incident => _buildIncidentStep(state),
        };
      },
    );
  }

  //===============================================================
  // STEP WIDGETS
  //===============================================================

  //---(_Step: Project Info)---//
  Widget _buildProjectInfoStep(WeekPlanState state) {
    // Trigger fetch nếu thiếu data — tránh bottom sheet trống.
    if (state.projects.isEmpty) {
      bloc.add(const WeekPlanEvent.fetchProjects());
    }
    if (state.taskTypes.isEmpty) {
      bloc.add(const WeekPlanEvent.fetchTaskTypes());
    }
    if (state.projectTypes.isEmpty) {
      bloc.add(const WeekPlanEvent.fetchProjectTypes());
    }
    if (state.employees.isEmpty) {
      bloc.add(const WeekPlanEvent.fetchEmployees());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

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

          FormInputField(
            nameForm: 'task_name',
            nameTextField: 'task_name_field',
            label: 'Tên công việc',
            icon: Icons.assignment_outlined,
            isRequired: true,
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
          WeekPlanTapCard(
            label: 'Công việc cha',
            value: state.headerParentTaskName,
            icon: Icons.account_tree_outlined,
            onTap: () => _showParentTaskPicker(
              context,
              state,
            ),
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

          FormCard(
            title: 'Lịch trình dự kiến',
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormDateTimePicker(
                        nameForm: 'plan_start_date',
                        nameTimePicker: 'plan_start_date_picker',
                        label: 'Bắt đầu',
                        icon: Icons.calendar_today,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
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
                        label: 'Kết thúc',
                        icon: Icons.event,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
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
          ),
          const SizedBox(height: 12),
          FormCard(
            title: 'Thực tế thực hiện',
            child: Row(
              children: [
                Expanded(
                  child: FormDateTimePicker(
                    nameForm: 'actual_start_date',
                    nameTimePicker: 'actual_start_date_picker',
                    label: 'Bắt đầu',
                    icon: Icons.play_arrow_outlined,
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
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
                    label: 'Kết thúc',
                    icon: Icons.stop_outlined,
                    inputType: InputType.date,
                    format: DateFormat('dd/MM/yyyy'),
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
          ),

        ],
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
            options: [
              WeekPlanChoiceOption(label: 'Cá nhân', value: true),
              WeekPlanChoiceOption(label: 'Phê duyệt', value: false),
            ],
            selected: state.headerIsPersonalTask,
            onChanged: (v) =>
                bloc.add(WeekPlanEvent.updateHeaderPersonalTask(v)),
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
            onChanged: (v) => bloc.add(
              WeekPlanEvent.updateHeaderStatus(
                statusId: v,
                statusName: WeekPlanStatusCard.labels[v],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //---(_Step: SubTask)---//
  Future<void> _showSubTaskSheet(int? editIndex, WeekPlanState state) async {
    final subTask = editIndex != null ? state.subTasks[editIndex] : null;

    final result = await WeekPlanSubTaskBottomSheet.show(
      context: context,
      subTask: subTask,
      taskTypes: state.taskTypes,
      projectTypes: state.projectTypes,
      employees: state.employees,
      defaultComplexity: state.headerComplexity,
      defaultWorkType: state.headerWorkType,
      defaultWorkTypeName: state.headerWorkTypeName,
      defaultTaskCategory: state.headerTaskCategory,
      defaultTaskCategoryName: state.headerTaskCategoryName,
    );

    if (result == null) return;

    if (editIndex != null) {
      bloc.add(WeekPlanEvent.updateSubTask(editIndex, result));
    } else {
      bloc.add(WeekPlanEvent.addSubTaskWithData(result));
    }
  }

  Widget _buildSubTaskStep(WeekPlanState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          // Header + button
          Row(
            children: [
              Text(
                'Danh sách công việc con',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              if (state.subTasks.isNotEmpty) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${state.subTasks.length}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showSubTaskSheet(null, state),
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Thêm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Empty state
          if (state.subTasks.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.playlist_add,
                      size: 48, color: AppColors.hintText),
                  const SizedBox(height: 8),
                  Text(
                    'Chưa có công việc con nào',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bấm "Thêm" để tạo công việc con',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.hintText,
                    ),
                  ),
                ],
              ),
            ),

          // List cards
          ...List.generate(state.subTasks.length, (i) {
            return WeekPlanSubTaskCard(
              key: ValueKey(state.subTasks[i].id ?? i),
              index: i,
              subTask: state.subTasks[i],
              onTap: () => _showSubTaskSheet(i, state),
              onDelete: () => bloc.add(WeekPlanEvent.removeSubTask(i)),
            );
          }),
        ],
      ),
    );
  }

  //---(_Step: Checklist)---//
  Widget _buildChecklistStep(WeekPlanState state) {
    final total = state.checklistItems.length;
    final done = total > 0
        ? state.checklistDone.where((d) => d).length
        : 0;
    final progress = total > 0 ? done / total : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          // Progress indicator
          if (state.checklistItems.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiến độ hoàn thành',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.heading,
                        ),
                      ),
                      Text(
                        '$done / $total',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: progress >= 1.0
                              ? AppColors.stateSuccessColor
                              : AppColors.primaryERP,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: AppColors.bgCard,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress >= 1.0
                            ? AppColors.stateSuccessColor
                            : AppColors.primaryERP,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child:                       Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: progress >= 1.0
                              ? AppColors.stateSuccessColor
                              : AppColors.gray,
                        ),
                      ),
                  ),
                ],
              ),
            ),

          // Header + button
          Row(
            children: [
              Text(
                'Danh sách checklist',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showAddChecklistDialog(context),
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Thêm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Empty state
          if (state.checklistItems.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.checklist, size: 48, color: AppColors.hintText),
                  const SizedBox(height: 8),
                  Text(
                    'Chưa có checklist nào',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bấm "Thêm" để tạo checklist',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.hintText,
                    ),
                  ),
                ],
              ),
            ),

          // List
          ...List.generate(state.checklistItems.length, (i) {
            return WeekPlanChecklistItem(
              index: i,
              content: state.checklistItems[i],
              isDone: i < state.checklistDone.length && state.checklistDone[i],
              onToggle: () {
                bloc.add(WeekPlanEvent.toggleChecklistDone(i));
              },
              onEdit: () => _showEditChecklistDialog(context, i, state.checklistItems[i]),
              onDelete: () {
                bloc.add(WeekPlanEvent.removeChecklistItem(i));
              },
            );
          }),
        ],
      ),
    );
  }

  void _showAddChecklistDialog(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm checklist'),
        content: FormBuilder(
          key: formKey,
          child: FormInputField(
            nameForm: 'checklist_content',
            nameTextField: 'checklist_content_field',
            label: 'Nội dung',
            icon: Icons.check_box_outlined,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập nội dung',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                final vals = formKey.currentState?.value;
                final text = vals?['checklist_content']?.toString().trim() ?? '';
                bloc.add(WeekPlanEvent.addChecklistItem(text));
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              foregroundColor: Colors.white,
            ),
            child: const Text('Xác nhận'),
          ),
        ],
      ),
    );
  }

  void _showEditChecklistDialog(BuildContext context, int index, String current) {
    final formKey = GlobalKey<FormBuilderState>();

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
            initialValue: current,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập nội dung',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                final vals = formKey.currentState?.value;
                final text = vals?['checklist_content']?.toString().trim() ?? '';
                bloc.add(WeekPlanEvent.updateChecklistItem(index, text));
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha:0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
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
          // Header + button
          Row(
            children: [
              Text(
                'Tệp đính kèm',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _pickFiles(context),
                icon: const Icon(Icons.attach_file, size: 16),
                label: const Text('Chọn tệp'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Empty state
          if (state.attachments.isEmpty)
            _buildEmptyState(
              icon: Icons.attachment,
              title: 'Chưa có tệp đính kèm',
              subtitle: 'Bấm "Chọn tệp" để thêm đính kèm',
            ),

          // List
          ...List.generate(state.attachments.length, (i) {
            return WeekPlanAttachmentCard(
              index: i,
              attachment: state.attachments[i],
              onDelete: () {
                bloc.add(WeekPlanEvent.removeAttachment(i));
              },
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
          // Header + button
          Row(
            children: [
              Text(
                'Link đính kèm',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => _showAddLinkDialog(context),
                icon: const Icon(Icons.link, size: 16),
                label: const Text('Thêm Link'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryERP,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Empty state
          if (state.links.isEmpty)
            _buildEmptyState(
              icon: Icons.link_off,
              title: 'Chưa có link đính kèm',
              subtitle: 'Bấm "Thêm Link" để gắn liên kết',
            ),

          // List
          ...List.generate(state.links.length, (i) {
            return WeekPlanLinkCard(
              index: i,
              link: state.links[i],
              onDelete: () {
                bloc.add(WeekPlanEvent.removeLink(i));
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(icon, size: 48, color: AppColors.hintText),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.hintText,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.hintText,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFiles(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null && result.files.isNotEmpty) {
      for (final file in result.files) {
        if (file.path != null) {
          bloc.add(WeekPlanEvent.addAttachment(
            WeekPlanAttachmentItem(
              id: 0,
              fileName: file.name,
              filePath: file.path,
              fileSize: file.size,
            ),
          ));
        }
      }
    }
  }

  void _showAddLinkDialog(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thêm Link'),
        content: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormInputField(
                nameForm: 'link_name',
                nameTextField: 'link_name_field',
                label: 'Tên Link',
                icon: Icons.text_fields,
              ),
              const SizedBox(height: 12),
              FormInputField(
                nameForm: 'link_url',
                nameTextField: 'link_url_field',
                label: 'URL',
                icon: Icons.link,
                isRequired: true,
                keyboardType: TextInputType.url,
                validator: FormBuilderValidators.required(
                  errorText: 'Vui lòng nhập URL',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                final vals = formKey.currentState?.value;
                final name = vals?['link_name']?.toString().trim() ?? '';
                final url = vals?['link_url']?.toString().trim() ?? '';
                bloc.add(WeekPlanEvent.addLink(
                  WeekPlanLinkItem(
                    fileName: name,
                    filePath: url,
                  ),
                ));
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryERP,
              foregroundColor: Colors.white,
            ),
            child: const Text('Xác nhận'),
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
        children: [
          // Header + button
          Row(
            children: [
              Text(
                'Danh sách phát sinh',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () => bloc.add(const WeekPlanEvent.addIncident()),
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Thêm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.warning,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Empty state
          if (state.incidents.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.warning_amber_outlined,
                      size: 48, color: AppColors.hintText),
                  const SizedBox(height: 8),
                  Text(
                    'Chưa có sự phát sinh nào',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bấm "Thêm" để ghi nhận phát sinh',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.hintText,
                    ),
                  ),
                ],
              ),
            ),

          // List
          ...List.generate(state.incidents.length, (i) {
            return WeekPlanIncidentForm(
              key: ValueKey(state.incidents[i].id ?? i),
              index: i,
              incident: state.incidents[i],
              onChanged: (updated) {
                bloc.add(WeekPlanEvent.updateIncident(i, updated));
              },
              onDelete: () {
                bloc.add(WeekPlanEvent.removeIncident(i));
              },
            );
          }),
        ],
      ),
    );
  }

  Future<void> _showParentTaskPicker(
    BuildContext context, WeekPlanState state,
  ) async {
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
    final isLastStep = _currentStep == WeekPlanAddStep.values.length - 1;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () {
                            if (isLastStep) {
                              _goToStep(_currentStep - 1);
                            } else {
                              _saveFormAndCreate();
                            }
                          },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.secondaryERP),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: AppColors.secondaryERP,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isLastStep ? Icons.arrow_back : Icons.save_outlined,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(isLastStep ? 'Quay lại' : 'Lưu'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () => isLastStep
                            ? _saveFormAndCreate()
                            : _goToStep(_currentStep + 1),
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            isLastStep ? 'Lưu' : 'Tiếp theo',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
    if (step >= 0 && step < WeekPlanAddStep.values.length) {
      bloc.add(WeekPlanEvent.changeStep(step));
      setState(() => _currentStep = step);
    }
  }

  void _saveFormAndCreate() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    formState.save();
    if (!formState.validate()) return;

    final vals = formState.value;

    // Step 1 fields
    bloc.add(WeekPlanEvent.updateContentTaskName(
      vals['task_name']?.toString() ?? '',
    ));

    final hoursStr = vals['expected_hours']?.toString() ?? '';
    final hours = double.tryParse(hoursStr);
    bloc.add(WeekPlanEvent.updateHeaderTimeEstimate(hours));

    // Step 2 fields
    bloc.add(WeekPlanEvent.updateContentDescription(
      vals['description']?.toString() ?? '',
    ));
    bloc.add(WeekPlanEvent.updateContentResult(
      vals['expected_result']?.toString() ?? '',
    ));

    // Trigger create
    bloc.add(const WeekPlanEvent.createTask());
  }
}
