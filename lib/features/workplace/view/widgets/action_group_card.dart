import 'package:flutter/material.dart';

import '../../../../common/app_theme/index.dart';
import '../../../../common/models/index.dart';
import '../../../../common/utils/dialog/index.dart';

class ActionGroupCard extends StatefulWidget {
  final String title;
  final List<AppItem> items;

  final bool expandable;
  final int collapsedItemCount;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;

  const ActionGroupCard({
    super.key,
    required this.title,
    required this.items,
    this.expandable = false,
    this.collapsedItemCount = 11,
    this.outerPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.innerPadding = const EdgeInsets.all(12),
  });

  @override
  State<ActionGroupCard> createState() => _ActionGroupCardState();
}

class _ActionGroupCardState extends State<ActionGroupCard> {
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
                crossAxisCount: 4,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 1,
              ),
              itemBuilder: (_, index) {
                return _ActionGridItem(item: visibleItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ⭐ LOGIC EXPAND ĐÚNG – item thứ 12
  List<AppItem> _buildVisibleItems() {
    if (!widget.expandable ||
        widget.items.length <= widget.collapsedItemCount) {
      return widget.items;
    }

    if (_expanded) {
      return [
        ...widget.items,
        AppItem.toggle(
          expanded: true,
          onTap: () => setState(() => _expanded = false),
        ),
      ];
    }

    return [
      ...widget.items.take(widget.collapsedItemCount),
      AppItem.toggle(
        expanded: false,
        onTap: () => setState(() => _expanded = true),
      ),
    ];
  }
}



class _ActionGridItem extends StatelessWidget {
  final AppItem item;

  const _ActionGridItem({required this.item});

  void _handleTap(BuildContext context) {
    if (item.isProcessing) {
      DialogService.showProcessing(context: context);
      return;
    }

    item.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _handleTap(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: item.isToggle
                      ? Colors.grey.shade200
                      : Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  size: 22,
                  color:item.isToggle
                      ? Colors.black54
                      : Colors.black,
                ),
              ),

              /// ⭐ favorite (KHÔNG áp cho toggle)
              if (item.isFavorite && !item.isToggle)
                const Positioned(
                  right: 0,
                  top: 0,
                  child: Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.orange,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppStyles.caption1,
          ),
        ],
      ),
    );
  }
}


