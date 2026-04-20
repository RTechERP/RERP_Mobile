// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Widget nút tròn (notification, QR) trong workspace appBar

import 'package:flutter/material.dart';

/// Widget nút tròn dùng trong appBar của workspace.
///
/// Hỗ trợ tùy chỉnh size, icon, border, màu sắc.
/// Dùng cho nút notification bell và nút QR scanner.
class WpCircleButton extends StatelessWidget {
  /// Icon hiển thị bên trong nút.
  final IconData icon;

  /// Callback khi user tap vào nút.
  final VoidCallback? onPressed;

  /// Kích thước tổng của nút (width = height).
  final double size;

  /// Kích thước icon bên trong.
  final double iconSize;

  /// Màu viền nút.
  final Color borderColor;

  /// Độ dày viền nút.
  final double borderWidth;

  /// Màu icon.
  final Color iconColor;

  /// Màu nền nút.
  final Color backgroundColor;

  /// Padding bên trong nút.
  final EdgeInsets padding;

  const WpCircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 40,
    this.iconSize = 20,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: backgroundColor,
        shape: CircleBorder(
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
