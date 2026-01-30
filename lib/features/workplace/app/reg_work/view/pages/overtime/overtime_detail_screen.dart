import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class OvertimeDetailScreenPage extends StatefulWidget {
  const OvertimeDetailScreenPage({super.key});

  @override
  State<OvertimeDetailScreenPage> createState() =>
      _OvertimeDetailScreenPageState();
}

class _OvertimeDetailScreenPageState
    extends State<OvertimeDetailScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  void _toggleEdit() => setState(() => _isEditing = true);

  void _cancelEdit() {
    _formKey.currentState?.reset();
    setState(() => _isEditing = false);
  }

  void _save() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(_formKey.currentState!.value.toString());
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn tăng ca'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.close : Icons.create_outlined,
            ),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              /// ===== CONTENT =====
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// ===== THÔNG TIN TĂNG CA =====
                      FormCard(
                        title: 'Thông tin tăng ca',
                        child: Column(
                          children: [
                            /// NGÀY
                            _isEditing
                                ? FormBuilderDateTimePicker(
                              name:
                              'regwork_overtime_detail_date',
                              inputType: InputType.date,
                              format:
                              DateFormat('dd/MM/yyyy'),
                              decoration:
                              formInputDecoration(
                                context,
                                label: 'Ngày đăng ký',
                                icon: Icons
                                    .date_range_outlined,
                              ),
                            )
                                : const FormReadonlyField(
                              value: '27/01/2026',
                              icon: Icons
                                  .date_range_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// TỪ - ĐẾN
                            Row(
                              children: [
                                Expanded(
                                  child: _isEditing
                                      ? FormBuilderDateTimePicker(
                                    name:
                                    'regwork_overtime_detail_from',
                                    inputType:
                                    InputType.time,
                                    format: DateFormat(
                                        'hh:mm a',
                                        'en'),
                                    decoration:
                                    formInputDecoration(
                                      context,
                                      label: 'Từ',
                                      icon: Icons
                                          .schedule_outlined,
                                    ),
                                  )
                                      : const FormReadonlyField(
                                    value: '06:00 PM',
                                    icon: Icons
                                        .schedule_outlined,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _isEditing
                                      ? FormBuilderDateTimePicker(
                                    name:
                                    'regwork_overtime_detail_to',
                                    inputType:
                                    InputType.time,
                                    format: DateFormat(
                                        'hh:mm a',
                                        'en'),
                                    decoration:
                                    formInputDecoration(
                                      context,
                                      label: 'Đến',
                                      icon: Icons
                                          .schedule_outlined,
                                    ),
                                  )
                                      : const FormReadonlyField(
                                    value: '09:00 PM',
                                    icon: Icons
                                        .schedule_outlined,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            /// SỐ GIỜ
                            _isEditing
                                ? FormBuilderTextField(
                              name:
                              'regwork_overtime_detail_hours',
                              keyboardType:
                              TextInputType.number,
                              decoration:
                              formInputDecoration(
                                context,
                                label: 'Số giờ',
                                icon: Icons
                                    .timelapse_outlined,
                              ),
                            )
                                : const FormReadonlyField(
                              value: '3 giờ',
                              icon: Icons
                                  .timelapse_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// LOẠI LÀM THÊM
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name:
                              'regwork_overtime_detail_type',
                              label: 'Loại làm thêm',
                              icon: Icons
                                  .category_outlined,
                              items: const [
                                DropdownMenuItem(
                                  value: 'weekday',
                                  child:
                                  Text('Ngày thường'),
                                ),
                                DropdownMenuItem(
                                  value: 'weekend',
                                  child:
                                  Text('Cuối tuần'),
                                ),
                                DropdownMenuItem(
                                  value: 'holiday',
                                  child:
                                  Text('Ngày lễ'),
                                ),
                              ],
                            )
                                : const FormReadonlyField(
                              value: 'Ngày thường',
                              icon: Icons
                                  .category_outlined,
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
                            /// DỰ ÁN
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name:
                              'regwork_overtime_detail_project',
                              label: 'Dự án',
                              icon:
                              Icons.work_outline,
                              items: const [
                                DropdownMenuItem(
                                  value: 'project_a',
                                  child:
                                  Text('Dự án A'),
                                ),
                                DropdownMenuItem(
                                  value: 'project_b',
                                  child:
                                  Text('Dự án B'),
                                ),
                              ],
                            )
                                : const FormReadonlyField(
                              value: 'Dự án A',
                              icon:
                              Icons.work_outline,
                            ),

                            const SizedBox(height: 12),

                            /// ĐỊA ĐIỂM
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name:
                              'regwork_overtime_detail_location',
                              label: 'Địa điểm',
                              icon:
                              Icons.place_outlined,
                              items: const [
                                DropdownMenuItem(
                                  value: 'office',
                                  child:
                                  Text('Văn phòng'),
                                ),
                                DropdownMenuItem(
                                  value: 'remote',
                                  child: Text('Từ xa'),
                                ),
                                DropdownMenuItem(
                                  value: 'onsite',
                                  child:
                                  Text('Công trường'),
                                ),
                              ],
                            )
                                : const FormReadonlyField(
                              value: 'Văn phòng',
                              icon:
                              Icons.place_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// PHỤ CẤP
                            _isEditing
                                ? FormBuilderCheckbox(
                              name:
                              'regwork_overtime_detail_allowance',
                              title: const Text(
                                  'Có phụ cấp'),
                              activeColor:
                              AppColors.primaryERP,
                            )
                                : const FormReadonlyField(
                              value: 'Có',
                              icon: Icons
                                  .check_circle_outline,
                            ),

                            const SizedBox(height: 12),

                            /// FILE
                            _isEditing
                                ? FormBuilderFilePicker(
                              name:
                              'regwork_overtime_detail_attachment',
                              initialValue:
                              const [],
                              maxFiles: 5,
                              decoration:
                              formInputDecoration(
                                context,
                                label: 'File bổ sung',
                                icon: Icons
                                    .attach_file_outlined,
                              ),
                            )
                                : const FormReadonlyField(
                              value: 'xac_nhan_ot.pdf',
                              icon: Icons
                                  .attach_file_outlined,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== NGƯỜI DUYỆT =====
                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          name:
                          'regwork_overtime_detail_approver',
                          label: 'Người duyệt',
                          icon: Icons
                              .supervisor_account_outlined,
                          enabled: _isEditing,
                          items: const [
                            DropdownMenuItem(
                              value: 'manager',
                              child:
                              Text('Quản lý trực tiếp'),
                            ),
                            DropdownMenuItem(
                              value: 'hr',
                              child:
                              Text('Phòng nhân sự'),
                            ),
                            DropdownMenuItem(
                              value: 'director',
                              child:
                              Text('Ban giám đốc'),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// ===== LÝ DO =====
                      FormCard(
                        title: 'Lý do',
                        child: _isEditing
                            ? FormBuilderTextField(
                          name:
                          'regwork_overtime_detail_reason',
                          maxLines: 4,
                          decoration:
                          formInputDecoration(
                            context,
                            label: 'Lý do',
                            icon:
                            Icons.note_alt_outlined,
                          ),
                        )
                            : const FormReadonlyField(
                          value:
                          'Hoàn thành gấp deadline',
                          icon:
                          Icons.note_alt_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// ===== ACTION =====
              FormActions(
                mode: _isEditing
                    ? FormActionMode.edit
                    : FormActionMode.view,
                onCancel: _cancelEdit,
                onSave: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
