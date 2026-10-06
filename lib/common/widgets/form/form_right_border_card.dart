import 'package:flutter/material.dart';

/// Card có viền bên phải — mirror của [FormLeftBorderCard].
///
/// Dùng cho các tin nhắn của user trong chat, đối xứng với user/ bot bubble.
class FormRightBorderCard extends StatelessWidget {
  /// Nội dung chính
  final Widget child;

  /// Màu viền bên phải
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

  /// Khi `true` (mặc định) card giãn full width — phù hợp form.
  /// Đặt `false` để card bó theo chiều dài nội dung — phù hợp chat bubble.
  final bool expand;

  const FormRightBorderCard({
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
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: expand ? double.infinity : null,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border(
          right: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Expanded(child: child),
          if (icon != null) ...[
            SizedBox(width: spacing),
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? borderColor,
            ),
          ],
        ],
      ),
    );

    return card;
  }
}
