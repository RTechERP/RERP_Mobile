// Lưới icon chọn phần dữ liệu của Personal Summary.
// Thay thế TabBar cũ: dữ liệu đã được load sẵn toàn bộ từ API, nên chỉ cần
// bấm vào icon của phần nào thì hiển thị danh sách tương ứng.
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';

/// Nguồn dữ liệu của từng phần trong Personal Summary.
enum PersonalSummarySource {
  onLeave,
  earlyLate,
  overTime,
  bussiness,
  wfh,
  enf,
  nightShift,
  attendance,
}

/// Định nghĩa 1 phần (mục) trong lưới: nhãn + icon + màu + nguồn dữ liệu.
class PersonalSummarySection {
  const PersonalSummarySection({
    required this.label,
    required this.icon,
    required this.color,
    required this.source,
  });

  final String label;

  /// Icon đại diện riêng cho từng phần.
  final IconData icon;

  /// Màu nhấn của icon.
  final Color color;

  final PersonalSummarySource source;
}

/// Lưới icon chọn phần dữ liệu (3 cột).
/// Ô đang chọn được highlight, kèm số lượng phiếu của từng phần.
class PersonalSummarySectionGrid extends StatelessWidget {
  const PersonalSummarySectionGrid({
    super.key,
    required this.sections,
    required this.selectedIndex,
    required this.countOf,
    required this.onSelected,
  });

  /// Danh sách các phần (theo thứ tự hiển thị trong lưới).
  final List<PersonalSummarySection> sections;

  /// Index của phần đang được chọn.
  final int selectedIndex;

  /// Hàm lấy số lượng phiếu của 1 phần từ state hiện tại.
  final int Function(PersonalSummarySource source) countOf;

  /// Callback khi người dùng chọn 1 phần (trả về index mới).
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.92,
        children: [
          for (var i = 0; i < sections.length; i++)
            _SectionTile(
              section: sections[i],
              count: countOf(sections[i].source),
              isSelected: i == selectedIndex,
              onTap: () => onSelected(i),
            ),
        ],
      ),
    );
  }
}

/// 1 ô trong lưới: icon tròn + nhãn + badge số lượng.
class _SectionTile extends StatelessWidget {
  const _SectionTile({
    required this.section,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final PersonalSummarySection section;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = section.color;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.10)
              : AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : AppColors.borderColor,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(section.icon, color: color, size: 22),
                ),
                if (count > 0)
                  Positioned(
                    top: -6,
                    right: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        '$count',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              section.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                height: 1.2,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? AppColors.heading : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
