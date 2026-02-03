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

  final VoidCallback onDelete;
  final VoidCallback onToggleExpand;
  final bool isExpanded;

  const TechTabWorkItem({
    super.key,
    required this.title,
    required this.work,
    required this.onDelete,
    required this.onToggleExpand,
    required this.isExpanded,
    required this.projectIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggleExpand,
      child: FormCard(
        title: title,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
            onPressed: onDelete,
          ),
          IconButton(
            icon: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
            ),
            onPressed: onToggleExpand,
          ),
        ],
        child: isExpanded ? _buildContent(context) : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final fakeCategories = const ['Bugfix', 'Feature', 'Tối ưu hiệu năng', 'Nghiên cứu'];

    return Column(
      children: [
        /// ===== CATEGORY =====
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
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
                    label: work.category?.isNotEmpty == true ? work.category! : 'Hạng mục',
                    readOnly: true,
                    icon: Icons.category_outlined,
                    initialValue: work.category ?? '',
                  ),
                ),
              ),
            ),
          ],
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
                initialValue: work.totalHours,
                onChanged: (v) {
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
                initialValue: work.otHours,
                onChanged: (v) {
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
          initialValue: work.percent,
          onChanged: (v) {
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
          initialValue: work.content,
          onChanged: (v) {
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
          initialValue: work.result,
          onChanged: (v) {
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