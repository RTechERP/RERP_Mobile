import 'package:flutter/material.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/summary_customer_model.dart';

/// Bottom sheet liệt kê toàn bộ dự án của một khách hàng.
///
/// Hiển thị mã dự án - tên dự án - PIC kèm ô tìm kiếm lọc theo
/// mã dự án, tên dự án hoặc tên PIC.
class SummaryCustomerProjectSheet extends StatefulWidget {
  const SummaryCustomerProjectSheet({
    super.key,
    required this.customerName,
    required this.customerCode,
    required this.projects,
  });

  /// Tên khách hàng.
  final String customerName;

  /// Mã khách hàng.
  final String customerCode;

  /// Danh sách dự án của khách hàng.
  final List<SummaryCustomerItem> projects;

  /// Mở bottom sheet hiển thị danh sách dự án.
  static Future<void> show(
    BuildContext context, {
    required String customerName,
    required String customerCode,
    required List<SummaryCustomerItem> projects,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SummaryCustomerProjectSheet(
        customerName: customerName,
        customerCode: customerCode,
        projects: projects,
      ),
    );
  }

  @override
  State<SummaryCustomerProjectSheet> createState() =>
      _SummaryCustomerProjectSheetState();
}

class _SummaryCustomerProjectSheetState
    extends State<SummaryCustomerProjectSheet> {
  final _searchController = TextEditingController();
  String _keyword = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Lọc danh sách dự án theo mã dự án, tên dự án hoặc PIC.
  List<SummaryCustomerItem> get _filteredProjects {
    final kw = _keyword.trim().toLowerCase();
    if (kw.isEmpty) return widget.projects;

    return widget.projects.where((item) {
      final projectCode = (item.projectCode ?? '').toLowerCase();
      final projectName = (item.projectName ?? '').toLowerCase();
      final pic = (item.pic ?? '').toLowerCase();
      return projectCode.contains(kw) ||
          projectName.contains(kw) ||
          pic.contains(kw);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final projects = _filteredProjects;
    final hasAnyProject = widget.projects.isNotEmpty;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          if (hasAnyProject) _buildSearchField(),
          if (!hasAnyProject)
            Expanded(child: _buildNoProjectNotice())
          else if (projects.isEmpty)
            Expanded(child: _buildEmpty())
          else
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: projects.length,
                itemBuilder: (context, index) =>
                    _ProjectTile(project: projects[index]),
                separatorBuilder: (_, _) => const SizedBox(height: 10),
              ),
            ),
        ],
      ),
    );
  }

  /// Header: tiêu đề, tên khách hàng và nút đóng.
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.line,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.projects.isEmpty
                      ? Icons.folder_off_outlined
                      : Icons.folder_copy_outlined,
                  color: widget.projects.isEmpty
                      ? AppColors.gray
                      : AppColors.primaryERP,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Danh sách dự án',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.enableText,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${widget.customerName}${widget.customerCode.isEmpty ? '' : ' • ${widget.customerCode}'}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.gray,
                        height: 1.2,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.projects.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryERP.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${widget.projects.length} dự án phụ trách',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryERP,
                            height: 1.2,
                          ),
                        ),
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
        ],
      ),
    );
  }

  /// Ô tìm kiếm dự án theo mã / tên / PIC.
  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _keyword = value),
        style: const TextStyle(fontSize: 14, color: AppColors.heading),
        decoration: InputDecoration(
          hintText: 'Tìm theo mã dự án, tên dự án hoặc PIC',
          hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 13),
          prefixIcon: const Icon(Icons.search, color: AppColors.gray, size: 20),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          suffixIcon: _keyword.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.gray,
                    size: 18,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _keyword = '');
                  },
                ),
          isDense: true,
          filled: true,
          fillColor: AppColors.background,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: AppColors.primaryERP,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  /// Thông báo khi khách hàng không có dự án phụ trách nào.
  Widget _buildNoProjectNotice() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.grey_bg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.folder_off_outlined,
                size: 32,
                color: AppColors.gray,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Khách hàng chưa có dự án phụ trách',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.enableText,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            const Text(
              'Dữ liệu dự án của khách hàng đang trống hoặc chưa được cập nhật.',
              style: TextStyle(fontSize: 12, color: AppColors.gray, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Trạng thái không có dự án phù hợp với từ khoá.
  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_off_rounded,
                size: 28,
                color: AppColors.primaryERP,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _keyword.isEmpty
                  ? 'Khách hàng chưa có dự án nào'
                  : 'Không tìm thấy dự án phù hợp',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.enableText,
              ),
              textAlign: TextAlign.center,
            ),
            if (_keyword.isNotEmpty) ...[
              const SizedBox(height: 6),
              const Text(
                'Thử tìm với từ khoá khác',
                style: TextStyle(fontSize: 12, color: AppColors.gray),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Thẻ hiển thị 1 dự án: mã dự án - tên dự án - PIC.
class _ProjectTile extends StatelessWidget {
  const _ProjectTile({required this.project});

  final SummaryCustomerItem project;

  @override
  Widget build(BuildContext context) {
    final projectCode = (project.projectCode ?? '').trim();
    final projectName = (project.projectName ?? '').trim();
    final pic = (project.pic ?? '').trim();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.whiteBlue,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  projectCode.isEmpty ? '-' : projectCode,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                    height: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  projectName.isEmpty ? '-' : projectName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.person_outline_rounded,
                size: 14,
                color: AppColors.gray,
              ),
              const SizedBox(width: 6),
              const Text(
                'PIC: ',
                style: TextStyle(fontSize: 12, color: AppColors.gray),
              ),
              Expanded(
                child: Text(
                  pic.isEmpty ? '-' : pic,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.enableText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
