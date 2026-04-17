import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Lựa chọn trong nhóm, hỗ trợ custom màu khi được chọn.
class FormChoiceOption<T> {
  final T value;
  final String label;
  final Color? selectedColor;

  const FormChoiceOption({
    required this.value,
    required this.label,
    this.selectedColor,
  });
}

/// Widget chọn lựa dạng chip/button group cho FormBuilder.
///
/// Dùng thay thế dropdown khi cần hiển thị trực quan các lựa chọn.
class FormChoiceGroup<T> extends StatefulWidget {
  const FormChoiceGroup({
    super.key,
    required this.name,
    required this.label,
    required this.icon,
    required this.options,
    this.initialValue,
    this.isRequired = false,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.onFieldCreated,
  });

  /// Tên field trong FormBuilder.
  final String name;

  /// Label hiển thị phía trên.
  final String label;

  /// Icon hiển thị cạnh label.
  final IconData icon;

  /// Danh sách các lựa chọn.
  final List<FormChoiceOption<T>> options;

  /// Giá trị ban đầu.
  final T? initialValue;

  /// Bắt buộc chọn.
  final bool isRequired;

  /// Có enable field không.
  final bool enabled;

  /// Validator tùy chỉnh.
  final FormFieldValidator<T>? validator;

  /// Callback khi giá trị thay đổi.
  final ValueChanged<T?>? onChanged;

  /// Callback khi field được tạo.
  final ValueChanged<FormFieldState<T>>? onFieldCreated;

  @override
  State<FormChoiceGroup<T>> createState() => _FormChoiceGroupState<T>();
}

class _FormChoiceGroupState<T> extends State<FormChoiceGroup<T>> {
  FormFieldValidator<T>? get _effectiveValidator {
    if (widget.isRequired) {
      return (v) {
        if (v == null) {
          return 'Vui lòng chọn ${widget.label.toLowerCase()}';
        }
        return widget.validator?.call(v);
      };
    }
    return widget.validator;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(widget.icon, size: 18, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (widget.isRequired)
              Text(
                ' *',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade700,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        FormBuilderField<T>(
          name: widget.name,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          validator: _effectiveValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          onReset: () {},
          builder: (field) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.onFieldCreated?.call(field);
            });
            return _buildChoiceChips(field);
          },
        ),
      ],
    );
  }

  Widget _buildChoiceChips(FormFieldState<T?> field) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        final isSelected = field.value == option.value;
        final selectedColor = option.selectedColor ?? Theme.of(context).primaryColor;

        return GestureDetector(
          onTap: widget.enabled ? () => field.didChange(option.value) : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? selectedColor.withValues(alpha: 0.1)
                  : Colors.grey.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? selectedColor : Colors.grey.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            child: Text(
              option.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? selectedColor : Colors.grey.shade700,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
