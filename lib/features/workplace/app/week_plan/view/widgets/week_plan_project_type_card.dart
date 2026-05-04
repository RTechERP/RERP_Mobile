import 'package:flutter/material.dart';

import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../data/datasource/models/week_plan_model.dart';

class WeekPlanProjectTypeCard extends StatelessWidget {
  const WeekPlanProjectTypeCard({
    super.key,
    required this.selectedId,
    required this.projectTypes,
    required this.onChanged,
  });

  final int? selectedId;
  final List<ProjectTypeItem> projectTypes;
  final ValueChanged<ProjectTypeItem> onChanged;

  ProjectTypeItem? get _selected =>
      projectTypes.cast<ProjectTypeItem?>().firstWhere(
            (p) => p?.id == selectedId,
            orElse: () => null,
          );

  void _openBottomSheet(BuildContext context) {
    if (projectTypes.isEmpty) return;
    openSelectBottomSheet<ProjectTypeItem>(
      context: context,
      title: 'Chọn hạng mục',
      items: projectTypes,
      initialSelectedItem: _selected,
      displayText: (p) =>
          p.projectTypeName ?? '',
      onSelected: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheet(context),
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
                const Icon(Icons.list_alt_outlined,
                    size: 24, color: Color(0xff989898)),
                const SizedBox(width: 14),
                const Text(
                  'Hạng mục',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff989898),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (projectTypes.isEmpty)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  const Icon(Icons.arrow_drop_down,
                      size: 22, color: Color(0xff989898)),
              ],
            ),
            if (projectTypes.isNotEmpty) ...[
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
                          ? Text(
                            _selected!.projectTypeName ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff404C6D),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                          : const Text(
                              'Chọn hạng mục',
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
