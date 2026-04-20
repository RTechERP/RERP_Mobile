import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Một lựa chọn cho [FormRadioGroup] (value gửi form + icon + nhãn hiển thị).
class FormRadioOption {
  final String value;
  final IconData icon;
  final String label;

  const FormRadioOption({
    required this.value,
    required this.icon,
    required this.label,
  });
}

/// Radio dạng thẻ (icon + text), bọc [FormBuilderRadioGroup].
class FormRadioGroup extends StatelessWidget {
  final String name;
  final List<FormRadioOption> options;
  final String? label;
  final bool enabled;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final InputDecoration? decoration;
  final OptionsOrientation orientation;
  final ControlAffinity controlAffinity;
  /// Khoảng cách giữa các lựa chọn (vertical/horizontal dùng [itemDecoration] + [wrapSpacing] của form_builder).
  final double optionSpacing;
  /// Tuỳ chỉnh viền/nền từng ô; mặc định [vertical] dùng ô trong suốt chỉ để tạo [optionSpacing].
  final BoxDecoration? itemDecoration;
  final bool isRequired;

  const FormRadioGroup({
    super.key,
    required this.name,
    required this.options,
    this.label,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.decoration,
    this.orientation = OptionsOrientation.vertical,
    this.controlAffinity = ControlAffinity.leading,
    this.optionSpacing = 8,
    this.itemDecoration,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveItemDecoration = itemDecoration ??
        (orientation == OptionsOrientation.vertical ||
                orientation == OptionsOrientation.horizontal
            ? const BoxDecoration()
            : null);

    return FormBuilderRadioGroup<String>(
      name: name,
      enabled: enabled,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      orientation: orientation,
      controlAffinity: controlAffinity,
      wrapSpacing: optionSpacing,
      itemDecoration: effectiveItemDecoration,
      decoration: decoration ??
          InputDecoration(
            label: label != null
                ? (isRequired
                    ? Text.rich(
                        TextSpan(
                          text: label,
                          children: const [
                            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      )
                    : Text(label!))
                : null,
            border: InputBorder.none,
          ),
      options: [
        for (final o in options)
          FormBuilderFieldOption<String>(
            value: o.value,
            child: _FormRadioOptionTile(
              fieldName: name,
              optionValue: o.value,
              icon: o.icon,
              label: o.label,
              enabled: enabled,
            ),
          ),
      ],
    );
  }
}

class _FormRadioOptionTile extends StatelessWidget {
  final String fieldName;
  final String optionValue;
  final IconData icon;
  final String label;
  final bool enabled;

  const _FormRadioOptionTile({
    required this.fieldName,
    required this.optionValue,
    required this.icon,
    required this.label,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final form = FormBuilder.of(context);
    final current = form?.instantValue[fieldName] as String?;
    final selected = current != null && current == optionValue;
    final theme = Theme.of(context);
    final borderColor = selected
        ? theme.colorScheme.primary
        : Colors.grey.shade300;

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: enabled ? borderColor : Colors.grey.shade300,
          ),
          color: selected
              ? theme.colorScheme.primary.withValues(alpha: 0.05)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}