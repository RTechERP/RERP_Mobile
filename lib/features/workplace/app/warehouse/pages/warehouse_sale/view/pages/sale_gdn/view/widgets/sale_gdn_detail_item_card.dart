import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

/// Card hiển thị một dòng chi tiết sản phẩm trong phiếu xuất kho.
class SaleGdnDetailItemCard extends StatelessWidget {
  const SaleGdnDetailItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.onAddImages,
    required this.onRemoveImage,
  });

  final DetailGDNResponse item;
  final int index;

  /// Callback mở flow chọn ảnh (camera/gallery) cho dòng này.
  final Future<void> Function() onAddImages;

  /// Callback xoá 1 ảnh theo chỉ số trong dòng này.
  final void Function(int imageIndex) onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: STT + Tên sản phẩm
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$index',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName ?? '--',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.enableText,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.unit != null && item.unit!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Đơn vị: ${item.unit}',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          // Mã nội bộ
          _CodeRow(
            label: 'Mã nội bộ',
            value: item.productNewCode,
          ),
          const SizedBox(height: 6),
          // Mã sản phẩm
          _CodeRow(
            label: 'Mã sản phẩm',
            value: item.productCode,
          ),
          const SizedBox(height: 10),
          // SL tồn + Số lượng
          Row(
            children: [
              Expanded(
                child: _MetricCell(
                  label: 'SL tồn',
                  value: _formatNumber(item.totalInventory),
                  icon: Icons.inventory_2_outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCell(
                  label: 'Số lượng',
                  value: _formatNumber(item.qty),
                  icon: Icons.production_quantity_limits_outlined,
                  highlight: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Đơn giá bán + Đơn giá mua
          Row(
            children: [
              Expanded(
                child: _MetricCell(
                  label: 'Đơn giá bán',
                  value: _formatCurrency(item.unitPricePOKH),
                  icon: Icons.sell_outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MetricCell(
                  label: 'Đơn giá mua',
                  value: _formatCurrency(item.unitPricePurchase),
                  icon: Icons.shopping_cart_outlined,
                ),
              ),
            ],
          ),
          if (item.projectCodeExport != null &&
              item.projectCodeExport!.isNotEmpty) ...[
            const SizedBox(height: 10),
            _CodeRow(
              label: 'Mã dự án',
              value: item.projectCodeExport,
            ),
          ],
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          // Khu vực ảnh
          _PhotoSection(
            paths: item.localImagePaths,
            onAdd: onAddImages,
            onRemove: onRemoveImage,
          ),
        ],
      ),
    );
  }

  String _formatNumber(double? v) {
    if (v == null) return '--';
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
  }

  String _formatCurrency(double? v) {
    if (v == null) return '--';
    final formatted = v.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    return '$formatted đ';
  }
}

class _CodeRow extends StatelessWidget {
  const _CodeRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.gray,
            ),
          ),
        ),
        Expanded(
          child: Text(
            (value == null || value!.isEmpty) ? '--' : value!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.enableText,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({
    required this.label,
    required this.value,
    required this.icon,
    this.highlight = false,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final color =
        highlight ? AppColors.primaryERP : AppColors.enableText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: highlight
            ? AppColors.primaryERP.withValues(alpha: 0.08)
            : Colors.black.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.gray,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: color,
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

// ---------------------------------------------------------------------------
// Photo section (nút thêm + lưới thumbnail)
// ---------------------------------------------------------------------------

class _PhotoSection extends StatelessWidget {
  const _PhotoSection({
    required this.paths,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> paths;
  final Future<void> Function() onAdd;
  final void Function(int imageIndex) onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ảnh',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.gray,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (paths.isEmpty)
                _buildEmpty(context)
              else
                _buildGrid(context),
              const SizedBox(height: 6),
              _buildCount(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _AddPhotoButton(onTap: onAdd),
        Text(
          'Chưa có ảnh',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < paths.length; i++)
          _PhotoThumb(
            path: paths[i],
            onRemove: () => onRemove(i),
          ),
        _AddPhotoButton(onTap: onAdd),
      ],
    );
  }

  Widget _buildCount() {
    return Text(
      paths.isEmpty ? '0 ảnh' : '${paths.length} ảnh',
      style: TextStyle(
        fontSize: 11,
        color: AppColors.gray,
      ),
    );
  }
}

class _AddPhotoButton extends StatelessWidget {
  const _AddPhotoButton({required this.onTap});

  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => onTap(),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.primaryERP.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryERP.withValues(alpha: 0.4),
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo_outlined,
              size: 20,
              color: AppColors.primaryERP,
            ),
            const SizedBox(height: 2),
            Text(
              'Thêm ảnh',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoThumb extends StatelessWidget {
  const _PhotoThumb({required this.path, required this.onRemove});

  final String path;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            File(path),
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 64,
              height: 64,
              color: AppColors.gray.withValues(alpha: 0.2),
              child: Icon(
                Icons.broken_image_outlined,
                color: AppColors.gray,
                size: 20,
              ),
            ),
          ),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                size: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}