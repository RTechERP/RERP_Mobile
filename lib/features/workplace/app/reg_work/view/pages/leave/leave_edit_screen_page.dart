import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LeaveEditScreenPage extends StatelessWidget {
  const LeaveEditScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chỉnh sửa đơn xin nghỉ'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Huỷ',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
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
                      /// ===== THÔNG TIN NGHỈ =====
                      FormCard(
                        title: 'Thông tin nghỉ phép',
                        child: Column(
                          children: [
                            LeaveTypeDropdown(name: 'leaveType'),

                            const SizedBox(height: 12),

                            FormBuilderDateTimePicker(
                              name: 'leaveDate',
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                              decoration: formInputDecoration(
                                context,
                                label: 'Ngày nghỉ',
                                icon: Icons.date_range_outlined,
                              ),
                            ),

                            const SizedBox(height: 12),

                            FormBuilderDropdown<String>(
                              name: 'leaveSession',
                              decoration: formInputDecoration(
                                context,
                                label: 'Thời gian nghỉ',
                                icon: Icons.access_time_outlined,
                              ),
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
                        child: FormBuilderDropdown<String>(
                          name: 'approver',
                          decoration: formInputDecoration(
                            context,
                            label: 'Người kiểm duyệt',
                            icon: Icons.supervisor_account_outlined,
                          ),
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
                        child: FormBuilderTextField(
                          name: 'reason',
                          maxLines: 5,
                          decoration: formInputDecoration(
                            context,
                            label: 'Nhập lý do nghỉ',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== BUTTON LƯU =====
              SafeArea(
                top: false,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final values = _formKey.currentState!.value;
                      debugPrint(values.toString());
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size.fromHeight(48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Lưu',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
