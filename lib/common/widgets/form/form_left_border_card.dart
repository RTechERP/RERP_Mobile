import 'package:flutter/material.dart';

class FormLeftBorderCard extends StatelessWidget {
  /// Nội dung chính
  final Widget child;

  /// Màu viền bên trái
  final Color borderColor;

  /// Độ dày viền
  final double borderWidth;

  /// Màu nền
  final Color backgroundColor;

  /// Bo góc
  final BorderRadius borderRadius;

  /// Padding bên trong
  final EdgeInsets padding;

  /// Icon (optional)
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;

  /// Khoảng cách icon - content
  final double spacing;

  /// Alignment
  final CrossAxisAlignment crossAxisAlignment;

  const FormLeftBorderCard({
    super.key,
    required this.child,
    required this.borderColor,
    required this.backgroundColor,
    this.borderWidth = 4,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.all(12),
    this.icon,
    this.iconColor,
    this.iconSize = 20,
    this.spacing = 8,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? borderColor,
            ),
            SizedBox(width: spacing),
          ],
          Expanded(child: child),
        ],
      ),
    );
  }
}
