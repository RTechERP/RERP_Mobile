import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.context,
    required this.controller,
    required this.screens,
    required this.items,
    this.navBarStyle = NavBarStyle.style3,
    this.backgroundColor = Colors.white,
    this.handleAndroidBackButtonPress = true,
    this.popAllScreensOnTapOfSelectedTab = true,
  });

  final BuildContext context;

  final PersistentTabController controller;
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem> items;

  final NavBarStyle navBarStyle;
  final Color backgroundColor;

  final bool handleAndroidBackButtonPress;
  final bool popAllScreensOnTapOfSelectedTab;

  @override
  Widget build(BuildContext _) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: items,
      navBarStyle: navBarStyle,
      backgroundColor: backgroundColor,
      handleAndroidBackButtonPress: handleAndroidBackButtonPress,
    );
  }
}

PersistentBottomNavBarItem navItem(
    IconData icon,
    String title, {
      required Color activeColorPrimary,
    }) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    title: title,
    activeColorPrimary: activeColorPrimary,
    inactiveColorPrimary: Colors.grey,
  );
}