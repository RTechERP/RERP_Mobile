import 'package:flutter/material.dart';

/// Static icon/color mapping for material categories by id.
/// Used to display visual hint in UI before API/icon service is wired up.
class MaterialCategoryStyle {
  const MaterialCategoryStyle({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  static MaterialCategoryStyle styleFor(int id) {
    final palette = _palette;
    final idx = id.abs() % palette.length;
    return palette[idx];
  }

  static const List<MaterialCategoryStyle> _palette = [
    MaterialCategoryStyle(
      icon: Icons.electrical_services,
      color: Colors.amber,
    ),
    MaterialCategoryStyle(
      icon: Icons.build_outlined,
      color: Colors.blueGrey,
    ),
    MaterialCategoryStyle(
      icon: Icons.handyman_outlined,
      color: Colors.brown,
    ),
    MaterialCategoryStyle(
      icon: Icons.inventory_2_outlined,
      color: Colors.teal,
    ),
    MaterialCategoryStyle(
      icon: Icons.extension_outlined,
      color: Colors.purple,
    ),
    MaterialCategoryStyle(
      icon: Icons.health_and_safety_outlined,
      color: Colors.red,
    ),
    MaterialCategoryStyle(
      icon: Icons.construction_outlined,
      color: Colors.orange,
    ),
    MaterialCategoryStyle(
      icon: Icons.precision_manufacturing_outlined,
      color: Colors.indigo,
    ),
  ];
}
