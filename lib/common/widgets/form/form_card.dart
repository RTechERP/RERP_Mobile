import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final List<Widget>? actions;
  final bool collapsed; // 👈 thêm

  const FormCard({
    super.key,
    this.title,
    required this.child,
    this.actions,
    this.collapsed = false, // 👈 default
  });

  bool get _hasHeader =>
      (title != null && title!.trim().isNotEmpty) ||
          (actions != null && actions!.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: collapsed ? 6 : 16, // 👈 collapse = thấp như input
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(collapsed ? 12 : 16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 không chiếm height thừa
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasHeader)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (title != null && title!.trim().isNotEmpty)
                  Expanded(
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  )
                else
                  const Spacer(),

                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  ...actions!,
                ],
              ],
            ),

          if (!collapsed && _hasHeader) const SizedBox(height: 8),

          if (!collapsed) child, // 👈 collapse thì không render content
        ],
      ),
    );
  }
}
