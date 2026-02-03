import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_tab_work_item.dart';

class TechDetailScreen extends StatefulWidget {
  const TechDetailScreen({super.key});

  @override
  State<TechDetailScreen> createState() => _TechDetailScreenState();
}

class _TechDetailScreenState
    extends BaseState<TechDetailScreen, TechEvent, TechState, TechBloc> {
  final _screenFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    bloc.add(const TechEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(title: const Text('Chi tiết báo cáo')),
      body: BlocBuilder<TechBloc, TechState>(
        builder: (context, state) {
          final hasExtraInfo =
              (state.issue?.isNotEmpty == true) ||
                  (state.solution?.isNotEmpty == true) ||
                  (state.blocking?.isNotEmpty == true) ||
                  (state.blockingReason?.isNotEmpty == true);

          return FormBuilder(
            key: _screenFormKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                /// ===== NGÀY =====
                FormCard(
                  title: 'Ngày báo cáo',
                  child: FormReadonlyField(
                    name: 'date',
                    label: 'Ngày báo cáo',
                    icon: Icons.calendar_today,
                    initialValue: state.reportDate,
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== PROJECT + CATEGORY + WORK =====
                ...state.projects.asMap().entries.map((pEntry) {
                  final projectIndex = pEntry.key;
                  final project = pEntry.value;

                  return Column(
                    children: [
                      FormCard(
                        title: 'Dự án ${projectIndex + 1}',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// PROJECT NAME
                            FormReadonlyField(
                              name: 'project_$projectIndex',
                              label: 'Dự án',
                              icon: Icons.work_outline,
                              initialValue: project.name ?? '--',
                            ),

                            const SizedBox(height: 12),

                            /// ===== CATEGORY + WORK =====
                            ...project.categories.asMap().entries.map((cEntry) {
                              final categoryIndex = cEntry.key;
                              final category = cEntry.value;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (category.category?.isNotEmpty == true) ...[
                                    FormReadonlyField(
                                      name:
                                      'category_${projectIndex}_$categoryIndex',
                                      label: 'Hạng mục',
                                      icon: Icons.category_outlined,
                                      initialValue: category.category,
                                    ),
                                    const SizedBox(height: 8),
                                  ],

                                  ...category.works
                                      .asMap()
                                      .entries
                                      .map((wEntry) {
                                    final wIndex = wEntry.key;
                                    final work = wEntry.value;

                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 8),
                                      child: TechTabWorkItem(
                                        projectIndex: projectIndex, // ✅ fix i
                                        title: 'Công việc ${wIndex + 1}', // ✅ fix i
                                        work: work,
                                        isExpanded: true,
                                        alwaysExpanded: true, // ✅ luôn mở
                                        readonly: true, // ✅ chỉ xem
                                        onToggleExpand: () {}, // không dùng
                                      ),
                                    );
                                  }),

                                  const SizedBox(height: 12),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                }),

                /// ===== NƠI LÀM VIỆC =====
                FormCard(
                  title: 'Nơi làm việc',
                  child: FormReadonlyField(
                    name: 'location',
                    label: 'Địa điểm làm việc',
                    icon: Icons.location_on_outlined,
                    initialValue: state.locationType == 'rtc'
                        ? 'VP RTC'
                        : state.location,
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== THÔNG TIN BỔ SUNG =====
                if (hasExtraInfo)
                  FormCard(
                    title: 'Thông tin bổ sung',
                    child: Column(
                      children: [
                        if (state.issue?.isNotEmpty == true)
                          FormReadonlyField(
                            name: 'issue',
                            label: 'Vấn đề phát sinh',
                            icon: Icons.report_problem_outlined,
                            initialValue: state.issue,
                          ),
                        if (state.solution?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            name: 'solution',
                            label: 'Hướng giải quyết',
                            icon: Icons.build_outlined,
                            initialValue: state.solution,
                          ),
                        ],
                        if (state.blocking?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            name: 'blocking',
                            label: 'Tồn đọng',
                            icon: Icons.warning_amber_outlined,
                            initialValue: state.blocking,
                          ),
                        ],
                        if (state.blockingReason?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            name: 'blocking_reason',
                            label: 'Lý do tồn đọng',
                            icon: Icons.note_outlined,
                            initialValue: state.blockingReason,
                          ),
                        ],
                      ],
                    ),
                  ),

                const SizedBox(height: 12),

                /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
                FormCard(
                  title: 'Kế hoạch ngày tiếp theo',
                  child: FormReadonlyField(
                    name: 'next_plan',
                    label: 'Kế hoạch ngày tiếp theo',
                    icon: Icons.next_plan_outlined,
                    initialValue: state.nextPlan,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}