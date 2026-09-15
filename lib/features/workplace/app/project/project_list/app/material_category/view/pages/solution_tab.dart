import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import '../bloc/solution_bloc.dart';
import '../models/solution_item.dart';

/// Tab "Giải pháp" hiển thị danh sách giải pháp của dự án dạng card.
class SolutionTab extends StatefulWidget {
  const SolutionTab({super.key});

  @override
  State<SolutionTab> createState() => _SolutionTabState();
}

class _SolutionTabState extends BaseState<SolutionTab, SolutionEvent,
    SolutionState, SolutionBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const SolutionEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<SolutionBloc, SolutionState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading && state.solutions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.solutions.isEmpty) {
          return Center(
            child: Text(
              state.message ?? 'Có lỗi xảy ra',
              style: AppStyles.contentText.copyWith(color: AppColors.red),
            ),
          );
        }

        final solutions = state.solutions;

        if (solutions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 80,
                  color: AppColors.gray.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 12),
                Text(
                  'Chưa có giải pháp nào',
                  style:
                      AppStyles.contentText.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        // Gom nhóm theo mã yêu cầu, giữ nguyên thứ tự xuất hiện.
        final groups = <String, List<SolutionItem>>{};
        for (final s in solutions) {
          groups.putIfAbsent(s.requestCode, () => []).add(s);
        }

        final children = <Widget>[];
        for (final entry in groups.entries) {
          children.add(_RequestGroupHeader(
            requestCode: entry.key,
            count: entry.value.length,
          ));
          for (var i = 0; i < entry.value.length; i++) {
            final item = entry.value[i];
            children.add(SolutionCard(
              index: i + 1,
              item: item,
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

/// Header gom nhóm theo mã yêu cầu.
class _RequestGroupHeader extends StatelessWidget {
  const _RequestGroupHeader({required this.requestCode, required this.count});

  final String requestCode;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(Icons.assignment_outlined,
              size: 16, color: AppColors.primaryERP),
          const SizedBox(width: 6),
          Text(
            'Mã yêu cầu: ',
            style: AppStyles.body2.copyWith(color: AppColors.gray),
          ),
          Text(
            requestCode,
            style: AppStyles.body2.copyWith(
              color: AppColors.primaryERP,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Card hiển thị thông tin một giải pháp (style giống ProjectCard).
class SolutionCard extends StatelessWidget {
  const SolutionCard({super.key, required this.index, required this.item});

  final int index;
  final SolutionItem item;

  String _formatDate(DateTime? d) {
    if (d == null) return '--';
    return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                // STT + Status + Mã + Menu
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
                        item.code,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _SolutionMenuButton(item: item, formatDate: _formatDate),
                  ],
                ),
                const SizedBox(height: 10),
                // Nội dung
                Text(
                  item.content,
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
                // Ngày GP
                _InfoRow(
                  icon: Icons.event_outlined,
                  label: 'Ngày GP',
                  value: _formatDate(item.gpDate),
                ),
                const SizedBox(height: 10),
                // Trạng thái + Duyệt PO
                Row(
                  children: [
                    Expanded(
                      child: _StatusBlock(
                        label: 'Trạng thái',
                        pill: _StatusPill(
                          label: item.status.label,
                          color: SolutionStatusColors.colorForStatus(item.status),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatusBlock(
                        label: 'Duyệt PO',
                        pill: _StatusPill(
                          label: item.poApproval.label,
                          color: SolutionStatusColors.colorForPoApproval(
                              item.poApproval),
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
    );
  }
}

/// Nút 3 chấm dọc - mở bottom sheet chi tiết.
class _SolutionMenuButton extends StatelessWidget {
  const _SolutionMenuButton({required this.item, required this.formatDate});

  final SolutionItem item;
  final String Function(DateTime?) formatDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _SolutionDetailSheet(item: item, formatDate: formatDate),
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

/// Bottom sheet chi tiết của Solution - có ô tìm kiếm, copy.
class _SolutionDetailSheet extends StatelessWidget {
  const _SolutionDetailSheet({required this.item, required this.formatDate});

  final SolutionItem item;
  final String Function(DateTime?) formatDate;

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
                    item.code,
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
                  // Nội dung
                  _DetailSection(
                    title: 'Nội dung',
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Text(
                        item.content,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.enableText,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                  // Trạng thái + Duyệt PO
                  _DetailRow(items: [
                    _DetailItem(
                      label: 'Trạng thái',
                      value: item.status.label,
                      icon: Icons.flag_outlined,
                      valueColor:
                          SolutionStatusColors.colorForStatus(item.status),
                    ),
                    _DetailItem(
                      label: 'Duyệt PO',
                      value: item.poApproval.label,
                      icon: Icons.receipt_long_outlined,
                      valueColor: SolutionStatusColors.colorForPoApproval(
                          item.poApproval),
                    ),
                  ]),
                  // Ngày GP + Mã
                  _DetailRow(items: [
                    _DetailItem(
                      label: 'Ngày GP',
                      value: formatDate(item.gpDate),
                      icon: Icons.event_outlined,
                    ),
                    _DetailItem(
                      label: 'Mã',
                      value: item.code,
                      icon: Icons.qr_code_2_outlined,
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

/// Block hiển thị label + status pill trong card.
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

/// Một dòng thông tin (icon + label: value) - dùng trong card.
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 14, color: AppColors.gray),
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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Pill hiển thị status với màu nền.
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
