import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/dialog/index.dart';
import '../../data/sale_admin_model.dart';

class SaleAdminAddScreen extends StatefulWidget {
  const SaleAdminAddScreen({super.key});

  @override
  State<SaleAdminAddScreen> createState() => _SaleAdminAddScreenState();
}

class _SaleAdminAddScreenState extends State<SaleAdminAddScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final List<SaleReportTabData> _tabs = [SaleReportTabData()];
  int _activeTab = 0;

  /// fake data – sau này gắn API
  final staffs = ['Nguyễn Văn A', 'Trần Thị B'];
  final reportTypes = ['Báo cáo ngày', 'Báo cáo tuần'];
  final projects = ['PRJ-001', 'PRJ-002'];
  final customers = ['Công ty ABC', 'Công ty XYZ'];
  final requesters = ['PM A', 'PM B'];

  void _addTab() {
    setState(() {
      _tabs.add(SaleReportTabData());
      _activeTab = _tabs.length - 1;
    });
  }

  SaleReportTabData get currentTab => _tabs[_activeTab];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Tạo báo cáo Sale'),
        actions: [
          /// ➕ Thêm loại báo cáo
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newType = await DialogService.showCreateReport(context: context);
              if (newType != null) {
                debugPrint('Loại báo cáo mới: $newType');
                // TODO: add vào list reportTypes
              }
            },
          )

        ],
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: {'sale_admin_report_time': DateTime.now()},
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// ===== TAB NHÂN VIÊN =====
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ..._tabs.asMap().entries.map((e) {
                    final isActive = e.key == _activeTab;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _activeTab = e.key),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isActive
                                  ? AppColors.primaryERP
                                  : Colors.grey.shade300,
                            ),
                            color: isActive
                                ? AppColors.primaryERP.withOpacity(0.1)
                                : null,
                          ),
                          child: Text(
                            e.value.staff ?? 'Nhân viên ${e.key + 1}',
                            style: TextStyle(
                              color: isActive
                                  ? AppColors.primaryERP
                                  : Colors.black87,
                              fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  IconButton(
                    onPressed: _addTab,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== THỜI GIAN =====
            FormCard(
              title: 'Thời gian báo cáo',
              child: FormDateTimePicker(
                label: '',
                nameForm: 'sale_admin_add_report_time',
                nameTimePicker: 'date_time',
                icon: Icons.access_time,
                inputType: InputType.both,
                format: DateFormat('dd/MM/yyyy'),
              ),
            ),

            const SizedBox(height: 12),

            /// ===== NHÂN VIÊN =====
            _selectField(
              nameForm: 'sale_admin_staff_$_activeTab',
              title: 'Nhân viên',
              value: currentTab.staff,
              icon: Icons.person_outline,
              items: staffs,
              onSelected: (v) => setState(() => currentTab.staff = v),
            ),

            _selectField(
              nameForm: 'sale_admin_report_type_$_activeTab',
              title: 'Loại báo cáo',
              value: currentTab.reportType,
              icon: Icons.category_outlined,
              items: reportTypes,
              onSelected: (v) => setState(() => currentTab.reportType = v),
            ),

            FormCard(
              title: 'Nội dung báo cáo',
              child: FormInputField(
                label: '',
                icon: Icons.description_outlined,
                nameForm: 'sale_admin_content_$_activeTab',
                nameTextField: 'content',
                maxLines: 4,
              ),
            ),

            _selectField(
              nameForm: 'sale_admin_project_$_activeTab',
              title: 'Mã dự án',
              value: currentTab.project,
              icon: Icons.work_outline,
              items: projects,
              onSelected: (v) => setState(() => currentTab.project = v),
            ),

            _selectField(
              nameForm: 'sale_admin_customer_$_activeTab',
              title: 'Khách hàng',
              value: currentTab.customer,
              icon: Icons.people_outline,
              items: customers,
              onSelected: (v) => setState(() => currentTab.customer = v),
            ),

            _selectField(
              nameForm: 'sale_admin_requester_$_activeTab',
              title: 'Người yêu cầu',
              value: currentTab.requester,
              icon: Icons.person_pin_outlined,
              items: requesters,
              onSelected: (v) => setState(() => currentTab.requester = v),
            ),

            FormCard(
              title: 'Kết quả xử lý',
              child: FormInputField(
                label: '',
                icon: Icons.check_circle_outline,
                nameForm: 'sale_admin_result_$_activeTab',
                nameTextField: 'result',
                maxLines: 3,
              ),
            ),

            FormCard(
              title: 'Vấn đề tồn đọng',
              child: FormInputField(
                label: '',
                icon: Icons.warning_amber_outlined,
                nameForm: 'sale_admin_blocking_$_activeTab',
                nameTextField: 'blocking',
                maxLines: 3,
              ),
            ),

            FormCard(
              title: 'Giải quyết vấn đề',
              child: FormInputField(
                label: '',
                icon: Icons.build_outlined,
                nameForm: 'sale_admin_solution_$_activeTab',
                nameTextField: 'solution',
                maxLines: 3,
              ),
            ),

            const SizedBox(height: 12),

            FormActions(
              mode: FormActionMode.add,
              onSubmit: () {
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  debugPrint(_formKey.currentState!.value.toString());
                  debugPrint(_tabs.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectField({
    required String title,
    required String nameForm,
    required String? value,
    required IconData icon,
    required List<String> items,
    required ValueChanged<String> onSelected,
  }) {
    return FormCard(
      title: title,
      child: GestureDetector(
        onTap: () {
          // openSelectBottomSheet(
          //   context: context,
          //   title: title,
          //   items: items,
          //   onSelected: (v) {
          //     onSelected(v);
          //
          //     /// 👇 BẮT BUỘC: cập nhật FormBuilder
          //     _formKey.currentState
          //         ?.fields[title]
          //         ?.didChange(v);
          //   },
          // );
        },

        child: AbsorbPointer(
          child: FormInputField(
            icon: icon,
            nameForm: nameForm,
            nameTextField: title,
            readOnly: true,
            initialValue: value ?? '',
            label: title,
          ),
        ),
      ),
    );
  }
}

