import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import 'leave_add_constants.dart';

/// Một phiếu: ngày, buổi, loại, lý do.
class LeaveSlipFormFields extends StatelessWidget {
  const LeaveSlipFormFields({
    super.key,
    required this.slipKey,
    required this.todayStart,
    required this.bypassDateRules,
    this.readOnly = false,
    this.dateRangeLine,
    this.initialLeaveDate,
    this.initialSessionCode,
    this.initialTypeCode,
    this.initialReason,
    this.onDateChanged,
  });

  final String slipKey;
  final DateTime todayStart;
  final bool bypassDateRules;
  final bool readOnly;

  /// Dòng phụ dưới nhãn ngày (vd. khoảng Start–End từ API).
  final String? dateRangeLine;
  final DateTime? initialLeaveDate;
  final String? initialSessionCode;
  final String? initialTypeCode;
  final String? initialReason;
  final void Function(DateTime?)? onDateChanged;

  DateTime get _leaveDayCalendar => initialLeaveDate ?? todayStart;

  /// Cho phép mở picker khi sửa đơn có ngày trong quá khứ (so với “hôm nay”).
  DateTime get _pickerFirstDate {
    if (bypassDateRules) return DateTime(1900);
    final slip = initialLeaveDate;
    if (slip != null) {
      final sd = DateTime(slip.year, slip.month, slip.day);
      final td = DateTime(todayStart.year, todayStart.month, todayStart.day);
      if (sd.isBefore(td)) return sd;
    }
    return todayStart;
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey<String>(slipKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (dateRangeLine != null && dateRangeLine!.isNotEmpty) ...[
            Text(
              dateRangeLine!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 6),
          ],
          FormDateTimePicker(
            nameForm: 'leave_slip_${slipKey}_date',
            nameTimePicker: 'leave_slip_${slipKey}_date_inner',
            label: 'Ngày nghỉ',
            icon: Icons.date_range_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialValue: _leaveDayCalendar,
            initialDate: _leaveDayCalendar,
            enabled: !readOnly,
            firstDate: _pickerFirstDate,
            selectableDayPredicate: bypassDateRules || readOnly
                ? null
                : (day) => ValidateHelper.leaveDateSelectable(
                      day,
                      todayStart: todayStart,
                      bypassDateRules: false,
                    ),
            isRequired: true,
            onChanged: onDateChanged,
            validator: (v) {
              if (v == null) return 'Vui lòng chọn ngày nghỉ';
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 16),

          // ── Buổi nghỉ ──
          _buildChoiceGroup<String>(
            context: context,
            name: 'leave_slip_${slipKey}_session',
            label: 'Buổi nghỉ',
            icon: Icons.access_time_outlined,
            initialValue: initialSessionCode ?? '1',
            enabled: !readOnly,
            options: kLeaveSessionOptions
                .map((o) => _ChoiceOption(value: o.value.toString(), label: o.label))
                .toList(),
          ),
          const SizedBox(height: 16),

          // ── Loại nghỉ ──
          _buildChoiceGroup<String>(
            context: context,
            name: 'leave_slip_${slipKey}_type',
            label: 'Loại nghỉ',
            icon: Icons.assignment_outlined,
            initialValue: initialTypeCode ?? '1',
            enabled: !readOnly,
            options: kLeaveTypeOptions
                .map((o) => _ChoiceOption(
                      value: o.value.toString(),
                      label: o.label,
                      // Màu sắc tương ứng theo loại nghỉ
                      selectedColor: o.value == 1
                          ? AppColors.stateErrorColor
                          : o.value == 2
                              ? AppColors.stateSuccessColor
                              : AppColors.stateWarningColor,
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),

          FormInputField(
            label: 'Lý do',
            nameForm: 'leave_slip_${slipKey}_reason',
            nameTextField: 'leave_slip_${slipKey}_reason_tf',
            icon: Icons.note_alt_outlined,
            maxLines: 2,
            readOnly: readOnly,
            initialValue: initialReason,
            isRequired: true,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Vui lòng nhập lý do';
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceGroup<T>({
    required BuildContext context,
    required String name,
    required String label,
    required IconData icon,
    required List<_ChoiceOption<T>> options,
    T? initialValue,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primaryERP),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.neutralText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        FormBuilderField<T>(
          name: name,
          initialValue: initialValue,
          enabled: enabled,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<T?> field) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: options.map((option) {
                final isSelected = field.value == option.value;
                final primaryColor = option.selectedColor ?? AppColors.primaryERP;
                
                return GestureDetector(
                  onTap: enabled ? () => field.didChange(option.value) : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? primaryColor.withValues(alpha: 0.1)
                          : AppColors.white.withValues(alpha:0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected ? primaryColor : AppColors.black.withValues(alpha: 0.1),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      option.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? primaryColor : AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _ChoiceOption<T> {
  final T value;
  final String label;
  final Color? selectedColor;

  _ChoiceOption({
    required this.value,
    required this.label,
    this.selectedColor,
  });
}
