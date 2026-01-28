import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LeaveDetailScreenPage extends StatefulWidget {
  const LeaveDetailScreenPage({super.key});

  @override
  State<LeaveDetailScreenPage> createState() => _LeaveDetailScreenPageState();
}

class _LeaveDetailScreenPageState extends State<LeaveDetailScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  void _toggleEdit() {
    setState(() => _isEditing = true);
  }

  void _cancelEdit() {
    _formKey.currentState?.reset();
    setState(() => _isEditing = false);
  }

  void _save() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(_formKey.currentState!.value.toString());
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn xin nghỉ'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.close : Icons.create_outlined,
            ),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== CONTENT =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// ===== THÔNG TIN NGHỈ =====
                      FormCard(
                        title: 'Thông tin nghỉ phép',
                        child: Column(
                          children: [
                            _isEditing
                                ? TypeDropDown<String>(
                              name: 'regwork_leave_detail_type',
                              label: 'Loại nghỉ',
                              icon: Icons.assignment_outlined,
                              items: const [
                                DropdownMenuItem(value: 'annual', child: Text('Nghỉ phép năm')),
                                DropdownMenuItem(value: 'unpaid', child: Text('Nghỉ không lương')),
                                DropdownMenuItem(value: 'sick', child: Text('Nghỉ bệnh')),
                              ],
                            )
                                : const ReadonlyField(
                              value: 'Nghỉ phép năm',
                              icon: Icons.assignment_outlined,
                            ),

                            const SizedBox(height: 12),

                            _isEditing
                                ? FormBuilderDateTimePicker(
                              name: 'regwork_leave_detail_date',
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                              decoration: formInputDecoration(
                                context,
                                label: 'Ngày nghỉ',
                                icon: Icons.date_range_outlined,
                              ),
                            )
                                : const ReadonlyField(
                              value: '25/01/2026',
                              icon: Icons.date_range_outlined,
                            ),


                            const SizedBox(height: 12),

                            InputField(
                              enabled: _isEditing,
                              nameForm: 'leave',
                              nameTextField:
                              'regwork_leave_detail_duration',
                              label: 'Thời gian',
                              icon: Icons.schedule_outlined,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI KIỂM DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: TypeDropDown<String>(
                          name: 'regwork_leave_detail_approver',
                          label: 'Người kiểm duyệt',
                          icon: Icons.supervisor_account_outlined,
                          enabled: _isEditing,
                          items: const [
                            DropdownMenuItem(
                              value: 'manager',
                              child: Text('Quản lý trực tiếp'),
                            ),
                            DropdownMenuItem(
                              value: 'hr',
                              child: Text('Phòng nhân sự'),
                            ),
                            DropdownMenuItem(
                              value: 'director',
                              child: Text('Ban giám đốc'),
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 8),

                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do nghỉ',
                        child: InputField(
                          enabled: _isEditing,
                          nameForm: 'leave',
                          nameTextField:
                          'regwork_leave_detail_reason',
                          label: 'Lý do',
                          icon: Icons.note_alt_outlined,
                          maxLines: 5,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              /// ===== ACTION =====
              FormActions(
                mode: _isEditing
                    ? FormActionMode.edit
                    : FormActionMode.view,
                onView: () {},
                onCancel: _cancelEdit,
                onSave: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

