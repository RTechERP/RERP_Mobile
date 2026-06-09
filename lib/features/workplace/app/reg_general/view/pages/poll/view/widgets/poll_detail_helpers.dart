import 'dart:convert';

import 'package:intl/intl.dart';

import '../../data/datasource/models/poll_model.dart';

class PollDetailHelpers {
  static final RegExp _dateOnlyPattern = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$');
  static final RegExp _dateTimePattern = RegExp(
    r'^(\d{4})-(\d{2})-(\d{2})[T\s](\d{2}):(\d{2})(?::\d{2}(?:\.\d{1,6})?)?(?:Z|[+-]\d{2}:?\d{2})?$',
  );
  static const _emptyAnswerText = 'Chưa có dữ liệu trả lời';
  static const _emptyChoiceText = 'Chưa chọn đáp án';

  static String formatDate(DateTime? value) {
    if (value == null) return '--';
    return DateFormat('dd/MM/yyyy').format(value);
  }

  static String displayText(String? primary, String? fallback, String defaultValue) {
    return normalizedOrNull(primary) ?? normalizedOrNull(fallback) ?? defaultValue;
  }

  static String? normalizedOrNull(String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) return null;
    return formatApiDateString(normalized) ?? normalized;
  }

  static String? formatApiDateString(String value) {
    final normalized = value.trim();
    if (normalized.isEmpty) return null;

    if (_dateOnlyPattern.hasMatch(normalized)) {
      final parsed = DateTime.tryParse(normalized);
      if (parsed != null) {
        return DateFormat('dd/MM/yyyy').format(parsed);
      }
    }

    if (_dateTimePattern.hasMatch(normalized)) {
      final parsed = DateTime.tryParse(normalized);
      if (parsed != null) {
        return DateFormat('dd/MM/yyyy HH:mm').format(parsed);
      }
    }

    return null;
  }

  static bool isChoiceQuestion(String? type) {
    return const {
      'radio',
      'radiobutton',
      'singlechoice',
      'single-choice',
      'checkbox',
      'multiplechoice',
      'multiple-choice',
      'dropdown',
      'select',
      'combobox',
    }.contains(normalizeQuestionType(type));
  }

  static bool isMultipleChoiceQuestion(String? type) {
    return const {
      'checkbox',
      'multiplechoice',
      'multiple-choice',
    }.contains(normalizeQuestionType(type));
  }

  static bool isDateQuestion(String? type) {
    return const {
      'date',
      'datetime',
      'datetime-local',
    }.contains(normalizeQuestionType(type));
  }

  static String? normalizeQuestionType(String? type) {
    final normalized = type?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) return null;

    switch (normalized) {
      case 'singlechoice':
      case 'single-choice':
      case 'radiobutton':
        return 'radio';
      case 'multiplechoice':
      case 'multiple-choice':
        return 'checkbox';
      case 'textarea':
        return 'textarea';
      case 'text':
        return 'text';
      case 'date':
        return 'date';
      case 'rating':
        return 'rating';
      default:
        return normalized;
    }
  }

  static List<String> extractDisplayValues(PollQuestionItem question) {
    final config = _decodeConfig(question.configJson);
    final values = <String>[];
    final type = normalizeQuestionType(question.questionType);

    void appendValue(String? raw, {bool forceDateFormat = false}) {
      final normalized = _normalizeDisplayValue(
        raw,
        isDate: forceDateFormat || isDateQuestion(type),
      );
      if (normalized == null) return;
      if (!values.contains(normalized)) {
        values.add(normalized);
      }
    }

    appendValue(question.dataSourceDisplayValue, forceDateFormat: true);

    final selectedValues = _extractSelectedValues(config);
    final optionTexts = _mapOptionTexts(question.options, selectedValues);
    for (final option in optionTexts) {
      appendValue(option);
    }

    if (isChoiceQuestion(type) && optionTexts.isEmpty) {
      for (final selectedValue in selectedValues) {
        appendValue(selectedValue);
      }
    }

    if (values.isEmpty && !isChoiceQuestion(type)) {
      for (final option in _extractAllOptionTexts(question.options)) {
        appendValue(option);
      }
    }

    final displayValue = _extractConfigDisplayValue(config);
    if (displayValue is List) {
      for (final item in displayValue) {
        appendValue(item?.toString());
      }
    } else {
      appendValue(displayValue?.toString());
    }

    if (values.isEmpty) {
      appendValue(question.dataSourceLabel);
    }

    if (values.isEmpty && isChoiceQuestion(type)) {
      return const [_emptyChoiceText];
    }

    if (values.isEmpty) {
      return const [_emptyAnswerText];
    }

    return values;
  }

  static List<PollOptionItem> extractSortedOptions(List<PollOptionItem>? options) {
    if (options == null || options.isEmpty) return const [];
    return List.from(options)
      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));
  }

  static Set<String> extractSelectedValuesFromConfig(String? configJson) {
    final config = _decodeConfig(configJson);
    return _extractSelectedValues(config).toSet();
  }

  static String? _normalizeDisplayValue(String? raw, {required bool isDate}) {
    final normalized = raw?.trim();
    if (normalized == null || normalized.isEmpty) return null;
    if (!isDate) return normalized;

    final formattedDate = formatApiDateString(normalized);
    return formattedDate ?? normalized;
  }

  static Map<String, dynamic>? _decodeConfig(String? rawConfig) {
    final raw = rawConfig?.trim();
    if (raw == null || raw.isEmpty) return null;

    try {
      final decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) {
        return decoded.map(
          (key, value) => MapEntry(key.toString(), value),
        );
      }
    } catch (_) {}

    return null;
  }

  static List<String> _extractSelectedValues(Map<String, dynamic>? config) {
    if (config == null) return const [];
    final candidates = [
      config['value'],
      config['values'],
      config['defaultValue'],
      config['selectedValue'],
      config['selectedValues'],
    ];

    final values = <String>[];
    for (final candidate in candidates) {
      if (candidate is List) {
        for (final item in candidate) {
          final text = item?.toString().trim();
          if (text != null && text.isNotEmpty && !values.contains(text)) {
            values.add(text);
          }
        }
      } else {
        final text = candidate?.toString().trim();
        if (text != null && text.isNotEmpty && !values.contains(text)) {
          values.add(text);
        }
      }
    }
    return values;
  }

  static List<String> _mapOptionTexts(
    List<PollOptionItem>? options,
    List<String> selectedValues,
  ) {
    if (options == null || options.isEmpty || selectedValues.isEmpty) {
      return const [];
    }

    final normalizedValues = selectedValues.map((e) => e.trim()).toSet();
    final mapped = <String>[];

    for (final option in options) {
      final optionValue = option.optionValue?.trim();
      final optionText = option.optionText?.trim();
      if (optionValue != null && normalizedValues.contains(optionValue)) {
        if (optionText != null && optionText.isNotEmpty && !mapped.contains(optionText)) {
          mapped.add(optionText);
        }
      }
    }

    return mapped;
  }

  static List<String> _extractAllOptionTexts(List<PollOptionItem>? options) {
    if (options == null || options.isEmpty) return const [];

    final values = <String>[];
    for (final option in options) {
      final optionText = option.optionText?.trim();
      if (optionText != null && optionText.isNotEmpty && !values.contains(optionText)) {
        values.add(optionText);
      }
    }

    return values;
  }

  static dynamic _extractConfigDisplayValue(Map<String, dynamic>? config) {
    if (config == null) return null;
    if (config.containsKey('displayValue')) return config['displayValue'];
    if (config.containsKey('label')) return config['label'];
    if (config.containsKey('text')) return config['text'];
    return null;
  }

  static Map<String, String?> buildFieldValueMap(PollDetailItem detail) {
    final Map<String, String?> fieldValueMap = {};

    void collectFieldValues(List<PollQuestionItem>? questions) {
      if (questions == null) return;
      for (final q in questions) {
        final key = q.fieldKey?.trim();
        if (key == null || key.isEmpty) continue;
        if (fieldValueMap.containsKey(key)) continue;

        final values = extractDisplayValues(q);
        final first = values.isNotEmpty ? values.first : null;
        if (first == _emptyAnswerText || first == _emptyChoiceText) {
          fieldValueMap[key] = null;
        } else {
          fieldValueMap[key] = first;
        }
      }
    }

    collectFieldValues(detail.questions);
    for (final section in detail.sections ?? const <PollSectionItem>[]) {
      collectFieldValues(section.questions);
    }

    return fieldValueMap;
  }

  static bool evaluateShowIf(
    String? showIfJson,
    Map<String, String?> fieldValueMap,
  ) {
    final raw = showIfJson?.trim();
    if (raw == null || raw.isEmpty) return true;

    try {
      final decoded = jsonDecode(raw);
      return _evaluateShowIfNode(decoded, fieldValueMap);
    } catch (_) {
      return true;
    }
  }

  static bool _evaluateShowIfNode(
    dynamic node,
    Map<String, String?> fieldValueMap,
  ) {
    if (node is! Map) return true;

    final logic = (node['logic'] as String?)?.toLowerCase();
    final conditions = node['conditions'] as List?;

    if (conditions == null || conditions.isEmpty) return true;

    if (logic == 'or') {
      for (final cond in conditions) {
        if (_evaluateSingleCondition(cond, fieldValueMap)) return true;
      }
      return false;
    }

    for (final cond in conditions) {
      if (!_evaluateSingleCondition(cond, fieldValueMap)) return false;
    }
    return true;
  }

  static bool _evaluateSingleCondition(
    dynamic cond,
    Map<String, String?> fieldValueMap,
  ) {
    if (cond is! Map) return true;

    final fieldKey = (cond['fieldKey'] as String?)?.trim();
    if (fieldKey == null || fieldKey.isEmpty) return true;

    final rawValue = cond['value'];
    final rawFieldValue = fieldValueMap[fieldKey];

    if (rawFieldValue == null) return false;

    final op = (cond['operator'] as String?)?.toLowerCase();
    if (op == null) return false;

    final numField = num.tryParse(rawFieldValue);
    final numTarget = num.tryParse(rawValue?.toString() ?? '');

    switch (op) {
      case 'greaterorEqual':
      case 'greaterorequal':
      case 'gte':
        if (numField != null && numTarget != null) return numField >= numTarget;
        return rawFieldValue.compareTo(rawValue?.toString() ?? '') >= 0;

      case 'lessOrEqual':
      case 'lessorequal':
      case 'lte':
        if (numField != null && numTarget != null) return numField <= numTarget;
        return rawFieldValue.compareTo(rawValue?.toString() ?? '') <= 0;

      case 'greaterThan':
      case 'greaterthan':
      case 'gt':
        if (numField != null && numTarget != null) return numField > numTarget;
        return rawFieldValue.compareTo(rawValue?.toString() ?? '') > 0;

      case 'lessThan':
      case 'lessthan':
      case 'lt':
        if (numField != null && numTarget != null) return numField < numTarget;
        return rawFieldValue.compareTo(rawValue?.toString() ?? '') < 0;

      case 'equals':
      case 'equal':
      case 'eq':
        if (numField != null && numTarget != null) return numField == numTarget;
        return rawFieldValue == rawValue?.toString();

      case 'notEquals':
      case 'notequal':
      case 'neq':
        if (numField != null && numTarget != null) return numField != numTarget;
        return rawFieldValue != rawValue?.toString();

      case 'contains':
        return rawFieldValue.toLowerCase().contains(
              (rawValue?.toString() ?? '').toLowerCase(),
            );

      case 'notContains':
        return !rawFieldValue.toLowerCase().contains(
              (rawValue?.toString() ?? '').toLowerCase(),
            );

      case 'startsWith':
        return rawFieldValue.toLowerCase().startsWith(
              (rawValue?.toString() ?? '').toLowerCase(),
            );

      case 'endsWith':
        return rawFieldValue.toLowerCase().endsWith(
              (rawValue?.toString() ?? '').toLowerCase(),
            );

      case 'isEmpty':
        return rawFieldValue.isEmpty;

      case 'isNotEmpty':
        return rawFieldValue.isNotEmpty;

      default:
        return true;
    }
  }
}
