import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import 'lead_marketing_stage_style.dart';

/// Card hiển thị một phiếu lead trong danh sách Lead Marketing.
///
/// Bố cục gồm 4 vùng:
/// - Thanh trên: mã lead + chip giai đoạn + cảnh báo quá hạn.
/// - Tiêu đề: tên công ty + loại khách hàng.
/// - Dải chip: nhóm hàng / nguồn / mã khách hàng.
/// - Lưới thông tin: người liên hệ, nhân viên phụ trách, thời gian, giá trị.
///
/// Chạm vào card sẽ mở bottom sheet chi tiết.
class LeadMarketingCard extends StatelessWidget {
  const LeadMarketingCard({
    super.key,
    required this.item,
    this.onTap,
  });

  /// Phiếu lead cần hiển thị.
  final LeadMarketingItem item;

  /// Callback khi người dùng chạm vào card.
  final VoidCallback? onTap;

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  /// Màu nhấn mạnh theo giai đoạn xử lý của lead.
  ///
  /// Dùng chung [LeadStageStyle] với bộ lọc nên chip giai đoạn ở danh sách
  /// và trong filter luôn cùng màu.
  Color get _stageColor => LeadStageStyle.ofName(item.stageName);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: AppColors.heading.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildTitle(),
              const SizedBox(height: 10),
              _buildChips(),
              const SizedBox(height: 12),
              _buildInfoGrid(),
            ],
          ),
        ),
      ),
    );
  }

  /// Thanh trên cùng: mã lead, chip giai đoạn, cờ quá hạn.
  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.secondaryERP,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _orDash(item.leadCode),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.enableText,
              height: 1.2,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(width: 8),
          _StatusChip(
            label: _orDash(item.stageName),
            color: _stageColor,
            filled: true,
          ),
          const Spacer(),
          if (item.isOverdue == true)
            _StatusChip(label: 'Quá hạn', color: AppColors.redA500, filled: true),
        ],
      ),
    );
  }

  /// Tên công ty + loại khách hàng.
  Widget _buildTitle() {
    final company = (item.companyName ?? '').trim();
    final customer = (item.customerName ?? '').trim();
    final title = company.isNotEmpty ? company : customer;
    final customerType = (item.customerType ?? '').trim();

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title.isEmpty ? '-' : title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.heading,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (customerType.isNotEmpty) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                customerType,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.label,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Dải chip: nhóm hàng, nguồn, mã khách hàng.
  Widget _buildChips() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          if ((item.customerCode ?? '').trim().isNotEmpty)
            _StatusChip(
              label: item.customerCode!.trim(),
              color: AppColors.purpleA400,
              icon: Icons.badge_outlined,
            ),
          if ((item.poTypeName ?? '').trim().isNotEmpty)
            _StatusChip(
              label: item.poTypeName!.trim(),
              color: AppColors.blueMain,
              icon: Icons.category_outlined,
            ),
          if ((item.leadSourceName ?? '').trim().isNotEmpty)
            _StatusChip(
              label: item.leadSourceName!.trim(),
              color: AppColors.tealA400,
              icon: Icons.campaign_outlined,
            ),

        ],
      ),
    );
  }

  /// Lưới thông tin 2 cột: người liên hệ, nhân viên, thời gian, giá trị.
  Widget _buildInfoGrid() {
    final contactName = _orDash(item.contactName);
    final contactPhone = _orDash(item.contactPhone);

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _InfoCell(
                  icon: Icons.person_outline,
                  label: 'Liên hệ',
                  value: contactName,
                  subValue: contactPhone == '-' ? null : contactPhone,
                ),
              ),
              Expanded(
                child: _InfoCell(
                  icon: Icons.support_agent_outlined,
                  label: 'Marketing',
                  value: _orDash(item.marketingEmployeeName),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _InfoCell(
                  icon: Icons.handshake_outlined,
                  label: 'Sale',
                  value: _orDash(item.saleEmployeeName),
                ),
              ),
              Expanded(
                child: _InfoCell(
                  icon: Icons.event_outlined,
                  label: 'Hẹn liên hệ',
                  value: _formatDate(item.nextFollowUpDate),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _InfoCell(
                  icon: Icons.payments_outlined,
                  label: 'Giá trị dự kiến',
                  value: _formatMoney(item.estimatedValue),
                ),
              ),
              Expanded(
                child: _InfoCell(
                  icon: Icons.inbox_outlined,
                  label: 'Ngày thu thập',
                  value: _formatDate(item.collectedDate),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Định dạng ngày theo `dd/MM/yyyy`, trả về '-' nếu không hợp lệ.
  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '-';
    try {
      return DateFormat('dd/MM/yyyy').format(DateTime.parse(value).toLocal());
    } catch (_) {
      return value;
    }
  }

  /// Định dạng giá trị tiền.
  String _formatMoney(double? value) {
    if (value == null) return '-';
    final formatter = NumberFormat('#,##0', 'vi_VN');
    return '${formatter.format(value)} đ';
  }
}

/// Một ô thông tin trong lưới 2 cột của card.
class _InfoCell extends StatelessWidget {
  const _InfoCell({
    required this.icon,
    required this.label,
    required this.value,
    this.subValue,
  });

  final IconData icon;
  final String label;
  final String value;

  /// Dòng phụ hiển thị dưới giá trị chính.
  final String? subValue;

  @override
  Widget build(BuildContext context) {
    final isEmpty = value == '-';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15, color: AppColors.gray),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isEmpty ? AppColors.disableText : AppColors.enableText,
                  height: 1.35,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (subValue != null)
                Text(
                  subValue!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                    height: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Status chip hiển thị giai đoạn / nhóm hàng / nguồn.
class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.color,
    this.filled = false,
    this.icon,
  });

  final String label;
  final Color color;

  /// Chip giai đoạn dùng nền đậm hơn để nổi bật.
  final bool filled;

  /// Icon nhỏ đi kèm chip (tuỳ chọn).
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: filled ? color : color.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 12,
              color: filled ? Colors.white : color,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: filled ? Colors.white : color,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
