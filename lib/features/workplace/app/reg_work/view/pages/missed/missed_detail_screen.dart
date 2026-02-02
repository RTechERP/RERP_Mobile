import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../common/app_theme/index.dart';
import '../../../../../../../common/enums/index.dart';
import '../../../../../../../common/widgets/form/index.dart';

class MissedDetailScreen extends StatefulWidget {
  const MissedDetailScreen({super.key});

  @override
  State<MissedDetailScreen> createState() =>
      _MissedDetailScreenState();
}

class _MissedDetailScreenState extends State<MissedDetailScreen> {
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

  void _autoSetTimeByType(String? type) {
    if (!_isEditing || type == null) return;

    final form = _formKey.currentState;
    if (form == null) return;

    DateTime time(int h, int m) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, h, m);
    }

    if (type == 'check_in') {
      form.fields['regwork_missed_detail_time']
          ?.didChange(time(8, 0));
    }

    if (type == 'check_out') {
      form.fields['regwork_missed_detail_time']
          ?.didChange(time(17, 30));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết đơn quên chấm công'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.create_outlined),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FormCard(
                        title: 'Thông tin quên chấm công',
                        child: Column(
                          children: [
                            _isEditing
                                ? FormTypeDropDown<String>(
                              name:
                              'regwork_missed_detail_type',
                              label: 'Loại',
                              icon:
                              Icons.fingerprint_outlined,
                              onChanged:
                              _autoSetTimeByType,
                              items: const [
                                DropdownMenuItem(
                                  value: 'check_in',
                                  child:
                                  Text('Quên check-in'),
                                ),
                                DropdownMenuItem(
                                  value: 'check_out',
                                  child: Text(
                                      'Quên check-out'),
                                ),
                              ],
                            )
                                : const FormReadonlyField(
                              label: '',

                              name: 'Quên check-in',
                              icon: Icons
                                  .fingerprint_outlined,
                            ),

                            const SizedBox(height: 12),

                            _isEditing
                                ? FormDateTimePicker(
                              name:
                              'regwork_missed_detail_date',
                              label: 'Ngày',
                              icon: Icons
                                  .date_range_outlined,
                              inputType: InputType.date,
                              format: DateFormat(
                                  'dd/MM/yyyy'),
                            )
                                : const FormReadonlyField(
                              label: '',

                              name: '27/01/2026',
                              icon: Icons
                                  .date_range_outlined,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      FormCard(
                        title: 'Người kiểm duyệt',
                        child: FormTypeDropDown<String>(
                          enabled: _isEditing,
                          name:
                          'regwork_missed_detail_approver',
                          label: 'Người duyệt',
                          icon: Icons
                              .supervisor_account_outlined,
                          items: const [
                            DropdownMenuItem(
                              value: 'manager',
                              child:
                              Text('Quản lý trực tiếp'),
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
