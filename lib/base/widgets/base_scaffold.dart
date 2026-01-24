import 'package:flutter/material.dart';

import '../../common/app_theme/app_colors.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final PreferredSizeWidget? bottomBar;
  final Widget body;

  final Widget? endDrawer;
  final Key? scaffoldKey;

  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool dismissKeyboardOnTap;

  final double paddingTop;
  final Color backgroundColor;
  final String? backgroundImage;

  /// 🔥 Pull to refresh
  final Future<void> Function()? onRefresh;

  const BaseScaffold({
    super.key,
    this.appBar,
    this.bottomBar,
    required this.body,
    this.endDrawer,
    this.scaffoldKey,
    this.backgroundImage,
    this.backgroundColor = AppColors.grey_bg,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.dismissKeyboardOnTap = true,
    this.paddingTop = 0,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Stack(
      children: [
        if (backgroundImage != null)
          Positioned.fill(
            child: Image.asset(
              backgroundImage!,
              fit: BoxFit.cover,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: body,
        ),
      ],
    );

    if (dismissKeyboardOnTap) {
      content = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: content,
      );
    }

    /// 🔥 Wrap RefreshIndicator nếu có onRefresh
    if (onRefresh != null) {
      content = RefreshIndicator(
        onRefresh: onRefresh!,
        child: _ensureScrollable(content),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      bottomNavigationBar: bottomBar,
      body: content,
      endDrawer: endDrawer,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }

  /// ✅ Đảm bảo pull được kể cả khi body không scroll
  Widget _ensureScrollable(Widget child) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
