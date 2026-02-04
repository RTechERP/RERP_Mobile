import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class HrAdminDetailScreen extends StatefulWidget {
  const HrAdminDetailScreen({super.key});

  @override
  State<HrAdminDetailScreen> createState() => _HrAdminDetailScreenState();
}

class _HrAdminDetailScreenState extends State<HrAdminDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;
  bool _showExtraInfo = true;

  /// Fake data demo (sau này thay bằng state / api)
  final Map<String, dynamic> _initialValue = {
    'date': DateTime.now(),
    'content': 'Soạn thảo hợp đồng nhân sự',
    'result': 'Đã hoàn thành 5 hợp đồng',
    'next_plan': 'Soạn hợp đồng cho bộ phận sale',
    'issue': 'Thiếu thông tin CMND',
    'solution': 'Liên hệ nhân sự bổ sung',
    'blocking': '',
    'blocking_reason': '',
  };

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

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết báo cáo HR (Admin)'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.create_outlined),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
            tooltip: _isEditing ? 'Huỷ' : 'Chỉnh sửa',
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        enabled: _isEditing, // 🔥 edit mode
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// ===== NGÀY =====
            FormCard(
              title: 'Ngày báo cáo',
              child: _isEditing
                  ? FormDateTimePicker(
                icon: Icons.calendar_today,
                name: 'date',
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
              )
                  : FormReadonlyField(
                name: 'date',
                label: 'Ngày báo cáo',
                icon: Icons.calendar_today,
                initialValue: _initialValue['date'], // 👈 vẫn là DateTime
                valueTransformer: (value) {
                  if (value == null) return '';
                  return DateFormat('dd/MM/yyyy').format(value as DateTime);
                },
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NỘI DUNG =====
            FormCard(
              title: 'Nội dung công việc',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.note_alt_outlined,
                nameForm: 'hr_detail_content',
                nameTextField: 'content',
                label: 'Nội dung công việc',
                maxLines: 4,
              )
                  : FormReadonlyField(
                name: 'content',
                label: 'Nội dung công việc',
                icon: Icons.note_alt_outlined,
                initialValue: _initialValue['content'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KẾT QUẢ =====
            FormCard(
              title: 'Kết quả',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.task_alt_outlined,
                nameForm: 'hr_detail_result',
                nameTextField: 'result',
                label: 'Kết quả đạt được',
                maxLines: 4,
              )
                  : FormReadonlyField(
                name: 'result',
                label: 'Kết quả đạt được',
                icon: Icons.task_alt_outlined,
                initialValue: _initialValue['result'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== THÔNG TIN BỔ SUNG =====
            FormCard(
              title: 'Thông tin bổ sung',
              child: Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _showExtraInfo = !_showExtraInfo;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _showExtraInfo
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryERP,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _showExtraInfo
                                ? 'Ẩn thông tin bổ sung'
                                : 'Hiện thông tin bổ sung',
                            style: const TextStyle(
                              color: AppColors.primaryERP,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (_showExtraInfo) ...[
                    const SizedBox(height: 12),

                    _isEditing
                        ? FormInputField(
                      icon: Icons.report_problem_outlined,
                      nameForm: 'hr_detail_issue',
                      nameTextField: 'issue',
                      label: 'Vấn đề phát sinh',
                      maxLines: 3,
                    )
                        : FormReadonlyField(
                      name: 'issue',
                      label: 'Vấn đề phát sinh',
                      icon: Icons.report_problem_outlined,
                      initialValue: _initialValue['issue'],
                    ),
                    const SizedBox(height: 8),

                    _isEditing
                        ? FormInputField(
                      icon: Icons.build_outlined,
                      nameForm: 'hr_detail_solution',
                      nameTextField: 'solution',
                      label: 'Hướng giải quyết',
                      maxLines: 3,
                    )
                        : FormReadonlyField(
                      name: 'solution',
                      label: 'Hướng giải quyết',
                      icon: Icons.build_outlined,
                      initialValue: _initialValue['solution'],
                    ),
                    const SizedBox(height: 8),

                    _isEditing
                        ? FormInputField(
                      icon: Icons.warning_amber_outlined,
                      nameForm: 'hr_detail_blocking',
                      nameTextField: 'blocking',
                      label: 'Tồn đọng',
                      maxLines: 3,
                    )
                        : FormReadonlyField(
                      name: 'blocking',
                      label: 'Tồn đọng',
                      icon: Icons.warning_amber_outlined,
                      initialValue: _initialValue['blocking'],
                    ),
                    const SizedBox(height: 8),

                    _isEditing
                        ? FormInputField(
                      icon: Icons.note_outlined,
                      nameForm: 'hr_detail_blocking_reason',
                      nameTextField: 'blocking_reason',
                      label: 'Lý do tồn đọng',
                      maxLines: 3,
                    )
                        : FormReadonlyField(
                      name: 'blocking_reason',
                      label: 'Lý do tồn đọng',
                      icon: Icons.note_outlined,
                      initialValue: _initialValue['blocking_reason'],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NEXT PLAN =====
            FormCard(
              title: 'Kế hoạch ngày tiếp theo',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.next_plan_outlined,
                nameForm: 'hr_detail_next_plan',
                nameTextField: 'next_plan',
                label: 'Kế hoạch ngày tiếp theo',
                maxLines: 3,
              )
                  : FormReadonlyField(
                name: 'next_plan',
                label: 'Kế hoạch ngày tiếp theo',
                icon: Icons.next_plan_outlined,
                initialValue: _initialValue['next_plan'],
              ),
            ),

            const SizedBox(height: 24),

            FormActions(
              mode: _isEditing ? FormActionMode.edit : FormActionMode.view,
              onView: () {
              },
              onCancel: _cancelEdit,
              onSave: _save,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}