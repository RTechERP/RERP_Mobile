import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_sale/view/pages/sale_gdn/data/datasource/models/sale_gdn_model.dart';

/// Card hiển thị một dòng chi tiết sản phẩm trong phiếu xuất kho.
class SaleGdnDetailItemCard extends StatelessWidget {
  const SaleGdnDetailItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.localImagePaths,
    required this.serverImages,
    required this.onAddImages,
    required this.onTapImage,
    required this.onBulkDeleteImages,
    required this.pendingDeletedFileIds,
    required this.pendingDeletedLocalPaths,
  });

  final ViewGDNDetailResponse item;
  final int index;
  final List<String> localImagePaths;

  /// Ảnh server: `url` dùng để load, `fileId` dùng để mark xoá.
  final List<({String url, int? fileId})> serverImages;

  /// Callback mở flow chọn ảnh (camera/gallery) cho dòng này.
  final Future<void> Function() onAddImages;

  /// Tap 1 thumbnail ảnh để mở fullscreen viewer.
  /// `isLocal=true` nếu là ảnh local, ngược lại là ảnh server.
  final void Function(int imageIndex, bool isLocal) onTapImage;

  /// Mở bottomSheet chọn nhiều ảnh (server + local) của dòng này để xoá.
  /// Callback này được gọi từ nút thùng rác trên fullscreen viewer.
  /// Screen sẽ hiển thị dialog confirm trước khi submit.
  final void Function() onBulkDeleteImages;

  /// Set `fileId` (server) đã được đánh dấu xoá (chưa submit).
  final Set<int> pendingDeletedFileIds;

  /// Set `localPath` đã được đánh dấu xoá (chưa submit).
  final Set<String> pendingDeletedLocalPaths;

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
          // Header: STT + Tên sản phẩm + icon info
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
              // Icon info — bấm vào hiển thị dialog thông tin chi tiết.
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _showInfoDialog(context, item),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryERP.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.info_outline,
                    size: 18,
                    color: AppColors.primaryERP,
                  ),
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
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          // Khu vực ảnh (server + local)
          _PhotoSection(
            localPaths: localImagePaths,
            serverImages: serverImages,
            onAdd: onAddImages,
            onTapImage: (imageIndex, isLocal) =>
                _onTapThumb(context, imageIndex, isLocal),
            pendingDeletedFileIds: pendingDeletedFileIds,
            pendingDeletedLocalPaths: pendingDeletedLocalPaths,
          ),
        ],
      ),
    );
  }

  String _formatNumber(double? v) {
    if (v == null) return '--';
    return _toDecimal2(v);
  }

  String _formatCurrency(double? v) {
    if (v == null) return '--';
    final formatted = v.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
        );
    return '$formatted đ';
  }

  /// Chuẩn hoá số lượng → chuỗi với đúng 2 chữ số thập phân.
  /// Ví dụ: 1.0 -> "1.00", 1.234 -> "1.23", 1000 -> "1000.00".
  String _toDecimal2(double v) => v.toStringAsFixed(2);

  /// Hiển thị dialog thông tin chi tiết của sản phẩm trong dòng phiếu xuất.
  void _showInfoDialog(BuildContext context, ViewGDNDetailResponse item) {
    showDialog<void>(
      context: context,
      builder: (_) => _GdnItemInfoDialog(item: item),
    );
  }

  /// Tap 1 thumbnail → mở fullscreen viewer (kèm nút thùng rác góc phải).
  void _onTapThumb(
    BuildContext context,
    int imageIndex,
    bool isLocal,
  ) {
    final List<String> paths;
    if (isLocal) {
      paths = localImagePaths;
    } else {
      paths = serverImages.map((e) => e.url).toList();
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => _FullScreenImageViewer(
          imagePaths: paths,
          initialIndex: imageIndex,
          isLocal: isLocal,
          // Icon thùng rác trên viewer: bấm sẽ pop viewer rồi mở
          // bottomSheet chọn nhiều ảnh của dòng (server + local).
          onRequestBulkDelete: () {
            Navigator.of(context).pop();
            onBulkDeleteImages();
          },
        ),
      ),
    );
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
    required this.localPaths,
    required this.serverImages,
    required this.onAdd,
    required this.onTapImage,
    required this.pendingDeletedFileIds,
    required this.pendingDeletedLocalPaths,
  });

  final List<String> localPaths;

  /// Ảnh server: `url` dùng để load, `fileId` dùng để mark xoá.
  final List<({String url, int? fileId})> serverImages;

  final Future<void> Function() onAdd;

  /// Tap 1 thumbnail ảnh (server hoặc local) → mở fullscreen viewer.
  final void Function(int imageIndex, bool isLocal) onTapImage;

  /// Set `fileId` (server) đã được đánh dấu xoá.
  final Set<int> pendingDeletedFileIds;

  /// Set `localPath` đã được đánh dấu xoá.
  final Set<String> pendingDeletedLocalPaths;

  @override
  Widget build(BuildContext context) {
    final hasImages = localPaths.isNotEmpty || serverImages.isNotEmpty;

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
              if (!hasImages)
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
        // Server images
        for (int i = 0; i < serverImages.length; i++)
          _ServerPhotoThumb(
            image: serverImages[i],
            isMarkedDeleted: pendingDeletedFileIds.contains(
              serverImages[i].fileId ?? -1,
            ),
            onTap: () => onTapImage(i, false),
          ),
        // Local images
        for (int i = 0; i < localPaths.length; i++)
          _LocalPhotoThumb(
            path: localPaths[i],
            isMarkedDeleted: pendingDeletedLocalPaths.contains(localPaths[i]),
            onTap: () => onTapImage(i, true),
          ),
        _AddPhotoButton(onTap: onAdd),
      ],
    );
  }

  Widget _buildCount() {
    final total = localPaths.length + serverImages.length;
    return Text(
      '$total ảnh',
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

class _LocalPhotoThumb extends StatelessWidget {
  const _LocalPhotoThumb({
    required this.path,
    required this.isMarkedDeleted,
    required this.onTap,
  });

  final String path;
  final bool isMarkedDeleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.file(
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
            if (isMarkedDeleted) const _MarkedDeletedOverlay(),
          ],
        ),
      ),
    );
  }
}

