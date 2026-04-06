import 'package:flutter/material.dart';
import '../../../../../../../../../common/app_theme/index.dart';

class WorkCategorySlipTabsBar extends StatelessWidget {
  const WorkCategorySlipTabsBar({
    super.key,
    required this.count,
    required this.selectedIndex,
    required this.onSelect,
    required this.onRemoveAt,
    required this.onAdd,
  });

  final int count;
  final int selectedIndex;
  final void Function(int) onSelect;
  final void Function(int) onRemoveAt;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < count; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: i == selectedIndex
                        ? AppColors.primaryERP.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: i == selectedIndex
                          ? AppColors.primaryERP
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hạng mục ${i + 1}',
                        style: TextStyle(
                          color: i == selectedIndex
                              ? AppColors.primaryERP
                              : Colors.black87,
                          fontWeight: i == selectedIndex
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                      if (count > 1) ...[
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => onRemoveAt(i),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add_circle_outline),
            color: AppColors.primaryERP,
          ),
        ],
      ),
    );
  }
}
