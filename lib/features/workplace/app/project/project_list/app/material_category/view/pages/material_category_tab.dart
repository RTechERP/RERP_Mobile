import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rtc_erp/base/bloc/index.dart';
import 'package:rtc_erp/base/widgets/base_widget.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/common/widgets/form/form_left_border_card.dart';

import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../bloc/material_category_bloc.dart';
import '../../data/datasource/model/part_list_model.dart';
import '../../../material_info/view/widgets/material_info_menu_sheet.dart';
import '../../../material_info/data/model/material_info_menu_item.dart';
import '../../../material_info/view/widgets/material_info_detail_sheet.dart';
import '../../../material_info/view/widgets/quote_request_detail_sheet.dart';
import '../../../material_info/view/widgets/purchase_request_detail_sheet.dart';
import '../../../material_info/view/widgets/import_warehouse_detail_sheet.dart';
import '../../../material_info/view/widgets/stock_balance_detail_sheet.dart';
import '../../../material_info/view/pages/quote_request_create_page.dart';

/// Tab "Danh mục vật tư" - hiển thị danh sách vật tư dạng cây cha - con.
///
/// API `/ProjectPartList/get-all` trả về danh sách flat kèm `ParentID` và
/// `CountChild`, tab này nhóm theo `parentId` để dựng cây.
/// Bloc do MaterialCategoryScreen cung cấp; tab này không tạo bloc riêng
/// để đảm bảo dùng chung state với screen cha.
class MaterialCategoryTab extends StatefulWidget {
  const MaterialCategoryTab({super.key});

  @override
  State<MaterialCategoryTab> createState() => _MaterialCategoryTabState();
}

