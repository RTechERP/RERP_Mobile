import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';

class SaleAdminDetailScreen extends StatefulWidget {
  const SaleAdminDetailScreen({super.key});

  @override
  State<SaleAdminDetailScreen> createState() =>
      _SaleAdminDetailScreenState();
}

class _SaleAdminDetailScreenState extends State<SaleAdminDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  final Map<String, dynamic> _initialValue = {
    'date': DateTime.now(),

    /// ===== CORE =====
    'employee_name': 'Nguyễn Văn A',
    'report_type': 'Báo cáo Sale ngày',
    'content': 'Theo dõi tiến độ dự án ERP',

    /// ===== BUSINESS =====
    'project_code': 'ERP-2025-001',
    'customer': 'Công ty ABC',
    'requester': 'Trần Văn B',

    /// ===== RESULT =====
    'result': 'Khách hàng đồng ý phương án triển khai',
    'blocking': 'Chờ ký hợp đồng',
    'next_plan': 'Theo dõi ký hợp đồng trong tuần',
  };

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
        title: const Text('Chi tiết báo cáo Sale (Admin)'),
        automaticallyImplyLeading: !_isEditing,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit_outlined),
            onPressed: () {
              _isEditing ? _cancelEdit() : _toggleEdit();
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        enabled: _isEditing,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// ===== NGÀY =====
            FormCard(
              title: 'Ngày báo cáo',
              child: _isEditing
                  ? FormDateTimePicker(
                nameForm: 'sale_admin_detail_report_time',
                nameTimePicker: 'date_time',
                icon: Icons.calendar_today,
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
              )
                  : FormReadonlyField(
                name: 'date',
                label: 'Ngày báo cáo',
                icon: Icons.calendar_today,
                initialValue: _initialValue['date'],
                valueTransformer: (value) =>
                    DateFormat('dd/MM/yyyy')
                        .format(value as DateTime),
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NHÂN VIÊN (1 NGƯỜI) =====
            FormCard(
              title: 'Nhân viên thực hiện',
              child: FormReadonlyField(
                name: 'employee_name',
                label: 'Tên nhân viên',
                icon: Icons.person_outline,
                initialValue: _initialValue['employee_name'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== LOẠI BÁO CÁO =====
            FormCard(
              title: 'Loại báo cáo',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.category_outlined,
                nameForm: 'sale_admin_report_type',
                nameTextField: 'report_type',
                label: 'Loại báo cáo',
              )
                  : FormReadonlyField(
                name: 'report_type',
                label: 'Loại báo cáo',
                icon: Icons.category_outlined,
                initialValue: _initialValue['report_type'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NỘI DUNG =====
            FormCard(
              title: 'Nội dung báo cáo',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.description_outlined,
                nameForm: 'sale_admin_content',
                nameTextField: 'content',
                label: 'Nội dung báo cáo',
                maxLines: 4,
              )
                  : FormReadonlyField(
                name: 'content',
                label: 'Nội dung báo cáo',
                icon: Icons.description_outlined,
                initialValue: _initialValue['content'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== DỰ ÁN =====
            FormCard(
              title: 'Dự án',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.code_outlined,
                nameForm: 'sale_admin_project',
                nameTextField: 'project_code',
                label: 'Mã dự án',
              )
                  : FormReadonlyField(
                name: 'project_code',
                label: 'Mã dự án',
                icon: Icons.code_outlined,
                initialValue: _initialValue['project_code'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KHÁCH HÀNG =====
            FormCard(
              title: 'Khách hàng',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.business_outlined,
                nameForm: 'sale_admin_customer',
                nameTextField: 'customer',
                label: 'Khách hàng',
              )
                  : FormReadonlyField(
                name: 'customer',
                label: 'Khách hàng',
                icon: Icons.business_outlined,
                initialValue: _initialValue['customer'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NGƯỜI YÊU CẦU =====
            FormCard(
              title: 'Người yêu cầu',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.person_search_outlined,
                nameForm: 'sale_admin_requester',
                nameTextField: 'requester',
                label: 'Người yêu cầu',
              )
                  : FormReadonlyField(
                name: 'requester',
                label: 'Người yêu cầu',
                icon: Icons.person_search_outlined,
                initialValue: _initialValue['requester'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KẾT QUẢ =====
            FormCard(
              title: 'Kết quả xử lý',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.task_alt_outlined,
                nameForm: 'sale_admin_result',
                nameTextField: 'result',
                label: 'Kết quả xử lý',
                maxLines: 3,
              )
                  : FormReadonlyField(
                name: 'result',
                label: 'Kết quả xử lý',
                icon: Icons.task_alt_outlined,
                initialValue: _initialValue['result'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== TỒN ĐỌNG =====
            FormCard(
              title: 'Vấn đề tồn đọng',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.warning_amber_outlined,
                nameForm: 'sale_admin_blocking',
                nameTextField: 'blocking',
                label: 'Vấn đề tồn đọng',
                maxLines: 3,
              )
                  : FormReadonlyField(
                name: 'blocking',
                label: 'Vấn đề tồn đọng',
                icon: Icons.warning_amber_outlined,
                initialValue: _initialValue['blocking'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== KẾ HOẠCH =====
            FormCard(
              title: 'Kế hoạch tiếp theo',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.next_plan_outlined,
                nameForm: 'sale_admin_next_plan',
                nameTextField: 'next_plan',
                label: 'Kế hoạch tiếp theo',
                maxLines: 3,
              )
                  : FormReadonlyField(
                name: 'next_plan',
                label: 'Kế hoạch tiếp theo',
                icon: Icons.next_plan_outlined,
                initialValue: _initialValue['next_plan'],
              ),
            ),

            const SizedBox(height: 24),

            FormActions(
              mode:
              _isEditing ? FormActionMode.edit : FormActionMode.view,
              onView: () {},
              onCancel: _cancelEdit,
              onSave: _save,
            ),
          ],
        ),
      ),
    );
  }
}
