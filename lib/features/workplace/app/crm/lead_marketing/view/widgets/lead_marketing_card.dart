import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';

/// Card hiển thị một phiếu lead trong danh sách Lead Marketing.
///
/// Gồm: mã lead, tên công ty, nguồn, giai đoạn, nhân viên marketing/sale
/// và thông tin liên hệ chính.
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

  static final _dateFmt = DateFormat('dd/MM/yyyy');

  /// Định dạng ngày theo `dd/MM/yyyy`, trả về '-' nếu không hợp lệ.
  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '-';
    try {
      return _dateFmt.format(DateTime.parse(value).toLocal());
    } catch (_) {
      return value;
    }
  }

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  /// Màu hiển thị theo giai đoạn xử lý của lead.
  Color get _stageColor {
    switch (item.stage) {
      case 1:
        return AppColors.tealA400;
      case 2:
        return AppColors.blueMain;
      case 3:
        return AppColors.orangeA500;
      case 4:
        return AppColors.purpleA400;
      case 5:
        return AppColors.greenA500;
      default:
        return AppColors.gray;
    }
  }

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
                color: AppColors.primaryERP.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 12),
                _buildCompany(),
                const SizedBox(height: 10),
                _buildChips(),
                const SizedBox(height: 12),
                _buildContact(),
                if (item.needDescription != null &&
                    item.needDescription!.trim().isNotEmpty) ...[
                  const SizedBox(height: 10),
                  _buildNeed(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Mã lead + nguồn lead + giai đoạn.
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryERP.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _orDash(item.leadCode),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            _orDash(item.leadSourceName),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
              height: 1.4,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _stageColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _orDash(item.stageName),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _stageColor,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  /// Tên công ty / khách hàng.
  Widget _buildCompany() {
    final company = (item.companyName ?? '').trim();
    final customer = (item.customerName ?? '').trim();
    final title = company.isNotEmpty ? company : customer;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.business_outlined, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            title.isEmpty ? '-' : title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
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

  /// Các chip thông tin: loại lead, ngành nghề, marketing, sale.
  Widget _buildChips() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        _Chip(
          icon: Icons.category_outlined,
          value: _orDash(item.leadTypeName),
          color: AppColors.tealA400,
        ),
        if ((item.industryName ?? '').trim().isNotEmpty)
          _Chip(
            icon: Icons.factory_outlined,
            value: _orDash(item.industryName),
            color: AppColors.blueMain,
          ),
        if ((item.marketingEmployeeName ?? '').trim().isNotEmpty)
          _Chip(
            icon: Icons.campaign_outlined,
            value: _orDash(item.marketingEmployeeName),
            color: AppColors.purpleA400,
          ),
        if ((item.saleEmployeeName ?? '').trim().isNotEmpty)
          _Chip(
            icon: Icons.support_agent_outlined,
            value: _orDash(item.saleEmployeeName),
            color: AppColors.greenA500,
          ),
        _Chip(
          icon: Icons.event_outlined,
          value: _formatDate(item.collectedDate),
          color: AppColors.orangeA500,
        ),
      ],
    );
  }

  /// Thông tin liên hệ: người liên hệ, điện thoại, email.
  Widget _buildContact() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _ContactRow(
            icon: Icons.person_outline,
            label: 'Người liên hệ',
            value: _orDash(item.contactName),
          ),
          const SizedBox(height: 6),
          _ContactRow(
            icon: Icons.phone_outlined,
            label: 'Điện thoại',
            value: _orDash(item.contactPhone),
          ),
          const SizedBox(height: 6),
          _ContactRow(
            icon: Icons.mail_outline,
            label: 'Email',
            value: _orDash(item.contactEmail),
          ),
        ],
      ),
    );
  }

  /// Nhu cầu của khách hàng.
  Widget _buildNeed() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.notes_outlined, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            item.needDescription!.trim(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.enableText,
              height: 1.35,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Chip nhỏ hiển thị thông tin phân loại.
class _Chip extends StatelessWidget {
  const _Chip({
    required this.icon,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 5),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 140),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dòng thông tin liên hệ dạng `label: value`.
class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icon, size: 13, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 11, color: AppColors.gray, height: 1.4),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.enableText,
              height: 1.4,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