class _MaterialCategoryTabState extends State<MaterialCategoryTab>
    with BaseMethodMixin<MaterialCategoryState> {
  /// Tập id các node cha đang được mở rộng.
  final Set<int> _expandedIds = <int>{};

  /// Tập id các phiếu đang được chọn (qua checkbox).
  /// Tự động cascade: chọn cha → con cũng được chọn.
  final Set<int> _selectedIds = <int>{};

  /// Cây hiện tại — cache sau khi build để xử lý chọn không cần rebuild.
  List<_PartListNode> _currentTree = const [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialCategoryBloc, MaterialCategoryState>(
      builder: (context, state) {
        if (state.status == BaseStateStatus.loading &&
            state.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BaseStateStatus.failed &&
            state.categories.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.red.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    state.message ?? 'Có lỗi xảy ra',
                    style: AppStyles.contentText.copyWith(color: AppColors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }

        final tree = _buildTree(state.filteredCategories);
        _currentTree = tree;

        if (tree.isEmpty) {
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
                  state.searchKeyword.isNotEmpty
                      ? 'Không tìm thấy vật tư phù hợp'
                      : 'Chưa có vật tư nào',
                  style: AppStyles.contentText.copyWith(color: AppColors.gray),
                ),
              ],
            ),
          );
        }

        return Stack(
          children: [
            ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
              itemCount: tree.length,
              itemBuilder: (context, index) =>
                  _buildNode(context, tree[index], 0),
            ),
            if (_selectedIds.isNotEmpty)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: _SelectionActionBar(
                  count: _selectedIds.length,
                  onAction: _openBulkMenu,
                  onClear: () => setState(() => _selectedIds.clear()),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Dựng cây từ danh sách flat dựa trên `parentId`.
  ///
  /// Node có `parentId == null` hoặc `0` được coi là root. Các node còn lại
  /// được gắn vào parent tương ứng nếu tìm thấy, ngược lại fallback về root
  /// để tránh mất dữ liệu khi API thiếu cha.
  List<_PartListNode> _buildTree(List<PartListModel> items) {
    final byId = <int, _PartListNode>{};
    for (final item in items) {
      if (item.id == null) continue;
      byId[item.id!] = _PartListNode(item: item);
    }

    final roots = <_PartListNode>[];
    for (final item in items) {
      if (item.id == null) continue;
      final node = byId[item.id!]!;
      final pid = item.parentId;
      if (pid != null && pid > 0 && byId.containsKey(pid)) {
        byId[pid]!.children.add(node);
      } else {
        roots.add(node);
      }
    }

    _sortRecursive(roots);
    return roots;
  }

  void _sortRecursive(List<_PartListNode> nodes) {
    nodes.sort((a, b) => (a.item.stt ?? 0).compareTo(b.item.stt ?? 0));
    for (final n in nodes) {
      _sortRecursive(n.children);
    }
  }

  Widget _buildNode(BuildContext context, _PartListNode node, int depth) {
    final hasChildren = node.children.isNotEmpty;
    final nodeId = node.item.id!;
    final expanded = _expandedIds.contains(nodeId);
    final selected = _selectedIds.contains(nodeId);

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PartListCard(
            item: node.item,
            depth: depth,
            isLastChild: node.isLastChild,
            hasChildren: hasChildren,
            childCount: node.children.length,
            expanded: expanded,
            selected: selected,
            onToggleExpand: hasChildren
                ? () => setState(() {
                    if (expanded) {
                      _expandedIds.remove(nodeId);
                    } else {
                      _expandedIds.add(nodeId);
                    }
                  })
                : null,
            onTap: () => _openMenu(context, node.item),
            onToggleSelect: () => _toggleSelection(nodeId),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 220),
            crossFadeState: (hasChildren && expanded)
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            alignment: Alignment.topCenter,
            firstCurve: Curves.easeIn,
            secondCurve: Curves.easeOut,
            sizeCurve: Curves.easeInOut,
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < node.children.length; i++)
                    _buildNode(
                      context,
                      node.children[i]
                        ..isLastChild = i == node.children.length - 1,
                      depth + 1,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openMenu(BuildContext context, PartListModel item) async {
    final id = await MaterialInfoMenuSheet.show(context, partListItem: item);
    if (!context.mounted || id == null) return;
    Future<void>? pending;
    switch (id) {
      case 'detail':
        pending = MaterialInfoDetailSheet.show(context, partListItem: item);
        break;
      case 'quote':
        pending = QuoteRequestDetailSheet.show(context, partListItem: item);
        break;
      case 'purchase':
        pending = PurchaseRequestDetailSheet.show(context, partListItem: item);
        break;
      case 'import':
        pending = ImportWarehouseDetailSheet.show(context, partListItem: item);
        break;
      case 'stock':
        pending = StockBalanceDetailSheet.show(context, partListItem: item);
        break;
      default:
        break;
    }
    if (pending != null) unawaited(pending);
  }

  /// Toggle chọn/bỏ chọn 1 phiếu qua checkbox (dấu tròn).
  ///
  /// Hành vi:
  /// - Check cha → tự động check tất cả con cháu.
  /// - Uncheck cha → tự động uncheck tất cả con cháu.
  /// - Không tự mở sheet: action bar nổi sẽ xuất hiện khi có phiếu chọn,
  ///   user bấm "Thao tác" trên bar để mở bottom sheet bulk.
  void _toggleSelection(int id) {
    final node = _findNode(id, _currentTree);
    if (node == null) return;

    final willSelect = !_selectedIds.contains(id);
    _collectDescendantIds(node).forEach((d) {
      if (willSelect) {
        _selectedIds.add(d);
      } else {
        _selectedIds.remove(d);
      }
    });

    setState(() {});
  }

  /// Mở bottom sheet [MaterialInfoMenuSheet] với 4 nhóm thao tác bulk.
  /// Gọi từ action bar khi user bấm "Thao tác". Không truyền vật tư nên sheet
  /// không hiện header, chỉ có lưới 4 nhóm. Mỗi nhóm mở tiếp sheet con.
  Future<void> _openBulkMenu() async {
    final pickedCount = _selectedIds.length;
    if (pickedCount == 0) return;

    final actionId = await MaterialInfoMenuSheet.show(
      context,
      menuItems: MaterialInfoMenuItem.bulkMenuItems,
    );
    if (!mounted || actionId == null) return;

    // Một số lệnh điều hướng sang trang riêng (form tạo phiếu) thay vì snackbar.
    if (actionId == 'bulk.quote.create') {
      await _openQuoteRequestCreate();
      return;
    }

    // Huỷ duyệt mới (TBP) gọi API tuần tự cho từng phiếu đã chọn.
    if (actionId == 'bulk.tbp.cancel_approve') {
      await _cancelApproveNewBulk();
      return;
    }

    // Duyệt mới (TBP): gọi check trước, nếu OK thì duyệt (repo xử lý).
    if (actionId == 'bulk.tbp.approve') {
      await _approveNewBulk();
      return;
    }

    // Duyệt tích xanh (TBP).
    if (actionId == 'bulk.tbp.approve_stock') {
      await _approveFixBulk(isFix: true);
      return;
    }

    // Huỷ duyệt tích xanh (TBP).
    if (actionId == 'bulk.tbp.cancel_approve_stock') {
      await _approveFixBulk(isFix: false);
      return;
    }

    // Chuyển kho — 5 kho tương ứng 5 child id (bulk.transfer.hn, ...).
    final transferCode = _mapTransferWarehouseCode(actionId);
    if (transferCode != null) {
      await _transferBulk(transferCode);
      return;
    }

    showMessage(
      context,
      'Không có vật tư hợp lệ để Duyệt mã mới',
      type: SnackBarType.error,
    );
    setState(() => _selectedIds.clear());
  }

  /// Map child id của menu chuyển kho sang mã kho gửi lên API.
  /// Trả về null nếu id không phải chuyển kho.
  /// Mapping: hn=HN, hcm=HCM, bacninh=BN, haiphong=HP, danphuong=DP.
  String? _mapTransferWarehouseCode(String actionId) {
    switch (actionId) {
      case 'bulk.transfer.hn':
        return 'HN';
      case 'bulk.transfer.hcm':
        return 'HCM';
      case 'bulk.transfer.bacninh':
        return 'BN';
      case 'bulk.transfer.haiphong':
        return 'HP';
      case 'bulk.transfer.danphuong':
        return 'DP';
      default:
        return null;
    }
  }

  /// Yêu cầu chuyển kho cho toàn bộ vật tư đang chọn sang kho [warehouseCode].
  /// Gọi 1 lần duy nhất với toàn bộ list (backend nhận batch qua ListItem).
  /// Bloc tự refresh list sau khi API trả 200.
  Future<void> _transferBulk(String warehouseCode) async {
    final selectedItems = _resolveSelectedItems();
    if (selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào để chuyển kho',
        type: SnackBarType.error,
      );
      return;
    }

    final bloc = context.read<MaterialCategoryBloc>();
    bloc.add(MaterialCategoryEvent.requestExportTransfer(
      warehouseCode: warehouseCode,
      items: selectedItems,
    ));

    // Đợi bloc emit success/failed để có message mới nhất.
    await bloc.stream.firstWhere(
      (s) =>
          s.status == BaseStateStatus.success ||
          s.status == BaseStateStatus.failed,
    );

    if (!mounted) return;
    final latest = bloc.state;
    if (latest.status == BaseStateStatus.failed) {
      showMessage(
        context,
        latest.message ?? 'Chuyển kho thất bại',
        type: SnackBarType.error,
      );
    } else {
      showMessage(context, 'Đã chuyển ${selectedItems.length} phiếu sang kho $warehouseCode');
    }
    setState(() => _selectedIds.clear());
  }

  /// Huỷ duyệt mới (TBP) cho toàn bộ vật tư đang được chọn.
  /// Gọi API tuần tự từng item; nếu 1 cái lỗi thì dừng lại và báo lỗi.
  /// Bloc sẽ tự refresh lại danh sách sau khi từng lệnh thành công.
  Future<void> _cancelApproveNewBulk() async {
    final selectedItems = _resolveSelectedItems();
    if (selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào để huỷ duyệt',
        type: SnackBarType.error,
      );
      return;
    }

    final bloc = context.read<MaterialCategoryBloc>();
    final errors = <String>[];

    for (final item in selectedItems) {
      if (!mounted) return;
      bloc.add(MaterialCategoryEvent.cancelApproveNew(item: item));
      // Đợi bloc emit success/failed trước khi gọi tiếp để có message mới nhất.
      await bloc.stream.firstWhere(
        (s) =>
            s.status == BaseStateStatus.success ||
            s.status == BaseStateStatus.failed,
      );
      final latest = bloc.state;
      if (latest.status == BaseStateStatus.failed) {
        errors.add('${item.productCode ?? "--"}: ${latest.message ?? "lỗi"}');
      }
    }

    if (!mounted) return;
    if (errors.isEmpty) {
      showMessage(context, 'Đã huỷ duyệt ${selectedItems.length} phiếu');
    } else {
      showMessage(
        context,
        'Huỷ duyệt thất bại: ${errors.join("; ")}',
        type: SnackBarType.error,
      );
    }
    setState(() => _selectedIds.clear());
  }

  /// Duyệt mới (TBP) cho toàn bộ vật tư đang chọn.
  /// Cùng pattern với [_cancelApproveNewBulk]: gọi tuần tự từng item, gom
  /// lỗi, snackbar tổng kết cuối hàm. Mỗi item repo sẽ gọi check trước —
  /// nếu check trả lỗi thì dừng luôn không gọi API duyệt.
  Future<void> _approveNewBulk() async {
    final selectedItems = _resolveSelectedItems();
    if (selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào để duyệt mới',
        type: SnackBarType.error,
      );
      return;
    }

    final bloc = context.read<MaterialCategoryBloc>();
    final errors = <String>[];

    for (final item in selectedItems) {
      if (!mounted) return;
      bloc.add(MaterialCategoryEvent.approveNew(item: item));
      // Đợi bloc emit success/failed trước khi gọi tiếp để có message mới nhất.
      await bloc.stream.firstWhere(
        (s) =>
            s.status == BaseStateStatus.success ||
            s.status == BaseStateStatus.failed,
      );
      final latest = bloc.state;
      if (latest.status == BaseStateStatus.failed) {
        errors.add('${item.productCode ?? "--"}: ${latest.message ?? "lỗi"}');
      }
    }

    if (!mounted) return;
    if (errors.isEmpty) {
      showMessage(context, 'Đã duyệt mới ${selectedItems.length} phiếu');
    } else {
      showMessage(
        context,
        'Duyệt mới thất bại: ${errors.join("; ")}',
        type: SnackBarType.error,
      );
    }
    setState(() => _selectedIds.clear());
  }

  /// Duyệt / huỷ duyệt tích xanh (TBP) cho toàn bộ vật tư đang chọn.
  /// isFix=true  → duyệt tích xanh.
  /// isFix=false → huỷ duyệt tích xanh.
  /// Cùng pattern với [_cancelApproveNewBulk]: gọi tuần tự từng item, gom
  /// lỗi, snackbar tổng kết cuối hàm.
  Future<void> _approveFixBulk({required bool isFix}) async {
    final selectedItems = _resolveSelectedItems();
    if (selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào để ${isFix ? "duyệt" : "huỷ duyệt"} tích xanh',
        type: SnackBarType.error,
      );
      return;
    }

    final bloc = context.read<MaterialCategoryBloc>();
    final errors = <String>[];
    final actionLabel = isFix ? 'Duyệt tích xanh' : 'Huỷ duyệt tích xanh';

    for (final item in selectedItems) {
      if (!mounted) return;
      bloc.add(MaterialCategoryEvent.approveFix(item: item, isFix: isFix));
      await bloc.stream.firstWhere(
        (s) =>
            s.status == BaseStateStatus.success ||
            s.status == BaseStateStatus.failed,
      );
      final latest = bloc.state;
      if (latest.status == BaseStateStatus.failed) {
        errors.add('${item.productCode ?? "--"}: ${latest.message ?? "lỗi"}');
      }
    }

    if (!mounted) return;
    if (errors.isEmpty) {
      showMessage(context, '$actionLabel ${selectedItems.length} phiếu');
    } else {
      showMessage(
        context,
        '$actionLabel thất bại: ${errors.join("; ")}',
        type: SnackBarType.error,
      );
    }
    setState(() => _selectedIds.clear());
  }

  /// Mở trang tạo yêu cầu báo giá với danh sách vật tư đã chọn.
  /// Chuẩn hoá: với mỗi id được chọn, nếu là node cha có con → lấy toàn bộ
  /// con cháu; nếu là lá → lấy chính nó. Trùng id thì bỏ.
  Future<void> _openQuoteRequestCreate() async {
    final selectedItems = _resolveSelectedItems();
    if (selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào để tạo phiếu',
        type: SnackBarType.error,
      );
      return;
    }

    final confirmed = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => QuoteRequestCreatePage(selectedItems: selectedItems),
      ),
    );
    if (!mounted) return;

    if (confirmed == true) {
      showMessage(
        context,
        'Đã tạo yêu cầu báo giá cho ${selectedItems.length} vật tư',
      );
      setState(() => _selectedIds.clear());
    }
  }

  /// Chuẩn hoá [Set] id đã chọn thành danh sách [PartListModel] phẳng.
  ///
  /// Rule:
  /// - Nếu id thuộc node cha (có con) → chỉ lấy con cháu, bỏ node cha gốc.
  /// - Nếu id thuộc node lá → lấy chính node đó.
  /// - Bỏ trùng theo `item.id` để tránh liệt kê 1 vật tư 2 lần khi user
  ///   check cả node cha và node con.
  List<PartListModel> _resolveSelectedItems() {
    final result = <PartListModel>[];
    final seenIds = <int>{};
    for (final root in _currentTree) {
      _collectForIds(root, _selectedIds, result, seenIds);
    }
    return result;
  }

  void _collectForIds(
    _PartListNode node,
    Set<int> selectedIds,
    List<PartListModel> out,
    Set<int> seenIds,
  ) {
    final id = node.item.id;
    if (id != null && selectedIds.contains(id)) {
      // Node được chọn:
      // - Có con → chỉ lấy con cháu, bỏ chính node cha gốc
      //   (vd chọn "Cấu hình Camera Align" → chỉ lấy vật tư con, không lấy
      //   header nhóm).
      // - Là lá → lấy chính nó.
      if (node.children.isEmpty) {
        if (seenIds.add(id)) out.add(node.item);
      } else {
        for (final c in node.children) {
          for (final desc in _walkSubtree(c)) {
            final did = desc.item.id;
            if (did != null && seenIds.add(did)) {
              out.add(desc.item);
            }
          }
        }
      }
      return;
    }
    // Không được chọn → tiếp tục xuống con để bắt trường hợp lá chọn riêng.
    for (final c in node.children) {
      _collectForIds(c, selectedIds, out, seenIds);
    }
  }

  /// Trả về chính node và toàn bộ con cháu theo DFS.
  Iterable<_PartListNode> _walkSubtree(_PartListNode root) sync* {
    yield root;
    for (final c in root.children) {
      yield* _walkSubtree(c);
    }
  }

  /// Tìm tên hiển thị của 1 menu theo id, tra cả nhóm cha lẫn nhóm con.
  /// Dùng cho snackbar xác nhận sau khi bulk thao tác xong.
  String _findMenuLabel(String id) {
    for (final group in MaterialInfoMenuItem.bulkMenuItems) {
      if (group.id == id) return group.name;
      for (final child in group.children) {
        if (child.id == id) return child.name;
      }
    }
    return id;
  }

  /// Tìm node theo id trong cây (DFS).
  _PartListNode? _findNode(int id, List<_PartListNode> nodes) {
    for (final n in nodes) {
      if (n.item.id == id) return n;
      final found = _findNode(id, n.children);
      if (found != null) return found;
    }
    return null;
  }

  /// Gom id của node hiện tại và mọi con cháu (dùng khi cascade check).
  Set<int> _collectDescendantIds(_PartListNode node) {
    final result = <int>{};
    if (node.item.id != null) result.add(node.item.id!);
    for (final c in node.children) {
      result.addAll(_collectDescendantIds(c));
    }
    return result;
  }
}

