import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/model/project_list_model.dart';
import 'project_status_badge.dart';

/// Bottom sheet hiển thị thông tin chi tiết dự án.
///
/// Sheet chiếm gần hết chiều cao màn hình và có thể kéo giãn, hiển thị
/// đầy đủ các nhóm thông tin của dự án.
///
/// Gọi [ProjectDetailSheet.show] để mở sheet cho một [ProjectItem].
class ProjectDetailSheet extends StatelessWidget {
  const ProjectDetailSheet({super.key, required this.project});

  final ProjectItem project;

  /// Mở bottom sheet chi tiết dự án.
  static Future<void> show(BuildContext context, {required ProjectItem project}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ProjectDetailSheet(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final projectName = (project.projectName ?? '').trim();
    final projectCode = (project.projectCode ?? '').trim();

    return DraggableScrollableSheet(
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.96,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              _buildHandle(),
              _buildHeader(context, projectCode, projectName),
              const Divider(height: 1, color: AppColors.borderColor),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    16 + media.padding.bottom,
                  ),
                  children: _buildSections(),
                ),
              ),
            ],
          ),
        );
      },
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

  /// Thanh kéo ở đầu bottom sheet.
  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 44,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.gray.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  /// Header: icon dự án, nhãn, mã và tên dự án.
  Widget _buildHeader(
    BuildContext context,
    String projectCode,
    String projectName,
  ) {
    final status = _statusText(project);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.folder_open_outlined,
              color: AppColors.primaryERP,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CHI TIẾT DỰ ÁN',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gray,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        projectCode.isEmpty
                            ? 'Dự án'
                            : projectCode.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                          letterSpacing: 0.4,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (status.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      ProjectStatusBadge(status: status),
                    ],
                  ],
                ),
                if (projectName.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    projectName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.gray,
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: AppColors.gray, size: 20),
          ),
        ],
      ),
    );
  }

  /// Các nhóm thông tin của sheet, bỏ qua nhóm không có dữ liệu.
  List<Widget> _buildSections() {
    return [
      _buildCustomerSection(),
      _buildPersonnelSection(),
      _buildInfoSection(),
      _buildStateSection(),
      _buildDateSection(),
      _buildContactSection(),
      _buildNoteSection(),
      _buildAuditSection(),
    ].where((s) => s != const SizedBox.shrink()).toList();
  }

  /// Nhóm khách hàng.
  Widget _buildCustomerSection() {
    final customerName = (project.customerName ?? '').trim();
    final customerCode = (project.customerCode ?? '').trim();
    if (customerName.isEmpty && customerCode.isEmpty) {
      return const SizedBox.shrink();
    }

    return _Section(
      title: 'Khách hàng',
      children: [
        _InfoGrid(
          items: [
            _DetailItem(
              label: 'Tên khách hàng',
              value: _formatValue(project.customerName),
              icon: Icons.business_outlined,
            ),
            _DetailItem(
              label: 'Mã khách hàng',
              value: _formatValue(project.customerCode),
              icon: Icons.badge_outlined,
            ),
          ],
        ),
      ],
    );
  }

  /// Nhóm nhân sự phụ trách: sale, kỹ thuật, PM, end user.
  Widget _buildPersonnelSection() {
    final sale = (project.fullNameSale ?? '').trim();
    final tech = (project.fullNameTech ?? '').trim();
    final pm = (project.fullNamePM ?? '').trim();
    final endUser = (project.endUserName ?? '').trim();

    if (sale.isEmpty && tech.isEmpty && pm.isEmpty && endUser.isEmpty) {
      return const SizedBox.shrink();
    }

    return _Section(
      title: 'Nhân sự phụ trách',
      children: [
        _InfoGrid(
          items: [
            if (sale.isNotEmpty)
              _DetailItem(
                label: 'Sale',
                value: sale,
                icon: Icons.support_agent,
              ),
            if (tech.isNotEmpty)
              _DetailItem(
                label: 'Kỹ thuật',
                value: tech,
                icon: Icons.engineering_outlined,
              ),
            if (pm.isNotEmpty)
              _DetailItem(
                label: 'PM',
                value: pm,
                icon: Icons.person_outline,
              ),
            if (endUser.isNotEmpty)
              _DetailItem(
                label: 'End user',
                value: endUser,
                icon: Icons.groups_outlined,
              ),
          ],
        ),
      ],
    );
  }

  /// Nhóm thông tin chung: ưu tiên, PO, loại dự án.
  Widget _buildInfoSection() {
    final priority = _formatPriority(project.priotity);
    final personalPriority = _formatPriority(project.personalPriotity);
    final po = _formatValue(project.po);
    final poDate = _formatDate(project.poDate);

    final hasPriority = priority != '--' || personalPriority != '--';
    final hasPo = po != '--' || poDate != '--';

    if (!hasPriority && !hasPo) return const SizedBox.shrink();

    return _Section(
      title: 'Thông tin dự án',
      children: [
        if (hasPriority)
          _InfoGrid(
            items: [
              _DetailItem(
                label: 'Mức ưu tiên',
                value: priority,
                icon: Icons.flag_outlined,
              ),
              _DetailItem(
                label: 'Ưu tiên cá nhân',
                value: personalPriority,
                icon: Icons.person_pin_outlined,
              ),
            ],
          ),
        if (hasPo)
          _InfoGrid(
            items: [
              _DetailItem(
                label: 'PO',
                value: po,
                icon: Icons.receipt_outlined,
              ),
              _DetailItem(
                label: 'Ngày PO',
                value: poDate,
                icon: Icons.calendar_month_outlined,
              ),
            ],
          ),
      ],
    );
  }

  /// Nhóm hiện trạng dự án.
  Widget _buildStateSection() {
    final state = (project.currentState ?? '').trim();
    if (state.isEmpty) return const SizedBox.shrink();

    final color = _stateColor(state);

    return _Section(
      title: 'Hiện trạng',
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.22)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  state,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: color,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Nhóm thời gian: 4 ô riêng cho dự kiến bắt đầu/kết thúc và
  /// thực tế bắt đầu/kết thúc.
  Widget _buildDateSection() {
    final planStart = _formatDate(project.expectedPlanDate);
    final planEnd = _formatDate(project.planDateEnd);
    final actualStart = _formatDate(project.actualDateStart);
    final actualEnd = _formatDate(project.actualDateEnd);

    if (planStart == '--' &&
        planEnd == '--' &&
        actualStart == '--' &&
        actualEnd == '--') {
      return const SizedBox.shrink();
    }

    return _Section(
      title: 'Thời gian',
      children: [
        _InfoGrid(
          items: [
            _DetailItem(
              label: 'Dự kiến bắt đầu',
              value: planStart,
              icon: Icons.event_outlined,
            ),
            _DetailItem(
              label: 'Dự kiến kết thúc',
              value: planEnd,
              icon: Icons.event_outlined,
            ),
            _DetailItem(
              label: 'Thực tế bắt đầu',
              value: actualStart,
              icon: Icons.play_circle_outline,
            ),
            _DetailItem(
              label: 'Thực tế kết thúc',
              value: actualEnd,
              icon: Icons.stop_circle_outlined,
            ),
          ],
        ),
      ],
    );
  }

  /// Nhóm thông tin liên hệ.
  Widget _buildContactSection() {
    final name = _formatValue(project.contactName);
    final phone = _formatValue(project.contactPhone);
    final email = _formatValue(project.contactEmail);

    if (name == '--' && phone == '--' && email == '--') {
      return const SizedBox.shrink();
    }

    return _Section(
      title: 'Liên hệ',
      children: [
        _InfoGrid(
          items: [
            _DetailItem(
              label: 'Người liên hệ',
              value: name,
              icon: Icons.person_outlined,
            ),
            _DetailItem(
              label: 'Số điện thoại',
              value: phone,
              icon: Icons.phone_outlined,
            ),
            _DetailItem(
              label: 'Email',
              value: email,
              icon: Icons.mail_outline,
            ),
          ],
        ),
      ],
    );
  }

  /// Nhóm mô tả dự án.
  Widget _buildNoteSection() {
    final note = (project.note ?? '').trim();
    if (note.isEmpty) return const SizedBox.shrink();

    return _Section(
      title: 'Mô tả',
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Text(
            note,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.enableText,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }

  /// Nhóm thông tin người tạo / người sửa.
  Widget _buildAuditSection() {
    final createdBy = _formatValue(project.createdBy);
    final createdDate = _formatDate(project.createdDate);
    final updatedBy = _formatValue(project.updatedBy);
    final updatedDate = _formatDate(project.updatedDate);

    if (createdBy == '--' &&
        createdDate == '--' &&
        updatedBy == '--' &&
        updatedDate == '--') {
      return const SizedBox.shrink();
    }

    return _Section(
      title: 'Thông tin quản lý',
      children: [
        _InfoGrid(
          items: [
            _DetailItem(
              label: 'Người tạo',
              value: createdBy,
              icon: Icons.person_add_outlined,
            ),
            _DetailItem(
              label: 'Ngày tạo',
              value: createdDate,
              icon: Icons.access_time,
            ),
            _DetailItem(
              label: 'Người sửa',
              value: updatedBy,
              icon: Icons.edit_outlined,
            ),
            _DetailItem(
              label: 'Ngày cập nhật',
              value: updatedDate,
              icon: Icons.update,
            ),
          ],
        ),
      ],
    );
  }

  /// Chuẩn hóa giá trị hiển thị, trả về '--' nếu rỗng.
  String _formatValue(dynamic value) {
    if (value == null) return '--';
    final str = value.toString().trim();
    if (str.isEmpty || str == 'null') return '--';
    return str;
  }

  /// Chuẩn hóa mức ưu tiên để hiển thị.
  ///
  /// API trả điểm số (`Priotity`: 0.68, 1.5, 4.48...) — giữ nguyên giá trị
  /// API trả về, không làm tròn.
  String _formatPriority(dynamic value) {
    if (value == null) return '--';
    if (value is num) {
      if (value <= 0) return '--';
      return value.toString();
    }
    final str = value.toString().trim();
    if (str.isEmpty || str == 'null') return '--';
    return str;
  }

  /// Chuẩn hóa ngày về dd/MM/yyyy, trả về '--' nếu không có.
  String _formatDate(dynamic raw) {
    if (raw == null) return '--';
    final str = raw.toString();
    if (str.isEmpty || str == 'null') return '--';
    try {
      final parsed = DateTime.parse(str);
      return '${parsed.day.toString().padLeft(2, '0')}/'
          '${parsed.month.toString().padLeft(2, '0')}/${parsed.year}';
    } catch (_) {
      return str.length >= 10 ? str.substring(0, 10) : str;
    }
  }

  /// Màu hiển thị cho hiện trạng dự án.
  Color _stateColor(String state) {
    final lower = state.toLowerCase();
    if (lower.contains('hoàn thành') ||
        lower.contains('done') ||
        lower.contains('complete')) {
      return AppColors.greenA500;
    }
    if (lower.contains('đang') ||
        lower.contains('progress') ||
        lower.contains('active')) {
      return AppColors.blueA500;
    }
    if (lower.contains('tạm') ||
        lower.contains('pause') ||
        lower.contains('hold')) {
      return AppColors.orangeA500;
    }
    if (lower.contains('hủy') || lower.contains('cancel')) {
      return AppColors.redA500;
    }
    return AppColors.gray;
  }
}

/// Một nhóm thông tin: tiêu đề + nội dung.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

/// Lưới 2 cột chứa các ô thông tin.
class _InfoGrid extends StatelessWidget {
  const _InfoGrid({required this.items});

  final List<_DetailItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < items.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: items[i]),
                const SizedBox(width: 10),
                Expanded(
                  child: i + 1 < items.length ? items[i + 1] : const SizedBox(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Một ô chi tiết gồm icon, label và value.
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
    final hasValue = value != '--';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: AppColors.gray),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: hasValue ? AppColors.enableText : AppColors.disableText,
              height: 1.25,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
