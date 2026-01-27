import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/widgets/form/index.dart';
class LunchAddScreen extends StatelessWidget {
  const LunchAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return
      BaseScaffold(
        appBar: AppBarCommon(
          title: const Text('Tạo cơm ca'),

        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                /// ===== CARD: THÔNG TIN =====
                FormCard(
                  title: 'Thông tin cơm ca',
                  child: Column(
                    children: [
                      ReadonlyField(
                        value: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        icon: Icons.calendar_today_outlined,
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: 'quantity',
                        keyboardType: TextInputType.number,
                        decoration: formInputDecoration(
                          context,
                          label: 'Số lượng',
                          icon: Icons.confirmation_number_outlined,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LocationRadioGroup(),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// ===== CARD: GHI CHÚ =====
                FormCard(
                  title: 'Ghi chú',
                  child: FormBuilderTextField(
                    name: 'note',
                    maxLines: 8,
                    decoration: formInputDecoration(
                      context,
                      label: 'Nhập ghi chú (nếu có)',
                    ),
                  ),
                ),

                const Spacer(),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'Lưu',
                style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w600),
              ),
            ),

              ],
            ),
          ),
        ),
      );
  }
}


