import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class WfhDetailScreen extends StatefulWidget {
  const WfhDetailScreen({super.key});

  @override
  State<WfhDetailScreen> createState() => _WfhDetailScreenState();
}

class _WfhDetailScreenState extends State<WfhDetailScreen> {
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
        title: const Text('Chi tiết đơn WFH'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.create_outlined),
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
                      /// ===== THÔNG TIN WFH =====
                      FormCard(
                        title: 'Thông tin làm việc tại nhà',
                        child: Column(
                          children: [
                            /// THỜI GIAN (BUỔI)
                            _isEditing
                                ? FormTypeDropDown<String>(
                                    name: 'regwork_wfh_detail_session',
                                    label: 'Thời gian',
                                    icon: Icons.schedule_outlined,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'morning',
                                        child: Text('Buổi sáng'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'afternoon',
                                        child: Text('Buổi chiều'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'full_day',
                                        child: Text('Cả ngày'),
                                      ),
                                    ],
                                  )
                                : const FormReadonlyField(
                              label: '',

                                    name: 'Cả ngày',
                                    icon: Icons.schedule_outlined,
                                  ),

                            const SizedBox(height: 12),

                            /// NGÀY
                            _isEditing
                                ? FormDateTimePicker(
                                    nameForm: 'regwork_wfh_detail_date',
                                    nameTimePicker: 'wfh_detail_date_time',
                                    label: 'Ngày',
                                    icon: Icons.date_range_outlined,
                                    inputType: InputType.date,
                                    format: DateFormat('dd/MM/yyyy'),
                                  )
                                : const FormReadonlyField(
                              label: '',

                                    name: '25/01/2026',
                                    icon: Icons.date_range_outlined,
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// ===== NGƯỜI KIỂM DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'regwork_wfh_detail_approver',
                          label: 'Người duyệt',
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

                      /// ===== Nội dung / Kế hoạch công việc =====
                      FormCard(
                        title: 'Nội dung/Kế hoạch',
                        child: _isEditing
                            ? FormInputField(
                                nameForm: 'regwork',
                                nameTextField: 'regwork_wfh_add_reason',
                                label: '',
                                icon: Icons.content_paste,
                                maxLines: 3,
                              )
                            : const FormReadonlyField(
                          label: '',

                                name: 'Nội dung',
                                icon: Icons.content_paste,
                              ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: FormInputField(
                          enabled: _isEditing,
                          nameForm: 'wfh',
                          nameTextField: 'regwork_wfh_detail_reason',
                          label: 'Lý do',
                          icon: Icons.note_alt_outlined,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== ACTION =====
              FormActions(
                mode: _isEditing ? FormActionMode.edit : FormActionMode.view,
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
