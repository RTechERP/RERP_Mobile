import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class HrAddScreen extends StatelessWidget {
  final HrType? type;

  const HrAddScreen({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Tạo báo cáo', style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (type) {
      case HrType.admin:
        return const _HrAddAdminView();
      case HrType.lxcp:
        return const _HrAddLxcpView();
      default:
        return const Center(child: Text('Chưa xác định loại HR'));
    }
  }
}

class _HrAddAdminView extends StatefulWidget {
  const _HrAddAdminView();

  @override
  State<_HrAddAdminView> createState() => _HrAddAdminViewState();
}

class _HrAddAdminViewState extends State<_HrAddAdminView> {
  final _formAdminKey = GlobalKey<FormBuilderState>();
  bool _showExtraInfo = false;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formAdminKey,
      initialValue: {
        'date': DateTime.now(),
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// ===== NGÀY BÁO CÁO =====
          FormCard(
            title: 'Ngày báo cáo',
            child: FormDateTimePicker(
              icon: Icons.calendar_today,
              name: 'date',
              label: 'Ngày báo cáo',
              inputType: InputType.date,
              format: DateFormat('dd/MM/yyyy'),
            ),
          ),

          const SizedBox(height: 12),

          /// ===== NỘI DUNG CÔNG VIỆC =====
          FormCard(
            title: 'Nội dung công việc',
            child: FormInputField(
              icon: Icons.note_alt_outlined,
              nameForm: 'hr_admin_add_content',
              nameTextField: 'content',
              label: 'Nội dung công việc',
              maxLines: 4,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== KẾT QUẢ =====
          FormCard(
            title: 'Kết quả',
            child: FormInputField(
              icon: Icons.task_alt_outlined,
              nameForm: 'hr_admin_add_result',
              nameTextField: 'result',
              label: 'Kết quả đạt được',
              maxLines: 4,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== THÔNG TIN BỔ SUNG (ẨN / HIỆN) =====
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

                  FormInputField(
                    icon: Icons.report_problem_outlined,
                    nameForm: 'hr_admin_add_issue',
                    nameTextField: 'issue',
                    label: 'Vấn đề phát sinh (nếu có)',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),

                  FormInputField(
                    icon: Icons.build_outlined,
                    nameForm: 'hr_admin_add_solution',
                    nameTextField: 'solution',
                    label: 'Hướng giải quyết (nếu có)',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),

                  FormInputField(
                    icon: Icons.warning_amber_outlined,
                    nameForm: 'hr_admin_add_blocking',
                    nameTextField: 'blocking',
                    label: 'Tồn đọng (nếu có)',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),

                  FormInputField(
                    icon: Icons.note_outlined,
                    nameForm: 'hr_admin__blocking_reason',
                    nameTextField: 'blocking_reason',
                    label: 'Ghi chú / Lý do tồn đọng',
                    maxLines: 3,
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 12),

          /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
          FormCard(
            title: 'Kế hoạch ngày tiếp theo',
            child: FormInputField(
              icon: Icons.next_plan_outlined,
              nameForm: 'hr_admin_add_next_plan',
              nameTextField: 'next_plan',
              label: 'Kế hoạch ngày tiếp theo',
              maxLines: 3,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== ACTIONS =====
          FormActions(
            mode: FormActionMode.add,
            onSubmit: () {
              if (_formAdminKey.currentState?.saveAndValidate() ?? false) {
                debugPrint(_formAdminKey.currentState!.value.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HrAddLxcpView extends StatelessWidget {
  const _HrAddLxcpView();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Form thêm HR - LXCP'));
  }
}