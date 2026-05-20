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
    this.fieldKey,
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

  /// GlobalKey để screen có thể gọi didChange từ bên ngoài
  /// (dùng sau patchValue khi FormBuilderField chưa mount).
  final GlobalKey<FormBuilderFieldState>? fieldKey;

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

  /// Callback khi field được tạo, truyền field state để screen có thể
  /// gọi didChange từ bên ngoài.
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

  /// Chuẩn hóa ellipsis: '...' → '…' (U+2026), rồi trim.
  String _norm(String s) => s.replaceAll('...', '\u2026').trim();

  /// Normalize giá trị để so sánh với options.
  String? _normValue(Object? v) {
    if (v == null) return null;
    final s = v is T ? v.toString() : v.toString();
    return _norm(s);
  }

  /// Tìm index của option khớp với [raw] (normalize trước so sánh).
  int _matchIndex(Object? raw) {
    if (raw == null || widget.options.isEmpty) return -1;
    final nv = _normValue(raw);
    for (int i = 0; i < widget.options.length; i++) {
      if (_normValue(widget.options[i].value) == nv) return i;
    }
    return -1;
  }

  /// Resolve giá trị hiển thị chip.
  /// Ưu tiên: field.value đã sync (qua didChange / user tap).
  /// Fallback: đọc từ FormBuilder state (initialValue map, patchValue).
  T? _resolveDisplayValue(T? fieldValue) {
    // 1. field.value đã sync → dùng trực tiếp
    if (fieldValue != null) return fieldValue;

    // 2. Fallback: đọc từ FormBuilder state
    final formState = FormBuilder.of(context);
    if (formState != null) {
      final raw = formState.initialValue?[widget.name] ??
                  formState.value?[widget.name];
      if (raw != null) {
        final idx = _matchIndex(raw);
        if (idx >= 0) return widget.options[idx].value;
        return _normValue(raw) as T?;
      }
    }

    // 3. Fallback cuối: widget.initialValue
    final idx = _matchIndex(widget.initialValue);
    if (idx >= 0) return widget.options[idx].value;
    return widget.options.isNotEmpty ? widget.options.first.value : null;
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
          key: widget.fieldKey,
          name: widget.name,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          validator: _effectiveValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          onReset: () {},
          builder: (field) {
            if (field.value == null && widget.initialValue != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                field.didChange(widget.initialValue);
              });
            }
            final displayValue = _resolveDisplayValue(field.value);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.onFieldCreated?.call(field);
            });
            return _buildChoiceChips(field, displayValue);
          },
        ),
      ],
    );
  }

  Widget _buildChoiceChips(FormFieldState<T?> field, T? displayValue) {
    if (widget.options.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        final isSelected = _normValue(displayValue) == _normValue(option.value);
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
