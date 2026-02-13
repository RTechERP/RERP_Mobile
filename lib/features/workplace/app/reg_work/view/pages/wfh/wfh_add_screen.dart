import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class WfhAddScreen extends StatefulWidget {
  const WfhAddScreen({super.key});

  @override
  State<WfhAddScreen> createState() => _WfhAddScreenState();
}

class _WfhAddScreenState extends State<WfhAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn WFH'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== PHẦN SCROLL =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// ===== THÔNG TIN WFH =====
                      FormCard(
                        title: 'Thông tin làm việc tại nhà',
                        child: Column(
                          children: [
                            /// Ngày
                            FormDateTimePicker(
                              nameForm: 'regwork_wfh_add_date',
                              nameTimePicker: 'wfh_add_date_time',
                              label: 'Ngày',
                              icon: Icons.date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                            ),

                            const SizedBox(height: 12),

                            /// Buổi làm việc
                            FormTypeDropDown<String>(
                              name: 'regwork_wfh_add_session',
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
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI KIỂM DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'regwork_wfh_add_approver',
                          label: 'Người duyệt',
                          icon: Icons.supervisor_account_outlined,
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
                        child: FormInputField(
                          nameForm: 'regwork',
                          nameTextField: 'regwork_wfh_add_reason',
                          label: '',
                          icon: Icons.content_paste,
                          maxLines: 3,
                        ),
                      ),

                      const SizedBox(height: 8),
                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: FormInputField(
                          nameForm: 'regwork',
                          nameTextField: 'regwork_wfh_add_reason',
                          label: '',
                          icon: Icons.note_alt_outlined,
                          maxLines: 3,
                        ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),

              /// ===== NÚT GỬI =====
              FormActions(
                mode: FormActionMode.add,
                onSubmit: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final values = _formKey.currentState!.value;
                    debugPrint(values.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
