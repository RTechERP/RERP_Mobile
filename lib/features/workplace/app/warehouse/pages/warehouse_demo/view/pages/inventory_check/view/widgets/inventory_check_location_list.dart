import 'package:flutter/material.dart';
import 'package:rtc_erp/common/app_theme/index.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/data/datasource/models/inventory_check_model.dart';
import 'package:rtc_erp/features/workplace/app/warehouse/pages/warehouse_demo/view/pages/inventory_check/view/bloc/inventory_check_bloc.dart';

/// Danh sách vị trí kiểm kê theo nhóm đang chọn.
///
/// Cấu trúc tương ứng dữ liệu API `get-location-progress-mobile`:
/// - Nhóm vị trí kho → [productLocations] (mỗi kệ 1 dòng).
/// - Nhóm Modula → [modulaLocationGroups] (tủ cha) làm cấp 1,
///   [modulaLocations] (ô chi tiết) làm cấp 2.
class InventoryCheckLocationList extends StatefulWidget {
  const InventoryCheckLocationList({
    super.key,
    required this.group,
    required this.keyword,
    required this.productLocations,
    required this.modulaLocationGroups,
    required this.modulaLocations,
    required this.selectedProductLocationId,
    required this.selectedModulaLocationDetailId,
    required this.onSelectProductLocation,
    required this.onSelectModulaDetail,
  });

  /// Nhóm vị trí đang xem.
  final InventoryLocationGroup group;

  /// Từ khoá tìm kiếm (lọc cục bộ trên danh sách vị trí).
  final String keyword;

  /// Danh sách vị trí kho / kệ.
  final List<InventoryProductLocation> productLocations;

  /// Danh sách tủ Modula cha.
  final List<InventoryModulaLocationGroup> modulaLocationGroups;

  /// Danh sách ô Modula chi tiết.
  final List<InventoryModulaLocationDetail> modulaLocations;

  /// Id vị trí kho đang chọn (null = không lọc theo vị trí kho).
  final int? selectedProductLocationId;

  /// Id ô Modula chi tiết đang chọn.
  final int? selectedModulaLocationDetailId;

  /// Callback chọn vị trí kho. `null` = lấy toàn bộ vị trí kho.
  final ValueChanged<int?> onSelectProductLocation;

  /// Callback chọn ô Modula chi tiết.
  ///
  /// [detailId] là id ô chi tiết; `null` = bỏ lọc.
  final ValueChanged<int?> onSelectModulaDetail;

  @override
  State<InventoryCheckLocationList> createState() =>
      _InventoryCheckLocationListState();
}

