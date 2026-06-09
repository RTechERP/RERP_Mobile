import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';
import 'poll_detail_helpers.dart';

class PollDetailHeroCard extends StatelessWidget {
  const PollDetailHeroCard({
    super.key,
    required this.title,
    required this.description,
    required this.startDateText,
    required this.endDateText,
    required this.backgroundImageUrl,
    required this.accentColor,
    required this.titleColorValue,
  });

  final String title;
  final String description;
  final String startDateText;
  final String endDateText;
  final String? backgroundImageUrl;
  final Color accentColor;
  final String? titleColorValue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withValues(alpha: 0.24),
                blurRadius: 4,
                offset: const Offset(-1, -1),
              ),
              BoxShadow(
                color: accentColor.withValues(alpha: 0.14),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppColors.secondaryERP.withValues(alpha: 0.08),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _PollBackgroundImage(
                  imageUrl: backgroundImageUrl,
                  accentColor: accentColor,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white.withValues(alpha: 0.72),
                        AppColors.white.withValues(alpha: 0.52),
                      ],
                    ),
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.7),
                      width: 1.2,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.white.withValues(alpha: 0.18),
                        Colors.transparent,
                        accentColor.withValues(alpha: 0.04),
                      ],
                      stops: const [0, 0.45, 1],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: titleColorValue?.trim().isNotEmpty == true
                            ? accentColor
                            : AppColors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (description.trim().isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.36),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.38),
                          ),
                        ),
                        child: Text(
                          description.trim(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: AppColors.textSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _DetailInfoChip(
                          icon: Icons.play_circle_outline_rounded,
                          label: startDateText,
                          backgroundColor: const Color(0xFFE8F5E9),
                          borderColor: const Color(0xFFC8E6C9),
                          iconColor: const Color(0xFF2E7D32),
                          textColor: const Color(0xFF2E7D32),
                        ),
                        const SizedBox(width: 12),
                        _DetailInfoChip(
                          icon: Icons.event_available_rounded,
                          label: endDateText,
                          backgroundColor: const Color(0xFFFFEBEE),
                          borderColor: const Color(0xFFFFCDD2),
                          iconColor: const Color(0xFFC62828),
                          textColor: const Color(0xFFC62828),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailInfoChip extends StatelessWidget {
  const _DetailInfoChip({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class PollDetailSectionCard extends StatelessWidget {
  const PollDetailSectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.questions,
    required this.backgroundImageUrl,
    required this.accentColor,
    required this.questionReadonlyMap,
    required this.liveFieldValueMap,
    required this.onAnswerChanged,
  });

  final String? title;
  final String? description;
  final List<PollQuestionItem> questions;
  final String? backgroundImageUrl;
  final Color accentColor;
  final Map<int, bool> questionReadonlyMap;
  final Map<String, String?> liveFieldValueMap;
  final void Function(String fieldKey, String? value) onAnswerChanged;

  bool get _hasSectionHeader =>
      (title?.trim().isNotEmpty == true) || (description?.trim().isNotEmpty == true);

  @override
  Widget build(BuildContext context) {
    return BlurredBackgroundCard(
      imageUrl: backgroundImageUrl,
      accentColor: accentColor,
      borderRadius: 22,
      blurSigma: 10,
      borderColor: AppColors.white.withValues(alpha: 0.28),
      imageOverlayColors: [
        AppColors.white.withValues(alpha: 0.88),
        AppColors.white.withValues(alpha: 0.80),
      ],
      fallbackOverlayColors: [AppColors.white, const Color(0xFFF8FAFD)],
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryERP.withValues(alpha: 0.06),
          blurRadius: 18,
          offset: const Offset(0, 10),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasSectionHeader) ...[
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title?.trim().isNotEmpty == true)
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                      ),
                    ),
                  if (description?.trim().isNotEmpty == true) ...[
                    const SizedBox(height: 6),
                    Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: AppColors.hintText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.fromLTRB(18, _hasSectionHeader ? 0 : 18, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                final isLast = index == questions.length - 1;
                final readonly = questionReadonlyMap[question.id] ?? false;

                return Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: PollQuestionReadonlyCard(
                    question: question,
                    readonly: readonly,
                    displayOrder: question.sortOrder ?? index + 1,
                    liveFieldValueMap: liveFieldValueMap,
                    onAnswerChanged: onAnswerChanged,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class PollQuestionReadonlyCard extends StatefulWidget {
  const PollQuestionReadonlyCard({
    super.key,
    required this.question,
    required this.readonly,
    required this.displayOrder,
    required this.liveFieldValueMap,
    required this.onAnswerChanged,
  });

  final PollQuestionItem question;
  final bool readonly;
  final int displayOrder;
  final Map<String, String?> liveFieldValueMap;
  final void Function(String fieldKey, String? value) onAnswerChanged;

  @override
  State<PollQuestionReadonlyCard> createState() => _PollQuestionReadonlyCardState();
}

class _PollQuestionReadonlyCardState extends State<PollQuestionReadonlyCard> {
  late Set<String> _selectedValues;
  late TextEditingController _textController;
  DateTime? _selectedDate;
  String? _lastNotifiedValue;

  @override
  void initState() {
    super.initState();
    _selectedValues = _resolveSelectedValues(widget.question);
    _textController = TextEditingController(
      text: _buildResolvedTextValue(widget.question),
    );
    _selectedDate = _resolveSelectedDate(widget.question);
    _scheduleAnswerChangedNotification();
  }

  @override
  void didUpdateWidget(covariant PollQuestionReadonlyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question ||
        oldWidget.liveFieldValueMap != widget.liveFieldValueMap) {
      _selectedValues = _resolveSelectedValues(widget.question);
      _textController.text = _buildResolvedTextValue(widget.question);
      _textController.selection = TextSelection.collapsed(
        offset: _textController.text.length,
      );
      _selectedDate = _resolveSelectedDate(widget.question);
      _scheduleAnswerChangedNotification();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  DateTime? _resolveSelectedDate(PollQuestionItem question) {
    final liveValue = _liveValue(question);
    if (liveValue != null && liveValue.isNotEmpty) {
      final parsedLiveValue = DateTime.tryParse(liveValue);
      if (parsedLiveValue != null) return parsedLiveValue;
    }

    final values = PollDetailHelpers.extractDisplayValues(question);
    if (values.isEmpty) return null;
    final firstValue = values.first.trim();
    if (firstValue.isEmpty ||
        firstValue == 'Chưa có dữ liệu trả lời' ||
        firstValue == 'Chưa chọn đáp án') {
      return null;
    }

    final apiValue = question.dataSourceDisplayValue?.trim();
    if (apiValue != null && apiValue.isNotEmpty) {
      final parsed = DateTime.tryParse(apiValue);
      if (parsed != null) return parsed;
    }

    final formattedParts = firstValue.split('/');
    if (formattedParts.length == 3) {
      final day = int.tryParse(formattedParts[0]);
      final month = int.tryParse(formattedParts[1]);
      final year = int.tryParse(formattedParts[2]);
      if (day != null && month != null && year != null) {
        return DateTime(year, month, day);
      }
    }

    return DateTime.tryParse(firstValue);
  }

  String _buildResolvedTextValue(PollQuestionItem question) {
    final liveValue = _liveValue(question);
    if (liveValue != null) return liveValue;

    final values = PollDetailHelpers.extractDisplayValues(question);
    if (values.isEmpty) return '';
    if (values.length == 1 &&
        (values.first == 'Chưa có dữ liệu trả lời' ||
            values.first == 'Chưa chọn đáp án')) {
      return '';
    }
    return values.join('\n');
  }

  Set<String> _resolveSelectedValues(PollQuestionItem question) {
    final liveValue = _liveValue(question);
    if (liveValue != null) {
      return liveValue
          .split(',')
          .map((value) => value.trim())
          .where((value) => value.isNotEmpty)
          .toSet();
    }

    return PollDetailHelpers.extractSelectedValuesFromConfig(question.configJson);
  }

  String? _liveValue(PollQuestionItem question) {
    final fieldKey = question.fieldKey?.trim();
    if (fieldKey == null || fieldKey.isEmpty) return null;
    return widget.liveFieldValueMap[fieldKey];
  }

  bool _hasResponseValue(PollQuestionItem question) {
    final values = PollDetailHelpers.extractDisplayValues(question);
    return values.any(
      (value) =>
          value.trim().isNotEmpty &&
          value != 'Chưa có dữ liệu trả lời' &&
          value != 'Chưa chọn đáp án',
    );
  }

  bool _resolveReadonly(PollQuestionItem question) {
    if (question.isAutoFilled == true && !_hasResponseValue(question)) {
      return false;
    }
    return widget.readonly;
  }

  void _scheduleAnswerChangedNotification() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _notifyAnswerChanged();
    });
  }

  void _notifyAnswerChanged() {
    final fieldKey = widget.question.fieldKey?.trim();
    if (fieldKey == null || fieldKey.isEmpty) return;

    final normalizedType = PollDetailHelpers.normalizeQuestionType(
      widget.question.questionType,
    );

    String? nextValue;
    if (PollDetailHelpers.isChoiceQuestion(normalizedType)) {
      nextValue = _selectedValues.isEmpty ? null : _selectedValues.join(',');
    } else if (PollDetailHelpers.isDateQuestion(normalizedType)) {
      nextValue = _selectedDate == null ? null : DateFormat('yyyy-MM-dd').format(_selectedDate!);
    } else {
      final text = _textController.text.trim();
      nextValue = text.isEmpty ? null : text;
    }

    if (_lastNotifiedValue == nextValue) return;
    _lastNotifiedValue = nextValue;
    widget.onAnswerChanged(fieldKey, nextValue);
  }

  void _onSelectSingle(String value) {
    if (widget.readonly) return;
    setState(() {
      _selectedValues = {value};
    });
    _notifyAnswerChanged();
  }

  void _onResetSingle() {
    if (widget.readonly) return;
    setState(() {
      _selectedValues = <String>{};
    });
    _notifyAnswerChanged();
  }

  void _onToggleMultiple(String value) {
    if (widget.readonly) return;
    setState(() {
      if (_selectedValues.contains(value)) {
        _selectedValues.remove(value);
      } else {
        _selectedValues.add(value);
      }
    });
    _notifyAnswerChanged();
  }

  Future<void> _onPickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      _selectedDate = picked;
    });
    _notifyAnswerChanged();
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.question;
    final effectiveReadonly = _resolveReadonly(question);
    final normalizedType = PollDetailHelpers.normalizeQuestionType(
      question.questionType,
    );
    final values = PollDetailHelpers.extractDisplayValues(question);
    final sortedOptions = PollDetailHelpers.extractSortedOptions(question.options);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5EAF3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                    children: [
                      TextSpan(text: '${widget.displayOrder}. ${_questionTitle(question)}'),
                      if (question.isRequired == true)
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _AnswerContent(
            question: question,
            values: values,
            readonly: effectiveReadonly,
            type: normalizedType,
            options: sortedOptions,
            selectedValues: _selectedValues,
            selectedDate: _selectedDate,
            textController: _textController,
            onPickDate: _onPickDate,
            onSelectSingle: _onSelectSingle,
            onResetSingle: _onResetSingle,
            onToggleMultiple: _onToggleMultiple,
            onTextChanged: (_) => _notifyAnswerChanged(),
          ),
        ],
      ),
    );
  }
}

