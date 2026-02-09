import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/tech_model.dart';
import '../bloc/tech_bloc.dart';

class TechTabWorkItem extends StatelessWidget {
  final String title;
  final TechWork report;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;

  /// 👇 DetailScreen bật flag này = luôn mở
  final bool alwaysExpanded;
  final int index;

  const TechTabWorkItem({
    super.key,
    required this.title,
    required this.index,
    required this.report,
    required this.isExpanded,
    required this.onToggleExpand,
    this.onDelete,
    this.readonly = false,
    this.alwaysExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final showExpanded = alwaysExpanded || isExpanded;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: alwaysExpanded ? null : onToggleExpand,
      child: FormCard(
        title: title,
        actions: [
          if (!alwaysExpanded)
            IconButton(
              icon: Icon(
                showExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
              ),
              onPressed: onToggleExpand,
            ),
          if (!readonly && onDelete != null)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: onDelete,
            ),
        ],
        child: showExpanded
            ? IgnorePointer(ignoring: readonly, child: _buildContent(context))
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<TechBloc, TechState>(
      buildWhen: (prev, curr) =>
      prev.selectedProject != curr.selectedProject ||
          prev.expandedWorkIndex != curr.expandedWorkIndex ||
          prev.projectItem != curr.projectItem,

      builder: (context, state) {
        final missions = state.projectItem
            .map((e) => e.mission ?? '')
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList(); // loại trùng

        return Column(
          children: [
            /// ===== CATEGORY (MISSION TỪ BE) =====
            GestureDetector(
              onTap: readonly
                  ? null
                  : () {
                openSelectBottomSheet(
                  context: context,
                  title: 'Chọn hạng mục',
                  items: missions, // có thể rỗng
                  onSelected: (v) {
                    final item = state.projectItem.firstWhere(
                          (e) => e.mission == v,
                    );

                    context.read<TechBloc>().add(
                      TechEvent.updateWork(
                        index: index,
                        mission: item.mission,
                        projectItemId: item.id,        // ✅ ID đúng theo item user chọn
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('work_${report.id}_$index'),
                  nameForm:
                  'tech_add_category_${state.selectedProject?.projectCode}_${index}',
                  nameTextField:
                  'category_${state.selectedProject?.projectCode}_${index}',
                  label: (report.mission.isNotEmpty == true)
                      ? report.mission
                      : 'Hạng mục',
                  readOnly: true,
                  icon: Icons.category_outlined,
                  initialValue: report.mission,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== TOTAL + OT =====
            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm:
                        'tech_add_total_${report.projectCode}_${report.projectText}',
                    nameTextField:
                        'total_${report.projectCode}_${report.projectText}',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    initialValue: report.totalHours.toString(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Vui lòng nhập tổng số giờ'),
                      FormBuilderValidators.numeric(errorText: 'Chỉ được nhập số'),
                      FormBuilderValidators.min(0.1, errorText: 'Giờ phải > 0'),
                    ]),
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: index,
                          totalHours: double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm:
                        'tech_add_ot_${report.projectCode}_${report.projectText}',
                    nameTextField:
                        'ot_${report.projectCode}_${report.projectText}',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    initialValue: report.totalHourOT?.toString() ?? '0',
                    onChanged: (v) {
                      context.read<TechBloc>().add(
                        TechEvent.updateWork(
                          index: index,
                          totalHourOT: double.tryParse(v ?? '') ?? 0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// ===== PERCENT =====
            FormInputField(
              icon: Icons.percent_outlined,
              nameForm:
                  'tech_add_percent_${report.projectCode}_${report.projectText}',
              nameTextField:
                  'percent_${report.projectCode}_${report.projectText}',
              label: 'Tiến độ hoàn thành',
              keyboardType: TextInputType.number,
              initialValue: report.percentComplete.toString(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Vui lòng nhập % tiến độ'),
                FormBuilderValidators.numeric(errorText: 'Chỉ được nhập số'),
                FormBuilderValidators.min(0, errorText: '>= 0'),
                FormBuilderValidators.max(100, errorText: '<= 100'),
              ]),
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    index: index,
                    percentComplete: double.tryParse(v ?? '') ?? 0,
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== CONTENT =====
            FormInputField(
              icon: Icons.note_outlined,
              nameForm:
                  'tech_add_content_${report.projectCode}_${report.projectText}',
              nameTextField:
                  'content_${report.projectCode}_${report.projectText}',
              label: 'Nội dung công việc',
              maxLines: 3,
              initialValue: report.content,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng nhập nội dung công việc',
              ),
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: index, content: v),
                );
              },
            ),

            const SizedBox(height: 8),

            /// ===== RESULT =====
            FormInputField(
              icon: Icons.note_outlined,
              nameForm:
                  'tech_add_result_${report.projectCode}_${report.projectText}',
              nameTextField:
                  'result_${report.projectCode}_${report.projectText}',
              label: 'Kết quả',
              maxLines: 3,
              initialValue: report.results,
              validator: FormBuilderValidators.required(
                errorText: 'Vui lòng nhập kết quả',
              ),
              onChanged: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(index: index, results: v),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
