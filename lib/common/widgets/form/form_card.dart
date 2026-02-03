import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final String title;
  final Widget child;

  /// 👇 Thêm actions (ví dụ: IconButton, PopupMenuButton, ...)
  final List<Widget>? actions;

  const FormCard({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== HEADER =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              if (actions != null && actions!.isNotEmpty) ...[
                const SizedBox(width: 8),
                ...actions!,
              ],
            ],
          ),

          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}