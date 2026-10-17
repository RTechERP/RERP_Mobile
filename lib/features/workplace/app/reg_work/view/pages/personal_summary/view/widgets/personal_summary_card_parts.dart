// Widget chia sẻ: badge trạng thái duyệt + dòng info label/value + chip loại.
// Được các card của Personal Summary sử dụng để giữ style thống nhất.
import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';

/// Badge trạng thái duyệt (TBP / HR / BGD). Màu theo `ApprovalStatus`.
class ApprovalBadge extends StatelessWidget {
  const ApprovalBadge({
    super.key,
    required this.role,
    required this.status,
  });

  final String role;
  final ApprovalStatus status;

  String get _statusText {
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

  Color get _bgColor {
    switch (status) {
      case ApprovalStatus.approved:
        return AppColors.greenA500;
      case ApprovalStatus.pending:
        return AppColors.orangeA500;
      case ApprovalStatus.cancelled:
        return AppColors.redA500;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.15);
    }
  }

  Color get _textColor {
    switch (status) {
      case ApprovalStatus.prepare:
        return AppColors.enableText;
      default:
        return Colors.white;
    }
  }

  Color get _borderColor {
    switch (status) {
      case ApprovalStatus.approved:
        return AppColors.greenA400;
      case ApprovalStatus.pending:
        return AppColors.orangeA400;
      case ApprovalStatus.cancelled:
        return AppColors.redA400;
      case ApprovalStatus.prepare:
        return AppColors.gray.withValues(alpha: 0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final label = _statusText.isEmpty ? role : '$role - $_statusText';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: _bgColor.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          color: _textColor,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// Dòng thông tin kiểu "icon - label: value" dùng chung trong card.
class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
    this.indentTop = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;
  final bool indentTop;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: indentTop ? 2 : 0),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
              color: valueColor ?? AppColors.enableText,
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

/// Dòng gộp 2 cặp "label: value" trên cùng một hàng ngang.
/// Dùng cho các trường có cặp Bắt đầu / Kết thúc để tiết kiệm chiều dọc.
class InfoRowRange extends StatelessWidget {
  const InfoRowRange({
    super.key,
    required this.icon,
    required this.startLabel,
    required this.startValue,
    required this.endLabel,
    required this.endValue,
    this.indentTop = false,
  });

  final IconData icon;
  final String startLabel;
  final String startValue;
  final String endLabel;
  final String endValue;
  final bool indentTop;

  @override
  Widget build(BuildContext context) {
    final valueStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.enableText,
      height: 1.2,
    );
    final labelStyle = TextStyle(
      fontSize: 12,
      color: AppColors.gray,
      height: 1.2,
    );

    Widget pair(String label, String value) => Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  '$label: ',
                  style: labelStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  style: valueStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: indentTop ? 2 : 0),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        pair(startLabel, startValue),
        pair(endLabel, endValue),
      ],
    );
  }
}

/// Chip hiển thị "label + value" (icon + label nhỏ + value in đậm).
/// Có thể hiển thị nhiều cặp label/value xếp ngang (dùng cho trường hợp
/// gộp Bắt đầu / Kết thúc / Số giờ trong cùng 1 chip).
class SummaryTypeChip extends StatelessWidget {
  const SummaryTypeChip({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    this.icon = Icons.category_outlined,
  })  : extraFields = const [];

  /// Constructor cho chip nhiều cặp label/value xếp ngang, chia đều width.
  /// `icon` có thể null để ẩn icon (chỉ dùng cho chip nhiều cột).
  const SummaryTypeChip.multi({
    super.key,
    required this.color,
    this.icon,
    required this.extraFields,
  })  : label = '',
        value = '';

  final String label;
  final String value;
  final Color color;
  final IconData? icon;

  /// Các cặp (label, value) phụ hiển thị bên phải chip chính.
  final List<MapEntry<String, String>> extraFields;

