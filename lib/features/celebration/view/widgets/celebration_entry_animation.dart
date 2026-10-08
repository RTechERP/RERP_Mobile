part of '../pages/celebration_popup_screen.dart';

/// Entry scale + fade animation.
class _EntryAnimation extends StatelessWidget {
  const _EntryAnimation({required this.controller, required this.child});

  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scale = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
    final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.4)),
    );
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Opacity(
          opacity: fade.value,
          child: Transform.scale(scale: scale.value, child: child),
        );
      },
    );
  }
}