String _questionTitle(PollQuestionItem question) {
  final text = question.questionText?.trim();
  if (text != null && text.isNotEmpty) return text;
  return 'Câu hỏi chưa có tiêu đề';
}

class _AnswerContent extends StatelessWidget {
  const _AnswerContent({
    required this.question,
    required this.values,
    required this.readonly,
    required this.type,
    required this.options,
    required this.selectedValues,
    required this.selectedDate,
    required this.textController,
    required this.onPickDate,
    required this.onSelectSingle,
    required this.onResetSingle,
    required this.onToggleMultiple,
    required this.onTextChanged,
  });

  final PollQuestionItem question;
  final List<String> values;
  final bool readonly;
  final String? type;
  final List<PollOptionItem> options;
  final Set<String> selectedValues;
  final DateTime? selectedDate;
  final TextEditingController textController;
  final Future<void> Function() onPickDate;
  final ValueChanged<String> onSelectSingle;
  final VoidCallback onResetSingle;
  final ValueChanged<String> onToggleMultiple;
  final ValueChanged<String> onTextChanged;

  @override
  Widget build(BuildContext context) {
    if (PollDetailHelpers.isChoiceQuestion(type)) {
      final hasInteractiveOptions = options.isNotEmpty && !readonly;
      if (hasInteractiveOptions) {
        final isMultipleChoice = PollDetailHelpers.isMultipleChoiceQuestion(type);
        final canResetSingleChoice = !isMultipleChoice && selectedValues.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...options.asMap().entries.map((entry) {
              final option = entry.value;
              final optionText = option.optionText?.trim();
              final optionValue = option.optionValue?.trim();
              if (optionText == null || optionText.isEmpty) {
                return const SizedBox.shrink();
              }

              final effectiveValue =
                  optionValue == null || optionValue.isEmpty ? optionText : optionValue;
              final isSelected = selectedValues.contains(effectiveValue);
              final isLast = entry.key == options.length - 1;

              return Padding(
                padding: EdgeInsets.only(bottom: isLast && !canResetSingleChoice ? 0 : 10),
                child: ChoiceInputTile(
                  value: optionText,
                  isMultiple: isMultipleChoice,
                  selected: isSelected,
                  onTap: () {
                    if (isMultipleChoice) {
                      onToggleMultiple(effectiveValue);
                    } else {
                      onSelectSingle(effectiveValue);
                    }
                  },
                ),
              );
            }),
            if (canResetSingleChoice)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onResetSingle,
                  icon: const Icon(Icons.restart_alt_rounded, size: 18),
                  label: const Text('Bỏ chọn'),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.secondaryERP,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
          ],
        );
      }

