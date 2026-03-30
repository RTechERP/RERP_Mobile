import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/helpers/validate_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

/// Một phiếu: ngày, buổi, loại, lý do. Validate nghiệp vụ chỉ khi bấm Gửi (màn hình).
class LeaveSlipFormFields extends StatelessWidget {
  const LeaveSlipFormFields({
    super.key,
    required this.slipKey,
    required this.todayStart,
    required this.bypassDateRules,
    required this.onSessionTap,
    required this.onTypeTap,
  });

  final String slipKey;
  final DateTime todayStart;
  final bool bypassDateRules;
  final void Function(String slipKey) onSessionTap;
  final void Function(String slipKey) onTypeTap;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey<String>(slipKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormDateTimePicker(
            nameForm: 'leave_slip_${slipKey}_date',
            nameTimePicker: 'leave_slip_${slipKey}_date_inner',
            label: 'Ngày nghỉ',
            icon: Icons.date_range_outlined,
            inputType: InputType.date,
            format: DateFormat('dd/MM/yyyy'),
            initialValue: todayStart,
            initialDate: todayStart,
            firstDate: bypassDateRules ? DateTime(1900) : todayStart,
            selectableDayPredicate: bypassDateRules
                ? null
                : (day) => ValidateHelper.leaveDateSelectable(
                      day,
                      todayStart: todayStart,
                      bypassDateRules: false,
                    ),
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(height: 12),
          FormBuilderField<String>(
            name: 'leave_slip_${slipKey}_session',
            initialValue: '1',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: () => onSessionTap(slipKey),
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'leave_slip_${slipKey}_session_text',
                nameTextField: 'leave_slip_${slipKey}_session_text_tf',
                label: 'Buổi nghỉ',
                icon: Icons.access_time_outlined,
                initialValue: 'Buổi sáng',
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
          const SizedBox(height: 12),
          FormBuilderField<String>(
            name: 'leave_slip_${slipKey}_type',
            initialValue: '1',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: () => onTypeTap(slipKey),
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'leave_slip_${slipKey}_type_text',
                nameTextField: 'leave_slip_${slipKey}_type_text_tf',
                label: 'Loại nghỉ',
                icon: Icons.assignment_outlined,
                initialValue: 'Nghỉ không lương',
                autovalidateMode: AutovalidateMode.disabled,
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
            autovalidateMode: AutovalidateMode.disabled,
          ),
        ],
      ),
    );
  }
}