class _InventoryCheckLocationListState
    extends State<InventoryCheckLocationList> {
  /// Id tủ Modula đang mở nhánh con (null = không tủ nào được mở).
  int? _expandedTrayId;

  @override
  void initState() {
    super.initState();
    _syncExpandedTray();
  }

  @override
  void didUpdateWidget(covariant InventoryCheckLocationList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Ô Modula đã chọn thay đổi → mở đúng tủ cha chứa ô đó để người dùng
    // thấy vị trí đang lọc khi quay lại tab vị trí.
    if (oldWidget.selectedModulaLocationDetailId !=
        widget.selectedModulaLocationDetailId) {
      _syncExpandedTray();
    }
  }

  /// Mở tủ Modula cha chứa ô đang được chọn (nếu có).
  void _syncExpandedTray() {
    final detailId = widget.selectedModulaLocationDetailId;
    if (detailId == null) return;

    for (final detail in widget.modulaLocations) {
      if (detail.detailId != detailId) continue;
      final groupId = detail.modulaLocationId;
      if (groupId == null) return;
      if (_expandedTrayId == groupId) return;
      setState(() => _expandedTrayId = groupId);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.group) {
      case InventoryLocationGroup.noLocation:
        return _buildNoLocationList();
      case InventoryLocationGroup.productLocation:
        return _buildProductLocationList();
      case InventoryLocationGroup.modula:
        return _buildModulaList();
    }
  }

  /// Danh sách khi chọn nhóm "Chưa có vị trí".
  ///
  /// Nhóm này không có cây vị trí — API gộp chung vị trí kho
  /// (`productLocationId = 0`) và vị trí Modula (`modulaLocationId = 0`) vào
  /// cùng 1 lựa chọn, nên không có vị trí con để liệt kê.
  Widget _buildNoLocationList() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: const [
        _EmptyHint(
          'Nhóm "Chưa có" gồm sản phẩm chưa có vị trí kho và chưa có vị trí '
          'Modula. Bấm ô "Chưa có" ở trên để xem danh sách sản phẩm cần kiểm.',
        ),
      ],
    );
  }

  /// Danh sách vị trí kho: từng kệ phẳng.
  ///
  /// Vị trí còn mã chưa kiểm được đưa lên đầu để người kiểm kê biết cần
  /// đi kệ nào trước.
  Widget _buildProductLocationList() {
    final racks = widget.productLocations
        .where((e) => (e.id ?? 0) > 0)
        .where(
          (e) => _match(e.locationName, e.locationCode),
        )
        .toList()
      ..sort(_sortByNeedCheck);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        const _SectionLabel('Danh sách vị trí kho'),
        const SizedBox(height: 6),
        for (final rack in racks)
          _LocationRow(
            title: rack.locationName ?? '--',
            subtitle: rack.locationCode,
            icon: Icons.warehouse_outlined,
            isSelected: widget.selectedProductLocationId == rack.id,
            totalCount: rack.totalCount,
            countedCount: rack.countedCount,
            uncountedCount: rack.uncountedCount,
            onTap: () => widget.onSelectProductLocation(rack.id),
          ),
        if (racks.isEmpty && widget.keyword.trim().isNotEmpty)
          const _EmptyHint('Không tìm thấy vị trí kho phù hợp'),
      ],
    );
  }

  /// Danh sách vị trí Modula — dạng cây tủ (cha) → ô chi tiết.
  ///
  /// Tủ còn mã chưa kiểm được đưa lên đầu để người kiểm kê biết cần đi
  /// tủ nào trước.
  Widget _buildModulaList() {
    final trays = widget.modulaLocationGroups
        .where((e) => (e.id ?? 0) > 0)
        .where((e) => _match(e.name, e.code))
        .toList()
      ..sort(_sortTrayByNeedCheck);

    if (trays.isEmpty) {
      return ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          if (widget.keyword.trim().isNotEmpty)
            const _EmptyHint('Không tìm thấy tủ Modula phù hợp')
          else
            const _EmptyHint('Kho này không có tủ Modula nào'),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        for (final tray in trays) _buildTrayNode(tray),
      ],
    );
  }

  /// Node tủ Modula — kèm nhánh con là các ô thuộc tủ đó.
  Widget _buildTrayNode(InventoryModulaLocationGroup tray) {
    final trayId = tray.id;
    final isExpanded = trayId != null && _expandedTrayId == trayId;

    final children = widget.modulaLocations
        .where((detail) => detail.modulaLocationId == trayId)
        .where((detail) => (detail.detailId ?? 0) > 0)
        .where((detail) => _match(detail.locationName, detail.detailCode))
        .toList()
      ..sort(_sortDetailByNeedCheck);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _LocationRow(
          title: tray.name ?? '--',
          subtitle: tray.code,
          icon: Icons.inventory_2_outlined,
          indent: 0,
          isSelected: false,
          isExpanded: isExpanded,
          hasChildren: true,
          totalCount: tray.totalCount,
          countedCount: tray.countedCount,
          uncountedCount: tray.uncountedCount,
          // Node cha (tủ) chỉ mở/đóng nhánh con, không lọc sản phẩm.
          onTap: () => setState(
            () => _expandedTrayId = isExpanded ? null : trayId,
          ),
        ),
        if (isExpanded)
          for (final detail in children)
            _LocationRow(
              title: detail.locationName ?? detail.detailName ?? '--',
              subtitle: detail.detailCode,
              icon: Icons.square_foot_outlined,
              indent: 16,
              isSelected: widget.selectedModulaLocationDetailId == detail.detailId,
              totalCount: detail.totalCount,
              countedCount: detail.countedCount,
              uncountedCount: detail.uncountedCount,
              onTap: () => widget.onSelectModulaDetail(detail.detailId),
            ),
      ],
    );
  }

  /// Sắp xếp vị trí kho: còn mã chưa kiểm lên đầu, nhiều mã chưa kiểm hơn
  /// thì lên trước, sau cùng theo thứ tự hiển thị của máy.
  static int _sortByNeedCheck(
    InventoryProductLocation a,
    InventoryProductLocation b,
  ) {
    if (a.uncountedCount != b.uncountedCount) {
      return b.uncountedCount.compareTo(a.uncountedCount);
    }
    return (a.stt ?? 0).compareTo(b.stt ?? 0);
  }

  /// Sắp xếp tủ Modula: còn mã chưa kiểm lên đầu, nhiều mã chưa kiểm hơn
  /// thì lên trước, sau cùng theo thứ tự hiển thị của máy.
  static int _sortTrayByNeedCheck(
    InventoryModulaLocationGroup a,
    InventoryModulaLocationGroup b,
  ) {
    if (a.uncountedCount != b.uncountedCount) {
      return b.uncountedCount.compareTo(a.uncountedCount);
    }
    return (a.stt ?? 0).compareTo(b.stt ?? 0);
  }

  /// Sắp xếp ô Modula: còn mã chưa kiểm lên đầu, nhiều mã chưa kiểm hơn
  /// thì lên trước, sau cùng theo thứ tự hiển thị của máy.
  static int _sortDetailByNeedCheck(
    InventoryModulaLocationDetail a,
    InventoryModulaLocationDetail b,
  ) {
    if (a.uncountedCount != b.uncountedCount) {
      return b.uncountedCount.compareTo(a.uncountedCount);
    }
    return (a.detailStt ?? 0).compareTo(b.detailStt ?? 0);
  }

  /// So khớp tên / mã vị trí với từ khoá đang tìm.
  bool _match(String? name, String? code) {
    final keyword = widget.keyword.trim().toLowerCase();
    if (keyword.isEmpty) return true;
    return (name ?? '').toLowerCase().contains(keyword) ||
        (code ?? '').toLowerCase().contains(keyword);
  }
}

