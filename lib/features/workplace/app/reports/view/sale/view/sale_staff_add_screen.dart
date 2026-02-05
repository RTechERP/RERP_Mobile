import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../common/enums/index.dart';

class SaleStaffAddScreen extends StatefulWidget {
  const SaleStaffAddScreen({super.key});

  @override
  State<SaleStaffAddScreen> createState() => _SaleStaffAddScreenState();
}

class _SaleStaffAddScreenState extends State<SaleStaffAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Tạo báo cáo Sale', style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(),
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: {
          'date': DateTime.now(),
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// ===== NGÀY =====
            FormCard(
              title: 'Ngày báo cáo',
              child: FormDateTimePicker(
                icon: Icons.calendar_today,
                name: 'date',
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
              ),
            ),

            const SizedBox(height: 12),

            /// ===== HOẠT ĐỘNG SALE =====
            FormCard(
              title: 'Hoạt động sale',
              child: FormInputField(
                icon: Icons.call_outlined,
                nameForm: 'sale_staff_activity',
                nameTextField: 'activity',
                label: 'Hoạt động sale trong ngày',
                maxLines: 4,
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KẾT QUẢ =====
            FormCard(
              title: 'Kết quả',
              child: FormInputField(
                icon: Icons.task_alt_outlined,
                nameForm: 'sale_staff_result',
                nameTextField: 'result',
                label: 'Kết quả đạt được',
                maxLines: 3,
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KẾ HOẠCH =====
            FormCard(
              title: 'Kế hoạch ngày tiếp theo',
              child: FormInputField(
                icon: Icons.next_plan_outlined,
                nameForm: 'sale_staff_next_plan',
                nameTextField: 'next_plan',
                label: 'Kế hoạch ngày tiếp theo',
                maxLines: 3,
              ),
            ),

            const SizedBox(height: 12),

            /// ===== ACTION =====
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
    );
  }
}
