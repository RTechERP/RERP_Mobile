import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class OvertimeAddScreenPage extends StatefulWidget {
  const OvertimeAddScreenPage({super.key});

  @override
  State<OvertimeAddScreenPage> createState() => _OvertimeAddScreenPageState();
}

class _OvertimeAddScreenPageState extends State<OvertimeAddScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo đơn tăng ca'),
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
                      /// ===== THÔNG TIN TĂNG CA =====
                      FormLeftBorderCard(
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
                            children: const [
                              /// Title
                              TextSpan(
                                text: 'LƯU Ý\n',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),

                              TextSpan(
                                text:
                                    '• Thời gian làm thêm không tính thời gian ăn ca, nghỉ giữa giờ, đợi xe, '
                                    'ngồi trên xe khi đi công tác (không bao gồm Lái xe).\n\n'
                                    '• Thời gian làm thêm tại văn phòng được tính từ 18:00.\n\n'
                                    '• Làm thêm đến 20:00 được hưởng phụ cấp ăn tối.\n\n'
                                    '• CBNV cần khai báo đúng quy định. Trường hợp quên khai báo công có thể '
                                    'khai báo bổ sung. Nếu quên khai báo/chấm công từ 3 lần/tháng sẽ bị trừ 100% PCCC.',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      FormCard(
                        title: 'Thông tin tăng ca',
                        child: Column(
                          children: [
                            /// Ngày đăng ký
                            FormDateTimePicker(
                              nameForm: 'regwork_overtime_add_date',
                              nameTimePicker: 'overtime_add_date_time',
                              label: 'Ngày đăng ký',
                              icon: Icons.date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                            ),

                            const SizedBox(height: 12),

                            /// Từ - Đến
                            Row(
                              children: [
                                Expanded(
                                  child: FormDateTimePicker(
                                    nameForm: 'regwork_overtime_add_from',
                                    nameTimePicker: 'overtime_add_from_time',
                                    label: 'Từ',
                                    icon: Icons.date_range_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: FormDateTimePicker(
                                    nameForm: 'regwork_overtime_add_to',
                                    nameTimePicker: 'overtime_add_to_time',
                                    label: 'Đến',
                                    icon: Icons.schedule_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),

                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Số giờ & trợ cấp
                            Row(
                              children: [
                                Expanded(
                                  child: FormInputField(
                                    nameForm: 'regwork',
                                    nameTextField: 'regwork_overtime_add_hours',
                                    label: 'Số giờ',
                                    icon: Icons.timelapse_outlined,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                /// Phụ cấp
                                Expanded(
                                  child: FormCheckbox(
                                    name: 'regwork_overtime_add_allowance',
                                    title: Text('Có phụ cấp'),
                                    initialValue: false,
                                  ),

                                ),
                              ],
                            ),

                            const SizedBox(height: 12),



                            /// Loại làm thêm
                            FormTypeDropDown<String>(
                              name: 'regwork_overtime_add_type',
                              label: 'Loại làm thêm',
                              icon: Icons.category_outlined,
                              items: const [
                                DropdownMenuItem(
                                  value: 'weekday',
                                  child: Text('Ngày thường'),
                                ),
                                DropdownMenuItem(
                                  value: 'weekend',
                                  child: Text('Cuối tuần'),
                                ),
                                DropdownMenuItem(
                                  value: 'holiday',
                                  child: Text('Ngày lễ'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== THÔNG TIN BỔ SUNG =====
                      FormCard(
                        title: 'Thông tin công việc',
                        child: Column(
                          children: [
                            /// Dự án
                            FormTypeDropDown<String>(
                              name: 'regwork_overtime_add_project',
                              label: 'Dự án',
                              icon: Icons.work_outline,
                              items: const [
                                DropdownMenuItem(
                                  value: 'project_a',
                                  child: Text('Dự án A'),
                                ),
                                DropdownMenuItem(
                                  value: 'project_b',
                                  child: Text('Dự án B'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Địa điểm
                            FormTypeDropDown<String>(
                              name: 'regwork_overtime_add_location',
                              label: 'Địa điểm',
                              icon: Icons.place_outlined,
                              items: const [
                                DropdownMenuItem(
                                  value: 'office',
                                  child: Text('Văn phòng'),
                                ),
                                DropdownMenuItem(
                                  value: 'remote',
                                  child: Text('Từ xa'),
                                ),
                                DropdownMenuItem(
                                  value: 'onsite',
                                  child: Text('Công trường'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// File bổ sung
                            FormBuilderFilePicker(
                              name: 'regwork_overtime_add_attachment',
                              initialValue: const [],
                              decoration: formInputDecoration(
                                context,
                                label: 'File bổ sung',
                                icon: Icons.attach_file_outlined,
                              ),
                              maxFiles: 5,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI KIỂM DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name: 'regwork_overtime_add_approver',
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
                          nameTextField: 'regwork_overtime_add_reason',
                          label: '',
                          icon: Icons.note_alt_outlined,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== NÚT GỬI =====
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