/// Nhãn phân đoạn trong danh sách vị trí.
class _SectionLabel extends StatelessWidget {  const _SectionLabel(this.text);

  /// Nội dung nhãn.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 10.5,
        fontWeight: FontWeight.w700,
        color: AppColors.gray,
        letterSpacing: 0.4,
      ),
    );
  }
}

/// Gợi ý khi danh sách vị trí rỗng.
class _EmptyHint extends StatelessWidget {
  const _EmptyHint(this.text);

  /// Nội dung gợi ý.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12.5, color: AppColors.gray),
        ),
      ),
    );
  }
}

/// Một dòng vị trí trong danh sách.
///
/// Dùng chung cho cả vị trí kho (phẳng) và vị trí Modula (cây) — khác nhau
/// ở [indent] và biểu tượng mũi tên mở/đóng nhánh con.
class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
    this.indent = 0,
    this.hasChildren = false,
    this.isExpanded = false,
    this.totalCount,
    this.countedCount,
    this.uncountedCount,
  });

  /// Tên vị trí.
  final String title;

  /// Mã vị trí (hiển thị nhỏ bên dưới tên).
  final String? subtitle;

  /// Icon đại diện.
  final IconData icon;

  /// Cấp thụt lề (0 = gốc, 16 = con).
  final double indent;

  /// Node đang được chọn hay chưa.
  final bool isSelected;

  /// Node có nhánh con hay không (hiển thị mũi tên).
  final bool hasChildren;

  /// Nhánh con đang mở hay chưa.
  final bool isExpanded;

  /// Tổng số mã sản phẩm thuộc node.
  final int? totalCount;

  /// Số mã đã kiểm.
  final int? countedCount;

  /// Số mã chưa kiểm — quyết định badge trạng thái của vị trí.
  final int? uncountedCount;

  /// Callback bấm vào node.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final total = totalCount;

    return Padding(
      padding: EdgeInsets.only(top: 6, left: indent),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.secondaryERP.withValues(alpha: 0.08)
                  : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.secondaryERP.withValues(alpha: 0.45)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 17,
                  color: isSelected ? AppColors.secondaryERP : AppColors.gray,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? AppColors.secondaryERP
                              : AppColors.enableText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if ((subtitle ?? '').isNotEmpty)
                        Text(
                          subtitle!,
                          style: const TextStyle(
                            fontSize: 10.5,
                            color: AppColors.gray,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (total != null) ...[
                  const SizedBox(width: 8),
                  _StatusBadge(
                    uncounted: uncountedCount ?? 0,
                    counted: countedCount ?? 0,
                    total: total,
                  ),
                ],
                if (hasChildren) ...[
                  const SizedBox(width: 4),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                    color: AppColors.secondaryERP,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Badge trạng thái kiểm kê của 1 vị trí.
///
/// Cho biết vị trí đó còn bao nhiêu mã chưa kiểm để người kiểm kê biết
/// cần đi vị trí nào trước:
///
/// - `N` (cam) → còn N mã chưa kiểm, cần kiểm tiếp.
/// - `Xong` (xanh) → đã kiểm đủ, không cần đi nữa.
///
/// Badge hiển thị cả tiến độ `đã kiểm/tổng` bên dưới để thấy rõ vị trí
/// đó đã kiểm được bao nhiêu.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.uncounted,
    required this.counted,
    required this.total,
  });

  /// Số mã chưa kiểm.
  final int uncounted;

  /// Số mã đã kiểm.
  final int counted;

  /// Tổng số mã của vị trí.
  final int total;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (uncounted) {
      > 0 => ('$uncounted', AppColors.stateWarningColor),
      _ => ('Xong', AppColors.stateSuccessColor),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            '$counted/$total',
            style: const TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w600,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}