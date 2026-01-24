import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/dialog/index.dart';

class ActionGroupCard extends StatefulWidget {
  final String title;
  final List<ActionIconItem> actions;

  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;

  final bool expandable;
  final int collapsedItemCount;

  const ActionGroupCard({
    super.key,
    required this.title,
    required this.actions,
    this.expandable = false,
    this.collapsedItemCount = 11,
    this.outerPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.innerPadding = const EdgeInsets.fromLTRB(12, 12, 12,0),
  });

  @override
  State<ActionGroupCard> createState() => _ActionGroupCardState();
}

class _ActionGroupCardState extends State<ActionGroupCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleActions = _buildVisibleActions();

    return SafeArea(
      bottom: false,
      child: Padding(
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
                itemCount: visibleActions.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final action = visibleActions[index];

                  return GestureDetector(
                    onTap: () => action.handleTap(context),
                    child: _ActionGridItem(item: action),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ActionIconItem> _buildVisibleActions() {
    // ❗ Không cần toggle
    if (!widget.expandable ||
        widget.actions.length <= widget.collapsedItemCount) {
      return widget.actions;
    }

    final List<ActionIconItem> items = _expanded
        ? List.of(widget.actions)
        : widget.actions.take(widget.collapsedItemCount).toList();

    // ✅ CHỈ add toggle khi thực sự cần
    items.add(
      ActionIconItem.toggle(
        expanded: _expanded,
        onTap: () {
          setState(() => _expanded = !_expanded);
        },
      ),
    );

    return items;
  }

}

class _ActionGridItem extends StatelessWidget {
  final ActionIconItem item;

  const _ActionGridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.backgroundColor ?? Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              size: item.iconSize,
              color: item.iconColor,
            ),
          ),
          if (item.label != null) ...[
            const SizedBox(height: 6),
            Text(
              item.label!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}


class ActionIconItem {
  final IconData icon;
  final String? label;
  final VoidCallback? onTap;
  final Color iconColor;
  final double iconSize;
  final Color? backgroundColor;
  final bool isToggle;

  /// 👉 NEW
  final bool isProcessing;

  ActionIconItem({
    required this.icon,
    this.label,
    this.onTap,
    this.iconColor = Colors.black,
    this.iconSize = 22,
    this.backgroundColor,
    this.isToggle = false,
    this.isProcessing = false,
  });

  factory ActionIconItem.toggle({
    required bool expanded,
    required VoidCallback onTap,
    bool isProcessing = false,
  }) {
    return ActionIconItem(
      icon: expanded ? Icons.expand_less : Icons.expand_more,
      label: expanded ? 'common.collapse'.tr() : 'common.expand'.tr(),
      onTap: onTap,
      backgroundColor: Colors.grey.shade200,
      isToggle: true,
      isProcessing: isProcessing,
    );
  }

  /// 👉 tap handler dùng chung
  void handleTap(BuildContext context) {
    if (isProcessing) {
      DialogService.showProcessing(context: context);
      return;
    }

    onTap?.call();
  }
}

