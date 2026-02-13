import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class MarketingDetailScreen extends StatefulWidget {
  const MarketingDetailScreen({super.key});

  @override
  State<MarketingDetailScreen> createState() => _MarketingDetailScreenState();
}

class _MarketingDetailScreenState extends State<MarketingDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isEditing = false;

  /// Fake data demo (sau này thay bằng state / api)
  final Map<String, dynamic> _initialValue = {
    'date': DateTime.now(),
    'content': 'Chạy chiến dịch Facebook Ads',
    'result': 'Tăng 20% lượt tiếp cận',
    'next_plan': 'Tối ưu landing page',
    'improve': 'Cần thêm ngân sách cho kênh TikTok',

    // File từ server
    'attachments': [
      {'name': 'report_ads_jan.pdf'},
      {'name': 'result_screenshot.png'},
    ],

    // File mới user chọn
    'new_attachments': <PlatformFile>[],
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
      final value = _formKey.currentState!.value;

      final List serverFiles = value['attachments'] ?? [];
      final List<PlatformFile> newFiles = value['new_attachments'] ?? [];

      debugPrint('Server files: $serverFiles');
      debugPrint('New upload files: ${newFiles.map((e) => e.name).toList()}');

      // TODO:
      // - upload newFiles
      // - merge vào serverFiles sau khi upload xong

      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết báo cáo Marketing'),
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
                nameForm: 'marketing_detail_date',
                nameTimePicker: 'date_time',
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
              )
                  : FormReadonlyField(
                name: 'date',
                label: 'Ngày báo cáo',
                icon: Icons.calendar_today,
                initialValue: _initialValue['date'],
                valueTransformer: (value) {
                  if (value == null) return '';
                  return DateFormat('dd/MM/yyyy')
                      .format(value as DateTime);
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
                nameForm: 'marketing_detail_content',
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
                nameForm: 'marketing_detail_result',
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

            /// ===== NEXT PLAN =====
            FormCard(
              title: 'Kế hoạch ngày tiếp theo',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.next_plan_outlined,
                nameForm: 'marketing_detail_next_plan',
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

            const SizedBox(height: 12),

            /// ===== ĐỀ XUẤT CẢI TIẾN =====
            FormCard(
              title: 'Đề xuất cải tiến phòng Marketing',
              child: _isEditing
                  ? FormInputField(
                icon: Icons.lightbulb_outline,
                nameForm: 'marketing_detail_improve',
                nameTextField: 'improve',
                label: 'Đề xuất cải tiến',
                maxLines: 4,
              )
                  : FormReadonlyField(
                name: 'improve',
                label: 'Đề xuất cải tiến',
                icon: Icons.lightbulb_outline,
                initialValue: _initialValue['improve'],
              ),
            ),

            const SizedBox(height: 12),

            /// ===== FILE ĐÍNH KÈM =====
            FormCard(
              title: 'File đính kèm',
              child: _isEditing
                  ? FormFilePicker(
                name: 'new_attachments', // 🔥 đổi key
                label: 'Chọn file đính kèm',
                icon: Icons.attach_file,
                allowMultiple: true,
              )
                  : _MarketingAttachmentsReadonly(
                files: _initialValue['attachments'] ?? [],
              ),
            ),

            const SizedBox(height: 24),

            FormActions(
              mode: _isEditing ? FormActionMode.edit : FormActionMode.view,
              onView: () {},
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

class _MarketingAttachmentsReadonly extends StatelessWidget {
  final List files;

  const _MarketingAttachmentsReadonly({
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'Không có file đính kèm',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    return Column(
      children: files
          .map(
            (e) => ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.insert_drive_file_outlined),
          title: Text(e['name'] ?? 'file'),
          trailing: IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // TODO: open / download file
            },
          ),
        ),
      )
          .toList(),
    );
  }
}