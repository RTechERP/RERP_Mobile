import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_customer_model.dart';

/// Card hiển thị thông tin tổng hợp của một khách hàng trong danh sách CRM.
///
/// Gồm: Loại KH, Mã KH, Tên khách hàng, Địa chỉ, MST, Lĩnh vực,
/// Ngành nghề và Số dự án. Chạm vào phần "dự án" sẽ mở danh sách đầy đủ
/// các dự án của khách hàng.
class SummaryCustomerCard extends StatelessWidget {
  const SummaryCustomerCard({
    super.key,
    required this.group,
    this.onTapProjects,
  });

  /// Thông tin khách hàng đã gom nhóm kèm số dự án.
  final SummaryCustomerGroup group;

  /// Callback khi người dùng chạm vào phần hiển thị danh sách dự án.
  final VoidCallback? onTapProjects;

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapProjects,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.10),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeader(), _buildBody(), _buildProjectsFooter()],
          ),
        ),
      ),
    );
  }

  /// Phần đầu card: tên khách hàng, mã KH và loại KH.
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryERP.withValues(alpha: 0.10),
            AppColors.primaryERPlight.withValues(alpha: 0.14),
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(19)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _orDash(group.customerName),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
              height: 1.3,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _HeaderTag(
                  icon: Icons.tag,
                  label: 'Mã KH',
                  value: _orDash(group.customerCode),
                  color: AppColors.primaryERP,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _HeaderTag(
                  icon: Icons.badge_outlined,
                  label: 'Loại KH',
                  value: _orDash(group.typeName),
                  color: AppColors.secondaryERP,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Phần thân card: địa chỉ, MST, lĩnh vực, ngành nghề.
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Địa chỉ',
            value: _orDash(group.address),
            maxLines: null,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.receipt_long_outlined,
            label: 'MST',
            value: _orDash(group.taxCode),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _TypeChip(
                label: 'Lĩnh vực',
                value: _orDash(group.industriesNameVi),
                color: AppColors.tealA400,
                icon: Icons.category_outlined,
              ),
              const SizedBox(height: 10),
              _TypeChip(
                label: 'Ngành nghề',
                value: _orDash(group.industryProduct),
                color: AppColors.blueMain,
                icon: Icons.inventory_2_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Phần chân card: badge số dự án phụ trách.
  Widget _buildProjectsFooter() {
    final hasProjects = group.projectCount > 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: hasProjects
            ? AppColors.primaryERP.withValues(alpha: 0.06)
            : AppColors.grey_bg.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(19),
        ),
        border: const Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: hasProjects
                  ? AppColors.primaryERP.withValues(alpha: 0.12)
                  : AppColors.gray.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              hasProjects
                  ? Icons.folder_copy_outlined
                  : Icons.folder_off_outlined,
              size: 16,
              color: hasProjects ? AppColors.primaryERP : AppColors.gray,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              hasProjects
                  ? '${group.projectCount} dự án phụ trách'
                  : '0 dự án phụ trách',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: hasProjects ? AppColors.primaryERP : AppColors.gray,
                height: 1.2,
              ),
            ),
          ),
          Text(
            'Xem chi tiết',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: hasProjects ? AppColors.primaryERP : AppColors.gray,
              height: 1.2,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            Icons.chevron_right_rounded,
            size: 18,
            color: hasProjects ? AppColors.primaryERP : AppColors.gray,
          ),
        ],
      ),
    );
  }
}

/// Tag hiển thị nhãn + giá trị trong phần đầu card (mã KH, loại KH).
class _HeaderTag extends StatelessWidget {
  const _HeaderTag({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.gray,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: color,
                    height: 1.2,
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

/// Chip hiển thị nhãn + giá trị ngắn.
class _TypeChip extends StatelessWidget {
  const _TypeChip({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  final String label;
  final String value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.15), width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.gray,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                    height: 1.2,
                  ),
                  maxLines: 2,
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

/// Row hiển thị một thông tin dạng `label: value`.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.maxLines = 2,
  });

  final IconData icon;
  final String label;
  final String value;

  /// Số dòng tối đa của giá trị — `null` để co giãn theo độ dài text.
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 14, color: AppColors.gray),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
              height: 1.2,
            ),
            maxLines: maxLines,
            overflow: maxLines == null ? null : TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
