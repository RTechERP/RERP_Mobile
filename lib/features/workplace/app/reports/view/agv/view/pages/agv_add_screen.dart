import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';

class AgvAddScreen extends StatefulWidget {
  const AgvAddScreen({super.key});

  @override
  State<AgvAddScreen> createState() => _AgvAddScreenState();
}

class _AgvAddScreenState extends State<AgvAddScreen> {
  final _screenFormKey = GlobalKey<FormBuilderState>();

  final fakeProjects = const ['Dự án Ads A', 'Dự án Ads B', 'Dự án Ads C'];

  int _activeProjectIndex = 0;

  final List<_AdProjectForm> _projects = [
    _AdProjectForm(),
  ];

  void _addProject() {
    setState(() {
      _projects.add(_AdProjectForm());
      _activeProjectIndex = _projects.length - 1;
    });
  }

  void _removeProject(int index) {
    setState(() {
      _projects.removeAt(index);
      if (_activeProjectIndex >= _projects.length) {
        _activeProjectIndex = _projects.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final project = _projects[_activeProjectIndex];

    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Tạo báo cáo Ads')),
      body: FormBuilder(
        key: _screenFormKey,
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
                name: 'ad_add_date',
                label: 'Ngày báo cáo',
                inputType: InputType.date,
                format: DateFormat('dd/MM/yyyy'),
              ),
            ),

            const SizedBox(height: 12),

            /// ===== CARD: PROJECT =====
            FormCard(
              title: 'Dự án',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===== TAB PROJECT =====
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
                        IconButton(
                          onPressed: _addProject,
                          icon: const Icon(Icons.add_circle_outline),
                          tooltip: 'Thêm dự án',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// ===== SELECT PROJECT NAME =====
                  GestureDetector(
                    onTap: () {
                      openSelectBottomSheet(
                        context: context,
                        title: 'Chọn dự án',
                        items: fakeProjects,
                        onSelected: (v) {
                          setState(() {
                            _projects[_activeProjectIndex].name = v;
                          });
                        },
                      );
                    },
                    child: AbsorbPointer(
                      child: FormInputField(
                        nameForm: 'ad_add_project_$_activeProjectIndex',
                        nameTextField:
                        'ad_project_$_activeProjectIndex',
                        label: project.name?.isNotEmpty == true
                            ? project.name!
                            : 'Dự án',
                        readOnly: true,
                        icon: Icons.work_outline,
                        initialValue: project.name ?? '',
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// ===== TỔNG GIỜ + OT =====
                  Row(
                    children: [
                      Expanded(
                        child: FormInputField(
                          icon: Icons.timer_outlined,
                          nameForm:
                          'ad_add_total_hours_$_activeProjectIndex',
                          nameTextField:
                          'total_hours_$_activeProjectIndex',
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
                          'ad_add_ot_hours_$_activeProjectIndex',
                          nameTextField:
                          'ot_hours_$_activeProjectIndex',
                          label: 'Số giờ OT',
                          keyboardType: TextInputType.number,
                          initialValue: project.otHours,
                          onChanged: (v) => project.otHours = v,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// ===== NỘI DUNG =====
                  FormInputField(
                    icon: Icons.note_alt_outlined,
                    nameForm:
                    'ad_add_content_$_activeProjectIndex',
                    nameTextField:
                    'content_$_activeProjectIndex',
                    label: 'Nội dung công việc',
                    maxLines: 3,
                    initialValue: project.content,
                    onChanged: (v) => project.content = v,
                  ),

                  const SizedBox(height: 8),

                  /// ===== KẾT QUẢ =====
                  FormInputField(
                    icon: Icons.task_alt_outlined,
                    nameForm:
                    'ad_add_result_$_activeProjectIndex',
                    nameTextField:
                    'result_$_activeProjectIndex',
                    label: 'Kết quả',
                    maxLines: 3,
                    initialValue: project.result,
                    onChanged: (v) => project.result = v,
                  ),

                  const SizedBox(height: 12),

                  /// ===== NƠI LÀM VIỆC (GIỐNG TECH) =====
                  FormCard(
                    title: 'Nơi làm việc',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderRadioGroup<String>(
                          name:
                          'ad_location_type_$_activeProjectIndex',
                          initialValue: 'rtc',
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
                          onChanged: (v) {
                            if (v == 'rtc') {
                              _screenFormKey
                                  .currentState
                                  ?.fields['ad_location_$_activeProjectIndex']
                                  ?.didChange('VP RTC');
                            } else {
                              _screenFormKey
                                  .currentState
                                  ?.fields['ad_location_$_activeProjectIndex']
                                  ?.didChange('');
                            }
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 8),
                        Builder(
                          builder: (context) {
                            final locationType = _screenFormKey
                                .currentState
                                ?.fields['ad_location_type_$_activeProjectIndex']
                                ?.value ??
                                'rtc';

                            if (locationType == 'rtc') {
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
                              'ad_add_location_$_activeProjectIndex',
                              nameTextField:
                              'ad_location_$_activeProjectIndex',
                              label: 'Địa điểm làm việc',
                              initialValue: '',
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
                  FormInputField(
                    icon: Icons.next_plan_outlined,
                    nameForm:
                    'ad_add_next_plan_$_activeProjectIndex',
                    nameTextField:
                    'next_plan_$_activeProjectIndex',
                    label: 'Kế hoạch ngày tiếp theo',
                    maxLines: 3,
                    initialValue: project.nextPlan,
                    onChanged: (v) =>
                    project.nextPlan = v,
                  ),

                  if (_projects.length > 1)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          _removeProject(_activeProjectIndex);
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Xoá dự án này',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            FormActions(
              mode: FormActionMode.add,
              onSubmit: () {
                if (_screenFormKey.currentState?.saveAndValidate() ??
                    false) {
                  debugPrint(_screenFormKey.currentState!.value.toString());
                  debugPrint(
                    _projects.map((e) => e.toJson()).toString(),
                  );
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
  String? locationType = 'rtc';
  String? location = 'VP RTC';
  String? nextPlan;

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