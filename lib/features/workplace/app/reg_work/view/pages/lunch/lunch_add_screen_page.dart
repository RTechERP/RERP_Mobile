import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LunchAddScreen extends StatelessWidget {
  const LunchAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Tạo cơm ca')),
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
                      LeftBorderCard(
                        icon: Icons.warning_amber_rounded,
                        borderColor: Colors.orange,
                        backgroundColor: const Color(0xFFFFF8E1),
                        child: const Text(
                          'Vui lòng đặt cơm trước 10h hàng ngày',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),

                      const SizedBox(height: 8),

                      FormCard(
                        title: 'Thông tin cơm ca',
                        child: Column(
                          children: [
                            ReadonlyField(
                              value: DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now()),
                              icon: Icons.calendar_today_outlined,
                            ),
                            const SizedBox(height: 12),
                            InputField(
                              nameForm: 'regwork',
                              nameTextField: 'regwork_lunch_add_quantity',
                              keyboardType: TextInputType.number,
                              label: 'Số lượng',
                              icon: Icons.confirmation_number_outlined,
                            ),

                            const SizedBox(height: 8),
                            LocationRadioGroup(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),


                      FormCard(
                        title: 'Ghi chú',
                        child:  InputField(
                          nameForm: 'regwork',
                          nameTextField: 'regwork_lunch_add_note',
                          label: 'Ghi chú',
                          icon: Icons.note_alt_outlined,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== BUTTON CỐ ĐỊNH =====
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