import 'package:flutter/material.dart';

import '../../enums/index.dart';

class AppCardItem extends StatelessWidget {
  final Widget content;
  final ApprovalStatus status;

  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onView;

  final VoidCallback? onCancel;
  final bool useStatusBackground;
  final bool useStatusBorder;

  const AppCardItem({
    super.key,
    required this.content,
    required this.status,
    this.onTap,
    this.onEdit,
    this.onView,
    this.onCancel,
    this.useStatusBackground = true,
    this.useStatusBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _statusColors(status);
    final backgroundColor = useStatusBackground ? colors.background : Colors.white;
    final borderColor = useStatusBorder ? colors.border : const Color(0xFFE0E0E0);

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap ?? (status == ApprovalStatus.approved ? onView : onEdit),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header: content + status
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: content),
                  _StatusBadge(status: status),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  
  _StatusColor _statusColors(ApprovalStatus status) {
    switch (status) {
      case ApprovalStatus.prepare:
        return const _StatusColor(
          border: Color(0xFF90A4AE),      // BlueGrey
          background: Color(0xFFF5F7F8),  // Grey very light
        );

      case ApprovalStatus.pending:
        return const _StatusColor(
          border: Color(0xFFFFC107),
          background: Color(0xFFFFF8E1),
        );
      case ApprovalStatus.approved:
        return const _StatusColor(
          border: Color(0xFF4CAF50),
          background: Color(0xFFE8F5E9),
        );
      case ApprovalStatus.cancelled:
        return const _StatusColor(
          border: Color(0xFFE53935), // Red
          background: Color(0xFFFDECEA),
        );
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final ApprovalStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == ApprovalStatus.prepare) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _label,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String get _label {
    switch (status) {
      case ApprovalStatus.approved:
        return 'Đã duyệt';
      case ApprovalStatus.pending:
        return 'Chờ duyệt';
      case ApprovalStatus.cancelled:
        return 'Đã huỷ';
      case ApprovalStatus.prepare:
        return '';
    }
  }

  Color get _backgroundColor {
    switch (status) {
      case ApprovalStatus.approved:
        return Colors.green;
      case ApprovalStatus.pending:
        return Colors.orange;
      case ApprovalStatus.cancelled:
        return Colors.red;
      case ApprovalStatus.prepare:
        return Colors.transparent;
    }
  }
}

class _StatusColor {
  final Color border;
  final Color background;

  const _StatusColor({
    required this.border,
    required this.background,
  });
}
