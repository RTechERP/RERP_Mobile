import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
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
        initialValue: {
          'date': DateTime.now(),
          'location_type': 'rtc',
        },
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
                                ? project.name!           // 👈 label = tên project đã chọn
                                : 'Dự án',                // 👈 fallback khi chưa chọn
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
                          projectIndex: projectIndex,
                          title: 'Công việc ${wIndex + 1}',
                          work: work,
                          isExpanded: state.expandedProjectIndex == projectIndex &&
                              state.expandedWorkIndex == wIndex,
                          onToggleExpand: () {
                            bloc.add(TechEvent.expandWork(projectIndex, wIndex));
                          },
                          onDelete: () {
                            bloc.add(TechEvent.removeWork(projectIndex: projectIndex, workId: work.id));
                          },
                        );
                      }),

                      const SizedBox(height: 12),

                      if (project.works.isEmpty)
                      /// ===== EMPTY STATE: CHƯA CÓ WORK =====
                        Center(
                          child: InkWell(
                            onTap: () {
                              bloc.add(TechEvent.addWork(projectIndex));
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.primaryERP.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.primaryERP),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_circle_outline, color: AppColors.primaryERP),
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
          ],
        ),
      ),
    );
  }
}