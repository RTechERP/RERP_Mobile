import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/tech_bloc.dart';
import '../widgets/tech_detail_item.dart';

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
        buildWhen: (prev, curr) =>
        prev.projects != curr.projects ||
            prev.reportDate != curr.reportDate ||
            prev.issue != curr.issue ||
            prev.solution != curr.solution ||
            prev.blocking != curr.blocking ||
            prev.blockingReason != curr.blockingReason ||
            prev.nextPlan != curr.nextPlan ||
            prev.location != curr.location ||
            prev.locationType != curr.locationType,
        builder: (context, state) {
          final hasExtraInfo =
              (state.issue?.isNotEmpty == true) ||
                  (state.solution?.isNotEmpty == true) ||
                  (state.blocking?.isNotEmpty == true) ||
                  (state.blockingReason?.isNotEmpty == true);

          return FormBuilder(
            key: ValueKey('form_${state.hashCode}'), // 🔥 ép rebuild form
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                /// ===== NGÀY =====
                FormCard(
                  title: 'Ngày báo cáo',
                  child: FormReadonlyField(
                    key: ValueKey('date_${state.reportDate}'),
                    name: 'date',
                    label: 'Ngày báo cáo',
                    icon: Icons.calendar_today,
                    initialValue: state.reportDate != null
                        ? _formatDate(state.reportDate!)
                        : '--',
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== PROJECT + CATEGORY + WORK =====
                ...state.projects.asMap().entries.map((pEntry) {
                  final projectIndex = pEntry.key;
                  final project = pEntry.value;

                  return Column(
                    key: ValueKey('project_block_${project.id}'),
                    children: [
                      FormCard(
                        title: 'Dự án ${projectIndex + 1}',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormReadonlyField(
                              key: ValueKey('project_${project.id}_${project.name}'),
                              name: 'project_$projectIndex',
                              label: 'Dự án',
                              icon: Icons.work_outline,
                              initialValue: project.name ?? '--',
                            ),
                            const SizedBox(height: 12),

                            ...project.categories.asMap().entries.map((cEntry) {
                              final categoryIndex = cEntry.key;
                              final category = cEntry.value;

                              return Column(
                                key: ValueKey(
                                    'category_block_${project.id}_$categoryIndex'),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (category.category?.isNotEmpty == true) ...[
                                    FormReadonlyField(
                                      key: ValueKey(
                                        'category_${project.id}_${categoryIndex}_${category.category}',
                                      ),
                                      name:
                                      'category_${projectIndex}_$categoryIndex',
                                      label: 'Hạng mục',
                                      icon: Icons.category_outlined,
                                      initialValue: category.category,
                                    ),
                                    const SizedBox(height: 8),
                                  ],

                                  ...category.works.asMap().entries.map((wEntry) {
                                    final wIndex = wEntry.key;
                                    final work = wEntry.value;

                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: TechDetailItem(
                                        key: ValueKey('detail_work_${work.id}_${work.hashCode}'),
                                        index: wIndex,
                                        work: work,
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
                    key: ValueKey(
                        'location_${state.location}_${state.locationType}'),
                    name: 'location',
                    label: 'Địa điểm làm việc',
                    icon: Icons.location_on_outlined,
                    initialValue: state.locationType == 'rtc'
                        ? 'VP RTC'
                        : (state.location?.isNotEmpty == true
                        ? state.location
                        : '--'),
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
                            key: ValueKey('issue_${state.issue}'),
                            name: 'issue',
                            label: 'Vấn đề phát sinh',
                            icon: Icons.report_problem_outlined,
                            initialValue: state.issue,
                          ),
                        if (state.solution?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            key: ValueKey('solution_${state.solution}'),
                            name: 'solution',
                            label: 'Hướng giải quyết',
                            icon: Icons.build_outlined,
                            initialValue: state.solution,
                          ),
                        ],
                        if (state.blocking?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            key: ValueKey('blocking_${state.blocking}'),
                            name: 'blocking',
                            label: 'Tồn đọng',
                            icon: Icons.warning_amber_outlined,
                            initialValue: state.blocking,
                          ),
                        ],
                        if (state.blockingReason?.isNotEmpty == true) ...[
                          const SizedBox(height: 8),
                          FormReadonlyField(
                            key: ValueKey(
                                'blockingReason_${state.blockingReason}'),
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
                    key: ValueKey('nextPlan_${state.nextPlan}'),
                    name: 'next_plan',
                    label: 'Kế hoạch ngày tiếp theo',
                    icon: Icons.next_plan_outlined,
                    initialValue:
                    state.nextPlan?.isNotEmpty == true ? state.nextPlan : '--',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/'
        '${d.year}';
  }
}