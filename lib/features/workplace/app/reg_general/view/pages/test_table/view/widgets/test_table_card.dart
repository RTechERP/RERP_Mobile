// Date: 04/09/2026
// Card đăng ký bàn test ESL - glassmorphism, compact.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/test_table_model.dart';

// ─── Helpers ─────────────────────────────────────────────────────────────────

String _dash(String? v) {
  final t = v?.trim();
  return (t == null || t.isEmpty) ? '—' : t;
}

String _fmt(DateTime? d) {
  if (d == null) return '—';
  return DateFormat('dd/MM/yyyy').format(d.toLocal());
}

String _statusLabel(int? s) {
  switch (s) {
    case 1: return 'Đã duyệt';
    case 2: return 'Từ chối';
    case 3: return 'Hoàn thành';
    default: return 'Chờ duyệt';
  }
}

// ─── Card ────────────────────────────────────────────────────────────────────

class TestTableCard extends StatelessWidget {
  const TestTableCard({super.key, required this.item});

  final TestTableItem item;

  @override
  Widget build(BuildContext context) {
    final sc = _statusColor(item.status);

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.92),
                Colors.white.withValues(alpha: 0.74),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.6),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: sc.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(sc),
              if (_hasInfo) ...[
                const SizedBox(height: 8),
                _buildInfo(),
              ],
              if (item.detailStartDate != null || item.detailEndDate != null) ...[
                const SizedBox(height: 8),
                _buildFooter(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ─── Header: mã + status ─────────────────────────────────────────────────
  Widget _buildHeader(Color sc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _dash(item.registrationCode),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.heading,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.desktop_windows_outlined,
                      size: 12, color: AppColors.secondaryERP),
                  const SizedBox(width: 4),

                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            _dash(item.testTableName),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondaryERP,
                              height: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        _OnlineDot(online: item.online),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _TinyBadge(text: _statusLabel(item.status), color: sc),
        const SizedBox(width: 8),
        _buildChipsRow(),
      ],
    );
  }

  // ─── Chips row: pin + online ─────────────────────────────────────────────
  Widget _buildChipsRow() {
    // Online được hiển thị inline cạnh tên thiết bị (xem _OnlineDot),
    // nên ở đây chỉ trả về SizedBox rỗng để giữ layout cũ.
    return const SizedBox.shrink();
  }

  // ─── Info: gọn, 2 cột ────────────────────────────────────────────────────
  bool get _hasInfo {
    return (item.projectCode ?? '').trim().isNotEmpty ||
        (item.registrationContent ?? '').trim().isNotEmpty ||
        (item.ownerFullName ?? '').trim().isNotEmpty ||
        (item.ownerCode ?? '').trim().isNotEmpty ||
        (item.ownerPhone ?? '').trim().isNotEmpty ||
        (item.approverFullName ?? '').trim().isNotEmpty;
  }

  Widget _buildInfo() {
    final rows = <Widget>[];
    void addDivider() {
      if (rows.isNotEmpty) rows.add(const _DotSep());
    }

    if ((item.projectCode ?? '').trim().isNotEmpty) {
      addDivider();
      rows.add(_InfoLine(
        icon: Icons.folder_outlined,
        text: _dash(item.projectCode),
      ));
    }
    if ((item.registrationContent ?? '').trim().isNotEmpty) {
      addDivider();
      rows.add(_InfoLine(
        icon: Icons.description_outlined,
        text: _dash(item.registrationContent),
      ));
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.7),
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (rows.isNotEmpty)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: rows,
            ),
          if ((item.ownerFullName ?? '').trim().isNotEmpty ||
              (item.ownerCode ?? '').trim().isNotEmpty ||
              (item.ownerPhone ?? '').trim().isNotEmpty) ...[
            if (rows.isNotEmpty) const SizedBox(height: 8),
            _PersonRow(
              name: _dash(item.ownerFullName),
              code: _dash(item.ownerCode),
              phone: _dash(item.ownerPhone),
            ),
          ],
          if ((item.approverFullName ?? '').trim().isNotEmpty) ...[
            const SizedBox(height: 6),
            _ApproverLine(name: _dash(item.approverFullName)),
          ],
        ],
      ),
    );
  }

  // ─── Footer: ngày bắt đầu / kết thúc / trả thực tế ──────────────────────
  Widget _buildFooter() {
    return Row(
      children: [
        Expanded(
          child: _DateCell(
            label: 'Bắt đầu',
            date: item.detailStartDate,
            accent: AppColors.secondaryERP,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _DateCell(
            label: 'Kết thúc',
            date: item.detailEndDate,
            accent: AppColors.warning,
          ),
        ),
        if (item.status == 3 && item.actualReturnDate != null) ...[
          const SizedBox(width: 8),
          Expanded(
            child: _DateCell(
              label: 'Đã trả',
              date: item.actualReturnDate,
              accent: AppColors.success,
              icon: Icons.check_circle,
            ),
          ),
        ],
      ],
    );
  }
}

