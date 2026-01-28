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
                      FormCard(
                        title: 'Thông tin tăng ca',
                        child: Column(
                          children: [
                            /// Ngày đăng ký
                            FormBuilderDateTimePicker(
                              name: 'regwork_overtime_add_date',
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                              decoration: formInputDecoration(
                                context,
                                label: 'Ngày đăng ký',
                                icon: Icons.date_range_outlined,
                              ),
                            ),

                            const SizedBox(height: 12),

                            /// Từ - Đến
                            Row(
                              children: [
                                Expanded(
                                  child: FormBuilderDateTimePicker(
                                    name: 'regwork_overtime_add_from',
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                    decoration: formInputDecoration(
                                      context,
                                      label: 'Từ',
                                      icon: Icons.schedule_outlined,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: FormBuilderDateTimePicker(
                                    name: 'regwork_overtime_add_to',
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                    decoration: formInputDecoration(
                                      context,
                                      label: 'Đến',
                                      icon: Icons.schedule_outlined,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// Số giờ
                            InputField(
                              nameForm: 'regwork',
                              nameTextField: 'regwork_overtime_add_hours',
                              label: 'Số giờ',
                              icon: Icons.timelapse_outlined,
                              keyboardType: TextInputType.number,
                            ),

                            const SizedBox(height: 12),

                            /// Loại làm thêm
                            TypeDropDown<String>(
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
                        title: 'Thông tin bổ sung',
                        child: Column(
                          children: [
                            /// Dự án
                            TypeDropDown<String>(
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
                            TypeDropDown<String>(
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

                            /// Phụ cấp
                            FormBuilderCheckbox(
                              name: 'regwork_overtime_add_allowance',
                              title: const Text('Có phụ cấp'),
                              activeColor: AppColors.primaryERP,
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
                        child: TypeDropDown<String>(
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
                        child: InputField(
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
