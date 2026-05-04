import 'package:flutter/material.dart';

import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../data/datasource/models/week_plan_model.dart';

class WeekPlanProjectCard extends StatelessWidget {
  const WeekPlanProjectCard({
    super.key,
    required this.selectedId,
    required this.projects,
    required this.onChanged,
  });

  final int? selectedId;
  final List<ProjectTaskItem> projects;
  final ValueChanged<ProjectTaskItem> onChanged;

  ProjectTaskItem? get _selected =>
      projects.cast<ProjectTaskItem?>().firstWhere(
            (p) => p?.id == selectedId,
            orElse: () => null,
          );

  void _openProjectSheet(BuildContext context) {
    if (projects.isEmpty) return;
    openSelectBottomSheet<ProjectTaskItem>(
      context: context,
      title: 'Chọn dự án',
      items: projects,
      initialSelectedItem: _selected,
      displayText: (p) =>
          '${p.projectCode ?? ''} - ${p.projectName ?? ''}',
      onSelected: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProjectSheet(context),
      child: Container(
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
                const Icon(Icons.folder_outlined,
                    size: 24, color: Color(0xff989898)),
                const SizedBox(width: 14),
                const Text(
                  'Dự án',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff989898),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down,
                    size: 22, color: Color(0xff989898)),
              ],
            ),
            if (projects.isNotEmpty) ...[
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEBEBF0)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _selected != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selected!.projectCode ?? '',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff989898),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _selected!.projectName ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff404C6D),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          : const Text(
                              'Chọn dự án',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff989898),
                              ),
                            ),
                    ),
                    const Icon(Icons.arrow_drop_down,
                        size: 22, color: Color(0xff989898)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
