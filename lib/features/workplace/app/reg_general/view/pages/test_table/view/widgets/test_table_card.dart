// Date: 04/09/2026
// Card đăng ký bàn test ESL - glassmorphism, compact.
// Hỗ trợ swipe actions: "Xoá" (chưa duyệt) / "Trả bàn" (đã duyệt).

import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/test_table_model.dart';

// ─── Helpers ─────────────────────────────────────────────────────────────────

/// Parse danh sách detail từ detailsJson (mỗi detail là 1 object).
List<Map<String, dynamic>> _parseDetails(String? detailsJson) {
  if (detailsJson == null || detailsJson.trim().isEmpty) return const [];
  try {
    final decoded = jsonDecode(detailsJson);
    if (decoded is! List || decoded.isEmpty) return const [];
    return List<Map<String, dynamic>>.from(decoded);
  } catch (_) {
    return const [];
  }
}

/// Label cho badge — chỉ 2 trạng thái (Chờ duyệt / Đã duyệt).
String _statusLabel(int? s) {
  return s == 1 ? 'Đã duyệt' : 'Chờ duyệt';
}

/// Màu cho badge theo status (2 trạng thái).
Color _statusColor(int? s) {
  return s == 1 ? AppColors.stateSuccessColor : AppColors.warning;
}

String _dash(String? v) {
  final t = v?.trim();
  return (t == null || t.isEmpty) ? '—' : t;
}

String _fmt(DateTime? d) {
  if (d == null) return '—';
  return DateFormat('dd/MM/yyyy').format(d.toLocal());
}

// ─── Card ────────────────────────────────────────────────────────────────────

class TestTableCard extends StatefulWidget {
  const TestTableCard({
    super.key,
    required this.item,
    this.onDelete,
    this.onEdit,
    this.onReturn,
    this.isReturning = false,
    this.isDeleting = false,
  });

  final TestCardItem item;

  /// Callback khi user xác nhận xóa (phiếu chưa duyệt — status != 1).
  /// Khi null → không cho phép xóa (ẩn action pane).
  final void Function(int masterId)? onDelete;

  /// Callback khi user bấm sửa (chuyển sang màn edit).
  /// Khi null → không cho phép sửa.
  final void Function(int masterId)? onEdit;

  /// Callback khi user xác nhận trả bàn (phiếu đã duyệt — status == 1).
  /// Khi null → không cho phép trả (ẩn action pane).
  final void Function(int registrationId)? onReturn;

  /// Đang trả bàn (chờ API) — hiển thị loading trên action pane.
  final bool isReturning;

  /// Đang xóa (chờ API) — hiển thị loading trên action pane.
  final bool isDeleting;

  @override
  State<TestTableCard> createState() => _TestTableCardState();
}

