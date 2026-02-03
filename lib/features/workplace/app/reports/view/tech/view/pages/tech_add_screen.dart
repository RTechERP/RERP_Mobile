import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_tab_work_item.dart';

class TechAddScreen extends StatefulWidget {
  const TechAddScreen({super.key});

  @override
  State<TechAddScreen> createState() => _TechAddScreenState();
}

class _TechAddScreenState
    extends BaseState<TechAddScreen, TechEvent, TechState, TechBloc> {
  final fakeProjects = const ['Dự án RTC A', 'Dự án RTC B', 'Dự án RTC C'];

  final _screenFormKey = GlobalKey<FormBuilderState>();

  bool _showExtraInfo = false;
  @override
  void initState() {
    super.initState();
    bloc.add(const TechEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Tạo báo cáo')),
      body: FormBuilder(
          key: _screenFormKey,
          initialValue: {'date': DateTime.now(), 'location_type': 'rtc'},
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              /// ===== NGÀY =====
              FormCard(
                title: 'Ngày báo cáo',
                child: FormDateTimePicker(
                  icon: Icons.calendar_today,
                  name: 'tech_add_date',
                  label: 'Ngày báo cáo',
                  inputType: InputType.date,
                  format: DateFormat('dd/MM/yyyy'),
                  onChanged: (v) {
                    bloc.add(TechEvent.updateDate(date: v));
                  },
                ),
              ),

              const SizedBox(height: 12),

              /// ===== CARD: PROJECT + WORK =====
              FormCard(
                title: 'Dự án',
                child: BlocBuilder<TechBloc, TechState>(
                  buildWhen: (prev, curr) =>
                      prev.projects != curr.projects ||
                      prev.expandedProjectIndex != curr.expandedProjectIndex ||
                      prev.expandedWorkIndex != curr.expandedWorkIndex,
                  builder: (context, state) {
                    if (state.projects.isEmpty) {
                      return CustomTextButton(
                        width: double.infinity,
                        bgColor: AppColors.grayColor[10],
                        colorText: AppColors.primaryERPlight,
                        buttonFn: () {
                          bloc.add(const TechEvent.addProject());
                        },
                        child: const Text('➕ Thêm dự án'),
                      );
                    }

                    final projectIndex = state.expandedProjectIndex ?? 0;
                    final project = state.projects[projectIndex];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ===== TAB PROJECT =====
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...state.projects.asMap().entries.map((entry) {
                                final i = entry.key;
                                final p = entry.value;
                                final isActive = i == projectIndex;

                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      bloc.add(TechEvent.expandProject(i));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? AppColors.primaryERP.withOpacity(
                                                0.1,
                                              )
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: isActive
                                              ? AppColors.primaryERP
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Text(
                                        p.name?.isNotEmpty == true
                                            ? p.name!
                                            : 'Dự án ${i + 1}',
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

                              /// ➕ ADD PROJECT
                              IconButton(
                                onPressed: () {
                                  bloc.add(const TechEvent.addProject());
                                },
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
                                bloc.add(
                                  TechEvent.selectProject(projectIndex, v),
                                );
                              },
                            );
                          },
                          child: AbsorbPointer(
                            child: FormInputField(
                              nameForm: 'tech_add_project_$projectIndex',
                              nameTextField: 'tech_project_$projectIndex',
                              label: project.name?.isNotEmpty == true
                                  ? project
                                        .name! // 👈 label = tên project đã chọn
                                  : 'Dự án', // 👈 fallback khi chưa chọn
                              readOnly: true,
                              icon: Icons.work_outline,
                              initialValue: project.name ?? '',
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// ===== LIST WORK =====
                        ...project.works.asMap().entries.map((entry) {
                          final wIndex = entry.key;
                          final work = entry.value;

                          return TechTabWorkItem(
                            readonly: false,
                            projectIndex: projectIndex,
                            title: 'Công việc ${wIndex + 1}',
                            work: work,
                            isExpanded:
                                state.expandedProjectIndex == projectIndex &&
                                state.expandedWorkIndex == wIndex,
                            onToggleExpand: () {
                              bloc.add(
                                TechEvent.expandWork(projectIndex, wIndex),
                              );
                            },
                            onDelete: () {
                              bloc.add(
                                TechEvent.removeWork(
                                  projectIndex: projectIndex,
                                  workId: work.id,
                                ),
                              );
                            },
                          );
                        }),

                        if (project.works.isEmpty)
                          /// ===== EMPTY STATE: CHƯA CÓ WORK =====
                          InkWell(
                            onTap: () {
                              bloc.add(TechEvent.addWork(projectIndex));
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryERP.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.primaryERP),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: AppColors.primaryERP,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Thêm công việc',
                                    style: TextStyle(
                                      color: AppColors.primaryERP,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          /// ===== ĐÃ CÓ WORK → CHỈ HIỆN ICON Ở GIỮA =====
                          Center(
                            child: InkResponse(
                              onTap: () {
                                bloc.add(TechEvent.addWork(projectIndex));
                              },
                              radius: 28,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 32,
                                  color: AppColors.primaryERP,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),

              FormCard(
                title: 'Nơi làm việc',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormBuilderRadioGroup<String>(
                      name: 'location_type',
                      initialValue: 'rtc',
                      options: const [
                        FormBuilderFieldOption(value: 'rtc', child: Text('VP RTC')),
                        FormBuilderFieldOption(value: 'other', child: Text('Địa điểm khác')),
                      ],
                      onChanged: (v) {
                        if (v == 'rtc') {
                          _screenFormKey.currentState?.fields['location']?.didChange('VP RTC');
                        } else {
                          _screenFormKey.currentState?.fields['location']?.didChange('');
                        }
                        setState(() {}); // rebuild để đổi widget
                      },
                    ),

                    const SizedBox(height: 8),

                    Builder(
                      builder: (context) {
                        final locationType =
                            _screenFormKey.currentState?.fields['location_type']?.value ??
                                'rtc';

                        final isRTC = locationType == 'rtc';

                        if (isRTC) {
                          /// ===== READONLY FIELD =====
                          return FormReadonlyField(
                            name: 'location',
                            label: '',
                            icon: Icons.location_on_outlined,
                            initialValue: 'VP RTC',
                          );
                        }

                        /// ===== INPUT FIELD =====
                        return FormInputField(
                          key: const ValueKey('location_other'), // ép rebuild
                          icon: Icons.location_on_outlined,
                          nameForm: 'tech_add_location',
                          nameTextField: 'location',
                          label: 'Địa điểm làm việc',
                          readOnly: false,
                          initialValue: '',
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

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
                        nameForm: 'tech_add_issue',
                        nameTextField: 'issue',
                        label: 'Vấn đề phát sinh (nếu có)',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        icon: Icons.build_outlined,
                        nameForm: 'tech_add_solution',
                        nameTextField: 'solution',
                        label: 'Hướng giải quyết (nếu có)',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        icon: Icons.warning_amber_outlined,
                        nameForm: 'tech_add_blocking',
                        nameTextField: 'blocking',
                        label: 'Tồn đọng (nếu có)',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8),

                      FormInputField(
                        icon: Icons.note_outlined,
                        nameForm: 'tech_add_blocking_reason',
                        nameTextField: 'blocking_reason',
                        label: 'Ghi chú / Lý do tồn đọng',
                        maxLines: 3,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),

              FormCard(
                title: 'Kế hoạch ngày tiếp theo',
                child: FormInputField(
                  icon: Icons.next_plan_outlined,
                  nameForm: 'tech_add_next_plan',
                  nameTextField: 'next_plan',
                  label: 'Kế hoạch ngày tiếp theo',
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 8),


              FormActions(
                mode: FormActionMode.add,
                onSubmit: () {
                  if (_screenFormKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_screenFormKey.currentState!.value.toString());
                  }
                },
              ),
            ],

          ),

        ),

      );
  }
}
