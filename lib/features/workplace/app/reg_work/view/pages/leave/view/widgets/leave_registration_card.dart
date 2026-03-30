import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/widgets/form/index.dart';
import 'leave_add_constants.dart';

/// Ngày đăng ký, Phòng ban, Nhân viên (readonly), Người duyệt.
/// Validate nghiệp vụ chỉ khi bấm Gửi (màn hình).
class LeaveRegistrationCard extends StatelessWidget {
  const LeaveRegistrationCard({
    super.key,
    required this.todayStart,
    required this.onPickApprover,
    this.approverPickerEnabled = true,
  });

  final DateTime todayStart;
  final VoidCallback onPickApprover;
  final bool approverPickerEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Đồng bộ bloc → form để `_computeSubmitEnabled` đọc được qua `form.value`.
        FormBuilderField<String>(
          name: 'leave_add_department',
          initialValue: '',
          autovalidateMode: AutovalidateMode.disabled,
          builder: (_) => const SizedBox.shrink(),
        ),
        FormBuilderField<String>(
          name: 'leave_add_employee',
          initialValue: '',
          autovalidateMode: AutovalidateMode.disabled,
          builder: (_) => const SizedBox.shrink(),
        ),
        FormDateTimePicker(
          nameForm: 'regwork_leave_detail_date',
          nameTimePicker: kLeaveRegDateInnerUnused,
          label: 'Ngày đăng ký',
          icon: Icons.date_range,
          inputType: InputType.date,
          format: DateFormat('dd/MM/yyyy'),
          initialValue: todayStart,
          initialDate: todayStart,
          enabled: false,
          autovalidateMode: AutovalidateMode.disabled,
        ),
        const SizedBox(height: 12),
        FormBuilderField<String>(
          name: 'regwork_leave_add_approver_id',
          initialValue: '',
          autovalidateMode: AutovalidateMode.disabled,
          builder: (state) {
            return const SizedBox.shrink();
          },
        ),
        GestureDetector(
          onTap: approverPickerEnabled ? onPickApprover : null,
          child: AbsorbPointer(
            child: FormInputField(
              readOnly: true,
              nameForm: 'regwork_leave_add_approver_text',
              nameTextField: 'regwork_leave_add_approver_text_tf',
              label: 'Người duyệt',
              icon: Icons.supervisor_account_outlined,
              autovalidateMode: AutovalidateMode.disabled,
            ),
          ),
        ),
      ],
    );
  }
}
