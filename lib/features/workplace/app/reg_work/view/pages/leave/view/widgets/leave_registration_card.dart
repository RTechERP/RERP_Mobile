import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/widgets/form/index.dart';
import 'leave_add_constants.dart';

/// Ngày đăng ký, Phòng ban, Nhân viên (readonly), Người duyệt.
/// Khi [isAdminOrHr] == true, thêm ô chọn nhân viên (Admin/HR đăng ký hộ).
class LeaveRegistrationCard extends StatelessWidget {
  const LeaveRegistrationCard({
    super.key,
    required this.todayStart,
    required this.onPickApprover,
    this.approverPickerEnabled = true,
    /// Admin / HR: bật picker "Ngày đăng ký" — chọn ngày tự do.
    this.regDatePickerEnabled = false,
    this.regDateInitialValue,
    this.isAdminOrHr = false,
    this.onPickEmployee,
    this.employeePickerEnabled = true,
  });

  final DateTime todayStart;
  final VoidCallback? onPickApprover;
  final bool approverPickerEnabled;
  final bool regDatePickerEnabled;
  /// Giá trị khởi tạo cho ô ngày đăng ký (màn chi tiết lấy từ API).
  final DateTime? regDateInitialValue;
  /// Hiện ô chọn nhân viên (chỉ Admin / HR).
  final bool isAdminOrHr;
  final VoidCallback? onPickEmployee;
  final bool employeePickerEnabled;

  @override
  Widget build(BuildContext context) {
    final regDate = regDateInitialValue ?? todayStart;
    return Column(
      children: [
        // Field ẩn đồng bộ bloc → form.
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
          initialValue: regDate,
          initialDate: regDate,
          enabled: regDatePickerEnabled,
          firstDate: regDatePickerEnabled ? DateTime(1900) : todayStart,
          isRequired: true,
          validator: (v) {
            if (v == null) return 'Vui lòng chọn ngày đăng ký';
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        if (isAdminOrHr) ...[
          const SizedBox(height: 12),
          // Field ẩn lưu ID nhân viên (dùng khi submit).
          FormBuilderField<String>(
            name: 'regwork_leave_employee_id',
            initialValue: '',
            autovalidateMode: AutovalidateMode.disabled,
            builder: (_) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: employeePickerEnabled ? onPickEmployee : null,
            child: AbsorbPointer(
              child: FormInputField(
                readOnly: true,
                nameForm: 'regwork_leave_employee_text',
                nameTextField: 'regwork_leave_employee_text_tf',
                label: 'Nhân viên',
                icon: Icons.person_outline,
                autovalidateMode: AutovalidateMode.disabled,
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        FormBuilderField<String>(
          name: 'regwork_leave_add_approver_id',
          initialValue: '',
          autovalidateMode: AutovalidateMode.disabled,
          builder: (_) => const SizedBox.shrink(),
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
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Vui lòng chọn người duyệt';
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ),
      ],
    );
  }
}
