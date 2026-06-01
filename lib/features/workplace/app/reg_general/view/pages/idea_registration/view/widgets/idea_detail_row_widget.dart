import 'package:flutter/material.dart';

import '../../../../../../../../../../common/app_theme/app_colors.dart';
import '../../../../../../../../../../common/widgets/form/form_input_field.dart';

/// Widget một hàng chi tiết ý tưởng: Diễn giải + Chú thích.
/// Hỗ trợ expand/collapse, mặc định mở rộng.
class IdeaDetailRowWidget extends StatefulWidget {
  const IdeaDetailRowWidget({
    super.key,
    required this.index,
    required this.categoryName,
    required this.nameFormPrefix,
    required this.initialDesc,
    required this.initialNote,
    this.onDescChanged,
    this.onNoteChanged,
  });

  final int index;
  final String categoryName;
  final String nameFormPrefix;
  final String initialDesc;
  final String? initialNote;
  final ValueChanged<String?>? onDescChanged;
  final ValueChanged<String?>? onNoteChanged;

  @override
  State<IdeaDetailRowWidget> createState() => _IdeaDetailRowWidgetState();
}

class _IdeaDetailRowWidgetState extends State<IdeaDetailRowWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header luôn hiển thị, vùng tap lớn
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primaryERP,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.index + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.categoryName,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                children: [
                  FormInputField(
                    nameForm: '${widget.nameFormPrefix}_desc_${widget.index}',
                    nameTextField: '${widget.nameFormPrefix}_desc_tf_${widget.index}',
                    label: 'Diễn giải',
                    icon: Icons.short_text,
                    initialValue: widget.initialDesc,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    autoExpand: true,
                    isRequired: true,
                    onChanged: widget.onDescChanged,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Vui lòng nhập đầy đủ thông tin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  FormInputField(
                    nameForm: '${widget.nameFormPrefix}_note_${widget.index}',
                    nameTextField: '${widget.nameFormPrefix}_note_tf_${widget.index}',
                    label: 'Chú thích',
                    icon: Icons.sticky_note_2_outlined,
                    initialValue: widget.initialNote ?? '',
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    autoExpand: true,
                    onChanged: widget.onNoteChanged,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
