import 'package:flutter/material.dart';

class ActionIconTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  // Custom UI
  final double iconSize;
  final double circleSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final int maxLines;

  const ActionIconTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconSize = 22,
    this.circleSize = 44,
    this.iconColor,
    this.backgroundColor,
    this.textStyle,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? Colors.grey.shade100,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor ?? theme.iconTheme.color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: textStyle ?? theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
