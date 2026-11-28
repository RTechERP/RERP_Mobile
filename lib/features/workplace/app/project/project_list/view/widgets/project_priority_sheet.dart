import 'package:flutter/material.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/model/project_list_model.dart';

/// Định dạng điểm ưu tiên, bỏ các số 0 thừa ở cuối.
///
/// 1.50 -> 1.5, 0.90 -> 0.9, -0.02 -> -0.02, 1.00 -> 1.
String formatPriorityValue(double value) {
  var text = value.toStringAsFixed(2);
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'0+$'), '');
    text = text.replaceFirst(RegExp(r'\.$'), '');
  }
  return text;
}

/// Mở bottom sheet chọn mức ưu tiên của dự án theo dạng cây cha - con.
///
/// Dữ liệu mốc ưu tiên gồm các mốc cha (`ParentID = 0`) và các mốc con
/// (`ParentID` trỏ tới mốc cha). Mỗi mốc có 5 thông tin: mã ưu tiên,
/// checkpoint, trọng số, điểm và độ ưu tiên.
///
/// Quy tắc chọn:
/// - Chọn mốc cha sẽ chọn luôn toàn bộ mốc con của nó.
/// - Bỏ chọn mốc cha sẽ bỏ chọn toàn bộ mốc con.
/// - Chọn mốc con không làm thay đổi trạng thái chọn của mốc cha.
///
/// Mỗi lần mở sheet là một lần chọn mới - không giữ lại mốc đã tick lần
/// trước nên tổng điểm không bị cộng dồn.
///
/// [onConfirm] trả về tập id đã chọn và tổng điểm ưu tiên (tổng các giá
/// trị `Priority` của các mốc đã chọn).
Future<void> openProjectPrioritySheet({
  required BuildContext context,
  required List<ProjectPriorityType> items,
  required void Function(Set<int> selectedIds, double totalPriority) onConfirm,
}) async {
  final parentFocusScope = FocusScope.of(context);
  final previousCanRequestFocus = parentFocusScope.canRequestFocus;
  final previousDescendantsFocusable = parentFocusScope.descendantsAreFocusable;

  /// Lấy `Navigator` trước khi await để không dùng `BuildContext` sau async gap.
  final navigator = Navigator.of(context);

  parentFocusScope.canRequestFocus = false;
  parentFocusScope.descendantsAreFocusable = false;

  FocusManager.instance.primaryFocus?.unfocus();

  await Future.delayed(const Duration(milliseconds: 80));

  try {
    await navigator.push(
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (_) => _ProjectPrioritySheet(
          items: items,
          onConfirm: onConfirm,
        ),
      ),
    );
  } finally {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      parentFocusScope.canRequestFocus = previousCanRequestFocus;
      parentFocusScope.descendantsAreFocusable = previousDescendantsFocusable;
    });
  }
}

/// Bottom sheet chọn mức ưu tiên dạng tree.
///
/// Mỗi mốc cha là 1 card riêng, bên trong là các mốc con xếp dọc. Mỗi mốc
/// hiển thị: mã ưu tiên, checkpoint, trọng số (%), điểm và chip độ ưu tiên.
class _ProjectPrioritySheet extends StatefulWidget {
  final List<ProjectPriorityType> items;
  final void Function(Set<int> selectedIds, double totalPriority) onConfirm;

  const _ProjectPrioritySheet({
    required this.items,
    required this.onConfirm,
  });

  @override
  State<_ProjectPrioritySheet> createState() => _ProjectPrioritySheetState();
}

class _ProjectPrioritySheetState extends State<_ProjectPrioritySheet> {
  /// Id của các mốc đang được chọn.
  late Set<int> _selectedIds;

  /// Id của các mốc cha đang mở danh sách mốc con.
  late Set<int> _expandedIds;

  /// Các mốc cha (không có mốc cha) - node gốc của cây.
  late List<ProjectPriorityType> _roots;

  /// Map id của mốc cha -> danh sách mốc con.
  late Map<int, List<ProjectPriorityType>> _childrenMap;

  /// Map id của mốc con -> id của mốc cha.
  late Map<int, int> _parentMap;

  @override
  void initState() {
    super.initState();

    /// Mỗi lần mở sheet là lần chọn mới - không giữ lại mốc đã tick lần trước.
    _selectedIds = <int>{};
    _buildTree();

    /// Mặc định mở toàn bộ nhánh để người dùng thấy hết các mốc con.
    _expandedIds = _childrenMap.keys.toSet();
  }

