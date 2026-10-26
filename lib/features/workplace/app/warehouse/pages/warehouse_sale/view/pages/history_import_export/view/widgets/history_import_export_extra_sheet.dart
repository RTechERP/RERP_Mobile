import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

/// Một mục trong sheet thông tin bổ sung.
class HistoryExtraEntry {
  const HistoryExtraEntry({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;

  /// Giá trị hiển thị; null/rỗng sẽ hiện `--`.
  final String? value;
}

/// Bottom sheet "Thông tin bổ sung" của card lịch sử nhập/xuất.
///
/// Mỗi mục là một dòng icon + nhãn + giá trị hiển thị đầy đủ (xuống dòng khi
/// dài, cho phép chọn để sao chép) thay vì cắt ngắn như trên card.
class HistoryImportExportExtraSheet extends StatelessWidget {
  const HistoryImportExportExtraSheet({
    super.key,
    required this.billCode,
    required this.accent,
    required this.entries,
  });

  /// Số phiếu hiển thị ở tiêu đề.
  final String billCode;

  /// Màu nhận diện loại phiếu (nhập/xuất).
  final Color accent;

  final List<HistoryExtraEntry> entries;

  /// Mở sheet; chiều cao tự co theo nội dung, cuộn khi vượt 85% màn hình.
  static Future<void> show(
    BuildContext context, {
    required String billCode,
    required Color accent,
    required List<HistoryExtraEntry> entries,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      builder: (_) => HistoryImportExportExtraSheet(
        billCode: billCode,
        accent: accent,
        entries: entries,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _Header(billCode: billCode, accent: accent),
            const Divider(height: 1, color: AppColors.borderColor),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                itemCount: entries.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, color: AppColors.borderColor),
                itemBuilder: (_, index) =>
                    _EntryTile(entry: entries[index], accent: accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tiêu đề sheet: icon, "Thông tin bổ sung", số phiếu và nút đóng.
class _Header extends StatelessWidget {
  const _Header({required this.billCode, required this.accent});

  final String billCode;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.info_outline, size: 22, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Thông tin bổ sung',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  billCode,
                  style: const TextStyle(fontSize: 12, color: AppColors.gray),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.gray),
            tooltip: 'Đóng',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

/// Một dòng: icon tròn nền nhạt, nhãn nhỏ phía trên, giá trị đầy đủ bên dưới.
class _EntryTile extends StatelessWidget {
  const _EntryTile({required this.entry, required this.accent});

  final HistoryExtraEntry entry;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final text = (entry.value ?? '').trim();
    final hasValue = text.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(entry.icon, size: 16, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 3),
                SelectableText(
                  hasValue ? text : '--',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                    color: hasValue ? AppColors.enableText : AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
