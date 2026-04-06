import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

/// Một phiếu: ngày, buổi, loại, lý do. Validate nghiệp vụ chỉ khi bấm Gửi (màn hình).
///
/// [initialLeaveDate] / session & type từ API: dùng màn chi tiết để khớp ngay lần mount
/// (không phụ thuộc [DateTime.now] làm ngày phiếu).
class LeaveSlipFormFields extends StatelessWidget {
  const LeaveSlipFormFields({
    super.key,
    required this.slipKey,
    required this.todayStart,
    required this.bypassDateRules,
    required this.onSessionTap,
    required this.onTypeTap,
    this.readOnly = false,
    this.dateRangeLine,
    this.initialLeaveDate,
    this.initialSessionCode,
    this.initialSessionLabel,
    this.initialTypeCode,
    this.initialTypeLabel,
    this.initialReason,
  });

  final String slipKey;
  final DateTime todayStart;
  final bool bypassDateRules;
  final void Function(String slipKey) onSessionTap;
  final void Function(String slipKey) onTypeTap;
  final bool readOnly;
  /// Dòng phụ dưới nhãn ngày (vd. khoảng Start–End từ API).
  final String? dateRangeLine;
  final DateTime? initialLeaveDate;
  final String? initialSessionCode;
  final String? initialSessionLabel;
  final String? initialTypeCode;
  final String? initialTypeLabel;
  final String? initialReason;

  DateTime get _leaveDayCalendar =>
      initialLeaveDate ?? todayStart;

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
            validator: (v) {
              if (v == null) return 'Vui lòng chọn ngày nghỉ';
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 12),
          FormBuilderField<String>(
            name: 'leave_slip_${slipKey}_session',
            initialValue: initialSessionCode ?? '1',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: readOnly ? null : () => onSessionTap(slipKey),
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'leave_slip_${slipKey}_session_text',
                nameTextField: 'leave_slip_${slipKey}_session_text_tf',
                label: 'Buổi nghỉ',
                icon: Icons.access_time_outlined,
                initialValue: initialSessionLabel ?? 'Buổi sáng',
                isRequired: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Vui lòng chọn buổi nghỉ';
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormBuilderField<String>(
            name: 'leave_slip_${slipKey}_type',
            initialValue: initialTypeCode ?? '1',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: readOnly ? null : () => onTypeTap(slipKey),
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'leave_slip_${slipKey}_type_text',
                nameTextField: 'leave_slip_${slipKey}_type_text_tf',
                label: 'Loại nghỉ',
                icon: Icons.assignment_outlined,
                initialValue: initialTypeLabel ?? 'Nghỉ không lương',
                isRequired: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Vui lòng chọn loại nghỉ';
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
          const SizedBox(height: 12),
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
}
