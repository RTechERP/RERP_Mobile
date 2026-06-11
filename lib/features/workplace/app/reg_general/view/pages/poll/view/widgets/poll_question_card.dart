import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';
import 'poll_detail_helpers.dart';
import 'poll_choice_widgets.dart';

class PollQuestionReadonlyCard extends StatefulWidget {
  const PollQuestionReadonlyCard({
    super.key,
    required this.question,
    required this.readonly,
    required this.displayOrder,
    required this.liveFieldValueMap,
    required this.dirtyFields,
    required this.clearedFields,
    required this.showValidationError,
    required this.onAnswerChanged,
  });

  final PollQuestionItem question;
  final bool readonly;
  final int displayOrder;
  final Map<String, String?> liveFieldValueMap;
  final Set<String> dirtyFields;
  final Set<String> clearedFields;
  final bool showValidationError;
  final void Function(String fieldKey, String? value) onAnswerChanged;

  @override
  State<PollQuestionReadonlyCard> createState() => PollQuestionReadonlyCardState();
}

class PollQuestionReadonlyCardState extends State<PollQuestionReadonlyCard> {
  late TextEditingController _textController;
  DateTime? _selectedDate;
  String? _lastNotifiedValue;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: _buildResolvedTextValue(widget.question),
    );
    _selectedDate = _resolveSelectedDate(widget.question);
    _scheduleAnswerChangedNotification();
  }

  @override
  void didUpdateWidget(covariant PollQuestionReadonlyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      _textController.text = _buildResolvedTextValue(widget.question);
      _textController.selection = TextSelection.collapsed(
        offset: _textController.text.length,
      );
      _selectedDate = _resolveSelectedDate(widget.question);
    } else if (oldWidget.liveFieldValueMap != widget.liveFieldValueMap) {
      _selectedDate = _resolveSelectedDate(widget.question);
      _textController.text = _buildResolvedTextValue(widget.question);
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
      nextValue = _liveSelectedValues.isEmpty ? null : _liveSelectedValues.join(',');
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
    final fieldKey = widget.question.fieldKey?.trim() ?? '';
    widget.onAnswerChanged(fieldKey, value);
  }

  void _onResetSingle() {
    if (widget.readonly || widget.question.isRequired == true) return;
    widget.onAnswerChanged(widget.question.fieldKey?.trim() ?? '', null);
  }

  void _onResetMultiple() {
    if (widget.readonly || widget.question.isRequired == true) return;
    widget.onAnswerChanged(widget.question.fieldKey?.trim() ?? '', null);
  }

  void _onToggleMultiple(String value) {
    if (widget.readonly) return;
    final fieldKey = widget.question.fieldKey?.trim() ?? '';
    final currentValues = _liveSelectedValues;
    String? nextValue;

    if (currentValues.contains(value)) {
      final newValues = Set<String>.from(currentValues)..remove(value);
      nextValue = newValues.isEmpty ? null : newValues.join(',');
    } else {
      final newValues = Set<String>.from(currentValues)..add(value);
      nextValue = newValues.join(',');
    }

    widget.onAnswerChanged(fieldKey, nextValue);
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

  void _onClearDate() {
    if (widget.readonly || widget.question.isRequired == true || _selectedDate == null) {
      return;
    }
    setState(() {
      _selectedDate = null;
    });
    _notifyAnswerChanged();
  }

  void _onClearText() {
    if (widget.readonly || widget.question.isRequired == true) return;
    if (_textController.text.isEmpty) return;
    _textController.clear();
    _notifyAnswerChanged();
  }

  void _onResetReadonly() {
    if (widget.question.isRequired == true) return;
    final fieldKey = widget.question.fieldKey?.trim();
    if (fieldKey == null || fieldKey.isEmpty) return;
    final normalizedType = PollDetailHelpers.normalizeQuestionType(widget.question.questionType);
    if (PollDetailHelpers.isChoiceQuestion(normalizedType)) {
      widget.onAnswerChanged(fieldKey, null);
    } else if (PollDetailHelpers.isDateQuestion(normalizedType)) {
      widget.onAnswerChanged(fieldKey, null);
    } else {
      widget.onAnswerChanged(fieldKey, null);
    }
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
    final showValidationError = widget.showValidationError;

    final effectiveValues = _buildEffectiveValues(question, values);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: showValidationError ? const Color(0xFFFCA5A5) : const Color(0xFFE5EAF3),
          width: showValidationError ? 1.4 : 1,
        ),
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
                      fontSize: 13,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                    children: [
                      TextSpan(text: '${widget.displayOrder}. $_questionTitle'),
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
          if (showValidationError) ...[
            const SizedBox(height: 8),
            const Text(
              'Vui lòng nhập hoặc chọn giá trị.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDC2626),
              ),
            ),
          ],
          const SizedBox(height: 14),
          _AnswerContent(
            question: question,
            values: values,
            effectiveValues: effectiveValues,
            readonly: effectiveReadonly,
            type: normalizedType,
            options: sortedOptions,
            selectedValues: _liveSelectedValues,
            selectedDate: _selectedDate,
            textController: _textController,
            showValidationError: showValidationError,
            onPickDate: _onPickDate,
            onClearDate: _onClearDate,
            onClearText: _onClearText,
            onSelectSingle: _onSelectSingle,
            onResetSingle: _onResetSingle,
            onToggleMultiple: _onToggleMultiple,
            onResetMultiple: _onResetMultiple,
            onTextChanged: (_) => _notifyAnswerChanged(),
            onResetReadonly: _onResetReadonly,
          ),
        ],
      ),
    );
  }

  String get _questionTitle {
    final text = widget.question.questionText?.trim();
    if (text != null && text.isNotEmpty) return text;
    return 'Câu hỏi chưa có tiêu đề';
  }

  /// Tính selectedValues: ưu tiên liveFieldValueMap nếu dirty, trả empty nếu cleared, fallback về API values
  Set<String> get _liveSelectedValues {
    final fieldKey = widget.question.fieldKey?.trim() ?? '';
    
    if (widget.clearedFields.contains(fieldKey)) {
      return <String>{};
    }
    
    if (widget.dirtyFields.contains(fieldKey)) {
      final liveValue = _liveValue(widget.question);
      if (liveValue != null && liveValue.isNotEmpty) {
        return liveValue
            .split(',')
            .map((v) => v.trim())
            .where((v) => v.isNotEmpty)
            .toSet();
      }
    }
    return PollDetailHelpers.extractSelectedValuesFromConfig(widget.question);
  }

  List<String> _buildEffectiveValues(PollQuestionItem question, List<String> apiValues) {
    final liveValue = _liveValue(question);
    if (liveValue == null || liveValue.isEmpty) {
      return [];
    }
    return liveValue.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  String? _liveValue(PollQuestionItem question) {
    final fieldKey = question.fieldKey?.trim();
    if (fieldKey == null || fieldKey.isEmpty) return null;

    if (widget.liveFieldValueMap.containsKey(fieldKey)) {
      return widget.liveFieldValueMap[fieldKey];
    }
    return null;
  }
}

