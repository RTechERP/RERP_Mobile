import 'package:flutter/material.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

class WorkRequirementDetailMeta {
  const WorkRequirementDetailMeta({
    required this.index,
    required this.title,
    required this.icon,
  });

  final int index;
  final String title;
  final IconData icon;
}

class WorkRequirementDetailAccordion extends StatelessWidget {
  const   WorkRequirementDetailAccordion({
    super.key,
    required this.meta,
    required this.rowIndex,
    required this.isExpanded,
    required this.hasData,
    required this.isAutoFill,
    required this.autoValue,
    required this.initialExplanation,
    required this.initialTarget,
    required this.initialNote,
    required this.onToggle,
    required this.onExplanationChanged,
    required this.onTargetChanged,
    required this.onNoteChanged,
  });

  final WorkRequirementDetailMeta meta;
  final int rowIndex;
  final bool isExpanded;
  final bool hasData;
  final bool isAutoFill;
  final String autoValue;
  final String initialExplanation;
  final String initialTarget;
  final String? initialNote;
  final VoidCallback onToggle;
  final ValueChanged<String> onExplanationChanged;
  final ValueChanged<String> onTargetChanged;
  final ValueChanged<String> onNoteChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpanded
              ? AppColors.primaryERP.withValues(alpha: 0.4)
              : hasData
                  ? AppColors.stateSuccessColor.withValues(alpha: 0.3)
                  : AppColors.borderColor,
          width: isExpanded ? 1.6 : 1.0,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: AppColors.primaryERP.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: isExpanded
                          ? AppColors.primaryERP
                          : hasData
                              ? AppColors.stateSuccessColor
                              : AppColors.supportBtn,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${meta.index + 1}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isExpanded || hasData
                            ? Colors.white
                            : AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    meta.icon,
                    size: 20,
                    color: isExpanded
                        ? AppColors.primaryERP
                        : hasData
                            ? AppColors.stateSuccessColor
                            : AppColors.gray,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meta.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isExpanded
                                ? AppColors.heading
                                : hasData
                                    ? AppColors.stateSuccessColor
                                    : AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color:
                          isExpanded ? AppColors.primaryERP : AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded
                ? _buildExpandedContent()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 12),
          WorkRequirementDetailFieldColumn(
            nameForm: 'detail_${rowIndex}_explanation',
            nameTextField: 'detail_${rowIndex}_explanation_tf',
            label: 'Diễn giải',
            hint: isAutoFill
                ? 'Tự động theo thời gian hoàn thành'
                : 'Nhập nội dung diễn giải...',
            initialValue: isAutoFill ? autoValue : initialExplanation,
            readOnly: isAutoFill,
            onChanged: onExplanationChanged,
          ),
          const SizedBox(height: 10),
          WorkRequirementDetailFieldColumn(
            nameForm: 'detail_${rowIndex}_target',
            nameTextField: 'detail_${rowIndex}_target_tf',
            label: 'Mục tiêu cần đạt',
            hint: 'Nhập mục tiêu cần đạt...',
            initialValue: initialTarget,
            onChanged: onTargetChanged,
          ),
          const SizedBox(height: 10),
          WorkRequirementDetailFieldColumn(
            nameForm: 'detail_${rowIndex}_note',
            nameTextField: 'detail_${rowIndex}_note_tf',
            label: 'Ghi chú',
            hint: 'Nhập ghi chú (nếu có)...',
            initialValue: initialNote ?? '',
            onChanged: onNoteChanged,
          ),
        ],
      ),
    );
  }
}

class WorkRequirementDetailFieldColumn extends StatelessWidget {
  const WorkRequirementDetailFieldColumn({
    super.key,
    required this.nameForm,
    required this.nameTextField,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    this.readOnly = false,
  });

  final String nameForm;
  final String nameTextField;
  final String label;
  final String hint;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return FormInputField(
      nameForm: nameForm,
      nameTextField: nameTextField,
      label: label,
      icon: Icons.short_text,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      initialValue: initialValue,
      readOnly: readOnly,
      autoExpand: true,
      onChanged: (v) => onChanged(v ?? ''),
    );
  }
}