// ─── Color helper (private) ──────────────────────────────────────────────────

Color _statusColor(int? s) {
  switch (s) {
    case 1: return AppColors.stateSuccessColor;
    case 2: return AppColors.alert;
    case 3: return AppColors.secondaryERP;
    default: return AppColors.warning;
  }
}

// ─── Sub widgets ─────────────────────────────────────────────────────────────

class _TinyBadge extends StatelessWidget {
  const _TinyBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 0.7),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
          height: 1,
        ),
      ),
    );
  }
}

class _OnlineDot extends StatelessWidget {
  const _OnlineDot({required this.online});

  final bool? online;

  Color get _c {
    if (online == null) return AppColors.gray;
    return online! ? AppColors.success : AppColors.alert;
  }

  String get _tip {
    if (online == null) return 'Không rõ';
    return online! ? 'Đang online' : 'Offline';
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = online == true;
    return Tooltip(
      message: _tip,
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _c.withValues(alpha: 0.22),
        ),
        child: Center(
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _c,
              boxShadow: [
                if (isOnline)
                  BoxShadow(
                    color: _c.withValues(alpha: 0.6),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DotSep extends StatelessWidget {
  const _DotSep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 3,
        height: 3,
        decoration: const BoxDecoration(
          color: AppColors.gray,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.gray),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _PersonRow extends StatelessWidget {
  const _PersonRow({
    required this.name,
    required this.code,
    required this.phone,
  });

  final String name;
  final String code;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final hasCode = code != '—';
    final hasPhone = phone != '—';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon người đăng ký
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.secondaryERP.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.person_outline,
            size: 16,
            color: AppColors.secondaryERP,
          ),
        ),
        const SizedBox(width: 8),
        // Row: Mã NV • Tên NV • SĐT
        Expanded(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (hasCode) _FieldPill(
                label: code,
                color: AppColors.secondaryERP,
                bg: AppColors.secondaryERP.withValues(alpha: 0.10),
              ),
              _FieldPill(
                label: name,
                color: AppColors.heading,
                bg: Colors.white.withValues(alpha: 0.7),
              ),
              if (hasPhone) _FieldPill(
                label: phone,
                icon: Icons.phone_outlined,
                color: AppColors.enableText,
                bg: Colors.white.withValues(alpha: 0.7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Pill nhỏ cho 1 trường: icon? + label, có nền
class _FieldPill extends StatelessWidget {
  const _FieldPill({
    required this.label,
    required this.color,
    required this.bg,
    this.icon,
  });

  final String label;
  final Color color;
  final Color bg;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: AppColors.borderColor.withValues(alpha: 0.4),
          width: 0.6,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _ApproverLine extends StatelessWidget {
  const _ApproverLine({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(7),
          ),
          child: const Icon(
            Icons.verified_user_outlined,
            size: 16,
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Người duyệt:',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: AppColors.success,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ─── Date cell (label + value, có accent color) ──────────────────────────────

class _DateCell extends StatelessWidget {
  const _DateCell({
    required this.label,
    required this.date,
    required this.accent,
    this.icon,
  });

  final String label;
  final DateTime? date;
  final Color accent;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: accent.withValues(alpha: 0.25),
          width: 0.7,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.event_outlined,
            size: 13,
            color: accent,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.gray,
                    letterSpacing: 0.2,
                    height: 1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  _fmt(date),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: date != null ? accent : AppColors.gray,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