class _AnswerContent extends StatelessWidget {
  const _AnswerContent({
    required this.question,
    required this.values,
    required this.effectiveValues,
    required this.readonly,
    required this.type,
    required this.options,
    required this.selectedValues,
    required this.selectedDate,
    required this.textController,
    required this.showValidationError,
    required this.onPickDate,
    required this.onClearDate,
    required this.onClearText,
    required this.onSelectSingle,
    required this.onResetSingle,
    required this.onToggleMultiple,
    required this.onResetMultiple,
    required this.onResetReadonly,
    required this.onTextChanged,
  });

  final PollQuestionItem question;
  final List<String> values;
  final List<String> effectiveValues;
  final bool readonly;
  final String? type;
  final List<PollOptionItem> options;
  final Set<String> selectedValues;
  final DateTime? selectedDate;
  final TextEditingController textController;
  final bool showValidationError;
  final Future<void> Function() onPickDate;
  final VoidCallback onClearDate;
  final VoidCallback onClearText;
  final ValueChanged<String> onSelectSingle;
  final VoidCallback onResetSingle;
  final ValueChanged<String> onToggleMultiple;
  final VoidCallback onResetMultiple;
  final VoidCallback onResetReadonly;
  final ValueChanged<String> onTextChanged;

  @override
  Widget build(BuildContext context) {
    if (PollDetailHelpers.isChoiceQuestion(type)) {
      final hasInteractiveOptions = options.isNotEmpty && !readonly;
      if (hasInteractiveOptions) {
        final isMultipleChoice = PollDetailHelpers.isMultipleChoiceQuestion(type);
        final canResetSingleChoice =
            !isMultipleChoice &&
            question.isRequired != true &&
            selectedValues.isNotEmpty;
        final canResetMultipleChoice =
            isMultipleChoice &&
            question.isRequired != true &&
            selectedValues.isNotEmpty;
        final choiceBorderColor =
            showValidationError ? const Color(0xFFFCA5A5) : const Color(0xFFDDE5F0);

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
                padding: EdgeInsets.only(bottom: isLast && !canResetSingleChoice && !canResetMultipleChoice ? 0 : 10),
                child: ChoiceInputTile(
                  value: optionText,
                  isMultiple: isMultipleChoice,
                  selected: isSelected,
                  borderColor: choiceBorderColor,
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
            if (canResetMultipleChoice)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onResetMultiple,
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

      final displayValues = effectiveValues;
      final hasValueToReset = displayValues.isNotEmpty;

      return Column(
        children: [
          ...displayValues.asMap().entries.map((entry) {
            final isLast = entry.key == displayValues.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
              child: ReadonlyChoiceTile(
                value: entry.value,
                isMultiple: PollDetailHelpers.isMultipleChoiceQuestion(type),
                readonly: readonly,
              ),
            );
          }),
          if (readonly && question.isRequired != true && hasValueToReset)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onResetReadonly,
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

    final isEditableDate = !readonly && PollDetailHelpers.isDateQuestion(type);
    if (isEditableDate) {
      return EditableDateAnswerField(
        selectedDate: selectedDate,
        isRequired: question.isRequired == true,
        showValidationError: showValidationError,
        onTap: onPickDate,
        onClear: onClearDate,
      );
    }

    final isEditableText =
        !readonly && (type == 'text' || type == 'textarea') && options.isEmpty;
    if (isEditableText) {
      return EditableTextAnswerField(
        controller: textController,
        isMultiline: type == 'textarea',
        isRequired: question.isRequired == true,
        showValidationError: showValidationError,
        onChanged: onTextChanged,
        onClear: onClearText,
      );
    }

    final displayValues = effectiveValues;
    final hasValueToReset = displayValues.isNotEmpty || selectedDate != null || textController.text.isNotEmpty;

    return Column(
      children: [
        ...displayValues.asMap().entries.map((entry) {
          final isLast = entry.key == displayValues.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
            child: ReadonlyAnswerTile(
              value: entry.value,
              readonly: readonly,
              isDate: PollDetailHelpers.isDateQuestion(type),
            ),
          );
        }),
        if (readonly && question.isRequired != true && hasValueToReset)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onResetReadonly,
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
}
