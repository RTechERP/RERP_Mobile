import 'package:flutter/material.dart';

import '../../app_theme/index.dart';

class BottomSheetService {
  BottomSheetService._();

  /// BottomSheet thường
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    Color backgroundColor = Colors.white,
    BorderRadius borderRadius = const BorderRadius.vertical(
      top: Radius.circular(16),
    ),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      builder: (_) => child,
    );
  }

  /// BottomSheet full screen (vd: form add)
  static Future<T?> showFull<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return show<T>(
      context: context,
      child: SafeArea(child: child),
      isScrollControlled: true,
    );
  }

  /// Đóng bottom sheet
  static void dismiss(BuildContext context, [dynamic result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(result);
    }
  }

  static Future<void> showRequestTypeList({
    required BuildContext context,
    required List<RequestTypeItem> items,
    String? title,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8), // 👈 giảm bottom
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                if (title != null) ...[
                  Text(
                    title,
                    style: AppStyles.s16h16w600,
                  ),
                  const SizedBox(height: 8),
                ],

                // List items
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => Divider(
                    height: 1,
                    thickness: 0.8,
                    color: Colors.grey.shade300,
                  ),
                  itemBuilder: (_, index) {
                    final e = items[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      leading: Icon(e.icon, color: Colors.deepOrange),
                      title: Text(e.title),
                      onTap: () {
                        Navigator.of(context).pop();
                        e.onTap();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RequestTypeItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  RequestTypeItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
