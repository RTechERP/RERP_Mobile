import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum AppItemType {
  feature,
  report,
  attendance,
  other,

  /// 👇 item đặc biệt
  toggle,
}

@immutable
class AppItem {
  final String id;
  final String name;
  final IconData icon;

  final AppItemType type;

  /// UI state
  final bool isFavorite;
  final bool isProcessing;

  /// 👇 CHỈ DÙNG CHO TOGGLE
  final bool isExpanded;

  final VoidCallback? onTap;

  const AppItem({
    required this.id,
    required this.name,
    required this.icon,
    this.type = AppItemType.other,
    this.isFavorite = false,
    this.isProcessing = false,
    this.isExpanded = false,
    this.onTap,
  });

  bool get isToggle => type == AppItemType.toggle;
  bool get isDisabled => isProcessing || onTap == null;

  /// 🔁 factory cho item toggle
  factory AppItem.toggle({
    required bool expanded,
    required VoidCallback onTap,
  }) {
    return AppItem(
      id: '__toggle__',
      name: expanded ? 'common.collapse'.tr() : 'common.expand'.tr(),
      icon: expanded ? Icons.expand_less : Icons.expand_more,
      type: AppItemType.toggle,
      isExpanded: expanded,
      onTap: onTap,
    );
  }

  AppItem copyWith({
    bool? isFavorite,
    bool? isProcessing,
    bool? isExpanded,
  }) {
    return AppItem(
      id: id,
      name: name,
      icon: icon,
      type: type,
      isFavorite: isFavorite ?? this.isFavorite,
      isProcessing: isProcessing ?? this.isProcessing,
      isExpanded: isExpanded ?? this.isExpanded,
      onTap: onTap,
    );
  }
}