/// Một nút trong cây vật tư: chứa [PartListModel] và danh sách con trực tiếp.
class _PartListNode {
  _PartListNode({required this.item});

  final PartListModel item;
  final List<_PartListNode> children = [];
  bool isLastChild = false;
}

/// Đường kẻ dọc + nhánh ngang nối parent → child theo phong cách tree-view.
class _TreeGuideLine extends StatelessWidget {
  const _TreeGuideLine({
    required this.depth,
    required this.hasChildren,
    required this.isLastChild,
  });

  final int depth;
  final bool hasChildren;
  final bool isLastChild;

  @override
  Widget build(BuildContext context) {
    // depth >= 1: node con. Tính vị trí đường dọc theo indent.
    const indent = 22.0;
    return SizedBox(
      width: indent,
      child: CustomPaint(
        painter: _GuidePainter(
          color: const Color(0xFFCBD5E1),
          hasChildren: hasChildren,
          isLastChild: isLastChild,
        ),
      ),
    );
  }
}

class _GuidePainter extends CustomPainter {
  _GuidePainter({
    required this.color,
    required this.hasChildren,
    required this.isLastChild,
  });

  final Color color;
  final bool hasChildren;
  final bool isLastChild;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    // Đường dọc: từ trên → giữa (nếu không phải con cuối) hoặc hết (nếu là con cuối).
    final midY = size.height / 2;
    if (!isLastChild) {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paint,
      );
    } else {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, midY),
        paint,
      );
    }

    // Nhánh ngang nối từ đường dọc → card con.
    canvas.drawLine(
      Offset(size.width / 2, midY),
      Offset(size.width, midY),
      paint,
    );
  }

  @override
  bool shouldRepaint(_GuidePainter old) =>
      old.color != color ||
      old.hasChildren != hasChildren ||
      old.isLastChild != isLastChild;
}

