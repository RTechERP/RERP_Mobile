import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';

import '../bloc/material_category_bloc.dart';
import '../../data/datasource/model/material_category_model.dart';

/// Tab "Danh mục vật tư" - hiển thị bảng cha (5 cột):
/// TT | Tên vật tư | Mã thiết bị | SL/1 máy | SL tổng.
class MaterialCategoryTab extends StatefulWidget {
  const MaterialCategoryTab({super.key});

  @override
  State<MaterialCategoryTab> createState() => _MaterialCategoryTabState();
}

class _MaterialCategoryTabState extends BaseState<MaterialCategoryTab,
    MaterialCategoryEvent, MaterialCategoryState, MaterialCategoryBloc> {
  /// Tập các id cha đang expand để hiển thị phân cấp con.
  final Set<int> _expandedParents = <int>{};
  /// Đánh dấu đã chạy init-expand lần đầu để tránh ghi đè toggle của user.
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const MaterialCategoryEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<MaterialCategoryBloc, MaterialCategoryState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading && state.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed && state.categories.isEmpty) {
          return Center(
            child: Text(
              state.message ?? 'Có lỗi xảy ra',
              style: AppStyles.contentText.copyWith(color: AppColors.red),
            ),
          );
        }

        final items = state.categories;

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
                  'Chưa có danh mục vật tư nào',
                  style:
                      AppStyles.contentText.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        // Xây cây phân cấp nhiều cấp từ danh sách phẳng.
        final tree = _CategoryTree.build(items);
        // Lần đầu load: mở rộng tất cả node có con để user thấy đầy đủ cây.
        if (!_initialized) {
          _expandAllWithChildren(tree.roots);
          _initialized = true;
        }

        // Parent (TabBarView) đã cho bounded height, nên ListView fill sẵn.
        // Không cần Expanded ở đây.
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          itemCount: tree.roots.length,
          itemBuilder: (context, index) {
            final root = tree.roots[index];
            return _BranchWidget(
              node: root,
              depth: 0,
              expanded: _expandedParents,
              onToggle: _toggle,
              pathLabel: '${index + 1}',
              parentIndex: index + 1,
            );
          },
        );
      },
    );
  }

  /// Mở rộng tất cả node có con (đệ quy nhiều cấp) - dùng cho lần đầu load.
  void _expandAllWithChildren(List<_CategoryNode> nodes) {
    for (final n in nodes) {
      if (n.children.isNotEmpty) {
        _expandedParents.add(n.item.id);
        _expandAllWithChildren(n.children);
      }
    }
  }

  void _toggle(int parentId) {
    setState(() {
      if (_expandedParents.contains(parentId)) {
        _expandedParents.remove(parentId);
      } else {
        _expandedParents.add(parentId);
      }
    });
  }
}

/// Node trong cây phân cấp. depth = 0 cho root.
class _CategoryNode {
  _CategoryNode({required this.item, List<_CategoryNode>? children})
      : children = children ?? <_CategoryNode>[];

  final MaterialCategoryItem item;
  int depth = 0;
  final List<_CategoryNode> children;

  bool get hasChildren => children.isNotEmpty;
}

/// Cây phân cấp từ danh sách phẳng.
class _CategoryTree {
  _CategoryTree._(this.roots);

  final List<_CategoryNode> roots;

  factory _CategoryTree.build(List<MaterialCategoryItem> items) {
    // Map id -> node. Mỗi item tạo 1 node duy nhất (giữ reference thống nhất).
    final nodeMap = <int, _CategoryNode>{
      for (final i in items) i.id: _CategoryNode(item: i),
    };

    // Duyệt items để gắn children vào parent — dùng cùng node đã tạo.
    final byParent = <int, List<_CategoryNode>>{};
    for (final node in nodeMap.values) {
      final pid = node.item.parentId;
      if (pid != null && nodeMap.containsKey(pid)) {
        nodeMap[pid]!.children.add(node);
      } else {
        byParent.putIfAbsent(-1, () => []).add(node);
      }
    }

    // Cập nhật depth: BFS từ roots.
    final roots = byParent[-1] ?? const [];
    final queue = Queue<_CategoryNode>.from(roots);
    while (queue.isNotEmpty) {
      final n = queue.removeFirst();
      for (final c in n.children) {
        c.depth = n.depth + 1;
        queue.add(c);
      }
    }

    return _CategoryTree._(roots);
  }
}

/// Render 1 nhánh (root + toàn bộ con/cháu đang expand).
class _BranchWidget extends StatelessWidget {
  const _BranchWidget({
    required this.node,
    required this.depth,
    required this.expanded,
    required this.onToggle,
    required this.pathLabel,
    required this.parentIndex,
  });

  final _CategoryNode node;
  final int depth;
  final Set<int> expanded;
  final ValueChanged<int> onToggle;
  final String pathLabel;
  final int parentIndex;

