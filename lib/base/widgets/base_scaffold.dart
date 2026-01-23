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

  const BaseScaffold({
    super.key,
    this.appBar,
    this.bottomBar,
    required this.body,
    this.endDrawer,
    this.scaffoldKey,
    this.backgroundImage,
    this.backgroundColor = AppColors.white,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.dismissKeyboardOnTap = true,
    this.paddingTop = 0,
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
}
