import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/models/newsletter_category.dart';
import '../bloc/newsfeed_bloc.dart';
import 'newsfeed_season_theme.dart';

/// Bộ lọc nhóm tin dạng pill cho phần "Tin nổi bật".
///
/// Đặt cạnh tiêu đề trên thanh ứng dụng nên không bị nhầm với thanh tab
/// "Bảng tin / Lịch làm việc" phía trên. Mặc định nhóm đang chọn là HCNS,
/// khớp với nhóm tin nội bộ trước đây.
class NewsfeedCategoryFilter extends StatelessWidget {
  final NewsletterCategory selected;
  final int Function(NewsletterCategory category) countOf;

  const NewsfeedCategoryFilter({
    super.key,
    required this.selected,
    required this.countOf,
  });

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: palette.surface.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.70)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < NewsletterCategory.values.length; i++) ...[
            if (i > 0) const SizedBox(width: 3),
            _CategoryPill(
              category: NewsletterCategory.values[i],
              isSelected: NewsletterCategory.values[i] == selected,
              count: countOf(NewsletterCategory.values[i]),
            ),
          ],
        ],
      ),
    );
  }
}

/// Một pill nhóm tin, hiển thị kèm số lượng tin của nhóm đó.
class _CategoryPill extends StatelessWidget {
  final NewsletterCategory category;
  final bool isSelected;
  final int count;

  const _CategoryPill({
    required this.category,
    required this.isSelected,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final palette = SeasonPaletteScope.of(context);
    final foreground = isSelected
        ? Colors.white
        : palette.onSurface.withValues(alpha: 0.70);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () {
          context.read<NewsfeedBloc>().add(
            NewsfeedEvent.changeCategory(category: category),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? palette.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: palette.primary.withValues(alpha: 0.30),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                  color: foreground,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.28)
                      : Colors.white.withValues(alpha: 0.50),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: foreground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
