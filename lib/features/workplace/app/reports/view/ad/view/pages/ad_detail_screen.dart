import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class AdDetailScreen extends StatefulWidget {
  const AdDetailScreen({super.key});

  @override
  State<AdDetailScreen> createState() => _AdDetailScreenState();
}

class _AdDetailScreenState extends State<AdDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _isEditing = false;
  int _activeProjectIndex = 0;

  final fakeProjects = const ['Dự án Ads A', 'Dự án Ads B'];

  final List<_AdProjectForm> _projects = [
    _AdProjectForm.fromApi({
      'name': 'Dự án Ads A',
      'total_hours': '6',
      'ot_hours': '1',
      'content': 'Chạy chiến dịch Facebook Ads',
      'result': 'Tăng 20% lượt tiếp cận',
      'location_type': 'rtc',
      'location': 'VP RTC',
      'next_plan': 'Tối ưu landing page',
    }),
    _AdProjectForm.fromApi({
      'name': 'Dự án Ads B',
      'total_hours': '3',
      'ot_hours': '0',
      'content': 'Chạy Google Ads',
      'result': 'Tăng 10% chuyển đổi',
      'location_type': 'other',
      'location': 'Làm việc tại nhà',
      'next_plan': 'Test A/B landing page',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    final project = _projects[_activeProjectIndex];

    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Chi tiết Ads'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        enabled: _isEditing,
        initialValue: {
          'date': DateTime.now(),
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// ===== NGÀY =====
            FormCard(
              title: 'Ngày báo cáo',
              child: FormDateTimePicker(
                icon: Icons.calendar_today,
                name: 'ad_detail_date',
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
                initialValue: DateTime.now(),
              ),
            ),

            const SizedBox(height: 12),

            /// ===== FORM CARD DỰ ÁN =====
            FormCard(
              title: 'Dự án',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Tabs dự án
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ..._projects.asMap().entries.map((entry) {
                          final i = entry.key;
                          final isActive = i == _activeProjectIndex;

                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _activeProjectIndex = i;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? AppColors.primaryERP.withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isActive
                                        ? AppColors.primaryERP
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  'Dự án ${i + 1}',
                                  style: TextStyle(
                                    color: isActive
                                        ? AppColors.primaryERP
                                        : Colors.black87,
                                    fontWeight: isActive
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Tên dự án
                  GestureDetector(
                    onTap: _isEditing
                        ? () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn dự án',
                        items: fakeProjects,
                        onSelected: (v) {
                          setState(() {
                            project.name = v;
                          });
                        },
                      );
                    }
                        : null,
                    child: AbsorbPointer(
                      child: FormInputField(
                        nameForm: 'ad_project_$_activeProjectIndex',
                        nameTextField:
                        'ad_project_$_activeProjectIndex',
                        label: project.name ?? 'Dự án',
                        readOnly: true,
                        icon: Icons.work_outline,
                        initialValue: project.name ?? '',
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Tổng giờ + OT
                  Row(
                    children: [
                      Expanded(
                        child: FormInputField(
                          icon: Icons.timer_outlined,
                          nameForm:
                          'ad_total_hours_$_activeProjectIndex',
                          nameTextField:
                          'ad_total_hours_$_activeProjectIndex',
                          label: 'Tổng số giờ',
                          keyboardType: TextInputType.number,
                          initialValue: project.totalHours,
                          onChanged: (v) =>
                          project.totalHours = v,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FormInputField(
                          icon: Icons.more_time,
                          nameForm:
                          'ad_ot_hours_$_activeProjectIndex',
                          nameTextField:
                          'ad_ot_hours_$_activeProjectIndex',
                          label: 'Số giờ OT',
                          keyboardType: TextInputType.number,
                          initialValue: project.otHours,
                          onChanged: (v) =>
                          project.otHours = v,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Nội dung
                  FormInputField(
                    icon: Icons.note_alt_outlined,
                    nameForm:
                    'ad_content_$_activeProjectIndex',
                    nameTextField:
                    'ad_content_$_activeProjectIndex',
                    label: 'Nội dung công việc',
                    maxLines: 3,
                    initialValue: project.content,
                    onChanged: (v) => project.content = v,
                  ),

                  const SizedBox(height: 8),

                  /// Kết quả
                  FormInputField(
                    icon: Icons.task_alt_outlined,
                    nameForm:
                    'ad_result_$_activeProjectIndex',
                    nameTextField:
                    'ad_result_$_activeProjectIndex',
                    label: 'Kết quả',
                    maxLines: 3,
                    initialValue: project.result,
                    onChanged: (v) => project.result = v,
                  ),

                  const SizedBox(height: 12),

                  /// Nơi làm việc
                  FormCard(
                    title: 'Nơi làm việc',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderRadioGroup<String>(
                          name:
                          'ad_location_type_$_activeProjectIndex',
                          initialValue: project.locationType,
                          options: const [
                            FormBuilderFieldOption(
                              value: 'rtc',
                              child: Text('VP RTC'),
                            ),
                            FormBuilderFieldOption(
                              value: 'other',
                              child: Text('Địa điểm khác'),
                            ),
                          ],
                          onChanged: _isEditing
                              ? (v) {
                            project.locationType = v;
                            if (v == 'rtc') {
                              _formKey
                                  .currentState
                                  ?.fields['ad_location_$_activeProjectIndex']
                                  ?.didChange('VP RTC');
                            } else {
                              _formKey
                                  .currentState
                                  ?.fields['ad_location_$_activeProjectIndex']
                                  ?.didChange('');
                            }
                            setState(() {});
                          }
                              : null,
                        ),
                        const SizedBox(height: 8),
                        Builder(
                          builder: (context) {
                            final type = _formKey
                                .currentState
                                ?.fields['ad_location_type_$_activeProjectIndex']
                                ?.value ??
                                project.locationType;

                            if (type == 'rtc') {
                              return FormReadonlyField(
                                name:
                                'ad_location_$_activeProjectIndex',
                                label: '',
                                icon: Icons.location_on_outlined,
                                initialValue: 'VP RTC',
                              );
                            }

                            return FormInputField(
                              key: ValueKey(
                                  'ad_location_other_$_activeProjectIndex'),
                              icon: Icons.location_on_outlined,
                              nameForm:
                              'ad_location_$_activeProjectIndex',
                              nameTextField:
                              'ad_location_$_activeProjectIndex',
                              label: 'Địa điểm làm việc',
                              initialValue: project.location ?? '',
                              onChanged: (v) =>
                              project.location = v,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Kế hoạch ngày tiếp theo
                  FormInputField(
                    icon: Icons.next_plan_outlined,
                    nameForm:
                    'ad_next_plan_$_activeProjectIndex',
                    nameTextField:
                    'ad_next_plan_$_activeProjectIndex',
                    label: 'Kế hoạch ngày tiếp theo',
                    maxLines: 3,
                    initialValue: project.nextPlan,
                    onChanged: (v) => project.nextPlan = v,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            if (_isEditing)
              FormActions(
                mode: FormActionMode.edit,
                onSubmit: () {
                  if (_formKey.currentState?.saveAndValidate() ??
                      false) {
                    debugPrint(
                      _projects.map((e) => e.toJson()).toString(),
                    );
                    setState(() => _isEditing = false);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _AdProjectForm {
  String? name;
  String? totalHours;
  String? otHours;
  String? content;
  String? result;
  String? locationType;
  String? location;
  String? nextPlan;

  _AdProjectForm();

  factory _AdProjectForm.fromApi(Map<String, dynamic> json) {
    return _AdProjectForm()
      ..name = json['name']
      ..totalHours = json['total_hours']
      ..otHours = json['ot_hours']
      ..content = json['content']
      ..result = json['result']
      ..locationType = json['location_type']
      ..location = json['location']
      ..nextPlan = json['next_plan'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'total_hours': totalHours,
    'ot_hours': otHours,
    'content': content,
    'result': result,
    'location_type': locationType,
    'location': location,
    'next_plan': nextPlan,
  };
}