import 'package:flutter/material.dart';

class AppBarCommon extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final bool centerTitle;

  /// true = tự động hiện back
  /// false = ẩn back
  final bool automaticallyImplyLeading;

  const AppBarCommon({
    super.key,
    this.title,
    this.actions,
    this.onBackTap,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,

      /// 🔥 CHÌA KHOÁ
      automaticallyImplyLeading: automaticallyImplyLeading,

      /// 🔥 Chỉ custom back khi có onBackTap
      leading: (automaticallyImplyLeading && onBackTap != null)
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: onBackTap,
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