  @override
  Widget build(BuildContext context) {
    final isExpanded = expanded.contains(node.item.id);
    final visibleChildren =
        isExpanded ? node.children : const <_CategoryNode>[];

    // Indent theo depth: cấp sâu hơn -> thụt vào nhiều hơn.
    // Root (depth 0) không indent, mỗi cấp thêm 14px.
    final indent = depth * 14.0;

    return Padding(
      padding: EdgeInsets.only(left: indent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card cho node hiện tại.
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: _MaterialCard(
              index: node.depth,
              pathLabel: pathLabel,
              item: node.item,
              isExpanded: isExpanded,
              childCount: node.children.length,
              hasChildren: node.hasChildren,
              onToggle:
                  node.hasChildren ? () => onToggle(node.item.id) : null,
            ),
          ),
          // Render các con (đệ quy).
          // pathLabel của nhánh hiện tại (VD "1", "1.1") -> con = "1.x", "1.1.x".
          for (int i = 0; i < visibleChildren.length; i++)
            _BranchWidget(
              node: visibleChildren[i],
              depth: depth + 1,
              expanded: expanded,
              onToggle: onToggle,
              parentIndex: i + 1,
              pathLabel: '$pathLabel.${i + 1}',
            ),
        ],
      ),
    );
  }
}

/// Card hiển thị 1 vật tư trong cây (root hoặc bất kỳ cấp nào).
/// - Có con: hiển thị badge số con + chevron toggle expand/collapse.
/// - depth > 0: render trong Container indent bằng đường kẻ dọc phân cấp.
class _MaterialCard extends StatelessWidget {
  const _MaterialCard({
    required this.index,
    required this.pathLabel,
    required this.item,
    this.isExpanded = false,
    this.childCount = 0,
    this.hasChildren = false,
    this.onToggle,
  });

  /// Không dùng, giữ để tương thích.
  final int index;
  /// Label "1", "1.1", "1.1.1"... hiển thị trong badge.
  final String pathLabel;
  final MaterialCategoryItem item;
  final bool isExpanded;
  final int childCount;
  final bool hasChildren;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    final device = (item.deviceCode == null || item.deviceCode!.isEmpty)
        ? '--'
        : item.deviceCode!;
    final qtyPer = (item.qtyPerMachine == null)
        ? '--'
        : item.qtyPerMachine.toString();
    final total =
        (item.totalQty == null) ? '--' : item.totalQty.toString();

    return Container(
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: badge số + tên.
            Row(
              children: [
                _NumberBadge(label: pathLabel),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            const SizedBox(height: 10),
            // Bottom: Mã TB | SL/1 máy | SL tổng
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _InfoBlock(
                    label: 'Mã thiết bị',
                    value: device,
                    icon: Icons.precision_manufacturing_outlined,
                  ),
                ),
                _VDivider(),
                Expanded(
                  flex: 2,
                  child: _InfoBlock(
                    label: 'SL/1 máy',
                    value: qtyPer,
                    icon: Icons.format_list_numbered,
                  ),
                ),
                _VDivider(),
                Expanded(
                  flex: 2,
                  child: _InfoBlock(
                    label: 'SL tổng',
                    value: total,
                    icon: Icons.inventory_2_outlined,
                    highlight: true,
                  ),
                ),
              ],
            ),
            // Footer: chevron toggle (đặt giữa-dưới card).
            if (hasChildren) ...[
              const SizedBox(height: 10),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isExpanded && childCount > 0) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryERP.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$childCount',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryERP,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                  _ChevronButton(
                    isExpanded: isExpanded,
                    onTap: onToggle,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Nút toggle mở/đóng phân cấp con (chevron-down ↔ chevron-up).
class _ChevronButton extends StatelessWidget {
  const _ChevronButton({
    required this.isExpanded,
    required this.onTap,
  });

  final bool isExpanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryERP.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: AnimatedRotation(
          turns: isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            Icons.expand_more,
            size: 18,
            color: AppColors.primaryERP,
          ),
        ),
      ),
    );
  }
}

/// Badge số thứ tự dạng dot (VD: "1", "1.1", "1.1.1") ở góc trái card.
class _NumberBadge extends StatelessWidget {
  const _NumberBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryERP.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryERP,
        ),
      ),
    );
  }
}

/// Divider dọc giữa các block info.
class _VDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: const Color(0xFFE5E7EB),
    );
  }
}

/// 1 block info: icon + label nhỏ + value lớn.
class _InfoBlock extends StatelessWidget {
  const _InfoBlock({
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
    final color = highlight ? AppColors.primaryERP : const Color(0xFF64748B);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: color),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: highlight
                  ? AppColors.primaryERP
                  : const Color(0xFF1E293B),
              height: 1.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
