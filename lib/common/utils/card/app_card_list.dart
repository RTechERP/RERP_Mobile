import 'package:flutter/material.dart';

class AppCardList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;
  final double spacing;

  const AppCardList({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.all(16),
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    final List<Widget> list = [];
    for (int i = 0; i < children.length; i++) {
      list.add(children[i]);
      if (i != children.length - 1) {
        list.add(SizedBox(height: spacing));
      }
    }
    return list;
  }
}
