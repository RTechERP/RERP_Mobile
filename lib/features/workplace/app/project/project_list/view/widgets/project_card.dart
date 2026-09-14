import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/model/project_list_model.dart';
import 'material_category_sheet.dart';
import 'project_status_badge.dart';

/// Card hiển thị thông tin một project trong danh sách với style glassmorphism.
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.onTap});

  final ProjectItem project;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MaterialCategorySheet.show(
        context,
        projectCode: project.projectCode ?? '',
        projectName: project.projectName ?? '',
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.9),
                  Colors.white.withValues(alpha: 0.7),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.6),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryERP.withValues(alpha: 0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // StatusChip + Mã dự án + Menu
                  Row(
                    children: [
                      ProjectStatusBadge(
                        status: project.projectStatusName ?? '',
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          project.projectCode ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryERP,
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _MenuButton(project: project),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Tên dự án
                  Text(
                    project.projectName ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.enableText,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  // Khách hàng
                  if ((project.customerName ?? '').trim().isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.business,
                      label: 'Khách hàng',
                      value: project.customerName!,
                    ),
                    const SizedBox(height: 8),
                  ],
                  // Sale
                  if ((project.fullNameSale ?? '').trim().isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.person_outline,
                      label: 'Sale',
                      value: project.fullNameSale!,
                    ),
                    const SizedBox(height: 8),
                  ],
                  // Kỹ thuật
                  if ((project.fullNameTech ?? '').trim().isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.engineering_outlined,
                      label: 'Kỹ thuật',
                      value: project.fullNameTech!,
                    ),
                    const SizedBox(height: 8),
                  ],
                  // Dự kiến: bắt đầu - kết thúc
                  _DateRangeRow(
                    icon: Icons.event_outlined,
                    label: 'Dự kiến',
                    startDate: project.expectedPlanDate,
                    endDate: null,
                    startColor: Colors.green,
                    endColor: Colors.red,
                  ),
                  // Thực tế: bắt đầu - kết thúc (chỉ hiện khi API trả về)
                  if (_hasActualDate(project)) ...[
                    const SizedBox(height: 8),
                    _DateRangeRow(
                      icon: Icons.event_available_outlined,
                      label: 'Thực tế',
                      startDate: project.realityPlanDate,
                      endDate: null,
                      startColor: Colors.green,
                      endColor: Colors.red,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _hasActualDate(ProjectItem p) {
    return (p.realityPlanDate != null &&
            p.realityPlanDate.toString().isNotEmpty &&
            p.realityPlanDate != 'null') ||
        (p.realityProjectEndDate != null &&
            p.realityProjectEndDate.toString().isNotEmpty &&
            p.realityProjectEndDate != 'null');
  }
}

/// Nút menu 3 chấm dọc, bấm hiện bottom sheet thông tin chi tiết.
class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetailSheet(context),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: const Icon(
          Icons.more_vert,
          size: 20,
          color: AppColors.gray,
        ),
      ),
    );
  }

  void _showDetailSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProjectDetailSheet(project: project),
    );
  }
}

