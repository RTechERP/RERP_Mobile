import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import '../bloc/version_bloc.dart';
import '../models/version_item.dart';

/// Tab "Phiên bản" hiển thị danh sách phiên bản (GP + PO) của giải pháp.
///
/// Tự đọc SolutionBloc đang hoạt động để lấy solutionId (solution đầu tiên),
/// tránh truyền qua prop vì TabBarView swap widget dẫn tới prop lỗi thời
/// khi remount.
class VersionTab extends StatefulWidget {
  const VersionTab({
    super.key,
    required this.onVersionSelected,
    this.projectId,
  });

  /// Callback khi user tap vào một phiên bản - truyền projectId + versionId.
  final void Function(int projectId, int versionId, int projectTypeId) onVersionSelected;

  /// ID dự án (projectRequestId) - ưu tiên dùng làm projectId khi gọi API
  /// thay vì ProjectID trong response version (là id giải pháp).
  final int? projectId;

  @override
  State<VersionTab> createState() => _VersionTabState();
}

class _VersionTabState extends BaseShareState<VersionTab, VersionEvent,
    VersionState, VersionBloc> {
  VersionBloc provideBloc(BuildContext context) =>
      BlocProvider.of<VersionBloc>(context);

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<VersionBloc, VersionState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading && state.versions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.versions.isEmpty) {
          return Center(
            child: Text(
              state.message ?? 'Có lỗi xảy ra',
              style: AppStyles.contentText.copyWith(color: AppColors.red),
            ),
          );
        }

        final versions = state.versions;

        if (versions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.layers_outlined,
                  size: 80,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 12),
                Text(
                  'Chưa có phiên bản nào',
                  style:
                      AppStyles.contentText.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        // Gom nhóm theo VersionType (Phiên bản Giải pháp / Phiên bản PO),
        // giữ nguyên thứ tự xuất hiện.
        final groups = <VersionType, List<VersionItem>>{};
        for (final v in versions) {
          groups.putIfAbsent(v.type, () => []).add(v);
        }

        final children = <Widget>[];
        for (final entry in groups.entries) {
          children.add(_VersionTypeHeader(
            type: entry.key,
            count: entry.value.length,
          ));
          for (var i = 0; i < entry.value.length; i++) {
            final item = entry.value[i];
            children.add(VersionCard(
              index: i + 1,
              item: item,
              onTap: () {
                if (item.projectId != null) {
                  widget.onVersionSelected(
                    widget.projectId ?? item.projectId!,
                    item.id,
                    item.projectTypeId ?? 0,
                  );
                }
              },
            ));
            if (i < entry.value.length - 1) {
              children.add(const SizedBox(height: 12));
            }
          }
          children.add(const SizedBox(height: 16));
        }

        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: children,
        );
      },
    );
  }
}

/// Header gom nhóm theo loại phiên bản.
class _VersionTypeHeader extends StatelessWidget {
  const _VersionTypeHeader({required this.type, required this.count});

  final VersionType type;
  final int count;

  IconData get _icon {
    switch (type) {
      case VersionType.solutionVersion:
        return Icons.lightbulb_outline;
      case VersionType.poVersion:
        return Icons.receipt_long_outlined;
    }
  }

