import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../base/network/errors/extension.dart';
import '../week_plan_tab_enum.dart';
import '../bloc/week_plan_bloc.dart';

class WeekPlanAddScreen extends StatefulWidget {
  const WeekPlanAddScreen({super.key});

  @override
  State<WeekPlanAddScreen> createState() => _WeekPlanAddScreenState();
}

class _WeekPlanAddScreenState
    extends
        BaseState<WeekPlanAddScreen, WeekPlanEvent, WeekPlanState, WeekPlanBloc>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _autoValidate = false;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: WeekPlanAddTab.values.length,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const WeekPlanEvent.clearSubmitState());
      bloc.add(const WeekPlanEvent.initAdd());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Validate và chuyển tab tiếp theo.
  void _nextTab() {
    if (!_validateCurrentTab()) return;
    if (_tabController.index < WeekPlanAddTab.values.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  /// Validate tab hiện tại trước khi chuyển.
  bool _validateCurrentTab() {
    final currentTab = WeekPlanAddTab.values[_tabController.index];
    final fieldsToValidate = _fieldsOf(currentTab);
    _formKey.currentState?.save();

    var isValid = true;
    for (final field in fieldsToValidate) {
      final value = _formKey.currentState?.fields[field]?.value;
      if (_isFieldRequired(currentTab, field) && _isEmpty(value)) {
        isValid = false;
        _formKey.currentState?.fields[field]?.validate();
      }
    }

    if (!isValid && !_autoValidate) {
      setState(() => _autoValidate = true);
      context.showMessage(
        'Vui lòng điền đầy đủ thông tin bắt buộc',
        type: SnackBarType.error,
      );
    }
    return isValid;
  }

  bool _isFieldRequired(WeekPlanAddTab tab, String field) {
    return _requiredFields[tab]?.contains(field) ?? false;
  }

  bool _isEmpty(dynamic value) {
    if (value == null) return true;
    if (value is String && value.trim().isEmpty) return true;
    return false;
  }

  List<dynamic> _fieldsOf(WeekPlanAddTab tab) {
    return _tabFields[tab] ?? [];
  }

  static const _requiredFields = {
    WeekPlanAddTab.content: [
      'week_plan_task_name',
      'week_plan_assignee',
      'week_plan_start_date',
      'week_plan_end_date',
      'week_plan_deadline',
    ],
    WeekPlanAddTab.assignee: [],
    WeekPlanAddTab.related: [],
    WeekPlanAddTab.subTask: [],
    WeekPlanAddTab.checklist: [],
  };

  static const _tabFields = {
    WeekPlanAddTab.content: [
      'week_plan_task_name',
      'week_plan_assignee',
      'week_plan_start_date',
      'week_plan_end_date',
      'week_plan_deadline',
      'week_plan_content',
      'week_plan_description',
      'week_plan_result',
    ],
    WeekPlanAddTab.assignee: ['week_plan_assignee'],
    WeekPlanAddTab.related: [],
    WeekPlanAddTab.subTask: [],
    WeekPlanAddTab.checklist: [],
  };

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
          context.showMessage(state.message!, type: SnackBarType.error);
        }
        if ((state.message ?? '').isNotEmpty && state.submitSuccess) {
          context.showMessage(state.message!, type: SnackBarType.success);
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
            _buildHeaderForm(),
            _buildStepperTabBar(),
            Expanded(
              child: BlocBuilder<WeekPlanBloc, WeekPlanState>(
                builder: (context, state) {
                  return FormBuilder(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    onChanged: () => setState(() {}),
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: WeekPlanAddTab.values.map((tab) {
                        return _buildTabContent(tab, state);
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  //---(HeaderForm)---//
  Widget _buildHeaderForm() {
    return BlocBuilder<WeekPlanBloc, WeekPlanState>(
      builder: (context, state) {
        return FormCard(
          title: 'Thông tin chung',
          collapsed: false,
          child: Column(
            children: [
              // Row: Dự án | CV cha | Việc cá nhân
              Row(
                children: [
                  Expanded(
                    child: _HeaderTapFieldCompact(
                      label: 'Dự án',
                      value: state.headerProjectName,
                      onTap: () => _showProjectBottomSheet(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _HeaderTapFieldCompact(
                      label: 'CV cha',
                      value: state.headerParentTaskName,
                      onTap: () => _showParentTaskBottomSheet(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _HeaderCheckboxCompact(
                    label: 'Việc cá nhân',
                    value: state.headerIsPersonalTask,
                    onChanged: (v) =>
                        bloc.add(WeekPlanEvent.updateHeaderPersonalTask(v)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Độ phức tạp
              _buildComplexityRow(state.headerComplexity),
              const SizedBox(height: 8),
              // Row: Hạng mục | Loại CV | Trạng thái
              Row(
                children: [
                  Expanded(
                    child: _HeaderTapFieldCompact(
                      label: 'Hạng mục',
                      value: state.headerTaskCategoryName,
                      onTap: () => _showTaskCategoryBottomSheet(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _HeaderTapFieldCompact(
                      label: 'Loại CV',
                      value: state.headerWorkTypeName,
                      onTap: () => _showWorkTypeBottomSheet(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _HeaderTapFieldCompact(
                      label: 'Trạng thái',
                      value: state.headerStatusName,
                      onTap: () => _showStatusBottomSheet(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComplexityRow(int selectedComplexity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bar_chart_outlined, size: 18, color: AppColors.hintText),
            const SizedBox(width: 8),
            Text(
              'Độ phức tạp',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (i) {
            final level = i + 1;
            final isSelected = selectedComplexity == level;
            return Expanded(
              child: GestureDetector(
                onTap: () =>
                    bloc.add(WeekPlanEvent.updateHeaderComplexity(level)),
                child: Container(
                  margin: EdgeInsets.only(right: i < 4 ? 6 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryERP : AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryERP
                          : AppColors.hintText,
                      width: 1.2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$level',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : AppColors.hintText,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  //---(BottomSheets)---//
  void _showProjectBottomSheet(BuildContext context) {
    // TODO: Mở bottom sheet chọn Dự án
    _showStubBottomSheet(context, 'Chọn Dự án');
  }

  void _showParentTaskBottomSheet(BuildContext context) {
    // TODO: Mở bottom sheet chọn Công việc cha
    _showStubBottomSheet(context, 'Chọn Công việc cha');
  }

  void _showTaskCategoryBottomSheet(BuildContext context) {
    // TODO: Mở bottom sheet chọn Loại hạng mục
    _showStubBottomSheet(context, 'Chọn Loại hạng mục');
  }

  void _showWorkTypeBottomSheet(BuildContext context) {
    // TODO: Mở bottom sheet chọn Loại công việc
    _showStubBottomSheet(context, 'Chọn Loại công việc');
  }

  void _showStatusBottomSheet(BuildContext context) {
    // TODO: Mở bottom sheet chọn Trạng thái
    _showStubBottomSheet(context, 'Chọn Trạng thái');
  }

  void _showStubBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Bottom sheet placeholder',
              style: TextStyle(color: AppColors.gray),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  //---(StepperTabBar)---//
  Widget _buildStepperTabBar() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        builder: (context, state) {
          return TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: AppColors.primaryERP,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primaryERP,
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            tabs: WeekPlanAddTab.values.map((tab) {
              return Tab(child: Text(tab.label));
            }).toList(),
          );
        },
      ),
    );
  }

  //---(TabContent)---//
  Widget _buildTabContent(WeekPlanAddTab tab, WeekPlanState state) {
    switch (tab) {
      case WeekPlanAddTab.content:
        return _buildContentTab();
      case WeekPlanAddTab.assignee:
        return _buildAssigneeTab();
      case WeekPlanAddTab.related:
        return _buildRelatedTab();
      case WeekPlanAddTab.subTask:
        return _buildSubTaskTab();
      case WeekPlanAddTab.checklist:
        return _buildChecklistTab();
      case WeekPlanAddTab.attach:
        return _buildAttachTab();
      case WeekPlanAddTab.problem:
        return _buildProblemTab();
    }
  }

  Widget _buildContentTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Tên công việc
          FormCard(
            child: Column(
              children: [
                FormInputField(
                  nameForm: 'week_plan_task_name',
                  nameTextField: 'week_plan_task_name_field',
                  label: 'Tên công việc',
                  icon: Icons.assignment_outlined,
                  isRequired: true,
                  autoExpand: true,
                  validator: (v) {
                    if (v == null || (v.trim().isEmpty)) {
                      return 'Vui lòng nhập tên công việc';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                // Row: Người thực hiện | Người giao việc
                Row(
                  children: [
                    Expanded(
                      child: FormInputField(
                        nameForm: 'week_plan_assignee',
                        nameTextField: 'week_plan_assignee_field',
                        label: 'Thực hiện',
                        icon: Icons.person_outlined,
                        isRequired: true,
                        readOnly: true,
                        validator: (v) {
                          if (v == null || (v.trim().isEmpty)) {
                            return 'Vui lòng chọn người thực hiện';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FormInputField(
                        nameForm: 'week_plan_assigner',
                        nameTextField: 'week_plan_assigner_field',
                        label: 'Giao việc',
                        icon: Icons.supervisor_account_outlined,
                        readOnly: true,
                        isRequired: true,
                        validator: (v) {
                          if (v == null || (v.trim().isEmpty)) {
                            return 'Vui lòng chọn người giao việc';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Row: BD dự kiến | KT dự kiến
                Row(
                  children: [
                    Expanded(
                      child: FormDateTimePicker(
                        nameForm: 'week_plan_start_date',
                        nameTimePicker: 'week_plan_start_date_picker',
                        label: 'BD dự kiến',
                        icon: Icons.play_arrow_outlined,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        validator: (v) {
                          if (v == null) return 'Vui lòng chọn ngày bắt đầu';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FormDateTimePicker(
                        nameForm: 'week_plan_end_date',
                        nameTimePicker: 'week_plan_end_date_picker',
                        label: 'KT dự kiến',
                        icon: Icons.stop_outlined,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        validator: (v) {
                          if (v == null) return 'Vui lòng chọn ngày kết thúc';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Row: BD thực tế | KT thực tế
                Row(
                  children: [
                    Expanded(
                      child: FormDateTimePicker(
                        nameForm: 'week_plan_actual_start',
                        nameTimePicker: 'week_plan_actual_start_picker',
                        label: 'BD thực tế',
                        icon: Icons.play_circle_outline,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FormDateTimePicker(
                        nameForm: 'week_plan_actual_end',
                        nameTimePicker: 'week_plan_actual_end_picker',
                        label: 'KT thực tế',
                        icon: Icons.stop_circle_outlined,
                        inputType: InputType.date,
                        format: DateFormat('dd/MM/yyyy'),
                        firstDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                FormDateTimePicker(
                  nameForm: 'week_plan_deadline',
                  nameTimePicker: 'week_plan_deadline_picker',
                  label: 'Deadline',
                  icon: Icons.timer_outlined,
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  validator: (v) {
                    if (v == null) return 'Vui lòng chọn deadline';
                    return null;
                  },
                ),
                const SizedBox(height: 8),

                FormInputField(
                  nameForm: 'week_plan_description',
                  nameTextField: 'week_plan_description_field',
                  label: 'Mô tả chi tiết',
                  icon: Icons.notes_outlined,
                  autoExpand: true,
                ),
                const SizedBox(height: 8),
                FormInputField(
                  nameForm: 'week_plan_result',
                  nameTextField: 'week_plan_result_field',
                  label: 'Kết quả công việc',
                  icon: Icons.check_circle_outline,
                  autoExpand: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssigneeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FormCard(
        title: 'Người thực hiện',
        child: FormInputField(
          nameForm: 'week_plan_assignee',
          nameTextField: 'week_plan_assignee_field',
          label: 'Người thực hiện',
          icon: Icons.person_outlined,
          isRequired: true,
          readOnly: true,
          validator: (v) {
            if (v == null || (v.trim().isEmpty)) {
              return 'Vui lòng chọn người thực hiện';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildRelatedTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _stubPlaceholder('Người liên quan'),
    );
  }

  Widget _buildSubTaskTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _stubPlaceholder('Công việc con'),
    );
  }

  Widget _buildChecklistTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _stubPlaceholder('Checklist'),
    );
  }

  Widget _buildAttachTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _stubPlaceholder('Đính kèm'),
    );
  }

  Widget _buildProblemTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: _stubPlaceholder('Phát sinh'),
    );
  }

  Widget _stubPlaceholder(String title) {
    return FormCard(
      title: title,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Chức năng đang phát triển',
            style: TextStyle(color: AppColors.gray),
          ),
        ),
      ),
    );
  }

  //---(BottomActions)---//
  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        builder: (context, state) {
          final isLastTab =
              _tabController.index == WeekPlanAddTab.values.length - 1;
          final isFirstTab = _tabController.index == 0;

          return Row(
            children: [
              if (!isFirstTab)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        _tabController.animateTo(_tabController.index - 1),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: AppColors.borderColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, size: 18),
                        SizedBox(width: 4),
                        Text('Quay lại'),
                      ],
                    ),
                  ),
                ),
              if (!isFirstTab) const SizedBox(width: 12),
              Expanded(
                flex: isFirstTab ? 2 : 1,
                child: ElevatedButton(
                  onPressed: state.isSubmitting
                      ? null
                      : () =>
                            isLastTab ? _onSubmit(context, state) : _nextTab(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLastTab
                        ? AppColors.stateSuccessColor
                        : AppColors.primaryERP,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(isLastTab ? 'Tạo công việc' : 'Tiếp tục'),
                            if (!isLastTab) ...[
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_forward, size: 18),
                            ],
                          ],
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //---(Submit)---//
  void _onSubmit(BuildContext context, WeekPlanState state) {
    FocusScope.of(context).unfocus();

    // Validate toàn bộ form trước khi submit
    if (!_formKey.currentState!.validate()) {
      if (!_autoValidate) setState(() => _autoValidate = true);
      context.showMessage(
        'Vui lòng điền đầy đủ thông tin bắt buộc',
        type: SnackBarType.error,
      );
      return;
    }

    _formKey.currentState!.save();
    final values = _formKey.currentState!.value;

    final taskName = '${values['week_plan_task_name'] ?? ''}'.trim();
    final projectName = '${values['week_plan_project'] ?? ''}'.trim();
    final content = '${values['week_plan_content'] ?? ''}'.trim();
    final description = '${values['week_plan_description'] ?? ''}'.trim();
    final startDate = values['week_plan_start_date'] as DateTime?;
    final endDate = values['week_plan_end_date'] as DateTime?;
    final deadline = values['week_plan_deadline'] as DateTime?;
    final priority = int.tryParse('${values['week_plan_priority'] ?? ''}') ?? 2;

    bloc.add(
      WeekPlanEvent.createTask(
        taskName: taskName,
        projectName: projectName,
        content: content,
        startDate: startDate!,
        endDate: endDate!,
        deadline: deadline!,
        priority: priority,
        description: description,
      ),
    );
  }
}

//---(_Header Widgets)---//

/// Widget tap field không icon — dùng cho row Dự án | CV cha | Hạng mục | Loại CV | Trạng thái.
class _HeaderTapFieldCompact extends StatelessWidget {
  const _HeaderTapFieldCompact({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = (value ?? '').trim().isNotEmpty;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.hintText, width: 1.2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    hasValue ? value! : '—',
                    style: TextStyle(
                      fontSize: 12,
                      color: hasValue
                          ? AppColors.textSecondaryColor
                          : AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: AppColors.hintText,
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget checkbox compact — nằm cùng row với Dự án | CV cha.
class _HeaderCheckboxCompact extends StatelessWidget {
  const _HeaderCheckboxCompact({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.hintText, width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: value ? AppColors.primaryERP : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: value ? AppColors.primaryERP : AppColors.hintText,
                  width: 1.5,
                ),
              ),
              child: value
                  ? const Icon(Icons.check, size: 11, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: value
                    ? AppColors.primaryERP
                    : AppColors.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
