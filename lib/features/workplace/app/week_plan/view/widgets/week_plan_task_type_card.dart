import 'package:flutter/material.dart';

import '../../data/datasource/models/week_plan_model.dart';

class WeekPlanTaskTypeCard extends StatelessWidget {
  const WeekPlanTaskTypeCard({
    super.key,
    required this.selectedId,
    required this.taskTypes,
    required this.onChanged,
  });

  final int? selectedId;
  final List<TaskTypeItem> taskTypes;
  final ValueChanged<TaskTypeItem> onChanged;

  TaskTypeItem? get _selected =>
      taskTypes.cast<TaskTypeItem?>().firstWhere(
            (t) => t?.id == selectedId,
            orElse: () => null,
          );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEBEBF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.category_outlined,
                  size: 24, color: Color(0xff989898)),
              const SizedBox(width: 14),
              const Text(
                'Loại công việc',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff989898),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (taskTypes.isEmpty)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
          if (taskTypes.isNotEmpty) ...[
            const SizedBox(height: 10),
            PopupMenuButton<TaskTypeItem>(
              initialValue: _selected,
              onSelected: onChanged,
              offset: const Offset(0, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              itemBuilder: (context) => taskTypes.map((t) {
                final isSelected = t.id == selectedId;
                final color = _parseColor(t.color);
                return PopupMenuItem<TaskTypeItem>(
                  value: t,
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          t.typeName ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight:
                                isSelected ? FontWeight.w700 : FontWeight.w400,
                            color: isSelected
                                ? const Color(0xff404C6D)
                                : const Color(0xff6E7191),
                          ),
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check,
                            size: 18, color: Color(0xffEE4623)),
                    ],
                  ),
                );
              }).toList(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEBEBF0)),
                ),
                child: Row(
                  children: [
                    if (_selected != null) ...[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _parseColor(_selected!.color),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selected!.typeName ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff404C6D),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ] else ...[
                      const Expanded(
                        child: Text(
                          'Chọn loại CV',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898),
                          ),
                        ),
                      ),
                    ],
                    const Icon(Icons.arrow_drop_down,
                        size: 22, color: Color(0xff989898)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) {
      return const Color(0xff989898);
    }
    final clean = hexColor.replaceAll('#', '');
    if (clean.length == 6) {
      return Color(int.parse('FF$clean', radix: 16));
    }
    if (clean.length == 8) {
      return Color(int.parse(clean, radix: 16));
    }
    return const Color(0xff989898);
  }
}
