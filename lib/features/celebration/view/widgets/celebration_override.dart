part of '../pages/celebration_popup_screen.dart';

/// Inherited override that supplies a preloaded [CelebrationItem]
/// (used by the dev test button to preview the UI without an API call).
class CelebrationOverride extends InheritedWidget {
  const CelebrationOverride({
    super.key,
    required this.item,
    required super.child,
  });

  final CelebrationItem item;

  static CelebrationItem? of(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<CelebrationOverride>();
    return widget?.item;
  }

  @override
  bool updateShouldNotify(CelebrationOverride oldWidget) =>
      oldWidget.item != item;
}
