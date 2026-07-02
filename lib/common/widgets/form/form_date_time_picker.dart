import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class FormDateTimePicker extends StatefulWidget {
  final String nameForm;
  final GlobalKey<FormBuilderFieldState>? formFieldKey;

  final String nameTimePicker;
  final GlobalKey<FormBuilderFieldState>? timePickerFieldKey;
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

  /// Key cho phép bên ngoài gọi `setValue(...)` để cập nhật cả UI lẫn form state
  /// một cách chắc chắn (giải quyết trường hợp gọi `didChange` từ bên ngoài
  /// nhưng TextField không rebuild).
  final GlobalKey<FormDateTimePickerState>? pickerKey;

  const FormDateTimePicker({
    super.key,
    required this.nameForm,
    this.formFieldKey,
    required this.nameTimePicker,
    this.timePickerFieldKey,
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
    this.pickerKey,
  });

  @override
  State<FormDateTimePicker> createState() => FormDateTimePickerState();
}

/// Public state để bên ngoài có thể truy cập qua [FormDateTimePicker.pickerKey].
class FormDateTimePickerState extends State<FormDateTimePicker> {
  FocusNode? _internalFocusNode;
  final GlobalKey<FormBuilderFieldState> _fieldKey =
      GlobalKey<FormBuilderFieldState>();
  final GlobalKey<FormBuilderFieldState> _innerFieldKey =
      GlobalKey<FormBuilderFieldState>();

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_internalFocusNode ??= FocusNode());
  }

  /// Set value cho cả outer + inner field, đồng thời force rebuild để
  /// TextField hiển thị text mới (gọi từ bên ngoài qua [pickerKey]).
  ///
  /// Gọi `didChange` trên field chỉ set `value` + `setState`, nhưng nếu
  /// widget tree cha không rebuild, TextField controller bên trong
  /// `FormBuilderDateTimePicker` có thể không được refresh. Method này
  /// đảm bảo UI update bằng cách ép state ngoài cùng setState.
  void setValue(DateTime? value) {
    if (!mounted) return;
    setState(() {
      _innerFieldKey.currentState?.didChange(value);
      _fieldKey.currentState?.didChange(value);
    });
  }

  /// Gọi didChange trên CẢ inner (FormBuilderDateTimePicker) lẫn outer
  /// (FormBuilderField) để đảm bảo:
  /// - Inner TextField UI update
  /// - Outer field value lưu vào FormBuilder
  void _syncValue(DateTime? value) {
    _innerFieldKey.currentState?.didChange(value);
    // Outer sẽ tự update qua onChanged callback của inner. Nhưng để chắc chắn
    // (trường hợp inner chưa mount), vẫn gọi cả outer.
    _fieldKey.currentState?.didChange(value);
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
      if (widget.initialValue == null) return;
      final innerCurrent = _innerFieldKey.currentState?.value;
      final outerCurrent = _fieldKey.currentState?.value;
      if (innerCurrent == null && outerCurrent == null) {
        _syncValue(widget.initialValue);
      } else if (outerCurrent == null) {
        _fieldKey.currentState?.didChange(widget.initialValue);
      }
    });
  }

  @override
  void didUpdateWidget(covariant FormDateTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync khi initialValue thay đổi từ bên ngoài (ví dụ: auto-fill Deadline
    // từ KT dự kiến). Chỉ patch nếu giá trị hiện tại của form chưa khớp với
    // initialValue mới → tránh ghi đè khi user đã tự chọn bằng tay.
    if (!_isSameDateTime(widget.initialValue, oldWidget.initialValue)) {
      final current = _fieldKey.currentState?.value;
      if (!_isSameDateTime(current, widget.initialValue)) {
        _syncValue(widget.initialValue);
      }
    }
  }

  bool _isSameDateTime(DateTime? a, DateTime? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    if (widget.inputType == InputType.date) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }
    if (widget.inputType == InputType.time) {
      return a.hour == b.hour && a.minute == b.minute;
    }
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day &&
        a.hour == b.hour &&
        a.minute == b.minute;
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
          key: _innerFieldKey,
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
