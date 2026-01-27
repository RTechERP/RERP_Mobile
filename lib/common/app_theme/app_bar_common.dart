import 'package:flutter/material.dart';
import '../utils/navigation/navigation_utils.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final bool centerTitle;

  const AppBarCommon({
    super.key,
    this.title,
    this.actions,
    this.onBackTap,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          if (onBackTap != null) {
            onBackTap!();
          } else {
            onBack(context); // hàm trong navigation_utils
          }
        },
      ),
      centerTitle: centerTitle,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