class _ServerPhotoThumb extends StatelessWidget {
  const _ServerPhotoThumb({
    required this.image,
    required this.isMarkedDeleted,
    required this.onTap,
  });

  final ({String url, int? fileId}) image;
  final bool isMarkedDeleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              image.url,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 64,
                  height: 64,
                  color: AppColors.gray.withValues(alpha: 0.1),
                  child: const Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              },
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
            if (isMarkedDeleted) const _MarkedDeletedOverlay(),
          ],
        ),
      ),
    );
  }
}

/// Overlay đánh dấu ảnh đã được lên lịch xoá
/// (chưa submit → hiển thị dấu X + nhãn "Đã xoá").
class _MarkedDeletedOverlay extends StatelessWidget {
  const _MarkedDeletedOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      color: Colors.black.withValues(alpha: 0.55),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_outline, color: Colors.white, size: 20),
          SizedBox(height: 2),
          Text(
            'Đã xoá',
            style: TextStyle(
              fontSize: 9,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dialog thông tin chi tiết của sản phẩm trong dòng phiếu xuất
// ---------------------------------------------------------------------------

class _GdnItemInfoDialog extends StatelessWidget {
  const _GdnItemInfoDialog({required this.item});

  final ViewGDNDetailResponse item;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          maxWidth: 480,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            const Divider(height: 1),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoSectionTitle('Thông tin sản phẩm'),
                    const SizedBox(height: 8),
                    _InfoRow(
                      label: 'Mã sản phẩm',
                      value: item.productCode,
                    ),
                    _InfoRow(
                      label: 'Mã nội bộ',
                      value: item.productNewCode,
                    ),
                    _InfoRow(
                      label: 'SL tồn',
                      value: _formatQty(item.totalInventory),
                    ),
                    _InfoRow(
                      label: 'Số lượng',
                      value: _formatQty(item.qty),
                    ),
                    const SizedBox(height: 12),
                    _InfoSectionTitle('Ghi chú & đơn hàng'),
                    const SizedBox(height: 8),
                    _InfoRow(
                      label: 'Ghi chú',
                      value: item.note,
                      multiline: true,
                    ),
                    _InfoRow(
                      label: 'Mã đơn hàng',
                      value: item.billCode,
                    ),
                    const SizedBox(height: 12),
                    _InfoSectionTitle('Thông số & phân loại'),
                    const SizedBox(height: 8),
                    _InfoRow(
                      label: 'Loại sản phẩm',
                      value: item.productTypeText,
                    ),
                    _InfoRow(
                      label: 'Nhóm',
                      value: item.productGroupName,
                    ),
                    _InfoRow(
                      label: 'Đơn vị',
                      value: item.unit,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.info_outline,
              color: AppColors.primaryERP,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thông tin sản phẩm',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.productName ?? '--',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.gray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close, size: 20),
            tooltip: 'Đóng',
          ),
        ],
      ),
    );
  }

  String _formatQty(double? v) {
    if (v == null) return '--';
    return v.toStringAsFixed(2);
  }
}