  /// Chia danh sách mốc thành mốc cha và mốc con theo `ParentID`.
  void _buildTree() {
    _roots = [];
    _childrenMap = {};
    _parentMap = {};

    for (final item in widget.items) {
      final id = item.id;
      if (id == null) continue;

      final parentId = item.parentId ?? 0;
      if (parentId == 0) {
        _roots.add(item);
      } else {
        _childrenMap.putIfAbsent(parentId, () => []).add(item);
        _parentMap[id] = parentId;
      }
    }
  }

  /// Bật/tắt chọn một mốc.
  ///
  /// - Mốc cha: chọn sẽ kéo theo toàn bộ mốc con, bỏ chọn sẽ gỡ toàn bộ mốc
  ///   con.
  /// - Mốc con: chỉ thay đổi trạng thái của chính nó. Nếu mốc cha đang được
  ///   chọn thì mốc cha cũng được bỏ chọn (vì mốc cha chỉ hợp lệ khi đủ toàn
  ///   bộ con), các mốc con còn lại giữ nguyên.
  void _toggle(ProjectPriorityType item) {
    final id = item.id;
    if (id == null) return;

    final children = _childrenMap[id] ?? const <ProjectPriorityType>[];

    setState(() {
      if (children.isEmpty) {
        if (_selectedIds.contains(id)) {
          _selectedIds.remove(id);
          for (final ancestorId in _ancestorIdsOf(item)) {
            _selectedIds.remove(ancestorId);
          }
        } else {
          _selectedIds.add(id);
        }
        return;
      }

      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
        for (final child in _descendantsOf(item)) {
          final childId = child.id;
          if (childId != null) _selectedIds.remove(childId);
        }
      } else {
        _selectedIds.add(id);
        for (final child in _descendantsOf(item)) {
          final childId = child.id;
          if (childId != null) _selectedIds.add(childId);
        }
      }
    });
  }

  /// Mở / thu gọn danh sách mốc con của một mốc cha.
  void _toggleExpand(ProjectPriorityType item) {
    final id = item.id;
    if (id == null) return;

    setState(() {
      if (_expandedIds.contains(id)) {
        _expandedIds.remove(id);
      } else {
        _expandedIds.add(id);
      }
    });
  }

  /// Trạng thái checkbox của một mốc.
  ///
  /// Mốc cha hiển thị đúng trạng thái đã tick của nó: chỉ khi chọn cha thì
  /// mới hiện dấu, chọn con không ảnh hưởng tới dấu của cha.
  bool _isChecked(ProjectPriorityType item) {
    final id = item.id;
    if (id == null) return false;
    return _selectedIds.contains(id);
  }

  /// Tất cả các mốc con (trực tiếp và gián tiếp) của [item].
  List<ProjectPriorityType> _descendantsOf(ProjectPriorityType item) {
    final id = item.id;
    if (id == null) return const [];

    final result = <ProjectPriorityType>[];
    for (final child in _childrenMap[id] ?? const <ProjectPriorityType>[]) {
      result.add(child);
      result.addAll(_descendantsOf(child));
    }
    return result;
  }

  /// Id của các mốc cha tổ tiên của [item], từ gần nhất xa nhất.
  List<int> _ancestorIdsOf(ProjectPriorityType item) {
    final id = item.id;
    if (id == null) return const [];

    final result = <int>[];
    var current = _parentMap[id];
    while (current != null) {
      result.add(current);
      current = _parentMap[current];
    }
    return result;
  }

  /// Tổng điểm ưu tiên của các mốc đang chọn.
  double get _totalPriority {
    var total = 0.0;
    for (final item in widget.items) {
      final id = item.id;
      if (id == null || !_selectedIds.contains(id)) continue;
      total += item.priority ?? 0;
    }
    return total;
  }

  /// Định dạng tổng điểm ưu tiên, bỏ các số 0 thừa ở cuối.
  ///
  /// 1.50 -> 1.5, 0.90 -> 0.9, -0.02 -> -0.02, 0.00 -> 0.
  static String formatTotal(double value) => formatPriorityValue(value);

  @override
  Widget build(BuildContext context) {
    final sheetMaxHeight = MediaQuery.of(context).size.height * 0.85;
    final isEmpty = widget.items.isEmpty;

    return Sheet(
      initialOffset: const SheetOffset(0.0),
      decoration: const MaterialSheetDecoration(
        size: SheetSize.fit,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        color: AppColors.white,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: sheetMaxHeight),
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Expanded(
              child: isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.priority_high_outlined,
                            size: 56,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Không có dữ liệu',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                      children: [
                        for (final root in _roots) ...[
                          _buildParentCard(root),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Tiêu đề sheet.
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          const SizedBox(width: 40),
          Expanded(
            child: Center(
              child: Text('Chọn mức ưu tiên', style: AppStyles.headingTitle2),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  /// Card của một mốc cha, chứa danh sách các mốc con bên trong.
  Widget _buildParentCard(ProjectPriorityType parent) {
    final children = _childrenMap[parent.id] ?? const <ProjectPriorityType>[];
    final isExpanded = parent.id != null && _expandedIds.contains(parent.id);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildParentHeader(parent, children.length, isExpanded),
          if (children.isNotEmpty && isExpanded)
            Container(
              color: AppColors.backgroundLight,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Column(
                children: [
                  for (var i = 0; i < children.length; i++) ...[
                    if (i > 0) const SizedBox(height: 8),
                    _buildChildRow(children[i]),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// Phần đầu card mốc cha: tên mốc + trọng số + chip độ ưu tiên + nút
  /// mở/thu gọn danh sách mốc con.
  Widget _buildParentHeader(
    ProjectPriorityType parent,
    int childCount,
    bool isExpanded,
  ) {
    return InkWell(
      onTap: () => _toggle(parent),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCheckbox(parent),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        parent.code ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildRateBadge(parent.rate),
                      const SizedBox(width: 6),
                      _buildScoreBadge(parent.score),
                      if (childCount > 0) ...[
                        const SizedBox(width: 6),
                        _buildMetaPill('$childCount mốc con'),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _cleanText(parent.checkpoint),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildPriorityChip(parent.priority),
            if (childCount > 0)
              IconButton(
                onPressed: () => _toggleExpand(parent),
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                  color: AppColors.gray,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Một mốc con bên trong card của mốc cha.
  Widget _buildChildRow(ProjectPriorityType child) {
    return InkWell(
      onTap: () => _toggle(child),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isChecked(child)
                ? AppColors.primaryERP.withValues(alpha: 0.45)
                : AppColors.borderColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCheckbox(child),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        child.code ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.heading,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildRateBadge(child.rate),
                      const SizedBox(width: 6),
                      _buildScoreBadge(child.score),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _cleanText(child.checkpoint),
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildPriorityChip(child.priority),
          ],
        ),
      ),
    );
  }

  /// Checkbox của một mốc.
  Widget _buildCheckbox(ProjectPriorityType item) {
    return SizedBox(
      width: 22,
      height: 22,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: AppColors.grayColor[40],
        ),
        child: Checkbox(
          value: _isChecked(item),
          onChanged: (_) => _toggle(item),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: AppColors.primaryERP,
        ),
      ),
    );
  }

  /// Chip màu thể hiện độ ưu tiên.
  ///
  /// Toàn bộ độ ưu tiên dùng cùng 1 màu xanh lá cây.
  Widget _buildPriorityChip(double? priority) {
    final value = priority ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.greenA100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        formatPriorityValue(value),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.greenA500,
        ),
      ),
    );
  }

  /// Pill nhỏ hiển thị thông tin phụ (số mốc con).
  Widget _buildMetaPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.label,
        ),
      ),
    );
  }

  /// Badge trọng số - nổi bật bằng icon biểu trọng và nền xanh.
  Widget _buildRateBadge(double? rate) {
    final percent = ((rate ?? 0) * 100).round();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.blueA100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.blueA500,
            ),
          ),
        ],
      ),
    );
  }

  /// Badge điểm - nổi bật bằng nền cam, chữ đậm.
  ///
  /// Điểm âm (`-1`) hiển thị bằng màu đỏ để thấy rõ là giá trị đặc biệt.
  Widget _buildScoreBadge(int? score) {
    final value = score ?? 0;
    final isNegative = value < 0;
    final bg = isNegative ? AppColors.redA200 : AppColors.orangeA100;
    final fg = isNegative ? AppColors.redA500 : AppColors.orangeA500;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isNegative ? Icons.remove_circle_outline : Icons.star_rounded,
            size: 12,
            color: fg,
          ),
          const SizedBox(width: 2),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }

  /// Chân sheet: tổng điểm ưu tiên + nút hủy / lưu.
  Widget _buildFooter() {
    final total = _totalPriority;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng điểm ưu tiên',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.heading,
                ),
              ),
              Text(
                formatTotal(total),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: total < 0 ? AppColors.redA500 : AppColors.primaryERP,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryERP,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: AppColors.primaryERP),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Huỷ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onConfirm(Set<int>.from(_selectedIds), total);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryERP,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Lưu',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Bỏ khoảng trắng thừa trong checkpoint (API trả kèm `\r\n`).
  static String _cleanText(String? value) {
    return (value ?? '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
