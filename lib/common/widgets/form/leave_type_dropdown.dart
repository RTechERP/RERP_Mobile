import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'form_input_decoration.dart';

class LeaveTypeDropdown extends StatelessWidget {
  final String name;

  const LeaveTypeDropdown({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: name,
      decoration: formInputDecoration(
        context,
        label: 'Loại nghỉ',
        icon: Icons.assignment_outlined,
      ),
      items: const [
        DropdownMenuItem(
          value: 'annual',
          child: Text('Nghỉ phép năm'),
        ),
        DropdownMenuItem(
          value: 'unpaid',
          child: Text('Nghỉ không lương'),
        ),
        DropdownMenuItem(
          value: 'sick',
          child: Text('Nghỉ bệnh'),
        ),
      ],
    );
  }
}
