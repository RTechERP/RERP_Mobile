import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'poll_detail_helpers.dart';

class ReadonlyChoiceTile extends StatelessWidget {
  const ReadonlyChoiceTile({
    super.key,
    required this.value,
    required this.isMultiple,
    required this.readonly,
  });

  final String value;
  final bool isMultiple;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    final borderColor = readonly
        ? AppColors.secondaryERP.withValues(alpha: 0.22)
        : const Color(0xFFDDE5F0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChoiceIndicator(isMultiple: isMultiple, selected: true),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceInputTile extends StatelessWidget {
  const ChoiceInputTile({
    super.key,
    required this.value,
    required this.isMultiple,
    required this.selected,
    required this.borderColor,
    required this.onTap,
  });

  final String value;
  final bool isMultiple;
  final bool selected;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF1F7FF) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? AppColors.secondaryERP.withValues(alpha: 0.55)
                : borderColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChoiceIndicator(isMultiple: isMultiple, selected: selected),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceIndicator extends StatelessWidget {
  const _ChoiceIndicator({required this.isMultiple, required this.selected});

  final bool isMultiple;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        shape: isMultiple ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isMultiple ? BorderRadius.circular(4) : null,
        border: Border.all(
          color: selected ? AppColors.secondaryERP : AppColors.hintText,
          width: selected ? 1.4 : 1,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: isMultiple ? 10 : 8,
                height: isMultiple ? 10 : 8,
                decoration: BoxDecoration(
                  color: AppColors.secondaryERP,
                  shape: isMultiple ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: isMultiple ? BorderRadius.circular(2) : null,
                ),
              ),
            )
          : null,
    );
  }
}

class ReadonlyAnswerTile extends StatelessWidget {
  const ReadonlyAnswerTile({
    super.key,
    required this.value,
    required this.readonly,
    this.isDate = false,
  });

  final String value;
  final bool readonly;
  final bool isDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: readonly
              ? AppColors.secondaryERP.withValues(alpha: 0.22)
              : const Color(0xFFDDE5F0),
        ),
      ),
      child: Row(
        children: [
          if (isDate) ...[
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: AppColors.hintText,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditableTextAnswerField extends StatelessWidget {
  const EditableTextAnswerField({
    super.key,
    required this.controller,
    required this.isMultiline,
    required this.isRequired,
    required this.showValidationError,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final bool isMultiline;
  final bool isRequired;
  final bool showValidationError;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        showValidationError ? const Color(0xFFFCA5A5) : const Color(0xFFDDE5F0);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      minLines: isMultiline ? 4 : 1,
      maxLines: isMultiline ? 6 : 1,
      textInputAction: isMultiline ? TextInputAction.newline : TextInputAction.done,
      decoration: InputDecoration(
        hintText: isMultiline ? 'Nhập nội dung trả lời' : 'Nhập câu trả lời',
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: showValidationError
                ? const Color(0xFFDC2626)
                : AppColors.secondaryERP.withValues(alpha: 0.65),
            width: 1.4,
          ),
        ),
        suffixIcon: isRequired
            ? const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.edit_outlined, size: 18, color: AppColors.hintText),
              )
            : IconButton(
                onPressed: controller.text.isEmpty ? null : onClear,
                icon: const Icon(Icons.close_rounded, size: 18),
                color: AppColors.hintText,
                splashRadius: 18,
                tooltip: 'Xóa nội dung',
              ),
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
      ),
    );
  }
}

class EditableDateAnswerField extends StatelessWidget {
  const EditableDateAnswerField({
    super.key,
    required this.selectedDate,
    required this.isRequired,
    required this.showValidationError,
    required this.onTap,
    required this.onClear,
  });

  final DateTime? selectedDate;
  final bool isRequired;
  final bool showValidationError;
  final Future<void> Function() onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        showValidationError ? const Color(0xFFFCA5A5) : const Color(0xFFDDE5F0);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: showValidationError ? 1.4 : 1),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: AppColors.hintText,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                selectedDate == null
                    ? 'Chọn ngày'
                    : PollDetailHelpers.formatDate(selectedDate),
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: selectedDate == null
                      ? AppColors.hintText
                      : AppColors.heading,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (!isRequired && selectedDate != null)
              InkWell(
                onTap: onClear,
                borderRadius: BorderRadius.circular(999),
                child: const Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: AppColors.hintText,
                  ),
                ),
              )
            else
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.hintText,
              ),
          ],
        ),
      ),
    );
  }
}
