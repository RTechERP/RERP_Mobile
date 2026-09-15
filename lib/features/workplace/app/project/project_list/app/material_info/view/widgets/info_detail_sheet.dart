import 'package:flutter/material.dart';

/// Field hiển thị label (gray) + value (bold) trong popup thông tin.
/// Dùng cho cả text, icon và boolean.
class InfoField extends StatelessWidget {  const InfoField({
    super.key,
    required this.label,
    this.value,
    this.boolValue,
  });

  /// Label nhỏ xám.
  final String label;

  /// Giá trị hiển thị (text). Nếu null/empty -> hiển thị '--'.
  final String? value;

  /// Nếu != null -> render icon check / x thay vì text.
  final bool? boolValue;

  bool get _hasBool => boolValue != null;
  bool get _hasValue => value != null && value!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    Widget trailing;
    Color color;
    if (_hasBool) {
      final isOn = boolValue == true;
      color = isOn ? const Color(0xFF43A047) : const Color(0xFFE53935);
      trailing = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isOn ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(
            isOn ? 'Có' : 'Không',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      );
    } else {
      color = const Color(0xFF1E293B);
      trailing = Text(
        _hasValue ? value! : '--',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: _hasValue ? color : const Color(0xFF94A3B8),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Align(alignment: Alignment.centerRight, child: trailing),
          ),
        ],
      ),
    );
  }
}

/// Section heading nhỏ phân nhóm trong popup.
class InfoSectionHeader extends StatelessWidget {
  const InfoSectionHeader(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 4),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 14,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

/// Shell popup chung: header + body scrollable + close.
/// [iconColor] dùng để tô gradient header theo chủ đề popup.
class InfoDetailSheet extends StatelessWidget {
  const InfoDetailSheet({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final String subtitle;
  final List<Widget> children;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconColor,
    required String subtitle,
    required List<Widget> children,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => InfoDetailSheet(
        title: title,
        icon: icon,
        iconColor: iconColor,
        subtitle: subtitle,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header gradient
              Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                padding: const EdgeInsets.fromLTRB(14, 12, 8, 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      iconColor.withValues(alpha: 0.12),
                      iconColor.withValues(alpha: 0.04),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: iconColor, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              // Body
              Expanded(
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  children: children,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
