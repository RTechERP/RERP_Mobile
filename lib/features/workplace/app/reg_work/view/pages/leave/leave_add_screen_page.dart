import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class LeaveAddScreenPage extends StatelessWidget {
  const LeaveAddScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Tạo đơn xin nghỉ')),
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
                      /// ===== CẢNH BÁO =====
                      LeftBorderCard(
                        icon: Icons.error_outline,
                        borderColor: Colors.red,
                        backgroundColor: Colors.red.shade50,
                        borderWidth: 6,
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                            children: [
                              /// Nghỉ phép năm
                              const TextSpan(
                                text: '• Nghỉ phép (P): ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(
                                text:
                                    'Đăng ký trên ứng dụng RERP trước 19h ngày liền trước ngày nghỉ, '
                                    'quỹ phép phải còn dương tại thời điểm xin nghỉ (không ứng phép). '
                                    'Nhân sự đang thử việc được tính phép nhưng chưa được sử dụng, '
                                    'không hoàn phép nếu không ký HĐLĐ chính thức.\n\n',
                              ),

                              /// Nghỉ không lương
                              const TextSpan(
                                text: '• Nghỉ không lương (Ro): ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(
                                text:
                                    'Xin nghỉ sau 19h của ngày liền trước ngày nghỉ hoặc khi không còn phép.\n\n',
                              ),

                              /// Nghỉ việc riêng hưởng lương
                              const TextSpan(
                                text: '• Nghỉ việc riêng có hưởng lương (R): ',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const TextSpan(
                                text:
                                    'NLĐ kết hôn (03 ngày); Con NLĐ kết hôn (01 ngày); '
                                    'Cha/Mẹ/Vợ/Chồng/Con mất (03 ngày).',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== THÔNG TIN NGHỈ =====
                      FormCard(
                        title: 'Thông tin nghỉ phép',
                        child: Column(
                          children: [
                            /// Loại nghỉ
                            LeaveTypeDropdown(name: 'leaveType'),

                            const SizedBox(height: 12),

                            /// Từ ngày
                            FormBuilderDateTimePicker(
                              name: 'fromDate',
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                              decoration: formInputDecoration(
                                context,
                                label: 'Ngày đăng ký',
                                icon: Icons.date_range_outlined,
                              ),
                            ),

                            const SizedBox(height: 12),

                            /// Đến ngày
                            // FormBuilderDateTimePicker(
                            //   name: 'toDate',
                            //   inputType: InputType.date,
                            //   format: DateFormat('dd/MM/yyyy'),
                            //   decoration: formInputDecoration(
                            //     context,
                            //     label: 'Đến ngày',
                            //     icon: Icons.event_outlined,
                            //   ),
                            // ),
                            // const SizedBox(height: 12),
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

                      /// ===== Người kiểm duyệt =====
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

                      /// ===== GHI CHÚ =====
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
                      const SizedBox(height: 8),

                    ],
                  ),
                ),
              ),

              /// ===== BUTTON CỐ ĐỊNH =====
              SafeArea(
                top: false,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final values = _formKey.currentState!.value;
                      debugPrint(values.toString());
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
                    'Gửi đơn',
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
