import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../../common/widgets/form/index.dart';
import '../bloc/work_requirement_bloc.dart';

class WorkRequirementInfoCard extends StatelessWidget {
  const WorkRequirementInfoCard({
    super.key,
    required this.state,
    required this.onDateRequestChanged,
    required this.onDeadlineChanged,
    required this.onOpenRequiredDept,
    required this.onOpenCoordinationDept,
    required this.onOpenApprover,
  });

  final WorkRequirementState state;
  final ValueChanged<DateTime?> onDateRequestChanged;
  final ValueChanged<DateTime?> onDeadlineChanged;
  final VoidCallback onOpenRequiredDept;
  final VoidCallback onOpenCoordinationDept;
  final VoidCallback onOpenApprover;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:[
            Expanded(
              child: AbsorbPointer(
                child: FormDateTimePicker(
                  icon: Icons.calendar_today,
                  nameForm: 'date_request',
                  nameTimePicker: 'date_request_picker',
                  label: 'Yêu cầu',
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  isRequired: true,
                  initialValue: DateTime.now(),
                  onChanged: onDateRequestChanged,
                  validator: (v) {
                    if (v == null) return 'Vui lòng chọn ngày';
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: FormDateTimePicker(
                icon: Icons.event_available,
                nameForm: 'deadline',
                nameTimePicker: 'deadline_picker',
                label: 'Hoàn thành',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
                isRequired: true,
                initialValue: DateTime.now(),
                firstDate: DateTime.now(),
                onChanged: onDeadlineChanged,
                validator: (v) {
                  if (v == null) return 'Vui lòng chọn ngày';
                  return null;
                },
              ),
            ),
          ]
        ),

        const SizedBox(height: 12),
        FormInputField(
          readOnly: true,
          nameForm: 'approver',
          nameTextField: 'approver_text',
          label: 'TBP duyệt',
          icon: Icons.approval,
          isRequired: true,
          initialValue: state.approverDisplayName,
          onTap: onOpenApprover,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Vui lòng chọn TBP duyệt';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        FormInputField(
          readOnly: true,
          nameForm: 'required_department',
          nameTextField: 'required_department_text',
          label: 'Bộ phận được yêu cầu',
          icon: Icons.business,
          isRequired: true,
          initialValue: state.requiredDepartmentName,
          onTap: onOpenRequiredDept,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Vui lòng chọn bộ phận';
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        FormInputField(
          readOnly: true,
          nameForm: 'coordination_department',
          nameTextField: 'coordination_department_text',
          label: 'Bộ phận phối hợp',
          icon: Icons.sync_alt,
          initialValue: state.coordinationDepartmentName,
          onTap: onOpenCoordinationDept,
        ),

      ],
    );
  }
}
