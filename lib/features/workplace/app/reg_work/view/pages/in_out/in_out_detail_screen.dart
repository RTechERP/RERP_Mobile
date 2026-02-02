import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class InOutDetailScreenPage extends StatefulWidget {
  const InOutDetailScreenPage({super.key});

  @override
  State<InOutDetailScreenPage> createState() => _InOutDetailScreenPageState();
}

class _InOutDetailScreenPageState extends State<InOutDetailScreenPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  void _toggleEdit() {
    setState(() => _isEditing = true);
  }

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

  /// ===== AUTO SET TIME =====
  void _autoSetTimeByType(String? value) {
    if (!_isEditing || value == null) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, h, m);
    }

    if (value.contains('early')) {
      form.fields['regwork_inout_detail_from']
          ?.didChange(time(16, 30));
      form.fields['regwork_inout_detail_to']
          ?.didChange(time(17, 30));
    }

    if (value.contains('late')) {
      form.fields['regwork_inout_detail_from']
          ?.didChange(time(8, 0));
      form.fields['regwork_inout_detail_to']
          ?.didChange(time(9, 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn'),
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
                      /// ===== THÔNG TIN RA / VÀO =====
                      FormCard(
                        title: 'Thông tin đi muộn - về sớm',
                        child: Column(
                          children: [
                            /// LOẠI
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name: 'regwork_inout_detail_type',
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
                            )
                                : const FormReadonlyField(
                              label: '',

                              name: 'Về sớm - Việc công ty',
                              icon: Icons.swap_vert_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// NGÀY
                            _isEditing
                                ? FormDateTimePicker(
                              name: 'regwork_inout_detail_date',
                              label: 'Ngày',
                              icon: Icons.date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat('dd/MM/yyyy'),
                            )

                                : const FormReadonlyField(
                              label: '',

                              name: '25/01/2026',
                              icon: Icons.date_range_outlined,
                            ),

                            const SizedBox(height: 12),

                            /// TỪ - ĐẾN
                            Row(
                              children: [
                                Expanded(
                                  child: _isEditing
                                      ? FormDateTimePicker(
                                    name: 'regwork_inout_detail_from',
                                    label: 'Từ',
                                    icon: Icons.schedule_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),

                                  )
                                      : const FormReadonlyField(
                                    label: '',
                                    name: '16:30',
                                    icon: Icons.schedule_outlined,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _isEditing
                                      ? FormDateTimePicker(
                                    name: 'regwork_inout_detail_to',
                                    label: 'Đến',
                                    icon: Icons.schedule_outlined,
                                    inputType: InputType.time,
                                    format: DateFormat('HH:mm'),
                                  )

                                      : const FormReadonlyField(
                                    label: '',
                                    name: '17:30',
                                    icon: Icons.schedule_outlined,
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
                          name: 'regwork_inout_detail_approver',
                          label: 'Người kiểm duyệt',
                          icon: Icons.supervisor_account_outlined,
                          enabled: _isEditing,
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
                          enabled: _isEditing,
                          nameForm: 'inout',
                          nameTextField: 'regwork_inout_detail_reason',
                          label: 'Lý do',
                          icon: Icons.note_alt_outlined,
                          maxLines: 4,
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
                onView: () {},
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
