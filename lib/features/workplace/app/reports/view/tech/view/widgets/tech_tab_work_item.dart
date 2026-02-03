import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/tech_model.dart';
import '../bloc/tech_bloc.dart';

class TechTabWorkItem extends StatelessWidget {
  final int projectIndex;
  final String title;
  final TechWork work;
  final bool isExpanded;
  final VoidCallback onToggleExpand;
  final VoidCallback? onDelete;
  final bool readonly;

  /// 👇 DetailScreen bật flag này = luôn mở
  final bool alwaysExpanded;

  const TechTabWorkItem({
    super.key,
    required this.projectIndex,
    required this.title,
    required this.work,
    required this.isExpanded,
    required this.onToggleExpand,
    this.onDelete,
    this.readonly = false,
    this.alwaysExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final showExpanded = alwaysExpanded ? true : isExpanded;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: alwaysExpanded ? null : onToggleExpand, // 👈 bấm cả card để expand
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
        ],
        child: showExpanded
            ? IgnorePointer(
          ignoring: readonly, // 👈 chỉ khoá input
          child: _buildContent(context),
        )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final fakeCategories = const [
      'Bugfix',
      'Feature',
      'Tối ưu hiệu năng',
      'Nghiên cứu'
    ];

    return Column(
      children: [
        /// ===== CATEGORY =====
        GestureDetector(
          onTap: readonly
              ? null
              : () {
            openSelectBottomSheet(
              context: context,
              title: 'Chọn hạng mục',
              items: fakeCategories,
              onSelected: (v) {
                context.read<TechBloc>().add(
                  TechEvent.updateWork(
                    projectIndex: projectIndex,
                    workId: work.id,
                    category: v,
                  ),
                );
              },
            );
          },
          child: AbsorbPointer(
            child: FormInputField(
              key: ValueKey('${work.id}_${work.category}'),
              nameForm: 'tech_add_category_${work.id}',
              nameTextField: 'category_${work.id}',
              label: work.category?.isNotEmpty == true
                  ? work.category!
                  : 'Hạng mục',
              readOnly: true,
              icon: Icons.category_outlined,
              initialValue: work.category ?? '',
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
                nameForm: 'tech_add_total_${work.id}',
                nameTextField: 'total_${work.id}',
                label: 'Tổng giờ',
                keyboardType: TextInputType.number,
                readOnly: readonly,
                initialValue: work.totalHours,
                onChanged: readonly
                    ? null
                    : (v) {
                  context.read<TechBloc>().add(
                    TechEvent.updateWork(
                      projectIndex: projectIndex,
                      workId: work.id,
                      totalHours: v,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FormInputField(
                icon: Icons.timer_outlined,
                nameForm: 'tech_add_ot_${work.id}',
                nameTextField: 'ot_${work.id}',
                label: 'OT',
                keyboardType: TextInputType.number,
                readOnly: readonly,
                initialValue: work.otHours,
                onChanged: readonly
                    ? null
                    : (v) {
                  context.read<TechBloc>().add(
                    TechEvent.updateWork(
                      projectIndex: projectIndex,
                      workId: work.id,
                      otHours: v,
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
          nameForm: 'tech_add_percent_${work.id}',
          nameTextField: 'percent_${work.id}',
          label: 'Tiến độ hoàn thành',
          keyboardType: TextInputType.number,
          readOnly: readonly,
          initialValue: work.percent,
          onChanged: readonly
              ? null
              : (v) {
            context.read<TechBloc>().add(
              TechEvent.updateWork(
                projectIndex: projectIndex,
                workId: work.id,
                percent: v,
              ),
            );
          },
        ),

        const SizedBox(height: 8),

        /// ===== CONTENT =====
        FormInputField(
          icon: Icons.note_outlined,
          nameForm: 'tech_add_content_${work.id}',
          nameTextField: 'content_${work.id}',
          label: 'Nội dung công việc',
          maxLines: 3,
          readOnly: readonly,
          initialValue: work.content,
          onChanged: readonly
              ? null
              : (v) {
            context.read<TechBloc>().add(
              TechEvent.updateWork(
                projectIndex: projectIndex,
                workId: work.id,
                content: v,
              ),
            );
          },
        ),

        const SizedBox(height: 8),

        /// ===== RESULT =====
        FormInputField(
          icon: Icons.note_outlined,
          nameForm: 'tech_add_result_${work.id}',
          nameTextField: 'result_${work.id}',
          label: 'Kết quả',
          maxLines: 3,
          readOnly: readonly,
          initialValue: work.result,
          onChanged: readonly
              ? null
              : (v) {
            context.read<TechBloc>().add(
              TechEvent.updateWork(
                projectIndex: projectIndex,
                workId: work.id,
                result: v,
              ),
            );
          },
        ),
      ],
    );
  }
}