class _InfoSectionTitle extends StatelessWidget {
  const _InfoSectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryERP,
        letterSpacing: 0.2,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.multiline = false,
  });

  final String label;
  final String? value;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.trim().isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hasValue ? value! : '--',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: hasValue
                    ? AppColors.enableText
                    : AppColors.gray.withValues(alpha: 0.7),
                height: 1.4,
              ),
              maxLines: multiline ? null : 2,
              overflow: multiline ? null : TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Full-screen image viewer widget
// ---------------------------------------------------------------------------

class _FullScreenImageViewer extends StatefulWidget {
  const _FullScreenImageViewer({
    required this.imagePaths,
    required this.initialIndex,
    required this.isLocal,
    this.onRequestBulkDelete,
  });

  final List<String> imagePaths;
  final int initialIndex;
  final bool isLocal;

  /// Callback khi user bấm nút thùng rác trên AppBar.
  /// Viewer không tự xoá - mà thông báo cho cha để mở bottomSheet chọn nhiều.
  final VoidCallback? onRequestBulkDelete;

  @override
  State<_FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<_FullScreenImageViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '${_currentIndex + 1} / ${widget.imagePaths.length}',
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          if (widget.onRequestBulkDelete != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Xoá ảnh',
              onPressed: widget.onRequestBulkDelete,
            ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.imagePaths.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final path = widget.imagePaths[index];
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: widget.isLocal
                  ? Image.file(
                      File(path),
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) => _errorPlaceholder(),
                    )
                  : Image.network(
                      path,
                      fit: BoxFit.contain,
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (_, _, _) => _errorPlaceholder(),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _errorPlaceholder() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.broken_image_outlined, color: Colors.white54, size: 64),
          SizedBox(height: 16),
          Text(
            'Không thể tải ảnh',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom sheet chọn nhiều ảnh để xoá
// ---------------------------------------------------------------------------

/// Item đại diện cho 1 ảnh trong bottom sheet.
class _BulkDeleteItem {
  const _BulkDeleteItem({
    required this.id,
    required this.previewUrl,
    required this.isLocal,
    this.fileId,
    this.localPath,
  });

  /// Key duy nhất: fileId cho ảnh server, localPath cho ảnh local.
  final String id;
  final String previewUrl;
  final bool isLocal;
  final int? fileId;
  final String? localPath;
}

/// Hiển thị bottom sheet cho phép user chọn 1 hoặc nhiều ảnh (server + local)
/// rồi trả về danh sách đã chọn qua `Navigator.pop`.
///
/// Trả về `null` nếu user đóng sheet mà không bấm xoá.
Future<({Set<int> fileIds, Set<String> localPaths})?>
    showSaleGdnBulkDeleteImageSheet({
  required BuildContext context,
  required List<({String url, int? fileId})> serverImages,
  required List<String> localImagePaths,
}) async {
  final items = <_BulkDeleteItem>[
    for (final s in serverImages)
      if ((s.fileId ?? 0) > 0)
        _BulkDeleteItem(
          id: 'srv_${s.fileId}',
          previewUrl: s.url,
          isLocal: false,
          fileId: s.fileId,
        ),
    for (final p in localImagePaths)
      _BulkDeleteItem(
        id: 'loc_${p.hashCode}',
        previewUrl: p,
        isLocal: true,
        localPath: p,
      ),
  ];

  if (items.isEmpty) return null;

  return showModalBottomSheet<({Set<int> fileIds, Set<String> localPaths})>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) => _BulkDeleteImageSheet(items: items),
  );
}

