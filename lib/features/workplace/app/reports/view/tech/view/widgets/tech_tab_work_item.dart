import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

    return Slidable(
      key: ValueKey('work_${title}_$index'),
      enabled: !showExpanded, // expanded thì disable swipe
      endActionPane: showExpanded
          ? null
          : ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.22,
        children: [
          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline,
            label: 'Xoá',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Builder(
        // 👈 rất quan trọng: để lấy đúng context của Slidable
        builder: (slidableCtx) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: alwaysExpanded
                ? null
                : () {
              // 👇 Đóng Slidable trước khi expand
              Slidable.of(slidableCtx)?.close();
              onToggleExpand();
            },
            child: FormCard(
              title: title,
              collapsed: !showExpanded,
              actions: [
                if (!alwaysExpanded)
                  IconButton(
                    icon: Icon(
                      showExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                    ),
                    onPressed: () {
                      Slidable.of(slidableCtx)?.close(); // 👈 đóng khi bấm icon
                      onToggleExpand();
                    },
                  ),
              ],
              child: AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: showExpanded
                    ? IgnorePointer(
                  ignoring: readonly,
                  child: _buildContent(context),
                )
                    : const SizedBox.shrink(),
              ),
            ),
          );
        },
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
                  items: state.projectItem, // List<ProjectItem>
                  displayText: (v) => '${v.code} - ${v.mission}',
                  onSelected: (item) {
                    context.read<TechBloc>().add(
                      TechEvent.updateWork(
                        index: index,
                        mission: item.mission,
                        projectItemId: item.id,
                        code: item.code,
                      ),
                    );
                  },
                );

              },
              child: AbsorbPointer(
                child: FormInputField(
                  key: ValueKey('work_${report.id}'),
                  nameForm: 'tech_add_category_${report.id}',
                  nameTextField: 'category_${report.id}',
                  label: (report.mission.isNotEmpty == true)
                      ? report.mission
                      : 'Hạng mục',
                  readOnly: true,
                  icon: Icons.category_outlined,
                  validator: (_) {
                    if (report.projectItemId == 0) {
                      return 'Vui lòng chọn hạng mục công việc';
                    }
                    return null;
                  },
                
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// ===== TOTAL + OT =====
            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    key: ValueKey('total_${report.id}'),
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_add_total_${report.id}',
                    nameTextField: 'total_${report.id}',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    initialValue: report.totalHours.toString(),
                    validator: (v) {
                      final total = double.tryParse(v ?? '') ?? 0;
                      final ot = report.totalHourOT ?? 0;

                      if (total <= 0) return 'Giờ phải > 0';
                      if (total > 24) return 'Giờ không được > 24';
                      if (total - ot <= 0) return 'Giờ hành chính phải > 0';
                      return null;
                    },


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
                    nameForm: 'tech_add_ot_${report.id}',
                    nameTextField: 'ot_${report.id}',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    initialValue: report.totalHourOT?.toString() ?? '0',
                    validator: (v) {
                      final total = report.totalHours;
                      final ot = double.tryParse(v ?? '') ?? 0;

                      if (ot > total) return 'OT không được > Tổng giờ';
                      if (total > 8 && ot <= 0) return 'Tổng giờ > 8 thì phải có OT';
                      if (total - ot > 8) return 'Giờ hành chính không được > 8h';
                      return null;
                    },
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
              key: ValueKey('percent_${report.id}'),

              icon: Icons.percent_outlined,
              nameForm: 'tech_add_percent_${report.id}',
              nameTextField: 'percent_${report.id}',
              label: 'Tiến độ hoàn thành',
              keyboardType: TextInputType.number,
              initialValue: report.percentComplete.toString(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Vui lòng nhập % tiến độ'),
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
              key: ValueKey('content_${report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_content_${report.id}',
              nameTextField: 'content_${report.id}',

              label: 'Nội dung công việc',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
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
              key: ValueKey('result_${report.id}'),

              icon: Icons.note_outlined,
              nameForm: 'tech_add_result_${report.id}',
              nameTextField: 'result_${report.id}',
              label: 'Kết quả',
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline, // ⬅ Enter xuống dòng
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