  @override
  Widget build(BuildContext context) {
    final showMain = icon != null || label.isNotEmpty;
    final columns = <Widget>[];
    if (showMain) {
      columns.add(_buildColumn(label, value));
    }
    for (final f in extraFields) {
      columns.add(_buildColumn(f.key, f.value));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 8),
          ],
          for (var i = 0; i < columns.length; i++) ...[
            if (i > 0)
              Container(
                width: 1,
                height: 28,
                color: color.withValues(alpha: 0.2),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
            Expanded(child: columns[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.gray,
            height: 1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.enableText,
            height: 1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Lớp base cho các card của Personal Summary (glassmorphism style).
/// Cung cấp layout: badge trạng thái trên + chips + danh sách InfoRow dưới.
class GlassCardShell extends StatelessWidget {
  const GlassCardShell({
    super.key,
    required this.badges,
    this.chips,
    required this.children,
    this.borderColor,
    this.chipsColumn = false,
  });

  final List<Widget> badges;
  final List<Widget>? chips;
  final List<Widget> children;
  final Color? borderColor;

  /// Nếu `true`, chips xếp dọc (mỗi chip 1 dòng) thay vì ngang.
  final bool chipsColumn;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: 0.9),
              Colors.white.withValues(alpha: 0.7),
            ],
          ),
          border: Border.all(
            color: borderColor ?? Colors.white.withValues(alpha: 0.6),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (badges.isNotEmpty)
                Row(
                  children: [
                    const SizedBox(width: 8),
                    for (var i = 0; i < badges.length; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      badges[i],
                    ],
                  ],
                ),
              if (chips != null && chips!.isNotEmpty) ...[
                const SizedBox(height: 14),
                if (chipsColumn)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < chips!.length; i++) ...[
                        if (i > 0) const SizedBox(height: 8),
                        chips![i],
                      ],
                    ],
                  )
                else
                  Row(
                    children: [
                      for (var i = 0; i < chips!.length; i++) ...[
                        if (i > 0) const SizedBox(width: 8),
                        Expanded(child: chips![i]),
                      ],
                    ],
                  ),
              ],
              const SizedBox(height: 14),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

/// Dòng kiểu "icon - label: Có/Không" với tick xanh khi `checked = true`.
/// Dùng cho các trường boolean như "Xuất phát trước 7h15", Ăn tối.
class InfoRowCheck extends StatelessWidget {
  const InfoRowCheck({
    super.key,
    required this.icon,
    required this.label,
    required this.checked,
    this.checkedText = 'Có',
    this.uncheckedText = 'Không',
    this.indentTop = false,
  });

  final IconData icon;
  final String label;
  final bool checked;
  final String checkedText;
  final String uncheckedText;
  final bool indentTop;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: indentTop ? 2 : 0),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Icon(
          checked ? Icons.check_circle : Icons.cancel,
          size: 14,
          color: checked ? AppColors.greenA500 : AppColors.gray,
        ),
        const SizedBox(width: 4),
        Text(
          checked ? checkedText : uncheckedText,
          style: TextStyle(
            fontSize: 12,
            fontWeight: checked ? FontWeight.w600 : FontWeight.w500,
            color: checked ? AppColors.greenA500 : AppColors.enableText,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

/// Convert `int?` status (BE thường trả 0 = chờ, 1 = duyệt, 2 = huỷ)
/// sang `ApprovalStatus`. Nếu text chứa "chờ" / "huỷ" / "duyệt" thì ưu tiên text.
ApprovalStatus mapStatusFromInt(
  int? status,
  String? statusText,
) {
  final text = (statusText ?? '').toLowerCase();
  if (text.contains('huỷ') ||
      text.contains('hủy') ||
      text.contains('cancel')) {
    return ApprovalStatus.cancelled;
  }
  if (status != null) {
    if (status == 1) return ApprovalStatus.approved;
    if (status == 2) return ApprovalStatus.cancelled;
  }
  if (text.contains('chờ')) return ApprovalStatus.pending;
  if (text.contains('duyệt') && !text.contains('chờ')) {
    return ApprovalStatus.approved;
  }
  return ApprovalStatus.pending;
}

/// Đối với field dạng bool (`IsApprovedTBP`, `IsApprovedHR`): true = duyệt,
/// false = chờ, null = chờ (BE hay trả false cho cả chờ và huỷ).
ApprovalStatus mapStatusFromBool(bool? approved) {
  if (approved == true) return ApprovalStatus.approved;
  return ApprovalStatus.pending;
}