/// Bottom sheet hiển thị thông tin chi tiết dự án.
class _ProjectDetailSheet extends StatelessWidget {
  const _ProjectDetailSheet({required this.project});

  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    project.projectCode ?? 'Chi tiết dự án',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppColors.gray),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên dự án
                  if ((project.projectName ?? '').trim().isNotEmpty)
                    _DetailSection(
                      title: 'Tên dự án',
                      child: Text(
                        project.projectName!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.enableText,
                        ),
                      ),
                    ),
                  // Mức ưu tiên + Mức ưu tiên cá nhân
                  _DetailRow(
                    items: [
                      _DetailItem(
                        label: 'Mức ưu tiên',
                        value: _formatPriority(project.priotity),
                        icon: Icons.flag_outlined,
                      ),
                      _DetailItem(
                        label: 'Mức ưu tiên cá nhân',
                        value: _formatPersonalPriority(project.personalPriotity),
                        icon: Icons.person_pin_outlined,
                      ),
                    ],
                  ),
                  // PM
                  if ((project.fullNamePM ?? '').trim().isNotEmpty)
                    _DetailSection(
                      title: 'PM',
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryERP.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.person_outline,
                              size: 16,
                              color: AppColors.primaryERP,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            project.fullNamePM!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.enableText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Hiện trạng
                  if ((project.currentState ?? '').trim().isNotEmpty)
                    _DetailSection(
                      title: 'Hiện trạng',
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getStateColor(project.currentState!)
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          project.currentState!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: _getStateColor(project.currentState!),
                          ),
                        ),
                      ),
                    ),
                  // Row(PO - ngày PO)
                  _DetailRow(
                    items: [
                      _DetailItem(
                        label: 'PO',
                        value: project.po?.toString() ?? '--',
                        icon: Icons.receipt_outlined,
                      ),
                      _DetailItem(
                        label: 'Ngày PO',
                        value: _formatDate(project.poDate),
                        icon: Icons.calendar_month_outlined,
                      ),
                    ],
                  ),
                  // Row(Thực tế bắt đầu - kết thúc)
                  _DetailRow(
                    items: [
                      _DetailItem(
                        label: 'Thực tế bắt đầu',
                        value: _formatDate(project.realityPlanDate),
                        icon: Icons.play_circle_outline,
                      ),
                      _DetailItem(
                        label: 'Thực tế kết thúc',
                        value: _formatDate(project.realityProjectEndDate),
                        icon: Icons.stop_circle_outlined,
                      ),
                    ],
                  ),
                  // Row(Người tạo - Ngày tạo)
                  _DetailRow(
                    items: [
                      _DetailItem(
                        label: 'Người tạo',
                        value: project.createdBy ?? '--',
                        icon: Icons.person_add_outlined,
                      ),
                      _DetailItem(
                        label: 'Ngày tạo',
                        value: _formatDate(project.createdDate),
                        icon: Icons.access_time,
                      ),
                    ],
                  ),
                  // Row(Người sửa - Ngày cập nhật)
                  _DetailRow(
                    items: [
                      _DetailItem(
                        label: 'Người sửa',
                        value: project.updatedBy ?? '--',
                        icon: Icons.edit_outlined,
                      ),
                      _DetailItem(
                        label: 'Ngày cập nhật',
                        value: _formatDate(project.updatedDate),
                        icon: Icons.update,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatPriority(dynamic priority) {
    if (priority == null) return '--';
    return priority.toString();
  }

  String _formatPersonalPriority(dynamic personalPriority) {
    if (personalPriority == null) return '--';
    return personalPriority.toString();
  }

  String _formatDate(dynamic raw) {
    if (raw == null) return '--';
    final str = raw.toString();
    if (str.isEmpty || str == 'null') return '--';
    try {
      final parsed = DateTime.parse(str);
      return '${parsed.day.toString().padLeft(2, '0')}/${parsed.month.toString().padLeft(2, '0')}/${parsed.year}';
    } catch (_) {
      return str.length >= 10 ? str.substring(0, 10) : str;
    }
  }

  Color _getStateColor(String state) {
    final lower = state.toLowerCase();
    if (lower.contains('hoàn thành') || lower.contains('done') || lower.contains('complete')) {
      return Colors.green;
    }
    if (lower.contains('đang') || lower.contains('progress') || lower.contains('active')) {
      return Colors.blue;
    }
    if (lower.contains('tạm') || lower.contains('pause') || lower.contains('hold')) {
      return Colors.orange;
    }
    if (lower.contains('hủy') || lower.contains('cancel') || lower.contains('deleted')) {
      return Colors.red;
    }
    return AppColors.gray;
  }
}

/// Section hiển thị một nhóm thông tin.
class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          child,
        ],
      ),
    );
  }
}

/// Row chứa 2 item cạnh nhau.
class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.items});

  final List<_DetailItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) => Expanded(child: item)).toList(),
      ),
    );
  }
}

/// Một item hiển thị label + value.
class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: AppColors.gray),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.enableText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

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
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Hiển thị một khoảng ngày với màu riêng cho ngày bắt đầu/kết thúc.
class _DateRangeRow extends StatelessWidget {
  const _DateRangeRow({
    required this.icon,
    required this.label,
    required this.startDate,
    required this.endDate,
    required this.startColor,
    required this.endColor,
  });

  final IconData icon;
  final String label;
  final dynamic startDate;
  final dynamic endDate;
  final Color startColor;
  final Color endColor;

  String _formatDate(dynamic raw) {
    if (raw == null) return '--/--/--';
    final str = raw.toString();
    if (str.isEmpty || str == 'null') return '--/--/--';
    try {
      final parsed = DateTime.parse(str);
      return '${parsed.day.toString().padLeft(2, '0')}/${parsed.month.toString().padLeft(2, '0')}/${parsed.year}';
    } catch (_) {
      return str.length >= 10 ? str.substring(0, 10) : str;
    }
  }

  @override
  Widget build(BuildContext context) {
    final startStr = _formatDate(startDate);
    final endStr = _formatDate(endDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
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
        Text(
          startStr,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: startStr == '--/--/--' ? AppColors.gray : startColor,
            height: 1.2,
          ),
        ),
        const Text(
          ' - ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
          ),
        ),
        Text(
          endStr,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: endStr == '--/--/--' ? AppColors.gray : endColor,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
