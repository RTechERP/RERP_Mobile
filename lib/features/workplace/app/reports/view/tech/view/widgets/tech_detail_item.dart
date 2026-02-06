import 'package:flutter/material.dart';

import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/tech_model.dart';

class TechDetailItem extends StatelessWidget {
  final int index;
  final TechWork work;

  const TechDetailItem({
    super.key,
    required this.index,
    required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return FormCard(
      title: 'Công việc ${index + 1}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (work.projectText.isNotEmpty == true)
            FormReadonlyField(
              key: ValueKey('work_${work.id}_category_${work.projectText}'),
              name: 'work_${work.id}_category',
              label: 'Hạng mục',
              icon: Icons.category_outlined,
              initialValue: work.projectText,
            ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: FormReadonlyField(
                  key: ValueKey('work_${work.id}_total_${work.totalHours}'),
                  name: 'work_${work.id}_total',
                  label: 'Tổng giờ',
                  icon: Icons.timer_outlined,
                  initialValue: work.totalHours,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormReadonlyField(
                  key: ValueKey('work_${work.id}_ot_${work.totalHourOT}'),
                  name: 'work_${work.id}_ot',
                  label: 'OT',
                  icon: Icons.timer_outlined,
                  initialValue: work.totalHourOT,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          FormReadonlyField(
            key: ValueKey('work_${work.id}_percent_${work.percentComplete}'),
            name: 'work_${work.id}_percent',
            label: 'Tiến độ (%)',
            icon: Icons.percent_outlined,
            initialValue: work.percentComplete,
          ),

          if (work.content.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            FormReadonlyField(
              key: ValueKey('work_${work.id}_content_${work.content}'),
              name: 'work_${work.id}_content',
              label: 'Nội dung công việc',
              icon: Icons.note_outlined,
              initialValue: work.content,
            ),
          ],

          if (work.results.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            FormReadonlyField(
              key: ValueKey('work_${work.id}_result_${work.results}'),
              name: 'work_${work.id}_result',
              label: 'Kết quả',
              icon: Icons.task_alt_outlined,
              initialValue: work.results,
            ),
          ],
        ],
      ),
    );
  }
}