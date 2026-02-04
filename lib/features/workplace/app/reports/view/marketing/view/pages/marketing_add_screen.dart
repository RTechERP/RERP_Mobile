import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class MarketingAddScreen extends StatelessWidget {
  const MarketingAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Tạo báo cáo Marketing', style: AppStyles.headingTitle2),
        onBackTap: () => context.pop(),
      ),
      body: const _MarketingAddView(),
    );
  }
}

class _MarketingAddView extends StatefulWidget {
  const _MarketingAddView();

  @override
  State<_MarketingAddView> createState() => _MarketingAddViewState();
}

class _MarketingAddViewState extends State<_MarketingAddView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
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
              nameForm: 'marketing_add_content',
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
              nameForm: 'marketing_add_result',
              nameTextField: 'result',
              label: 'Kết quả đạt được',
              maxLines: 4,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
          FormCard(
            title: 'Kế hoạch ngày tiếp theo',
            child: FormInputField(
              icon: Icons.next_plan_outlined,
              nameForm: 'marketing_add_next_plan',
              nameTextField: 'next_plan',
              label: 'Kế hoạch ngày tiếp theo',
              maxLines: 3,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== ĐỀ XUẤT CẢI TIẾN =====
          FormCard(
            title: 'Đề xuất cải tiến phòng Marketing',
            child: FormInputField(
              icon: Icons.lightbulb_outline,
              nameForm: 'marketing_add_improve',
              nameTextField: 'improve',
              label: 'Đề xuất cải tiến',
              maxLines: 4,
            ),
          ),

          const SizedBox(height: 12),

          /// ===== FILE ĐÍNH KÈM =====
          FormCard(
            title: 'Bảng đính kèm file',
            child: FormFilePicker(
              name: 'attachments',
              label: 'Chọn file đính kèm',
              icon: Icons.attach_file,
              allowMultiple: true,
            ),
          ),

          const SizedBox(height: 16),

          /// ===== ACTIONS =====
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
    );
  }
}