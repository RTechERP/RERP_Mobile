import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import '../bloc/material_category_bloc.dart';
import '../../data/datasource/model/part_list_model.dart';
import '../../../material_info/view/widgets/material_info_menu_sheet.dart';
import '../../../material_info/view/widgets/material_info_detail_sheet.dart';
import '../../../material_info/view/widgets/quote_request_detail_sheet.dart';
import '../../../material_info/view/widgets/purchase_request_detail_sheet.dart';
import '../../../material_info/view/widgets/import_warehouse_detail_sheet.dart';
import '../../../material_info/view/widgets/stock_balance_detail_sheet.dart';

/// Tab "Danh mục vật tư" - hiển thị danh sách vật tư flat từ API PartList.
/// Bloc do MaterialCategoryScreen cung cấp; tab này không tạo bloc riêng
/// để đảm bảo dùng chung state với screen cha.
class MaterialCategoryTab extends StatelessWidget {
  const MaterialCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialCategoryBloc, MaterialCategoryState>(
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading && state.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.categories.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.red.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    state.message ?? 'Có lỗi xảy ra',
                    style: AppStyles.contentText.copyWith(color: AppColors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }

        final items = state.filteredCategories;

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 80,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 12),
                Text(
                  state.searchKeyword.isNotEmpty
                      ? 'Không tìm thấy vật tư phù hợp'
                      : 'Chưa có vật tư nào',
                  style: AppStyles.contentText.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _PartListCard(
                index: index + 1,
                item: item,
                onTap: () async {
                  final id = await MaterialInfoMenuSheet.show(
                    context,
                    partListItem: item,
                  );
                  if (!context.mounted || id == null) return;
                  Future<void>? pending;
                  switch (id) {
                    case 'detail':
                      pending = MaterialInfoDetailSheet.show(context, partListItem: item);
                      break;
                    case 'quote':
                      pending = QuoteRequestDetailSheet.show(context, partListItem: item);
                      break;
                    case 'purchase':
                      pending = PurchaseRequestDetailSheet.show(context, partListItem: item);
                      break;
                    case 'import':
                      pending = ImportWarehouseDetailSheet.show(context, partListItem: item);
                      break;
                    case 'stock':
                      pending = StockBalanceDetailSheet.show(context, partListItem: item);
                      break;
                    default:
                      break;
                  }
                  if (pending != null) unawaited(pending);
                },
              ),
            );
          },
        );
      },
    );
  }
}

/// Card hiển thị một vật tư trong danh sách flat (PartListModel).
class _PartListCard extends StatelessWidget {
  const _PartListCard({
    required this.index,
    required this.item,
    this.onTap,
  });

  final int index;
  final PartListModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final groupName = (item.groupMaterial ?? '').isNotEmpty
        ? item.groupMaterial!
        : 'Vật tư';
    final productCode = (item.productCode ?? '').isNotEmpty
        ? item.productCode!
        : '--';
    final manufacturer = (item.manufacturer ?? '').isNotEmpty
        ? item.manufacturer!
        : '--';
    final unit = (item.unit ?? '').isNotEmpty ? item.unit! : '--';
    final qtyMin = item.qtyMin?.toStringAsFixed(0) ?? '--';
    final qtyFull = item.qtyFull?.toStringAsFixed(0) ?? '--';
    final unitPrice = item.unitPriceQuote != null && item.unitPriceQuote! > 0
        ? _formatCurrency(item.unitPriceQuote!)
        : '--';
    final totalPrice = item.totalPriceQuote != null && item.totalPriceQuote! > 0
        ? _formatCurrency(item.totalPriceQuote!)
        : '--';
    final statusText = (item.statusPriceRequestText ?? '').isNotEmpty
        ? item.statusPriceRequestText!
        : '--';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: STT badge + tên nhóm + trạng thái giá
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _STTBadge(label: '$index'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            groupName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1E293B),
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'TT: ${item.tt ?? '--'}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _StatusBadge(text: statusText),
                  ],
                ),
                const SizedBox(height: 12),
                // Mã sản phẩm
                _InfoRow(
                  icon: Icons.qr_code_2_outlined,
                  label: 'Mã SP',
                  value: productCode,
                ),
                const SizedBox(height: 8),
                // Hãng + Đơn vị
                Row(
                  children: [
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.factory_outlined,
                        label: 'Hãng',
                        value: manufacturer,
                      ),
                    ),
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.straighten_outlined,
                        label: 'Đơn vị',
                        value: unit,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // SL/1 máy + SL đủ
                Row(
                  children: [
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.looks_one_outlined,
                        label: 'SL/1 máy',
                        value: qtyMin,
                      ),
                    ),
                    Expanded(
                      child: _InfoRow(
                        icon: Icons.inventory_2_outlined,
                        label: 'SL tổng',
                        value: qtyFull,
                      ),
                    ),
                  ],
                ),
                // Duyệt TBP + Duyệt mua
                if ((item.isApprovedTbpText ?? '').isNotEmpty ||
                    (item.isApprovedPurchaseText ?? '').isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      if ((item.isApprovedTbpText ?? '').isNotEmpty)
                        Expanded(
                          child: _ApproveChip(
                            label: 'TBP: ${item.isApprovedTbpText}',
                            approved: item.isApprovedTbp ?? false,
                          ),
                        ),
                      if ((item.isApprovedTbpText ?? '').isNotEmpty &&
                          (item.isApprovedPurchaseText ?? '').isNotEmpty)
                        const SizedBox(width: 8),
                      if ((item.isApprovedPurchaseText ?? '').isNotEmpty)
                        Expanded(
                          child: _ApproveChip(
                            label: 'Mua: ${item.isApprovedPurchaseText}',
                            approved: item.isApprovedPurchase ?? false,
                          ),
                        ),
                    ],
                  ),
                ],
                // Giá
                if (unitPrice != '--' || totalPrice != '--') ...[
                  const SizedBox(height: 10),
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Đơn giá',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              unitPrice,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1E88E5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Thành tiền',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              totalPrice,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF16A34A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)} tỷ';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)} triệu';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }
}

/// Badge STT.
class _STTBadge extends StatelessWidget {
  const _STTBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryERP,
        ),
      ),
    );
  }
}

/// Chip trạng thái báo giá.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.text});

  final String text;

  Color get _color {
    final t = text.toLowerCase();
    if (t.contains('đã') || t.contains('duyệt') || t.contains('xong')) {
      return const Color(0xFF16A34A);
    }
    if (t.contains('chờ') || t.contains('đang')) {
      return const Color(0xFFF59E0B);
    }
    return AppColors.gray;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}

/// Row thông tin label + value.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
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
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
        const SizedBox(width: 4),
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.gray,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E293B),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Chip trạng thái duyệt (TBP / Mua).
class _ApproveChip extends StatelessWidget {
  const _ApproveChip({required this.label, required this.approved});

  final String label;
  final bool approved;

  Color get _color => approved
      ? const Color(0xFF16A34A)
      : const Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            approved ? Icons.check_circle : Icons.schedule,
            size: 12,
            color: _color,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: _color,
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
