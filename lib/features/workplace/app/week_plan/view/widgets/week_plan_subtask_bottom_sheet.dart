import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/week_plan_model.dart';
import 'week_plan_complexity_row.dart';
import 'week_plan_project_type_card.dart';
import 'week_plan_task_type_card.dart';

/// Bottom sheet thêm / chỉnh sửa công việc con.
/// Dùng chung cho cả thêm mới và sửa.
class WeekPlanSubTaskBottomSheet extends StatefulWidget {
  const WeekPlanSubTaskBottomSheet({
    super.key,
    this.subTask,
    required this.taskTypes,
    required this.projectTypes,
    required this.employees,
    required this.defaultComplexity,
    required this.defaultWorkType,
    required this.defaultWorkTypeName,
    required this.defaultTaskCategory,
    required this.defaultTaskCategoryName,
  });

  /// null = thêm mới, non-null = chỉnh sửa.
  final WeekPlanSubTaskItem? subTask;
  final List<TaskTypeItem> taskTypes;
  final List<ProjectTypeItem> projectTypes;
  final List<EmployeeTaskItem> employees;
  final int defaultComplexity;
  final int? defaultWorkType;
  final String? defaultWorkTypeName;
  final int? defaultTaskCategory;
  final String? defaultTaskCategoryName;

  static Future<WeekPlanSubTaskItem?> show({
    required BuildContext context,
    WeekPlanSubTaskItem? subTask,
    required List<TaskTypeItem> taskTypes,
    required List<ProjectTypeItem> projectTypes,
    required List<EmployeeTaskItem> employees,
    required int defaultComplexity,
    required int? defaultWorkType,
    required String? defaultWorkTypeName,
    required int? defaultTaskCategory,
    required String? defaultTaskCategoryName,
  }) {
    return showModalBottomSheet<WeekPlanSubTaskItem>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => WeekPlanSubTaskBottomSheet(
        subTask: subTask,
        taskTypes: taskTypes,
        projectTypes: projectTypes,
        employees: employees,
        defaultComplexity: defaultComplexity,
        defaultWorkType: defaultWorkType,
        defaultWorkTypeName: defaultWorkTypeName,
        defaultTaskCategory: defaultTaskCategory,
        defaultTaskCategoryName: defaultTaskCategoryName,
      ),
    );
  }

  @override
  State<WeekPlanSubTaskBottomSheet> createState() =>
      _WeekPlanSubTaskBottomSheetState();
}

class _WeekPlanSubTaskBottomSheetState extends State<WeekPlanSubTaskBottomSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  late TextEditingController _contentController;
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

  bool get _isEditing => widget.subTask != null;

  @override
  void initState() {
    super.initState();

    final s = widget.subTask;
    _contentController = TextEditingController(text: s?.content ?? '');
    _startDate = s?.startDate;
    _endDate = s?.endDate;
    _assigneeId = s?.assigneeId;
    _assigneeName = s?.assigneeName;
    _assignerId = s?.assignerId;
    _assignerName = s?.assignerName;
    _taskCategoryId = s?.taskCategory ?? widget.defaultTaskCategory;
    _taskCategoryName =
        s?.taskCategoryName ?? widget.defaultTaskCategoryName;
    _workTypeId = s?.workType ?? widget.defaultWorkType;
    _workTypeName = s?.workTypeName ?? widget.defaultWorkTypeName;
    _complexity = s?.complexity ?? widget.defaultComplexity;
    if (_complexity < 1) _complexity = 1;
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial =
        isStart ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now());
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
        if (_endDate != null && _endDate!.isBefore(picked)) {
          _endDate = picked;
        }
      } else {
        _endDate = picked;
      }
    });
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
      },
    );
  }

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final result = WeekPlanSubTaskItem(
      id: widget.subTask?.id,
      content: _contentController.text.trim(),
      startDate: _startDate,
      endDate: _endDate,
      assigneeId: _assigneeId,
      assigneeName: _assigneeName,
      assignerId: _assignerId,
      assignerName: _assignerName,
      taskCategory: _taskCategoryId,
      taskCategoryName: _taskCategoryName,
      workType: _workTypeId,
      workTypeName: _workTypeName,
      complexity: _complexity,
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(bottom: bottomPad),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
            child: Row(
              children: [
                Icon(Icons.playlist_add,
                    size: 20, color: AppColors.primaryERP),
                const SizedBox(width: 8),
                Text(
                  _isEditing ? 'Chỉnh sửa công việc con' : 'Thêm công việc con',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: AppColors.hintText),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: AppColors.borderColor),

          // Body
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    // Nội dung công việc
                    FormInputField(
                      nameForm: 'subtask_content',
                      nameTextField: 'subtask_content_field',
                      label: 'Nội dung công việc',
                      icon: Icons.assignment_outlined,
                      controller: _contentController,
                      isRequired: true,
                      validator: FormBuilderValidators.required(
                        errorText: 'Vui lòng nhập nội dung',
                      ),
                      autoExpand: true,
                      onChanged: (_) {},
                    ),

                    const SizedBox(height: 12),

                    // Ngày bắt đầu - kết thúc
                    Row(
                      children: [
                        Expanded(child: _DateField(
                          label: 'Bắt đầu',
                          icon: Icons.play_arrow_outlined,
                          value: _startDate,
                          onTap: () => _pickDate(isStart: true),
                        )),
                        const SizedBox(width: 8),
                        Expanded(child: _DateField(
                          label: 'Kết thúc',
                          icon: Icons.stop_outlined,
                          value: _endDate,
                          onTap: () => _pickDate(isStart: false),
                        )),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Người thực hiện - người giao
                    Row(
                      children: [
                        Expanded(child: _TapField(
                          label: 'Người thực hiện',
                          icon: Icons.person_outline,
                          value: _assigneeName,
                          onTap: _pickAssignee,
                        )),
                        const SizedBox(width: 8),
                        Expanded(child: _TapField(
                          label: 'Người giao việc',
                          icon: Icons.assignment_ind_outlined,
                          value: _assignerName,
                          onTap: _pickAssigner,
                        )),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Hạng mục - loại công việc
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
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: WeekPlanTaskTypeCard(
                            selectedId: _workTypeId,
                            taskTypes: widget.taskTypes,
                            onChanged: (tt) {
                              setState(() {
                                _workTypeId = tt.id;
                                _workTypeName = tt.typeName;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Độ phức tạp
                    WeekPlanComplexityRow(
                      selected: _complexity,
                      onChanged: (v) => setState(() => _complexity = v),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom action
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryERP,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  _isEditing ? 'Cập nhật' : 'Thêm vào danh sách',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//---(_DateField)---//
class _DateField extends StatelessWidget {
  const _DateField({
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
                mainAxisSize: MainAxisSize.min,
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
                    value != null
                        ? DateFormat('dd/MM/yyyy').format(value!)
                        : 'Chọn ngày',
                    style: TextStyle(
                      fontSize: 13,
                      color: value != null
                          ? AppColors.heading
                          : AppColors.hintText,
                      fontWeight:
                          value != null ? FontWeight.w600 : FontWeight.w400,
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
                mainAxisSize: MainAxisSize.min,
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
