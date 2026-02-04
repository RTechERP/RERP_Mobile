import 'package:flutter/material.dart';

class ActionIconTile extends StatelessWidget {
  final IconData? icon;
  final String? imageUrl; // 👈 thêm
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
    this.icon,
    this.imageUrl,
    required this.title,
    this.onTap,
    this.iconSize = 28,
    this.circleSize = 48,
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
            alignment: Alignment.center,
            child: _buildIcon(theme),
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

  Widget _buildIcon(ThemeData theme) {
    final path = imageUrl;

    if (path != null && path.isNotEmpty) {
      final double imageSize = circleSize * 0.75; // 👈 chỉnh tỷ lệ ở đây

      return ClipOval(
        child: Center(
          child: Image.asset(
            path,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => _fallbackIcon(theme),
          ),
        ),
      );
    }

    return _fallbackIcon(theme);
  }

  Widget _fallbackIcon(ThemeData theme) {
    return Icon(
      icon ?? Icons.apps,
      size: iconSize,
      color: iconColor ?? theme.iconTheme.color,
    );
  }
}
