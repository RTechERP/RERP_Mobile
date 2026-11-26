import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/model/project_list_model.dart';
import 'material_category_sheet.dart';
import 'project_status_badge.dart';

/// Card hiển thị một dự án trong danh sách.
///
/// Layout theo kiểu phiếu: phần đầu là mã + tên dự án kèm trạng thái,
/// giữa là bảng thông tin (label - value) chia dòng bằng đường kẻ mảnh,
/// cuối là dải ngày dự kiến / thực tế nền nhạt.
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final ProjectItem project;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap ?? () => _openCategories(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildFieldTable(),
              _buildTimeline(),
            ],
          ),
        ),
      ),
    );
  }

  /// Text trạng thái của dự án.
  ///
  /// Lấy theo `ProjectStatusName` (tên trạng thái).
  static String _statusText(ProjectItem item) {
    final name = item.projectStatusName?.trim();
    if (name != null && name.isNotEmpty) return name;

    return '';
  }

  /// Phần đầu: icon dự án, mã dự án, badge trạng thái và tên dự án.
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.folder_outlined,
                  size: 20,
                  color: AppColors.primaryERP,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  (project.projectCode ?? '').trim().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                    letterSpacing: 0.5,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              // Chỉ hiện badge khi API có trả về trạng thái.
              if (_statusText(project).trim().isNotEmpty)
                ProjectStatusBadge(status: _statusText(project).trim()),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            (project.projectName ?? '').trim(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.enableText,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Bảng thông tin dạng label - value, các dòng ngăn cách bằng đường kẻ.
  Widget _buildFieldTable() {
    final rows = <_FieldEntry>[
      if ((project.customerName ?? '').trim().isNotEmpty)
        _FieldEntry('Khách hàng', project.customerName!.trim()),
      if ((project.fullNameSale ?? '').trim().isNotEmpty)
        _FieldEntry('Sale', project.fullNameSale!.trim()),
      if ((project.fullNameTech ?? '').trim().isNotEmpty)
        _FieldEntry('Kỹ thuật', project.fullNameTech!.trim()),
      if ((project.fullNamePM ?? '').trim().isNotEmpty)
        _FieldEntry('PM', project.fullNamePM!.trim()),
      if ((project.currentState ?? '').trim().isNotEmpty)
        _FieldEntry('Hiện trạng', project.currentState!.trim()),
    ];

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const Divider(height: 1, color: AppColors.borderColor),
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0)
            const Divider(height: 1, color: AppColors.borderColor),
          _FieldRow(entry: rows[i]),
        ],
      ],
    );
  }

  /// Dải ngày dự kiến / thực tế nền nhạt ở chân card.
  ///
  /// Mỗi mốc ngày là một ô riêng: dự kiến bắt đầu, dự kiến kết thúc,
  /// thực tế bắt đầu, thực tế kết thúc.
  Widget _buildTimeline() {
    final entries = <_DateEntry>[
      _DateEntry(
        'Dự kiến bắt đầu',
        Icons.event_outlined,
        project.expectedPlanDate,
      ),
      _DateEntry(
        'Dự kiến kết thúc',
        Icons.event_outlined,
        project.planDateEnd,
      ),
      _DateEntry(
        'Thực tế bắt đầu',
        Icons.play_circle_outline,
        project.actualDateStart,
      ),
      _DateEntry(
        'Thực tế kết thúc',
        Icons.stop_circle_outlined,
        project.actualDateEnd,
      ),
    ].where((e) => e.hasValue).toList();

    if (entries.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
      decoration: const BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          for (var i = 0; i < entries.length; i++) ...[
            if (i > 0) const SizedBox(height: 6),
            _DateLine(entry: entries[i]),
          ],
        ],
      ),
    );
  }

  /// Mở sheet menu của dự án (danh mục vật tư + chi tiết dự án).
  void _openCategories(BuildContext context) {
    MaterialCategorySheet.show(context, project: project);
  }
}
/// Một cặp label - value trong bảng thông tin.
class _FieldEntry {
  const _FieldEntry(this.label, this.value);

  final String label;
  final String value;
}

/// Một dòng của bảng thông tin: label cố định bên trái, value bên phải.
class _FieldRow extends StatelessWidget {
  const _FieldRow({required this.entry});

  final _FieldEntry entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 84,
            child: Text(
              entry.label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                height: 1.35,
              ),
            ),
          ),
          Expanded(
            child: Text(
              entry.value,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Một mốc ngày trong card: nhãn + giá trị.
class _DateEntry {
  const _DateEntry(this.label, this.icon, this.rawDate);

  final String label;
  final IconData icon;
  final dynamic rawDate;

  /// Ngày có giá trị hay không.
  bool get hasValue {
    final str = rawDate?.toString() ?? '';
    return str.isNotEmpty && str != 'null';
  }
}

/// Dòng hiển thị một mốc ngày: icon, nhãn và ngày.
class _DateLine extends StatelessWidget {
  const _DateLine({required this.entry});

  final _DateEntry entry;

  /// Chuẩn hóa mọi kiểu dữ liệu ngày về dd/MM/yyyy, trả về null nếu rỗng.
  static String? formatDate(dynamic raw) {
    if (raw == null) return null;
    final str = raw.toString();
    if (str.isEmpty || str == 'null') return null;
    try {
      final parsed = DateTime.parse(str);
      return '${parsed.day.toString().padLeft(2, '0')}/'
          '${parsed.month.toString().padLeft(2, '0')}/${parsed.year}';
    } catch (_) {
      return str.length >= 10 ? str.substring(0, 10) : str;
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = formatDate(entry.rawDate);

    return Row(
      children: [
        Icon(entry.icon, size: 13, color: AppColors.gray),
        const SizedBox(width: 7),
        SizedBox(
          width: 108,
          child: Text(
            entry.label,
            style: const TextStyle(
              fontSize: 11.5,
              color: AppColors.gray,
              height: 1.3,
            ),
          ),
        ),
        Expanded(
          child: Text(
            date ?? '--/--/----',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: date == null ? AppColors.disableText : AppColors.enableText,
              height: 1.3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
