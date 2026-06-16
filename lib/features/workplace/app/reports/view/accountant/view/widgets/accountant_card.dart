import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../data/datasource/models/report_model.dart';

class AccountantCard extends StatefulWidget {
  final AccountantItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const AccountantCard({
    super.key,
    required this.item,
    this.onTap,
    this.onDelete,
  });

  @override
  State<AccountantCard> createState() => _AccountantCardState();
}

class _AccountantCardState extends State<AccountantCard> {
  bool _isExpanded = false;

  String _formatDate(DateTime? d) {
    if (d == null) return '--/--/----';
    return DateFormat('dd/MM/yyyy').format(d);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final card = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha:0.85),
            Colors.white.withValues(alpha:0.55),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha:0.6),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.blue.withValues(alpha:0.05),
            blurRadius: 26,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(theme),
                    const SizedBox(height: 12),
                    _buildMainContent(theme),
                    const SizedBox(height: 8),
                    _buildExpandButton(),
                    if (_isExpanded) ...[
                      const SizedBox(height: 8),
                      _buildExpandableContent(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (widget.onDelete == null) return card;

    return Slidable(
      key: ValueKey(widget.item.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (_) => widget.onDelete?.call(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Xoá',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
        ],
      ),
      child: card,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha:0.25),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            _initials(widget.item.fullName),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.fullName ?? '---',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A237E),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if ((widget.item.chucVu ?? '').isNotEmpty)
                Text(
                  widget.item.chucVu!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black.withValues(alpha:0.55),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha:0.9),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today_rounded,
                size: 12,
                color: Color(0xFF1A237E),
              ),
              const SizedBox(width: 4),
              Text(
                _formatDate(widget.item.reportDate),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A237E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent(ThemeData theme) {
    final content = widget.item.content;
    if (content == null || content.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha:0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.withValues(alpha:0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5).withValues(alpha:0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.work_outline, size: 16, color: Color(0xFF1E88E5)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Việc đã làm',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E88E5),
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1A1C1E),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: _isExpanded ? null : 2,
                  overflow: _isExpanded ? null : TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandButton() {
    final hasMoreContent = _hasExpandableContent();
    if (!hasMoreContent) return const SizedBox.shrink();

    return Center(
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: Icon(
          _isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
          size: 20,
          color: const Color(0xFF1E88E5),
        ),
        label: Text(
          _isExpanded ? 'Thu gọn' : 'Xem thêm',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E88E5),
          ),
        ),
      ),
    );
  }

  bool _hasExpandableContent() {
    return (widget.item.result?.isNotEmpty ?? false) ||
        (widget.item.nextPlan?.isNotEmpty ?? false) ||
        (widget.item.pendingIssues?.isNotEmpty ?? false) ||
        (widget.item.urgent?.isNotEmpty ?? false) ||
        (widget.item.mistakeOrViolation?.isNotEmpty ?? false);
  }

  Widget _buildExpandableContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.item.result?.isNotEmpty ?? false)
          _buildSection(
            icon: Icons.flag_outlined,
            iconColor: const Color(0xFF43A047),
            label: 'Kết quả',
            value: widget.item.result!,
          ),
        if (widget.item.nextPlan?.isNotEmpty ?? false)
          _buildSection(
            icon: Icons.event_note_outlined,
            iconColor: const Color(0xFFFB8C00),
            label: 'Kế hoạch',
            value: widget.item.nextPlan!,
          ),
        if (widget.item.pendingIssues?.isNotEmpty ?? false)
          _buildSection(
            icon: Icons.hourglass_bottom_outlined,
            iconColor: const Color(0xFFE53935),
            label: 'Tồn đọng / Vướng mắc',
            value: widget.item.pendingIssues!,
          ),
        if (widget.item.urgent?.isNotEmpty ?? false)
          _buildSection(
            icon: Icons.flash_on_outlined,
            iconColor: const Color(0xFF8E24AA),
            label: 'Phát sinh',
            value: widget.item.urgent!,
          ),
        if (widget.item.mistakeOrViolation?.isNotEmpty ?? false)
          _buildSection(
            icon: Icons.error_outline,
            iconColor: const Color(0xFFD81B60),
            label: 'Lỗi',
            value: widget.item.mistakeOrViolation!,
          ),
      ],
    );
  }

  Widget _buildSection({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.55),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha:0.7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha:0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: iconColor.withValues(alpha:0.85),
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1A1C1E),
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String? name) {
    if (name == null || name.trim().isEmpty) return '?';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }
}
