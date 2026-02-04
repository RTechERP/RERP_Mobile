import 'package:flutter/material.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/models/index.dart';
import '../../../../common/utils/action_icon_tile.dart';

class WpActionCard extends StatefulWidget {
  final String title;
  final List<AppItemModel> items;

  final bool expandable;
  final int collapsedItemCount;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;

  /// 👉 callback xử lý tap item
  final ValueChanged<AppItemModel>? onItemTap;
  const WpActionCard({
    super.key,
    required this.title,
    required this.items,
    this.expandable = false,
    this.collapsedItemCount = 11,
    this.outerPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.innerPadding = const EdgeInsets.all(12),
    this.onItemTap,
  });

  @override
  State<WpActionCard> createState() => _WpActionCardState();
}

class _WpActionCardState extends State<WpActionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = _buildVisibleItems();

    return Padding(
      padding: widget.outerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Container(
            padding: widget.innerPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: visibleItems.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 1,
              ),
              itemBuilder: (_, index) {
                final item = visibleItems[index];

                if (item == null) {
                  return _ToggleGridItem(
                    expanded: _expanded,
                    onTap: _toggleExpand,
                  );
                }

                return ActionIconTile(
                  icon: item.imageUrl?.isNotEmpty == true
                      ? null
                      : IconData(
                    item.iconCodePoint ?? 0,
                    fontFamily: 'MaterialIcons',
                  ),
                  imageUrl: item.imageUrl, // 👈 nếu có link ảnh sẽ dùng ảnh
                  title: item.name,
                  onTap: () => widget.onItemTap?.call(item),
                  textStyle: AppStyles.caption1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _toggleExpand() {
    setState(() => _expanded = !_expanded);
  }

  List<AppItemModel?> _buildVisibleItems() {
    if (!widget.expandable ||
        widget.items.length <= widget.collapsedItemCount) {
      return widget.items;
    }

    if (_expanded) {
      return [...widget.items, null];
    }

    return [
      ...widget.items.take(widget.collapsedItemCount),
      null,
    ];
  }
}

class _ToggleGridItem extends StatelessWidget {
  final bool expanded;
  final VoidCallback onTap;

  const _ToggleGridItem({
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              expanded ? Icons.expand_less : Icons.expand_more,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            expanded ? 'Thu gọn' : 'Xem thêm',
            style: AppStyles.caption1,
          ),
        ],
      ),
    );
  }
}