class _BulkDeleteImageSheet extends StatefulWidget {
  const _BulkDeleteImageSheet({required this.items});

  final List<_BulkDeleteItem> items;

  @override
  State<_BulkDeleteImageSheet> createState() => _BulkDeleteImageSheetState();
}

class _BulkDeleteImageSheetState extends State<_BulkDeleteImageSheet> {
  final Set<String> _selectedIds = <String>{};

  bool get _hasSelection => _selectedIds.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Chọn ảnh cần xoá',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (_hasSelection)
                  TextButton(
                    onPressed: () => setState(() => _selectedIds.clear()),
                    child: const Text('Bỏ chọn'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _hasSelection
                  ? 'Đã chọn ${_selectedIds.length}/${widget.items.length} ảnh'
                  : 'Có thể chọn nhiều ảnh',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
              ),
            ),
            const SizedBox(height: 12),
            // Grid ảnh
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (ctx, i) {
                  final item = widget.items[i];
                  final selected = _selectedIds.contains(item.id);
                  return GestureDetector(
                    onTap: () => setState(() {
                      if (selected) {
                        _selectedIds.remove(item.id);
                      } else {
                        _selectedIds.add(item.id);
                      }
                    }),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: item.isLocal
                              ? Image.file(
                                  File(item.previewUrl),
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) =>
                                      _brokenThumb(),
                                )
                              : Image.network(
                                  item.previewUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) =>
                                      _brokenThumb(),
                                ),
                        ),
                        // Selected overlay
                        if (selected)
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Colors.red.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        // Checkbox
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Icon(
                              selected
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              size: 22,
                              color: selected
                                  ? Colors.red
                                  : Colors.black54,
                            ),
                          ),
                        ),
                        if (item.isLocal)
                          Positioned(
                            left: 6,
                            bottom: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    Colors.black.withValues(alpha: 0.55),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Local',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Huỷ'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _hasSelection
                        ? () {
                            final fileIds = <int>{};
                            final localPaths = <String>{};
                            for (final item in widget.items) {
                              if (!_selectedIds.contains(item.id)) continue;
                              if (item.fileId != null) {
                                fileIds.add(item.fileId!);
                              } else if (item.localPath != null) {
                                localPaths.add(item.localPath!);
                              }
                            }
                            Navigator.of(context).pop((
                              fileIds: fileIds,
                              localPaths: localPaths,
                            ));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      disabledBackgroundColor:
                          Colors.red.withValues(alpha: 0.4),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: Text(
                      _hasSelection
                          ? 'Xoá (${_selectedIds.length})'
                          : 'Xoá',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _brokenThumb() {
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: const Icon(
        Icons.broken_image_outlined,
        color: Colors.black38,
        size: 32,
      ),
    );
  }
}