/// Card hiển thị một vật tư (cha hoặc con) trong cây.
class _PartListCard extends StatelessWidget {
  const _PartListCard({
    required this.item,
    required this.depth,
    required this.isLastChild,
    required this.hasChildren,
    required this.childCount,
    required this.expanded,
    required this.selected,
    this.onToggleExpand,
    this.onTap,
    this.onToggleSelect,
  });

  final PartListModel item;
  final int depth;
  final bool isLastChild;
  final bool hasChildren;
  final int childCount;
  final bool expanded;
  final bool selected;
  final VoidCallback? onToggleExpand;
  final VoidCallback? onTap;
  final VoidCallback? onToggleSelect;

  bool get _isParent => depth == 0 && hasChildren;

  @override
  Widget build(BuildContext context) {
    final groupName = (item.groupMaterial ?? '').isNotEmpty
        ? item.groupMaterial!
        : 'Vật tư';
    final deviceCode = (item.productCode ?? '').isNotEmpty
        ? item.productCode!
        : '--';
    final qtyMin = item.qtyMin?.toStringAsFixed(0) ?? '--';
    final qtyFull = item.qtyFull?.toStringAsFixed(0) ?? '--';
    final unitPrice = item.unitPriceQuote != null && item.unitPriceQuote! > 0
        ? _formatCurrency(item.unitPriceQuote!)
        : '--';
    final totalPrice = item.totalPriceQuote != null && item.totalPriceQuote! > 0
        ? _formatCurrency(item.totalPriceQuote!)
        : '--';

    final theme = _CardTheme.forRole(isParent: _isParent, depth: depth);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (depth > 0)
            _TreeGuideLine(
              depth: depth,
              hasChildren: hasChildren,
              isLastChild: isLastChild,
            ),
          // Cột checkbox riêng — width cố định, độc lập với body card.
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Center(
              child: _SelectCircle(
                selected: selected,
                isParent: _isParent,
                onTap: onToggleSelect,
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(theme.radius),
                boxShadow: theme.shadow,
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(theme.radius),
                child: InkWell(
                  borderRadius: BorderRadius.circular(theme.radius),
                  onTap: onTap,
                  child: FormLeftBorderCard(
                    // Đã chọn → viền trái chuyển teal. Chưa chọn → cha dùng
                    // primary, con dùng xám theo depth.
                    borderColor: selected
                        ? AppColors.tealA700
                        : (_isParent ? AppColors.primaryERP : theme.border),
                    borderWidth: selected ? 4 : (_isParent ? 4 : 3),
                    backgroundColor: selected
                        ? AppColors.tealA700.withValues(alpha: 0.06)
                        : theme.background,
                    borderRadius: BorderRadius.circular(theme.radius),
                    padding: const EdgeInsets.fromLTRB(14, 10, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatusStack(
                          tbpText: item.isApprovedTbpText,
                          purchaseText: item.isApprovedPurchaseText,
                        ),
                        if (item.isApprovedTbpText != null &&
                            item.isApprovedTbpText!.isNotEmpty)
                          const SizedBox(height: 8),
                        _buildHeader(groupName: groupName, theme: theme),
                        if (_shouldShowMeta())
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildMetaLine(deviceCode: deviceCode),
                          ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: _shouldShowMeta() ? 10 : 12,
                          ),
                          child: _buildQtyRow(qtyMin: qtyMin, qtyFull: qtyFull),
                        ),
                        if (unitPrice != '--' || totalPrice != '--')
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _buildPriceRow(
                              unitPrice: unitPrice,
                              totalPrice: totalPrice,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({required String groupName, required _CardTheme theme}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasChildren)
          _ExpandButton(expanded: expanded, onTap: onToggleExpand)
        else
          _LeafDot(isParent: _isParent),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            groupName,
            style: TextStyle(
              fontSize: _isParent ? 15.5 : 14,
              fontWeight: _isParent ? FontWeight.w700 : FontWeight.w600,
              color: const Color(0xFF0F172A),
              height: 1.3,
              letterSpacing: _isParent ? -0.2 : 0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (hasChildren) ...[
          const SizedBox(width: 8),
          _ChildCountBadge(count: childCount),
        ],
      ],
    );
  }

  /// Meta chỉ hiển thị khi có TT hoặc có mã thiết bị.
  bool _shouldShowMeta() {
    return (item.tt ?? '').isNotEmpty || (item.productCode ?? '').isNotEmpty;
  }

  /// Dòng meta gọn: TT | Mã thiết bị.
  /// Nếu không có `productCode` thì ẩn icon QR.
  Widget _buildMetaLine({required String deviceCode}) {
    final tt = (item.tt ?? '').isNotEmpty ? item.tt! : null;
    final hasCode = deviceCode.isNotEmpty && deviceCode != '--';
    return Row(
      children: [
        if (tt != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'TT $tt',
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryERP,
              ),
            ),
          ),
        if (tt != null && hasCode) const SizedBox(width: 8),
        if (hasCode) ...[
          Icon(
            Icons.qr_code_2_rounded,
            size: 13,
            color: AppColors.gray.withValues(alpha: 0.9),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              deviceCode,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A),
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildQtyRow({required String qtyMin, required String qtyFull}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _InfoLine(
              icon: Icons.looks_one_rounded,
              label: 'SL/máy',
              value: qtyMin,
              compact: true,
              valueColor: const Color(0xFF1E88E5),
            ),
          ),
          Container(
            width: 1,
            height: 22,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: const Color(0xFFEDF0F4),
          ),
          Expanded(
            child: _InfoLine(
              icon: Icons.inventory_2_rounded,
              label: 'SL tổng',
              value: qtyFull,
              compact: true,
              valueColor: const Color(0xFF16A34A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String unitPrice,
    required String totalPrice,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _PriceCell(
              label: 'Đơn giá',
              value: unitPrice,
              valueColor: const Color(0xFF1E88E5),
              icon: Icons.price_change_outlined,
            ),
          ),
          Container(
            width: 1,
            height: 28,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: const Color(0xFFE2E8F0),
          ),
          Expanded(
            child: _PriceCell(
              label: 'Thành tiền',
              value: totalPrice,
              valueColor: const Color(0xFF16A34A),
              icon: Icons.payments_outlined,
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double value) {
    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)} tỷ';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)} tr';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }
}

/// Action bar nổi phía dưới — hiện khi có ít nhất 1 phiếu được chọn.
/// Gồm: badge số phiếu + nút "Thao tác" (mở menu bulk) + nút close (clear).
class _SelectionActionBar extends StatelessWidget {
  const _SelectionActionBar({
    required this.count,
    required this.onAction,
    required this.onClear,
  });

  final int count;
  final VoidCallback onAction;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.16),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: AppColors.tealA700.withValues(alpha: 0.35),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.tealA700.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 18,
                    color: AppColors.tealA700,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$count phiếu',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tealA700,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onClear,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Material(
              color: AppColors.tealA700,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: onAction,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.tune_rounded, size: 18, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        'Thao tác',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Theme áp dụng cho card theo vai trò (cha / con sâu / lá nông).
class _CardTheme {
  const _CardTheme({
    required this.background,
    required this.border,
    required this.radius,
    required this.shadow,
  });

  final Color background;
  final Color border;
  final double radius;
  final List<BoxShadow> shadow;

  static const _parentShadow = <BoxShadow>[
    BoxShadow(color: Color(0x140F172A), blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const _childShadow = <BoxShadow>[
    BoxShadow(color: Color(0x0A0F172A), blurRadius: 6, offset: Offset(0, 2)),
  ];

  factory _CardTheme.forRole({required bool isParent, required int depth}) {
    if (isParent) {
      return const _CardTheme(
        background: Color(0xFFFFF7F4),
        border: Color(0xFFFCD9CC),
        radius: 14,
        shadow: _parentShadow,
      );
    }
    if (depth >= 2) {
      return const _CardTheme(
        background: Color(0xFFFAFBFD),
        border: Color(0xFFEDF0F4),
        radius: 10,
        shadow: _childShadow,
      );
    }
    return const _CardTheme(
      background: Colors.white,
      border: Color(0xFFE6EAF0),
      radius: 12,
      shadow: _childShadow,
    );
  }
}

/// Dấu tròn (checkbox) chọn/bỏ chọn phiếu. Tap độc lập với onTap của card.
class _SelectCircle extends StatelessWidget {
  const _SelectCircle({
    required this.selected,
    required this.isParent,
    this.onTap,
  });

  final bool selected;
  final bool isParent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double size = isParent ? 26 : 22;
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? AppColors.tealA700 : Colors.white,
            border: Border.all(
              color: selected
                  ? AppColors.tealA700
                  : AppColors.gray.withValues(alpha: 0.55),
              width: 1.6,
            ),
          ),
          alignment: Alignment.center,
          child: AnimatedScale(
            scale: selected ? 1 : 0,
            duration: const Duration(milliseconds: 140),
            curve: Curves.easeOutBack,
            child: Icon(
              Icons.check_rounded,
              size: size * 0.68,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// Nút mở rộng / thu gọn cho node cha (icon chevron xoay theo trạng thái).
class _ExpandButton extends StatelessWidget {
  const _ExpandButton({required this.expanded, this.onTap});

  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryERP,
              AppColors.primaryERP.withValues(alpha: 0.85),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryERP.withValues(alpha: 0.25),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedRotation(
          turns: expanded ? 0.25 : 0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// Chấm tròn nhỏ đánh dấu node lá (không có con).
class _LeafDot extends StatelessWidget {
  const _LeafDot({required this.isParent});

  final bool isParent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: Center(
        child: Container(
          width: isParent ? 8 : 6,
          height: isParent ? 8 : 6,
          decoration: BoxDecoration(
            color: AppColors.gray.withValues(alpha: 0.45),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

/// Badge hiển thị số node con trực tiếp.
class _ChildCountBadge extends StatelessWidget {
  const _ChildCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.4),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.account_tree_rounded,
            size: 11,
            color: AppColors.primaryERP,
          ),
          const SizedBox(width: 3),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryERP,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Cụm status chip gồm: TBP + Mua (chỉ hiển thị khi có text).
/// Xếp dạng Wrap để tự rớt dòng khi hẹp, căn phải.
class _StatusStack extends StatelessWidget {
  const _StatusStack({required this.tbpText, required this.purchaseText});

  final String? tbpText;
  final String? purchaseText;

  @override
  Widget build(BuildContext context) {
    final chips = <Widget>[];
    if ((tbpText ?? '').isNotEmpty) {
      chips.add(_ApproveChip(label: 'TBP: $tbpText'));
    }
    if ((purchaseText ?? '').isNotEmpty) {
      chips.add(_ApproveChip(label: 'Mua: $purchaseText'));
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      runSpacing: 4,
      children: chips,
    );
  }
}

class _BadgePalette {
  const _BadgePalette({
    required this.bg,
    required this.fg,
    required this.border,
  });
  final Color bg;
  final Color fg;
  final Color border;
}

/// Một dòng thông tin: icon + label + value.
class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.icon,
    required this.label,
    required this.value,
    this.compact = false,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool compact;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontSize: 11.5,
      color: AppColors.gray.withValues(alpha: 0.95),
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    );
    final valueStyle = TextStyle(
      fontSize: compact ? 12.5 : 12,
      color: valueColor ?? const Color(0xFF0F172A),
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
    return Row(
      children: [
        Icon(icon, size: compact ? 13 : 14, color: AppColors.gray),
        const SizedBox(width: 6),
        Text(label, style: labelStyle),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            value,
            style: valueStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

/// Cell giá trị trong khối giá.
class _PriceCell extends StatelessWidget {
  const _PriceCell({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.icon,
  });

  final String label;
  final String value;
  final Color valueColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: valueColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 14, color: valueColor),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10.5,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: valueColor,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Chip trạng thái duyệt (TBP / Mua).
/// Màu xác định theo text:
/// - duyệt / đồng ý / chấp nhận → xanh lá
/// - chờ / đang / pending → vàng
/// - huỷ / từ chối / không duyệt → đỏ
class _ApproveChip extends StatelessWidget {
  const _ApproveChip({required this.label});

  final String label;

  _BadgePalette get _palette {
    final t = label.toLowerCase();
    if (t.contains('huỷ') ||
        t.contains('hủy') ||
        t.contains('từ chối') ||
        t.contains('không duyệt') ||
        t.contains('reject')) {
      return const _BadgePalette(
        bg: Color(0xFFFEE2E2),
        fg: Color(0xFFB91C1C),
        border: Color(0xFFFCA5A5),
      );
    }
    if (t.contains('chờ') ||
        t.contains('đang') ||
        t.contains('pending') ||
        t.contains('chưa')) {
      return const _BadgePalette(
        bg: Color(0xFFFEF3C7),
        fg: Color(0xFFB45309),
        border: Color(0xFFFCD34D),
      );
    }
    // Mặc định: đã duyệt → xanh lá
    return const _BadgePalette(
      bg: Color(0xFFDCFCE7),
      fg: Color(0xFF15803D),
      border: Color(0xFF86EFAC),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = _palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: p.bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: p.border, width: 0.8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: p.fg,
          height: 1.2,
        ),
      ),
    );
  }
}
