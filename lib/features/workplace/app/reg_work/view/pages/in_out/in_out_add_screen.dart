import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class InOutAddScreenPage extends StatefulWidget {
  const InOutAddScreenPage({super.key});

  @override
  State<InOutAddScreenPage> createState() => _InOutAddScreenPageState();
}

class _InOutAddScreenPageState extends State<InOutAddScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _autoSetTimeByType(String? type) {
    if (type == null) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, h, m);
    }

    if (type.contains('early')) {
      form.fields['regwork_inout_add_from']
          ?.didChange(time(16, 30));
      form.fields['regwork_inout_add_to']
          ?.didChange(time(17, 30));
    }

    if (type.contains('late')) {
      form.fields['regwork_inout_add_from']
          ?.didChange(time(8, 0));
      form.fields['regwork_inout_add_to']
          ?.didChange(time(9, 0));
    }
  }

  @override
  Widget build(BuildContext context) {

    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn'),
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
                      /// ===== THÔNG TIN RA / VÀO =====
                      FormCard(
                        title: 'Thông tin đi muộn - về sớm',
                        child: Column(
                          children: [
                            /// Ngày
                            FormDateTimePicker(
                              name: 'regwork_inout_add_date',
                              label: 'Ngày',
                              icon: Icons.date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                            ),

                            const SizedBox(height: 12),

                            /// Loại
                            FormTypeDropDown<String>(
                              name: 'regwork_inout_add_type',
                              label: 'Loại',
                              icon: Icons.swap_vert_outlined,
                              onChanged: _autoSetTimeByType,
                              items: const [
                                DropdownMenuItem(
                                  value: 'early_company',
                                  child: Text('Về sớm - Việc công ty'),
                                ),
                                DropdownMenuItem(
                                  value: 'early_personal',
                                  child: Text('Về sớm - Việc cá nhân'),
                                ),
                                DropdownMenuItem(
                                  value: 'late_company',
                                  child: Text('Đi muộn - Việc công ty'),
                                ),
                                DropdownMenuItem(
                                  value: 'late_personal',
                                  child: Text('Đi muộn - Việc cá nhân'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// TỪ - ĐẾN
                            Row(
                              children: [
                                Expanded(
                                  child: FormDateTimePicker(
                                    name: 'regwork_inout_add_from',
                                    label: 'Từ',
                                    icon: Icons.schedule_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: FormDateTimePicker(
                                    name: 'regwork_inout_add_to',
                                    label: 'Đến',
                                    icon: Icons.schedule_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                  ),
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
                          name: 'regwork_inout_add_approver',
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

                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: FormInputField(
                          nameForm: 'regwork',
                          nameTextField: 'regwork_inout_add_reason',
                          label: '',
                          icon: Icons.note_alt_outlined,
                          maxLines: 5,
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

