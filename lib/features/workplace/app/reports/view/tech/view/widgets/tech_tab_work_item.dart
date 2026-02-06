import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final fakeCategories = const [
      'Bugfix',
      'Feature',
      'Tối ưu hiệu năng',
      'Nghiên cứu',
    ];

    debugPrint('UI mission = ${report.mission}');

    return Column(
      children: [
        /// ===== CATEGORY (map tạm vào projectText / hoặc mission tuỳ BE) =====
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
                        TechEvent.updateWork(index: index, mission: v),
                      );
                    },
                  );
                },
          child: AbsorbPointer(
            child: FormInputField(
              key: ValueKey('${report.id}_${report.mission}'),
              nameForm: 'tech_add_category_${report.projectCode}_${report.projectText}',
              nameTextField: 'category_${report.projectCode}_${report.projectText}',
              label: report.mission.isNotEmpty == true
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
                readOnly: readonly,
                initialValue: report.totalHours.toString(),
                onChanged: readonly
                    ? null
                    : (v) {
                        context.read<TechBloc>().add(
                          TechEvent.updateWork(index: index, totalHours: v),
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
                nameTextField: 'ot_${report.projectCode}_${report.projectText}',
                label: 'OT',
                keyboardType: TextInputType.number,
                readOnly: readonly,
                initialValue: report.totalHourOT?.toString() ?? '',
                onChanged: readonly
                    ? null
                    : (v) {
                        context.read<TechBloc>().add(
                          TechEvent.updateWork(index: index, totalHourOT: v),
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
          nameTextField: 'percent_${report.projectCode}_${report.projectText}',
          label: 'Tiến độ hoàn thành',
          keyboardType: TextInputType.number,
          readOnly: readonly,
          initialValue: report.percentComplete.toString(),
          onChanged: readonly
              ? null
              : (v) {
                  context.read<TechBloc>().add(
                    TechEvent.updateWork(index: index, percentComplete: v),
                  );
                },
        ),

        const SizedBox(height: 8),

        /// ===== CONTENT =====
        FormInputField(
          icon: Icons.note_outlined,
          nameForm:
              'tech_add_content_${report.projectCode}_${report.projectText}',
          nameTextField: 'content_${report.projectCode}_${report.projectText}',
          label: 'Nội dung công việc',
          maxLines: 3,
          readOnly: readonly,
          initialValue: report.content,
          onChanged: readonly
              ? null
              : (v) {
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
          nameTextField: 'result_${report.projectCode}_${report.projectText}',
          label: 'Kết quả',
          maxLines: 3,
          readOnly: readonly,
          initialValue: report.results,
          onChanged: readonly
              ? null
              : (v) {
                  context.read<TechBloc>().add(
                    TechEvent.updateWork(index: index, results: v),
                  );
                },
        ),
      ],
    );
  }
}
