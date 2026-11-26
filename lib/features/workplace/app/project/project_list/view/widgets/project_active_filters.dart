import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import 'project_status_badge.dart';

/// Khoá định danh của một tiêu chí lọc, dùng để bỏ riêng tiêu chí đó.
enum ProjectFilterKey {
  customer('customer', 'Khách hàng'),
  type('type', 'Kiểu dự án'),
  status('status', 'Trạng thái'),
  sale('sale', 'Sale'),
  tech('tech', 'Kỹ thuật'),
  pm('pm', 'PM'),
  businessField('businessField', 'Lĩnh vực');

  const ProjectFilterKey(this.id, this.label);

  /// Khoá định danh dạng chuỗi, dùng khi map về bộ lọc trong bloc.
  final String id;

  /// Nhãn hiển thị trên chip.
  final String label;
}

/// Danh sách chip nhỏ hiển thị các tiêu chí lọc đang áp dụng.
///
/// Mỗi chip có nút x để bỏ tiêu chí đó.
class ProjectActiveFilters extends StatelessWidget {
  const ProjectActiveFilters({
    super.key,
    required this.entries,
    required this.onRemove,
    required this.onClearAll,
  });

  /// Danh sách tiêu chí đang lọc kèm giá trị hiển thị.
  final List<({ProjectFilterKey key, String value})> entries;

  /// Callback khi bỏ một tiêu chí.
  final void Function(ProjectFilterKey key) onRemove;

  /// Callback khi xoá toàn bộ tiêu chí lọc.
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              size: 14,
              color: AppColors.primaryERP,
            ),
            const SizedBox(width: 6),
            const Text(
              'Đang lọc',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onClearAll,
              child: const Text(
                'Xoá tất cả',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: entries
              .map(
                (e) => _FilterTag(
                  filterKey: e.key,
                  value: e.value,
                  onRemove: () => onRemove(e.key),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

/// Một chip hiển thị "Label: value" kèm nút x.
class _FilterTag extends StatelessWidget {
  const _FilterTag({
    required this.filterKey,
    required this.value,
    required this.onRemove,
  });

  final ProjectFilterKey filterKey;
  final String value;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    // Chip trạng thái tô màu theo bảng màu trạng thái dự án.
    final isStatus = filterKey == ProjectFilterKey.status;
    final accent = isStatus
        ? ProjectStatusColors.background(value)
        : AppColors.primaryERP;

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 6, 6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accent.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${filterKey.label}: ',
            style: TextStyle(
              fontSize: 12,
              color: accent,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 130),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onRemove,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.close,
                size: 13,
                color: accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
