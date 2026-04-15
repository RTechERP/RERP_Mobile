// Date: 14/04/2026 - Dev: Claude
// Nội dung/Chức năng: Màn hình chi tiết tài sản cá nhân - hiển thị thông tin đầy đủ của 1 tài sản

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/personal_asset_model.dart';

class PersonalAssetDetailScreen extends StatelessWidget {
  const PersonalAssetDetailScreen({
    super.key,
    required this.item,
  });

  final PersonalAssetItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.heading, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Chi tiết tài sản',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.heading,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: AppColors.borderColor, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Hero Card: Tên tài sản + Status ---
            _HeroCard(item: item),
            const SizedBox(height: 16),

            // --- Thông tin chi tiết ---
            _DetailSection(
              title: 'Thông tin tài sản',
              children: [
                _DetailRow(label: 'Mã tài sản', value: item.assetCode ?? ''),
                _DetailRow(label: 'Tên tài sản', value: item.tsAssetName ?? ''),
                _DetailRow(label: 'Mã loại tài sản', value: item.tsAssetCode ?? ''),
                _DetailRow(label: 'Loại tài sản', value: item.assetType ?? ''),
                _DetailRow(label: 'Số Seri', value: item.seri ?? ''),
                _DetailRow(label: 'Đơn vị tính', value: item.unitName?? ''),
              ],
            ),
            const SizedBox(height: 16),

            // --- Nguồn gốc & Mua sắm ---
            _DetailSection(
              title: 'Nguồn gốc & Mua sắm',
              children: [
                _DetailRow(label: 'Mã NCC', value: item.tsCodeNCC ?? ''),
                _DetailRow(
                  label: 'Ngày mua',
                  value: _formatDate(item.dateBuy),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '—';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

// --- Hero Card ---

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.item});

  final PersonalAssetItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon tài sản
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.inventory_2_rounded,
                  color: AppColors.primaryERP,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.tsAssetName ?? '—',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.assetCode ?? '—',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(status: item.status),
            ],
          ),
          if (item.assetType != null || item.unitName != null) ...[
            const SizedBox(height: 16),
            const Divider(height: 1, color: AppColors.borderColor),
            const SizedBox(height: 16),
            Row(
              children: [
                if (item.assetType != null)
                  _Chip(
                    icon: Icons.category_outlined,
                    label: item.assetType!,
                  ),
                if (item.assetType != null && item.unitName != null)
                  const SizedBox(width: 8),
                if (item.unitName != null)
                  _Chip(
                    icon: Icons.straighten_rounded,
                    label: item.unitName!,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor, width: 0.8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.gray),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Detail Section ---

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borderColor, width: 1),
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(height: 1, color: AppColors.borderColor),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: AppColors.gray,
                  ),
                ),
              ),
              const Text(
                ': ',
                style: TextStyle(fontSize: 13.5, color: AppColors.gray),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            value.isEmpty ? '—' : value,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
        ),
      ],
    );
  }
}

// --- Status Badge ---

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String? status;

  _StatusBadgeEntry get _entry {
    switch (status?.toLowerCase()) {
      case 'active':
      case 'đang sử dụng':
        return _StatusBadgeEntry('Đang dùng', AppColors.stateSuccessColor);
      case 'inactive':
      case 'không sử dụng':
        return _StatusBadgeEntry('Không dùng', AppColors.gray);
      case 'broken':
      case 'hỏng':
        return _StatusBadgeEntry('Hỏng', AppColors.alert);
      default:
        return _StatusBadgeEntry(status ?? '—', AppColors.stateInfoColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final e = _entry;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: e.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: e.color.withValues(alpha: 0.4),
          width: 0.8,
        ),
      ),
      child: Text(
        e.label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: e.color,
        ),
      ),
    );
  }
}

class _StatusBadgeEntry {
  const _StatusBadgeEntry(this.label, this.color);
  final String label;
  final Color color;
}