class _TestTableCardState extends State<TestTableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final sc = _statusColor(widget.item.status);
    final badgeLabel = _statusLabel(widget.item.status);
    final masterId = widget.item.id;
    final hasDetails = (widget.item.detailsJson ?? '').trim().isNotEmpty;

    final card = ClipRRect(
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
              _buildHeader(sc, badgeLabel),
              if (_hasInfo) ...[
                const SizedBox(height: 8),
                _buildInfo(),
              ],
              if (widget.item.detailStartDate != null || widget.item.detailEndDate != null) ...[
                const SizedBox(height: 8),
                _buildFooter(),
              ],
              // ─── Expand: chi tiết detailsJson ────────────────────────────────
              if (hasDetails) ...[
                const SizedBox(height: 6),
                _buildExpandable(),
              ],
              // ─── Footer: chevron expand/collapse (tap không bubble lên edit) ──
              _buildFooterRow(hasDetails),
            ],
          ),
        ),
      ),
    );

    // Nếu không có id thì chỉ render card thường.
    if (masterId == null) return card;

    // Swipe phải → action trả bàn / xoá theo status.
    return Slidable(
      key: ValueKey('test_card_$masterId'),
      endActionPane: _buildActionPane(masterId, widget.item.status ?? 0),
      child: GestureDetector(
        onTap: widget.onEdit != null ? () => widget.onEdit!(masterId) : null,
        child: card,
      ),
    );
  }

  // ─── Action pane tùy theo trạng thái phiếu ─────────────────────────
  ActionPane? _buildActionPane(int masterId, int detailStatus) {
    // Xác định swipe action dựa trên trạng thái phiếu.
    final isApproved = detailStatus == 1;
    final hasAction = isApproved ? widget.onReturn != null : widget.onDelete != null;
    if (!hasAction) return null;

    final isLoading = isApproved ? widget.isReturning : widget.isDeleting;

    if (isApproved) {
      return ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            onPressed: isLoading
                ? null
                : (_) => widget.onReturn?.call(masterId),
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            icon: isLoading ? Icons.hourglass_top : Icons.keyboard_return,
            label: isLoading ? '...' : 'Trả bàn',
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(16),
            ),
          ),
        ],
      );
    } else {
      return ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: isLoading
                ? null
                : (_) => widget.onDelete?.call(masterId),
            backgroundColor: AppColors.alert,
            foregroundColor: Colors.white,
            icon: isLoading ? Icons.hourglass_top : Icons.delete,
            label: isLoading ? '...' : 'Xoá',
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(16),
            ),
          ),
        ],
      );
    }
  }

  // ─── Expandable: chi tiết detailsJson khi tap chevron ──────────────────
  Widget _buildExpandable() {
    final details = _parseDetails(widget.item.detailsJson);

    // AnimatedSize + ClipRect tự co giãn chiều cao khi expand/collapse,
    // tránh lỗi text nhảy/overflow mà AnimatedCrossFade hay gặp.
    return AnimatedSize(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: _isExpanded
              ? Padding(
                  key: const ValueKey('expanded'),
                  padding: const EdgeInsets.only(top: 6),
                  child: _buildDetailsBody(details),
                )
              : const SizedBox(key: ValueKey('collapsed'), height: 0),
        ),
      ),
    );
  }

  Widget _buildDetailsBody(List<Map<String, dynamic>> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1, color: AppColors.borderColor.withValues(alpha: 0.5)),
        const SizedBox(height: 6),
        const Text(
          'Lịch sử phiếu',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondaryColor,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 6),
        // Mỗi detail là 1 card nhỏ với viền trái màu theo Type,
        // body: statusChip • #{No} - {Loại} / Ngày / Người nhận BG / Người duyệt.
        ...details.map((d) {
          final st = d['Status'] as int?;
          final statusColor = _statusColor(st);
          final type = d['Type'] as int?;
          final accent = _detailTypeColor(type);

          // Ưu tiên field từ detail, fallback master.
          final start = _readDate(d, 'StartDate') ??
              _readDate(d, 'DetailStartDate') ??
              widget.item.detailStartDate;
          final end = _readDate(d, 'EndDate') ??
              _readDate(d, 'DetailEndDate') ??
              widget.item.detailEndDate;
          final handover = _readStr(d, 'ReceiverName') ??
              _readStr(d, 'HandoverName') ??
              _readStr(d, 'OwnerFullName') ??
              widget.item.ownerFullName;
          final approver = _readStr(d, 'ApproverFullName') ??
              widget.item.approverFullName;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white.withValues(alpha: 0.55),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Thanh accent trái — màu theo Type.
                      Container(width: 3, color: accent),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row 1: Type icon + #{No} - {Loại} + statusChip
                              Row(
                                children: [
                                  Icon(_detailTypeIcon(type), size: 14, color: accent),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      '#${d['No'] ?? '-'} • ${_detailTypeLabel(type)}',
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w700,
                                        color: accent,
                                        height: 1.2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: statusColor.withValues(alpha: 0.14),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: statusColor.withValues(alpha: 0.4),
                                        width: 0.7,
                                      ),
                                    ),
                                    child: Text(
                                      _detailStatusLabel(st),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: statusColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Divider mảnh ngăn header / body
                              Padding(
                                padding: const EdgeInsets.only(top: 6, bottom: 6),
                                child: Divider(
                                  height: 1,
                                  color: AppColors.borderColor.withValues(alpha: 0.35),
                                ),
                              ),
                              if (start != null || end != null) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: _DateCell(
                                        label: 'Bắt đầu',
                                        date: start,
                                        accent: accent,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: _DateCell(
                                        label: 'Kết thúc',
                                        date: end,
                                        accent: accent,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                              ],
                              if (handover != null && handover.trim().isNotEmpty) ...[
                                _DetailLine(
                                  icon: Icons.person_outline,
                                  text: handover,
                                  label: 'Người nhận BG',
                                ),
                                const SizedBox(height: 4),
                              ],
                              if (approver != null && approver.trim().isNotEmpty) ...[
                                _DetailLine(
                                  icon: Icons.verified_user_outlined,
                                  text: approver,
                                  label: 'Người duyệt',
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // Label đầy đủ cho Type. 1 = Đăng ký, 2 = Gia hạn, 3 = Bàn giao.
  String _detailTypeLabel(int? type) {
    switch (type) {
      case 1: return 'Đăng ký';
      case 2: return 'Gia hạn';
      case 3: return 'Bàn giao';
      default: return '—';
    }
  }

  // Icon tương ứng Type.
  IconData _detailTypeIcon(int? type) {
    switch (type) {
      case 1: return Icons.fiber_new_outlined;
      case 2: return Icons.update_outlined;
      case 3: return Icons.swap_horiz_outlined;
      default: return Icons.help_outline;
    }
  }

  // Màu nhấn cho Type (thanh accent trái).
  Color _detailTypeColor(int? type) {
    switch (type) {
      case 1: return AppColors.primaryERP;
      case 2: return AppColors.warning;
      case 3: return AppColors.stateSuccessColor;
      default: return AppColors.textSecondaryColor;
    }
  }

  // Label cho Status.
  String _detailStatusLabel(int? s) {
    switch (s) {
      case 1: return 'Đã duyệt';
      case 2: return 'Từ chối';
      case 3: return 'Hoàn thành';
      default: return 'Chờ duyệt';
    }
  }

  // Đọc field kiểu Date từ map — BE có thể trả String ISO hoặc DateTime.
  DateTime? _readDate(Map<String, dynamic> map, String key) {
    final v = map[key];
    if (v == null) return null;
    if (v is DateTime) return v;
    if (v is String && v.trim().isNotEmpty) {
      return DateTime.tryParse(v);
    }
    return null;
  }

  // Đọc field kiểu String từ map.
  String? _readStr(Map<String, dynamic> map, String key) {
    final v = map[key];
    if (v is String && v.trim().isNotEmpty) return v;
    return null;
  }

  // ─── Header: mã + thiết bị + status badge ────────────────────────────────
  Widget _buildHeader(Color sc, String badgeLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                _dash(widget.item.registrationCode),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.heading,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            _TinyBadge(text: badgeLabel, color: sc),
          ],
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
                      _dash(widget.item.testTableName),
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
                  if (widget.item.machineNames != null &&
                      widget.item.machineNames!.isNotEmpty) ...[
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        '(${_dash(widget.item.machineNames)})',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secondaryERP,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  const SizedBox(width: 4),
                  _OnlineDot(online: widget.item.online),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Footer row: chevron expand/collapse (tap chỉ toggle, không edit) ───
  Widget _buildFooterRow(bool hasDetails) {
    if (!hasDetails) return const SizedBox.shrink();
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: AnimatedRotation(
            turns: _isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Info: gọn, 2 cột ────────────────────────────────────────────────────
  bool get _hasInfo {
    return (widget.item.projectCode ?? '').trim().isNotEmpty ||
        (widget.item.registrationContent ?? '').trim().isNotEmpty ||
        (widget.item.ownerFullName ?? '').trim().isNotEmpty ||
        (widget.item.ownerCode ?? '').trim().isNotEmpty ||
        (widget.item.ownerPhone ?? '').trim().isNotEmpty ||
        (widget.item.approverFullName ?? '').trim().isNotEmpty;
  }

  Widget _buildInfo() {
    final rows = <Widget>[];
    void addDivider() {
      if (rows.isNotEmpty) rows.add(const _DotSep());
    }

    if ((widget.item.projectCode ?? '').trim().isNotEmpty) {
      addDivider();
      rows.add(_InfoLine(
        icon: Icons.folder_outlined,
        text: _dash(widget.item.projectCode),
      ));
    }
    if ((widget.item.registrationContent ?? '').trim().isNotEmpty) {
      addDivider();
      rows.add(_InfoLine(
        icon: Icons.description_outlined,
        text: _dash(widget.item.registrationContent),
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
          if ((widget.item.ownerFullName ?? '').trim().isNotEmpty ||
              (widget.item.ownerCode ?? '').trim().isNotEmpty ||
              (widget.item.ownerPhone ?? '').trim().isNotEmpty) ...[
            if (rows.isNotEmpty) const SizedBox(height: 8),
            _PersonRow(
              name: _dash(widget.item.ownerFullName),
              code: _dash(widget.item.ownerCode),
              phone: _dash(widget.item.ownerPhone),
            ),
          ],
          if ((widget.item.approverFullName ?? '').trim().isNotEmpty) ...[
            const SizedBox(height: 6),
            _ApproverLine(name: _dash(widget.item.approverFullName)),
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
            date: widget.item.detailStartDate,
            accent: AppColors.secondaryERP,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _DateCell(
            label: 'Kết thúc',
            date: widget.item.detailEndDate,
            accent: AppColors.warning,
          ),
        ),
        if (widget.item.status == 3 && widget.item.actualReturnDate != null) ...[
          const SizedBox(width: 8),
          Expanded(
            child: _DateCell(
              label: 'Đã trả',
              date: widget.item.actualReturnDate,
              accent: AppColors.success,
              icon: Icons.check_circle,
            ),
          ),
        ],
      ],
    );
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
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Dòng chi tiết nhỏ trong expandable: icon + text (có label phụ tuỳ chọn).
class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.icon,
    required this.text,
    this.label,
  });

  final IconData icon;
  final String text;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 12, color: AppColors.gray),
        const SizedBox(width: 4),
        if (label != null) ...[
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondaryColor,
              height: 1.3,
            ),
          ),
        ],
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
              height: 1.3,
            ),
            maxLines: 2,
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
