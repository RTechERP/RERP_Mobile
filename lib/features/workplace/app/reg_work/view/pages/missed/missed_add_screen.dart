import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class MissedAddScreen extends StatefulWidget {
  const MissedAddScreen ({super.key});

  @override
  State<MissedAddScreen> createState() => _MissedAddScreenState();
}

class _MissedAddScreenState extends State<MissedAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _autoSetTimeByType(String? type) {
    if (type == null) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, h, m);
    }

    if (type == 'check_in') {
      form.fields['regwork_missed_add_time']
          ?.didChange(time(8, 0));
    }

    if (type == 'check_out') {
      form.fields['regwork_missed_add_time']
          ?.didChange(time(17, 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn quên chấm công'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// INFO
                      FormCard(
                        title: 'Thông tin quên chấm công',
                        child: Column(
                          children: [
                            FormDateTimePicker(
                              name: 'regwork_missed_add_date',
                              label: 'Ngày',
                              icon: Icons.date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                            ),

                            const SizedBox(height: 12),

                            FormTypeDropDown<String>(
                              name: 'regwork_missed_add_type',
                              label: 'Loại',
                              icon: Icons.fingerprint_outlined,
                              onChanged: _autoSetTimeByType,
                              items: const [
                                DropdownMenuItem(
                                  value: 'check_in',
                                  child: Text('Quên check-in'),
                                ),
                                DropdownMenuItem(
                                  value: 'check_out',
                                  child: Text('Quên check-out'),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'regwork_missed_add_approver',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              FormActions(
                mode: FormActionMode.add,
                onSubmit: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_formKey.currentState!.value.toString());
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
