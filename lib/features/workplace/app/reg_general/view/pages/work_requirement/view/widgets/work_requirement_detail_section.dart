import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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

class WorkRequirementDetailAccordion extends StatefulWidget {
  const WorkRequirementDetailAccordion({
    super.key,
    required this.formKey,
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

  final GlobalKey<FormBuilderState> formKey;
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
  State<WorkRequirementDetailAccordion> createState() =>
      _WorkRequirementDetailAccordionState();
}

class _WorkRequirementDetailAccordionState
    extends State<WorkRequirementDetailAccordion> {
  static const _sentinel = '__UNSET__';

  String _lastExplanation = _sentinel;
  String _lastTarget = _sentinel;
  String? _lastNote;

  @override
  void initState() {
    super.initState();
    _lastTarget = widget.initialTarget;
    _lastNote = widget.initialNote;
  }

  @override
  void didUpdateWidget(WorkRequirementDetailAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncIfNeeded();
  }

  void _syncIfNeeded() {
    if (!widget.isExpanded) return;

    final form = widget.formKey.currentState;
    if (form == null) return;

    final newExp =
        widget.isAutoFill ? widget.autoValue : widget.initialExplanation;

    if (_lastExplanation == _sentinel || _lastExplanation != newExp) {
      _lastExplanation = newExp;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final f = form.fields['detail_${widget.rowIndex}_explanation'];
        f?.didChange(newExp);
      });
    }
    if (_lastTarget == _sentinel || widget.initialTarget != _lastTarget) {
      _lastTarget = widget.initialTarget;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final f = form.fields['detail_${widget.rowIndex}_target'];
        f?.didChange(widget.initialTarget);
      });
    }
    if (_lastNote == null && widget.initialNote != null ||
        widget.initialNote != _lastNote) {
      _lastNote = widget.initialNote;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final f = form.fields['detail_${widget.rowIndex}_note'];
        f?.didChange(widget.initialNote ?? '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.isExpanded
              ? AppColors.primaryERP.withValues(alpha: 0.4)
              : widget.hasData
                  ? AppColors.stateSuccessColor.withValues(alpha: 0.3)
                  : AppColors.borderColor,
          width: widget.isExpanded ? 1.6 : 1.0,
        ),
        boxShadow: widget.isExpanded
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
            onTap: widget.onToggle,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: widget.isExpanded
                          ? AppColors.primaryERP
                          : widget.hasData
                              ? AppColors.stateSuccessColor
                              : AppColors.supportBtn,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.meta.index + 1}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: widget.isExpanded || widget.hasData
                            ? Colors.white
                            : AppColors.gray,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    widget.meta.icon,
                    size: 20,
                    color: widget.isExpanded
                        ? AppColors.primaryERP
                        : widget.hasData
                            ? AppColors.stateSuccessColor
                            : AppColors.gray,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.meta.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: widget.isExpanded
                                ? AppColors.heading
                                : widget.hasData
                                    ? AppColors.stateSuccessColor
                                    : AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: widget.isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: widget.isExpanded
                          ? AppColors.primaryERP
                          : AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: widget.isExpanded
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
            nameForm: 'detail_${widget.rowIndex}_explanation',
            nameTextField: 'detail_${widget.rowIndex}_explanation_tf',
            label: 'Diễn giải',
            hint: widget.isAutoFill
                ? 'Tự động theo thời gian hoàn thành'
                : 'Nhập nội dung diễn giải...',
            initialValue: widget.isAutoFill
                ? widget.autoValue
                : widget.initialExplanation,
            readOnly: widget.isAutoFill,
            onChanged: widget.onExplanationChanged,
          ),
          const SizedBox(height: 10),
          WorkRequirementDetailFieldColumn(
            nameForm: 'detail_${widget.rowIndex}_target',
            nameTextField: 'detail_${widget.rowIndex}_target_tf',
            label: 'Mục tiêu cần đạt',
            hint: 'Nhập mục tiêu cần đạt...',
            initialValue: widget.initialTarget,
            onChanged: widget.onTargetChanged,
          ),
          const SizedBox(height: 10),
          WorkRequirementDetailFieldColumn(
            nameForm: 'detail_${widget.rowIndex}_note',
            nameTextField: 'detail_${widget.rowIndex}_note_tf',
            label: 'Ghi chú',
            hint: 'Nhập ghi chú (nếu có)...',
            initialValue: widget.initialNote ?? '',
            onChanged: widget.onNoteChanged,
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
