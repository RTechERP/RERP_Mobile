import 'package:flutter/material.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Color backgroundColor;
  final Color? foregroundColor;

  /// Gradient nền thanh tiêu đề. Khi có giá trị, nó được ưu tiên hơn
  /// [backgroundColor].
  final Gradient? backgroundGradient;

  const AppBarCommon({
    super.key,
    this.title,
    this.actions,
    this.onBackTap,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      surfaceTintColor: backgroundColor,
      flexibleSpace: backgroundGradient == null
          ? null
          : Container(decoration: BoxDecoration(gradient: backgroundGradient)),
      leading: (automaticallyImplyLeading && onBackTap != null)
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: onBackTap,
            )
          : null,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0), // update
  );
}
