import 'package:flutter/material.dart';

import '../../app_theme/index.dart';

class CommonCard extends StatefulWidget {
  final String title;
  final Widget child;

  /// padding bên trong card
  final EdgeInsets padding;

  /// margin ngoài card (chỉ áp dụng khi fullWidth = false)
  final EdgeInsets margin;

  /// mặc định expand hay không
  final bool initialExpanded;

  /// true = tràn viền, không bo góc
  final bool fullWidth;

  const CommonCard({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.initialExpanded = true,
    this.fullWidth = false,
  });

  @override
  State<CommonCard> createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = widget.fullWidth
        ? BorderRadius.zero
        : BorderRadius.circular(12);

    return Card(
      color: AppColors.white,
      margin: widget.fullWidth ? EdgeInsets.zero : widget.margin,
      elevation: widget.fullWidth ? 0 : 1.5,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ===== Header =====
          InkWell(
            borderRadius: borderRadius,
            onTap: _toggle,
            child: Padding(
              padding: widget.padding,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),

          /// ===== Content (giữ state) =====
          ClipRect(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _isExpanded
                  ? Padding(
                      padding: widget.padding.copyWith(top: 0),
                      child: widget.child,
                    )
                  : const SizedBox.shrink(), // ✅ KHÔNG render gì
            ),
          ),
        ],
      ),
    );
  }
}
