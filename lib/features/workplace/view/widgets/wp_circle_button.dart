import 'package:flutter/material.dart';

class WpCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  final double size;           // kích thước tổng (width = height)
  final double iconSize;       // kích thước icon
  final Color borderColor;
  final double borderWidth;
  final Color iconColor;
  final Color backgroundColor;
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