  Color get _color {
    switch (type) {
      case VersionType.solutionVersion:
        return AppColors.primaryERP;
      case VersionType.poVersion:
        return const Color(0xFF16A34A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(_icon, size: 16, color: _color),
          const SizedBox(width: 6),
          Text(
            '${type.label} ',
            style: AppStyles.body2.copyWith(
              color: _color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '($count phiên bản)',
            style: AppStyles.body2.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}

/// Card hiển thị thông tin một phiên bản.
class VersionCard extends StatelessWidget {
  const VersionCard({
    super.key,
    required this.index,
    required this.item,
    this.onTap,
  });

  final int index;
  final VersionItem item;
  final VoidCallback? onTap;

  String _formatDate(String? raw) {
    if (raw == null || raw.isEmpty) return '--';
    try {
      final d = DateTime.parse(raw);
      return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
    } catch (_) {
      return raw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                // STT + CodeNew + Menu
                Row(
                  children: [
                    _StatusPill(
                      label: '$index',
                      color: AppColors.gray,
                      background: AppColors.gray.withValues(alpha: 0.12),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item.codeNew?.isNotEmpty == true
                            ? item.codeNew!
                            : item.code,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _VersionMenuButton(item: item, formatDate: _formatDate),
                  ],
                ),
                const SizedBox(height: 10),
                // Mô tả
                if (item.description.trim().isNotEmpty &&
                    item.description.trim() != '--')
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.enableText,
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 12),
                // Người tạo + Loại dự án
                // Row(
                //   children: [
                //     Expanded(
                //       child: _InfoBlock(
                //         icon: Icons.person_outline,
                //         label: 'Người tạo',
                //         value: item.fullNameCreated,
                //       ),
                //     ),
                //     const SizedBox(width: 8),
                //     Expanded(
                //       child: _InfoBlock(
                //         icon: Icons.category_outlined,
                //         label: 'Loại',
                //         value: item.projectTypeName,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 10),
                // Trạng thái: Sử dụng - Duyệt
                Row(
                  children: [
                    Expanded(
                      child: _StatusBlock(
                        label: 'Sử dụng',
                        pill: _StatusPill(
                          label: item.usage.label,
                          color: VersionStatusColors.colorForUsage(item.usage),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatusBlock(
                        label: 'Duyệt',
                        pill: _StatusPill(
                          label: item.approval.label,
                          color: VersionStatusColors.colorForApproval(
                              item.approval),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

/// Nút 3 chấm dọc - mở bottom sheet chi tiết.
class _VersionMenuButton extends StatelessWidget {
  const _VersionMenuButton({required this.item, required this.formatDate});

  final VersionItem item;
  final String Function(String?) formatDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _VersionDetailSheet(item: item, formatDate: formatDate),
      ),
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
}

/// Bottom sheet chi tiết Version.
class _VersionDetailSheet extends StatelessWidget {
  const _VersionDetailSheet({required this.item, required this.formatDate});

  final VersionItem item;
  final String Function(String?) formatDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.codeNew?.isNotEmpty == true ? item.codeNew! : item.code,
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
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mô tả
                  if (item.description.trim().isNotEmpty &&
                      item.description.trim() != '--')
                    _DetailSection(
                      title: 'Mô tả',
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.enableText,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  _DetailRow(items: [
                    _DetailItem(
                      label: 'Sử dụng',
                      value: item.usage.label,
                      icon: Icons.toggle_on_outlined,
                      valueColor:
                          VersionStatusColors.colorForUsage(item.usage),
                    ),
                    _DetailItem(
                      label: 'Duyệt',
                      value: item.approval.label,
                      icon: Icons.check_circle_outline,
                      valueColor:
                          VersionStatusColors.colorForApproval(item.approval),
                    ),
                  ]),
                  _DetailRow(items: [
                    _DetailItem(
                      label: 'Loại',
                      value: item.projectTypeName,
                      icon: Icons.category_outlined,
                    ),
                    _DetailItem(
                      label: 'Người tạo',
                      value: item.fullNameCreated,
                      icon: Icons.person_outline,
                    ),
                  ]),
                  _DetailRow(items: [
                    _DetailItem(
                      label: 'Ngày tạo',
                      value: formatDate(item.createdDate),
                      icon: Icons.event_outlined,
                    ),
                    _DetailItem(
                      label: 'Ngày cập nhật',
                      value: formatDate(item.updatedDate),
                      icon: Icons.update_outlined,
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Section chi tiết trong bottom sheet.
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

/// Row 2 cột trong bottom sheet.
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

/// Item thông tin trong bottom sheet.
class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;

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
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColors.enableText,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Block label + status pill trong card.
class _StatusBlock extends StatelessWidget {
  const _StatusBlock({required this.label, required this.pill});

  final String label;
  final Widget pill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        pill,
      ],
    );
  }
}

/// Pill status có thể dùng cho cả STT (không có border).
class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.color,
    this.background,
  });

  final String label;
  final Color color;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final bg = background ?? color.withValues(alpha: 0.12);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: background == null
            ? Border.all(color: color.withValues(alpha: 0.3))
            : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
          height: 1.1,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
