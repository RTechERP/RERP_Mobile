import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder_outlined, size: 24, color: AppColors.hintText),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dự án',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (_selected != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      '${_selected!.projectCode ?? ''} - ${_selected!.projectName ?? ''}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.heading,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: _selected != null ? AppColors.hintText : AppColors.borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
