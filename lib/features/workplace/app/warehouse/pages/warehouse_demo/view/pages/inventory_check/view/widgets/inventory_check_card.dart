import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/widgets/form/form_left_border_card.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/widgets/inventory_check_status_chip.dart';

/// Card hiển thị một đợt kiểm kê.
///
/// Bố cục: mã đợt + tên đợt → chip trạng thái → kho → người kiểm kê → ngày
/// kiểm kê → số sản phẩm → ghi chú.
class InventoryCheckCard extends StatelessWidget {
  const InventoryCheckCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final InventoryCountItem item;

  /// Bấm vào card → mở màn chỉnh sửa đợt kiểm kê.
  final VoidCallback? onTap;

  /// Màu nhận diện: xanh khi đã hoàn thành, cam khi đang kiểm kê.
  Color get _accent => (item.isComplete ?? false)
      ? AppColors.stateSuccessColor
      : AppColors.stateWarningColor;

  @override
  Widget build(BuildContext context) {
    // Bóng đổ nằm ngoài để FormLeftBorderCard giữ nguyên viền trái + bo góc.
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: FormLeftBorderCard(
        borderColor: _accent,
        backgroundColor: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeaderRow(item: item, accent: _accent),
              const SizedBox(height: 10),
              const Divider(height: 1, color: AppColors.borderColor),
              const SizedBox(height: 10),
              _WarehouseRow(warehouseName: item.warehouseName),
              const SizedBox(height: 8),
              _EmployeeRow(
                employeeName: item.employeeName,
                employeeCode: item.employeeCode,
              ),
              const SizedBox(height: 8),
              _DateRow(dateCount: item.dateCount),
              const SizedBox(height: 10),
              _TotalItemsStrip(totalItems: item.totalItems, accent: _accent),
              if ((item.note ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 10),
                _NoteRow(note: item.note!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Dòng đầu card: mã đợt, tên đợt và chip trạng thái.
class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.item, required this.accent});

  final InventoryCountItem item;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (item.code ?? '').trim().isEmpty ? '--' : item.code!.trim(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Text(
                (item.name ?? '').trim().isEmpty ? '--' : item.name!.trim(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.enableText,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InventoryCheckStatusChip(isComplete: item.isComplete ?? false),
      ],
    );
  }
}

/// Dòng kho: icon + tên kho.
class _WarehouseRow extends StatelessWidget {
  const _WarehouseRow({required this.warehouseName});

  final String? warehouseName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.warehouse_outlined, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Kho: ',
                  style: TextStyle(color: AppColors.gray),
                ),
                TextSpan(
                  text: (warehouseName ?? '').trim().isEmpty
                      ? '--'
                      : warehouseName!.trim(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            style: const TextStyle(fontSize: 12, height: 1.2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Dòng người kiểm kê: icon + họ tên + mã nhân viên.
class _EmployeeRow extends StatelessWidget {
  const _EmployeeRow({required this.employeeName, required this.employeeCode});

  final String? employeeName;
  final String? employeeCode;

  @override
  Widget build(BuildContext context) {
    final name = (employeeName ?? '').trim();
    final code = (employeeCode ?? '').trim();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.person_outline, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Người kiểm kê: ',
                  style: TextStyle(color: AppColors.gray),
                ),
                TextSpan(
                  text: name.isEmpty ? '--' : name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                ),
                if (code.isNotEmpty)
                  TextSpan(
                    text: ' ($code)',
                    style: const TextStyle(color: AppColors.gray),
                  ),
              ],
            ),
            style: const TextStyle(fontSize: 12, height: 1.2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Dòng ngày kiểm kê: icon + ngày giờ định dạng `dd/MM/yyyy HH:mm`.
class _DateRow extends StatelessWidget {
  const _DateRow({required this.dateCount});

  final String? dateCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.event_outlined, size: 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Ngày: ',
                  style: TextStyle(color: AppColors.gray),
                ),
                TextSpan(
                  text: _formatDate(dateCount),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
            style: const TextStyle(fontSize: 12, height: 1.2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Format ISO `yyyy-MM-ddTHH:mm:ss` sang `dd/MM/yyyy HH:mm`; `--` nếu
  /// rỗng hoặc sai định dạng.
  static String _formatDate(String? raw) {
    final date = DateTime.tryParse(raw ?? '');
    if (date == null) return '--';
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }
}

/// Dải nền hiển thị tổng số sản phẩm đã kiểm kê.
class _TotalItemsStrip extends StatelessWidget {
  const _TotalItemsStrip({required this.totalItems, required this.accent});

  final int? totalItems;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final count = totalItems ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey_bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.inventory_2_outlined,
            size: 16,
            color: AppColors.gray,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Số sản phẩm',
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: AppColors.enableText,
              ),
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dòng ghi chú của đợt kiểm kê.
class _NoteRow extends StatelessWidget {
  const _NoteRow({required this.note});

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.orangeA100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.notes_outlined,
            size: 14,
            color: AppColors.secondaryERP,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              note.trim(),
              style: const TextStyle(
                fontSize: 12,
                height: 1.3,
                color: AppColors.enableText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
