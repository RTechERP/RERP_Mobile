import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/week_plan_model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'index.dart';

/// Widget form cho một slip công việc con.
/// Quản lý internal state — gọi [onChanged] khi có thay đổi.
class WeekPlanSubTaskForm extends StatefulWidget {
  const WeekPlanSubTaskForm({
    super.key,
    required this.index,
    required this.subTask,
    required this.taskTypes,
    required this.projectTypes,
    required this.employees,
    required this.onChanged,
    required this.onDelete,
    this.initiallyExpanded = true,
  });

  final int index;
  final WeekPlanSubTaskItem subTask;
  final List<TaskTypeItem> taskTypes;
  final List<ProjectTypeItem> projectTypes;
  final List<EmployeeTaskItem> employees;
  final ValueChanged<WeekPlanSubTaskItem> onChanged;
  final VoidCallback onDelete;
  final bool initiallyExpanded;

  @override
  State<WeekPlanSubTaskForm> createState() => _WeekPlanSubTaskFormState();
}

class _WeekPlanSubTaskFormState extends State<WeekPlanSubTaskForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  late TextEditingController _contentController;
  bool _isExpanded = true;

  // Local state — cập nhật ngay khi user thay đổi
  DateTime? _startDate;
  DateTime? _endDate;
  int? _assigneeId;
  String? _assigneeName;
  int? _assignerId;
  String? _assignerName;
  int? _taskCategoryId;
  String? _taskCategoryName;
  int? _workTypeId;
  String? _workTypeName;
  int _complexity = 1;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _initFromSubTask();
    _contentController = TextEditingController(text: widget.subTask.content);
  }

  void _initFromSubTask() {
    _startDate = widget.subTask.startDate;
    _endDate = widget.subTask.endDate;
    _assigneeId = widget.subTask.assigneeId;
    _assigneeName = widget.subTask.assigneeName;
    _assignerId = widget.subTask.assignerId;
    _assignerName = widget.subTask.assignerName;
    _taskCategoryId = widget.subTask.taskCategory;
    _taskCategoryName = widget.subTask.taskCategoryName;
    _workTypeId = widget.subTask.workType;
    _workTypeName = widget.subTask.workTypeName;
    _complexity = widget.subTask.complexity ?? 1;
  }

  void _notifyChange() {
    widget.onChanged(WeekPlanSubTaskItem(
      id: widget.subTask.id,
      content: _contentController.text,
      startDate: _startDate,
      endDate: _endDate,
      assigneeId: _assigneeId,
      assigneeName: _assigneeName,
      assignerId: _assignerId,
      assignerName: _assignerName,
      complexity: _complexity,
      workType: _workTypeId,
      workTypeName: _workTypeName,
      taskCategory: _taskCategoryId,
      taskCategoryName: _taskCategoryName,
    ));
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryERP,
              brightness: Brightness.light,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        // Nếu endDate < startDate → auto đẩy endDate lên
        if (_endDate != null && _endDate!.isBefore(picked)) {
          _endDate = picked;
        }
      } else {
        _endDate = picked;
      }
    });
    _notifyChange();
  }

  Future<void> _pickAssignee() async {
    await openSelectBottomSheet<EmployeeTaskItem>(
      context: context,
      title: 'Chọn người thực hiện',
      items: widget.employees,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}',
      initialSelectedItem: _assigneeId != null
          ? widget.employees
              .cast<EmployeeTaskItem?>()
              .firstWhere((e) => e?.id == _assigneeId, orElse: () => null)
          : null,
      onSelected: (e) {
        setState(() {
          _assigneeId = e.id;
          _assigneeName = '${e.code ?? ''} - ${e.fullName ?? ''}';
        });
        _notifyChange();
      },
    );
  }

  Future<void> _pickAssigner() async {
    await openSelectBottomSheet<EmployeeTaskItem>(
      context: context,
      title: 'Chọn người giao việc',
      items: widget.employees,
      displayText: (e) => '${e.code ?? ''} - ${e.fullName ?? ''}',
      initialSelectedItem: _assignerId != null
          ? widget.employees
              .cast<EmployeeTaskItem?>()
              .firstWhere((e) => e?.id == _assignerId, orElse: () => null)
          : null,
      onSelected: (e) {
        setState(() {
          _assignerId = e.id;
          _assignerName = '${e.code ?? ''} - ${e.fullName ?? ''}';
        });
        _notifyChange();
      },
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header: slip number + toggle + delete
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha:0.08),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    AnimatedRotation(
                      turns: _isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(Icons.chevron_right,
                          size: 20, color: AppColors.primaryERP),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.article_outlined,
                        size: 16, color: AppColors.primaryERP),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Công việc con ${widget.index + 1}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: Icon(Icons.delete_outline,
                          size: 20, color: AppColors.alert),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                      tooltip: 'Xoá công việc con',
                    ),
                  ],
                ),
              ),
            ),

            // Body: expandable
            AnimatedCrossFade(
              firstChild: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Nội dung công việc
                    FormInputField(
                      nameForm: 'subtask_content_${widget.index}',
                      nameTextField: 'subtask_content_field_${widget.index}',
                      label: 'Nội dung công việc',
                      icon: Icons.assignment_outlined,
                      controller: _contentController,
                      onChanged: (_) => _notifyChange(),
                      isRequired: true,
                      validator: FormBuilderValidators.required(
                        errorText: 'Vui lòng nhập tên công việc',
                      ),
                      autoExpand: true,
                    ),

                    const SizedBox(height: 10),

                    // Dự kiến bắt đầu - Dự kiến kết thúc
                    Row(
                      children: [
                        Expanded(
                          child: _DatePickerField(
                            label: 'Dự kiến bắt đầu',
                            icon: Icons.play_arrow_outlined,
                            value: _startDate,
                            onTap: () => _pickDate(isStart: true),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _DatePickerField(
                            label: 'Dự kiến kết thúc',
                            icon: Icons.stop_outlined,
                            value: _endDate,
                            onTap: () => _pickDate(isStart: false),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Người thực hiện
                    _TapField(
                      label: 'Người thực hiện',
                      icon: Icons.person_outline,
                      value: _assigneeName,
                      onTap: _pickAssignee,
                    ),

                    const SizedBox(height: 10),

                    // Người giao việc
                    _TapField(
                      label: 'Người giao việc',
                      icon: Icons.assignment_ind_outlined,
                      value: _assignerName,
                      onTap: _pickAssigner,
                    ),

                    const SizedBox(height: 10),

                    // Hạng mục + Loại công việc
                    Row(
                      children: [
                        Expanded(
                          child: WeekPlanProjectTypeCard(
                            selectedId: _taskCategoryId,
                            projectTypes: widget.projectTypes,
                            onChanged: (pt) {
                              setState(() {
                                _taskCategoryId = pt.id;
                                _taskCategoryName = pt.projectTypeName;
                              });
                              _notifyChange();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: WeekPlanTaskTypeCard(
                            selectedId: _workTypeId,
                            taskTypes: widget.taskTypes,
                            onChanged: (tt) {
                              setState(() {
                                _workTypeId = tt.id;
                                _workTypeName = tt.typeName;
                              });
                              _notifyChange();
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Độ phức tạp
                    WeekPlanComplexityRow(
                      selected: _complexity,
                      onChanged: (v) {
                        setState(() => _complexity = v);
                        _notifyChange();
                      },
                    ),
                  ],
                ),
              ),
              secondChild: const SizedBox.shrink(),
              crossFadeState:
                  _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}

//---(_DatePickerField)---//
class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.icon,
    required this.value,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final DateTime? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.hintText),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (value != null)
                    Text(
                      DateFormat('dd/MM/yyyy').format(value!),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.heading,
                      ),
                    )
                  else
                    Text(
                      'Chọn ngày',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.hintText,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//---(_TapField)---//
class _TapField extends StatelessWidget {
  const _TapField({
    required this.label,
    required this.icon,
    required this.value,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.hintText),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    value ?? 'Chọn',
                    style: TextStyle(
                      fontSize: 13,
                      color: value != null ? AppColors.heading : AppColors.hintText,
                      fontWeight: value != null ? FontWeight.w600 : FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down, size: 20, color: AppColors.hintText),
          ],
        ),
      ),
    );
  }
}
