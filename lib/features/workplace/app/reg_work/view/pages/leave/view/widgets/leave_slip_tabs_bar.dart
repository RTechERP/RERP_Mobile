import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Hàng tab theo từng phiếu (nhãn = ngày nghỉ dd/MM/yyyy) + nút thêm.
class LeaveSlipTabsBar extends StatelessWidget {
  const LeaveSlipTabsBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    required this.onRemoveAt,
    required this.onAdd,
  });

  /// Mỗi phần tử tương ứng một phiếu (thường là ngày nghỉ đã chọn).
  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onSelect;
  final void Function(int index) onRemoveAt;
  final VoidCallback onAdd;

  int get slipCount => labels.length;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: i == selectedIndex
                        ? AppColors.primaryERP.withOpacity(0.1)
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
                        labels[i],
                        style: TextStyle(
                          color: i == selectedIndex
                              ? AppColors.primaryERP
                              : Colors.black87,
                          fontWeight: i == selectedIndex
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                      if (slipCount > 1) ...[
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
