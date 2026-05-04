import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';
import '../week_plan_tab_enum.dart';
import '../widgets/index.dart';

/// Data truyền từ WeekPlanScreen qua route extra.
/// Chứa projects/taskTypes đã fetch sẵn để dùng ngay trên màn add.
class WeekPlanAddExtra {
  const WeekPlanAddExtra({
    required this.projects,
    required this.taskTypes,
  });

  final List<ProjectTaskItem> projects;
  final List<TaskTypeItem> taskTypes;
}

class WeekPlanAddScreen extends StatefulWidget {
  const WeekPlanAddScreen({super.key});

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
      bloc.add(WeekPlanEvent.initAddScreen());
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
          WeekPlanTapCard(
            label: 'Công việc cha',
            value: state.headerParentTaskName,
            icon: Icons.account_tree_outlined,
            onTap: () => _stub('Chọn công việc cha'),
          ),
          const SizedBox(height: 10),
          WeekPlanMultiSelectChips<WeekPlanEmployee>(
            label: 'Người thực hiện',
            icon: Icons.people_outline,
            selected: state.selectedAssignees,
            onAdd: () => _stub('Chọn người thực hiện'),
            onRemove: (id) => bloc.add(WeekPlanEvent.removeAssignee(id)),
            isEmployee: true,
          ),
          const SizedBox(height: 10),
          WeekPlanTapCard(
            label: 'Người giao việc',
            value: state.headerAssignerName,
            icon: Icons.assignment_ind_outlined,
            onTap: () => _stub('Chọn người giao việc'),
          ),
          const SizedBox(height: 10),
          WeekPlanMultiSelectChips<WeekPlanEmployee>(
            label: 'Người liên quan',
            icon: Icons.group_outlined,
            selected: state.selectedRelatedPersons,
            onAdd: () => _stub('Chọn người liên quan'),
            onRemove: (id) => bloc.add(WeekPlanEvent.removeRelatedPerson(id)),
            isEmployee: true,
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
                child: WeekPlanCategoryCard(
                  selectedId: state.headerTaskCategory,
                  onChanged: (categoryId) {
                    final name = WeekPlanCategoryCard.categories
                        .firstWhere((c) => c.$1 == categoryId)
                        .$2;
                    bloc.add(WeekPlanEvent.updateHeaderTaskCategory(
                      categoryId: categoryId,
                      categoryName: name,
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

  //---(_Step: Content)---//
  Widget _buildContentStep(WeekPlanState state) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text('Step 1: Nội dung — sẽ làm tiếp'),
    );
  }

  //---(_Step: SubTask)---//
  Widget _buildSubTaskStep(WeekPlanState state) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text('Step 4: Công việc con — sẽ làm tiếp'),
    );
  }

  //---(_Step: Checklist)---//
  Widget _buildChecklistStep(WeekPlanState state) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text('Step 5: Checklist — sẽ làm tiếp'),
    );
  }

  //---(_Step: Attachment)---//
  Widget _buildAttachmentStep(WeekPlanState state) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text('Step 6: Đính kèm — sẽ làm tiếp'),
    );
  }

  //---(_Step: Incident)---//
  Widget _buildIncidentStep(WeekPlanState state) {
    return const SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Text('Step 7: Phát sinh — sẽ làm tiếp'),
    );
  }

  void _stub(String title) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Text(
              'Tính năng đang phát triển',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

//===============================================================
// BOTTOM ACTIONS
//===============================================================
  Widget _buildBottomActions() {
    return BlocBuilder<WeekPlanBloc, WeekPlanState>(
      builder: (context, state) {
        final isLastStep = _currentStep == WeekPlanAddStep.values.length - 1;
        final isFirstStep = _currentStep == 0;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                if (!isFirstStep)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _goToStep(_currentStep - 1),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.secondaryERP),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios, size: 16),
                          SizedBox(width: 4),
                          Text('Quay lại'),
                        ],
                      ),
                    ),
                  ),
                if (!isFirstStep) const SizedBox(width: 12),
                Expanded(
                  flex: isFirstStep ? 1 : 1,
                  child: ElevatedButton(
                    onPressed: state.isSubmitting
                        ? null
                        : () => isLastStep
                              ? bloc.add(const WeekPlanEvent.createTask())
                              : _goToStep(_currentStep + 1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLastStep
                          ? AppColors.stateSuccessColor
                          : AppColors.primaryERP,
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
                            isLastStep ? 'Tạo công việc' : 'Tiếp theo',
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
}