      return Column(
        children: values.asMap().entries.map((entry) {
          final isLast = entry.key == values.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
            child: ReadonlyChoiceTile(
              value: entry.value,
              isMultiple: PollDetailHelpers.isMultipleChoiceQuestion(type),
              readonly: readonly,
            ),
          );
        }).toList(),
      );
    }

    final isEditableDate = !readonly && PollDetailHelpers.isDateQuestion(type);
    if (isEditableDate) {
      return EditableDateAnswerField(
        selectedDate: selectedDate,
        onTap: onPickDate,
      );
    }

    final isEditableText =
        !readonly && (type == 'text' || type == 'textarea') && options.isEmpty;
    if (isEditableText) {
      return EditableTextAnswerField(
        controller: textController,
        isMultiline: type == 'textarea',
        isRequired: question.isRequired == true,
        onChanged: onTextChanged,
      );
    }

    return Column(
      children: values.asMap().entries.map((entry) {
        final isLast = entry.key == values.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
          child: ReadonlyAnswerTile(
            value: entry.value,
            readonly: readonly,
            isDate: PollDetailHelpers.isDateQuestion(type),
          ),
        );
      }).toList(),
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
            Icon(
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
    required this.onChanged,
  });

  final TextEditingController controller;
  final bool isMultiline;
  final bool isRequired;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
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
          borderSide: const BorderSide(color: Color(0xFFDDE5F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE5F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.secondaryERP.withValues(alpha: 0.65),
            width: 1.4,
          ),
        ),
        suffixIcon: isRequired
            ? const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.edit_outlined, size: 18, color: AppColors.hintText),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
      ),
    );
  }
}

