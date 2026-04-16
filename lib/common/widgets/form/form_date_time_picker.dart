import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class FormDateTimePicker extends StatefulWidget {
  final String nameForm;

  final String nameTimePicker;
  final String label;
  final IconData icon;

  final InputType inputType;
  final DateFormat format;
  final bool enabled;
  final bool isRequired;

  final DateTime? initialValue;
  final DateTime? firstDate;
  final DateTime? lastDate;
  /// Ngày lịch mở ra khi bấm chọn (Material date picker).
  final DateTime? initialDate;
  final SelectableDayPredicate? selectableDayPredicate;
  final ValueChanged<DateTime?>? onChanged;
  final ValueChanged<DateTime?>? onSaved;
  final FormFieldValidator<DateTime?>? validator;
  final AutovalidateMode autovalidateMode;
  final FocusNode? focusNode;

  const FormDateTimePicker({
    super.key,
    required this.nameForm,
    required this.nameTimePicker,
    required this.label,
    required this.icon,
    required this.inputType,
    required this.format,
    this.enabled = true,
    this.isRequired = false,
    this.initialValue,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.selectableDayPredicate,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.focusNode,
  });

  @override
  State<FormDateTimePicker> createState() => _FormDateTimePickerState();
}

class _FormDateTimePickerState extends State<FormDateTimePicker> {
  FocusNode? _internalFocusNode;
  final GlobalKey<FormBuilderFieldState> _fieldKey =
      GlobalKey<FormBuilderFieldState>();

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_internalFocusNode ??= FocusNode());
  }

  @override
  void initState() {
    super.initState();
    // FormBuilderDateTimePicker quản lý internal field riêng, không gọi didChange
    // khi khởi tạo initialValue. Gọi didChange với initialValue để sync outer
    // field state → icon/error hiển thị đúng ngay khi form mở (autovalidateMode
    // onUserInteraction không tự trigger, cần sync thủ công).
    // KHÔNG gọi validate() ở đây vì sẽ chạy validator trên TẤT CẢ required fields
    // ngay khi mở màn, gây error icon sai cho các field chưa có giá trị.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final current = _fieldKey.currentState?.value;
      if (current == null && widget.initialValue != null) {
        _fieldKey.currentState?.didChange(widget.initialValue);
      }
    });
  }

  @override
  void dispose() {
    _internalFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime?>(
      key: _fieldKey,
      name: widget.nameForm,
      initialValue: widget.initialValue,
      validator: widget.validator,
      enabled: widget.enabled,
      autovalidateMode: widget.autovalidateMode,
      focusNode: _effectiveFocusNode,
      builder: (field) {
        return FormBuilderDateTimePicker(
          name: widget.nameTimePicker,
          inputType: widget.inputType,
          format: widget.format,
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          initialDate: widget.initialDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          selectableDayPredicate: widget.selectableDayPredicate,
          autovalidateMode: widget.autovalidateMode,
          focusNode: _effectiveFocusNode,

          onChanged: (v) {
            field.didChange(v);       // 🔑 sync state cho validator
            widget.onChanged?.call(v);
          },
          onSaved: (v) {
            widget.onSaved?.call(v);
          },

          decoration: formInputDecoration(
            context,
            label: widget.label,
            icon: widget.icon,
            hasError: field.hasError,     // ✅ đổi màu icon khi lỗi
            errorText: field.errorText,   // ✅ show text lỗi
            isRequired: widget.isRequired,
          ),
          validator: widget.validator,
        );
      },
    );
  }
}