class EditableDateAnswerField extends StatelessWidget {
  const EditableDateAnswerField({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  final DateTime? selectedDate;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFDDE5F0)),
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
    required this.onTap,
  });

  final String value;
  final bool isMultiple;
  final bool selected;
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
                : const Color(0xFFDDE5F0),
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

class PollDetailStateView extends StatelessWidget {
  const PollDetailStateView({
    super.key,
    required this.title,
    required this.actionLabel,
    required this.onTap,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.description_outlined,
              size: 48,
              color: AppColors.secondaryERP,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              child: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}

class BlurredBackgroundCard extends StatelessWidget {
  const BlurredBackgroundCard({
    super.key,
    required this.imageUrl,
    required this.accentColor,
    required this.child,
    required this.borderColor,
    this.borderRadius = 24,
    this.blurSigma = 24,
    this.boxShadow = const [],
    this.imageOverlayColors,
    this.fallbackOverlayColors,
  });

  final String? imageUrl;
  final Color accentColor;
  final Widget child;
  final Color borderColor;
  final double borderRadius;
  final double blurSigma;
  final List<BoxShadow> boxShadow;
  final List<Color>? imageOverlayColors;
  final List<Color>? fallbackOverlayColors;

  bool get _hasImage => imageUrl?.trim().isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    final overlayColors = _hasImage
        ? (imageOverlayColors ??
            [
              Colors.white.withValues(alpha: 0.06),
              Colors.black.withValues(alpha: 0.10),
            ])
        : (fallbackOverlayColors ??
            [
              AppColors.white.withValues(alpha: 0.14),
              accentColor.withValues(alpha: 0.18),
              const Color(0xFF1E3A8A).withValues(alpha: 0.48),
            ]);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                    tileMode: TileMode.decal,
                  ),
                  child: _PollBackgroundImage(
                    imageUrl: imageUrl,
                    accentColor: accentColor,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: overlayColors,
                  ),
                  border: Border.all(color: borderColor),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class _PollBackgroundImage extends StatelessWidget {
  const _PollBackgroundImage({
    required this.imageUrl,
    required this.accentColor,
  });

  final String? imageUrl;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              accentColor.withValues(alpha: 0.18),
              AppColors.secondaryERP.withValues(alpha: 0.1),
              AppColors.white.withValues(alpha: 0.12),
            ],
          ),
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withValues(alpha: 0.18),
                    AppColors.secondaryERP.withValues(alpha: 0.1),
                    AppColors.white.withValues(alpha: 0.12),
                  ],
                ),
              ),
            );
          },
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(color: Colors.transparent),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white.withValues(alpha: 0.08),
                AppColors.white.withValues(alpha: 0.2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
