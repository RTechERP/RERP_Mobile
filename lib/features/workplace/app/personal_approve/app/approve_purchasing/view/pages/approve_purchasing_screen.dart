// Màn hình Duyệt phiếu yêu cầu mua hàng (ProjectPartlistPurchaseRequest).
// Hiển thị 3 tab (ID 1, 7, 8) — danh sách phiếu theo loại và khoảng ngày.
//
// Pattern lấy từ `reg_work/view/pages/personal_summary`:
//  - `TabController` tạo 1 lần trong `initState` với số tab cố định.
//  - Đổi tab → dispatch event, bloc load lại dữ liệu cho tab mới.
//  - Tabs chỉ định nghĩa `label` + `requestTypeId` (whitelist 1/7/8), không
//    phụ thuộc vào API `/request-types`. API chỉ dùng để xác nhận label
//    (nếu BE trả khác thì ưu tiên label từ API).

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../data/datasource/models/approve_purchasing_model.dart';
import '../bloc/approve_purchasing_bloc.dart';
import '../widgets/filter_sheet.dart';

class ApprovePurchasingScreen extends StatefulWidget {
  const ApprovePurchasingScreen({super.key});

  @override
  State<ApprovePurchasingScreen> createState() =>
      _ApprovePurchasingScreenState();
}

class _ApprovePurchasingScreenState
    extends
        BaseState<
            ApprovePurchasingScreen,
            ApprovePurchasingEvent,
            ApprovePurchasingState,
            ApprovePurchasingBloc
        >
    with TickerProviderStateMixin {
  late final TabController _tabController;

  /// Định nghĩa tĩnh 3 tab của màn hình (label + requestTypeId).
  /// `TabController` được tạo 1 lần dựa trên độ dài list này, không phụ
  /// thuộc vào kết quả API `/request-types` — bloc vẫn dùng các ID này
  /// để filter dữ liệu từ `/get-all`.
  static const _tabDefs = <_TabDef>[
    _TabDef(label: 'Mua dự án', requestTypeId: 1),
    _TabDef(label: 'Hàng Marketing', requestTypeId: 7),
    _TabDef(label: 'Vật tư tiêu hao', requestTypeId: 8),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabDefs.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
    // Init bloc sau frame đầu để tránh emit trong khi đang build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const ApprovePurchasingEvent.init());
    });
  }

  void _onTabChanged() {
    // Listener được gọi cả khi animation đang chạy; chỉ xử lý khi
    // index đã settle để tránh dispatch nhiều event.
    if (_tabController.indexIsChanging) return;
    final idx = _tabController.index;
    if (idx < 0 || idx >= _tabDefs.length) return;
    final id = _tabDefs[idx].requestTypeId;
    if (id != bloc.state.selectedRequestTypeId) {
      bloc.add(ApprovePurchasingEvent.selectTab(requestTypeId: id));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Lấy label từ API `/request-types` nếu có, fallback về label tĩnh.
  /// Dùng cho hiển thị — bloc vẫn dựa trên `requestTypeId`.
  String _tabLabel(int index) {
    final def = _tabDefs[index];
    final id = def.requestTypeId;
    for (final t in bloc.state.requestTypes) {
      if (t.id == id && (t.requestTypeName ?? '').trim().isNotEmpty) {
        return t.requestTypeName!;
      }
    }
    return def.label;
  }

  @override
  Widget renderUI(BuildContext context) {
    return blocBuilder((context, state) {
      // Khi bloc đã chọn 1 tab (sau khi load request-types), đồng bộ lại
      // TabController về đúng index. Tránh dispatch event lặp bằng cách
      // chỉ gán index khi khác giá trị hiện tại (listener sẽ check).
      final selectedId = state.selectedRequestTypeId;
      if (selectedId != null) {
        final idx = _tabDefs.indexWhere(
          (d) => d.requestTypeId == selectedId,
        );
        if (idx >= 0 && _tabController.index != idx) {
          _tabController.index = idx;
        }
      }

      return BaseScaffold(
        appBar: AppBarCommon(
          onBackTap: () => context.pop(),
          centerTitle: false,
          title: Text(
            'Duyệt phiếu mua',
            style: AppStyles.headingTitle2,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: _buildTabBar(state),
          ),
          actions: [
            IconButton(
              tooltip: 'Bộ lọc',
              onPressed: _openFilterSheet,
              icon: Icon(
                Icons.filter_alt_outlined,
                color: state.filter.selectedProjectId != null ||
                        state.filter.selectedSupplierId != null ||
                        state.filter.searchKeyword.isNotEmpty
                    ? AppColors.primaryERP
                    : AppColors.gray,
              ),
            ),
            IconButton(
              tooltip: 'Lọc ngày',
              onPressed: () => _openDateRangePicker(context),
              icon: Icon(
                Icons.calendar_month,
                color: state.isDateFiltered
                    ? AppColors.primaryERP
                    : AppColors.gray,
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            for (var i = 0; i < _tabDefs.length; i++)
              _buildTabContent(context, state),
          ],
        ),
      );
    });
  }

  // ── Tab Bar ───────────────────────────────────────────────────────────────

  Widget _buildTabBar(ApprovePurchasingState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gray.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryERP,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryERP.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.gray,
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          tabs: [
            for (var i = 0; i < _tabDefs.length; i++)
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_tabLabel(i)),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blueA400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${state.countFor(_tabDefs[i].requestTypeId)}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ── Tab content ──────────────────────────────────────────────────────────

  Widget _buildTabContent(
    BuildContext context,
    ApprovePurchasingState state,
  ) {
    if (state.requestTypes.isEmpty &&
        (state.status == BaseStateStatus.loading ||
            state.status == BaseStateStatus.init)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.requestTypes.isEmpty && state.status == BaseStateStatus.failed) {
      return _ErrorView(message: state.message ?? 'Lỗi tải dữ liệu');
    }

    if (state.requestTypes.isEmpty) {
      return const Center(child: Text('Không có loại phiếu mua nào'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const ApprovePurchasingEvent.refresh());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading && !s.isRefreshing,
        );
      },
      child: _buildList(context, state),
    );
  }

  Widget _buildList(BuildContext context, ApprovePurchasingState state) {
    // Khi user chuyển tab, bloc đặt status = loading → hiển thị spinner.
    if (state.status == BaseStateStatus.loading && state.filteredItems.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200),
          Center(child: CircularProgressIndicator()),
        ],
      );
    }
    if (state.status == BaseStateStatus.failed && state.filteredItems.isEmpty) {
      return _ErrorView(message: state.message ?? 'Lỗi tải dữ liệu');
    }
    if (state.filteredItems.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 80),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.missing, width: 280),
                const SizedBox(height: 12),
                const Text('Không có phiếu mua nào'),
              ],
            ),
          ),
        ],
      );
    }
    return _PurchasingList(items: state.filteredItems);
  }

  // ── Date range ───────────────────────────────────────────────────────────

  Future<void> _openDateRangePicker(BuildContext context) async {
    final initialStart = bloc.state.dateStart ??
        ApprovePurchasingState.defaultDateStart();
    final initialEnd =
        bloc.state.dateEnd ?? ApprovePurchasingState.defaultDateEnd();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: initialStart,
        initialEnd: initialEnd,
        onApply: (start, end) {
          bloc.add(
            ApprovePurchasingEvent.changeDateRange(
              dateStart: DateTime(start.year, start.month, start.day),
              dateEnd: DateTime(end.year, end.month, end.day),
            ),
          );
        },
      ),
    );
  }

  // ── Filter ──────────────────────────────────────────────────────────────

  void _openFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const FilterSheet(),
      ),
    );
  }
}

/// Định nghĩa 1 tab: label hiển thị + `requestTypeId` tương ứng.
class _TabDef {
  const _TabDef({required this.label, required this.requestTypeId});

  final String label;
  final int requestTypeId;
}

/// View lỗi — hiển thị ảnh + message, dùng khi bloc fail.
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 80),
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.error, width: 280),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Danh sách phiếu mua — gom theo ProjectID, 1 card / project.
class _PurchasingList extends StatelessWidget {
  const _PurchasingList({required this.items});

  final List<ApprovePurchasingItem> items;

  @override
  Widget build(BuildContext context) {
    // Gom items theo ProjectID.
    final grouped = <int?, List<ApprovePurchasingItem>>{};
    for (final item in items) {
      grouped.putIfAbsent(item.projectId, () => <ApprovePurchasingItem>[])
        .add(item);
    }

    // Sort: project có ID trước, null project sau.
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        if (a == null && b == null) return 0;
        if (a == null) return 1;
        if (b == null) return -1;
        return a.compareTo(b);
      });

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: sortedKeys.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final projectId = sortedKeys[index];
        return _PurchasingCard(
          projectId: projectId,
          projectItems: grouped[projectId]!,
        );
      },
    );
  }
}

/// Card hiển thị 1 project cùng danh sách card con (mỗi card con = 1 SP).
///
/// Structure:
/// - Header: TT (#) | statusChip BGD duyệt | ProjectFullName
/// - Body: danh sách _ProductChildCard (mỗi card = 1 SP với đầy đủ 14 trường)
/// - Footer: Tổng tiền toàn project | Lý do huỷ (nếu có)
class _PurchasingCard extends StatelessWidget {
  const _PurchasingCard({
    required this.projectId,
    required this.projectItems,
  });

  final int? projectId;
  final List<ApprovePurchasingItem> projectItems;

  static final NumberFormat _moneyFmt = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    if (projectItems.isEmpty) return const SizedBox.shrink();

    final first = projectItems.first;
    final projectName =
        (first.projectFullName ?? first.projectName ?? '').trim();
    final reasonCancel = first.reasonCancel ?? '';

    // Tổng tiền = sum(TotalPrice) của tất cả dòng trong project.
    double total = 0;
    for (final i in projectItems) {
      total += i.totalPrice ?? 0;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primaryERP.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header: Dự án: ProjectFullName (x sản phẩm) ─────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.05),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primaryERP.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    'Dự án: $projectName',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    '|',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '${projectItems.length} sản phẩm',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryERP,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // ── Danh sách card con (mỗi card = 1 SP) ─────────────────────────
          ...projectItems.map(
            (item) => _ProductChildCard(item: item),
          ),

          // ── Footer: Tổng tiền ───────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            decoration: BoxDecoration(
              color: AppColors.alert.withValues(alpha: 0.04),
              border: Border(
                top: BorderSide(
                  color: AppColors.alert.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Tổng tiền: ${_moneyFmt.format(total)}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.alert,
                  ),
                ),
              ],
            ),
          ),

          // ── Lý do huỷ (nếu có) ──────────────────────────────────────────
          if (reasonCancel.trim().isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.stateWarningColor.withValues(alpha: 0.06),
                border: Border(
                  top: BorderSide(
                    color: AppColors.stateWarningColor.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.cancel_outlined,
                        size: 14,
                        color: AppColors.stateWarningColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Lý do huỷ',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.stateWarningColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reasonCancel.trim(),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.stateWarningColor,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Card con — hiển thị 1 dòng SP theo các cột web:
///   TT | TT Duyệt BGĐ | Mã SP | Tên SP | TSKT | ĐVT | SL | Đơn giá |
///   Thành tiền | Loại tiền | Tỷ giá | NCC | Ghi chú | Lý do huỷ
///
/// Tap để expand/collapse.
class _ProductChildCard extends StatefulWidget {
  const _ProductChildCard({required this.item});

  final ApprovePurchasingItem item;

  @override
  State<_ProductChildCard> createState() => _ProductChildCardState();
}

class _ProductChildCardState extends State<_ProductChildCard> {
  bool _isExpanded = false;

  ApprovePurchasingItem get item => widget.item;

  static final NumberFormat _moneyFmt = NumberFormat('#,###');
  static final NumberFormat _rateFmt = NumberFormat('#,##0.##');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header — tap để expand/collapse
          _buildHeader(),

          // Chi tiết (khi expand)
          if (_isExpanded) ...[
            _buildDivider(),
            _buildSectionDetails(),
            const SizedBox(height: 4),
          ],
        ],
      ),
    );
  }

  /// Header hiển thị các trường chính (không có lý do huỷ).
  Widget _buildHeader() {
    final code = (item.productCode ?? '').trim();
    final name = (item.productName ?? '-').trim();
    final model = (item.model ?? '').trim();
    final unit = (item.unitName ?? '').trim();
    final unitMoney = (item.unitMoney ?? '').trim();
    final ncc = (item.nameNcc ?? '').trim();
    final note = (item.note ?? '').trim();

    return InkWell(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dòng 1: TT + statusChip BGD
            Row(
              children: [
                Text(
                  '#${(item.tt ?? '').trim().isEmpty ? (item.id?.toString() ?? '-') : item.tt!.trim()}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(width: 8),
                _ApprovalBadge(
                  text: item.isApprovedBgdText ?? 'Chờ duyệt',
                  isApproved: item.isApprovedBgd ?? false,
                ),
                const Spacer(),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                  color: AppColors.gray,
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Dòng 2: Mã SP | Tên SP
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _FieldCol(label: 'Mã SP', value: code.isEmpty ? '-' : code),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: _FieldCol(label: 'Tên SP', value: name, valueIsBold: true),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Dòng 3: TSKT | ĐVT | SL
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _FieldCol(label: 'TSKT', value: model.isEmpty ? '-' : model),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FieldCol(label: 'ĐVT', value: unit.isEmpty ? '-' : unit),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FieldCol(label: 'SL', value: _formatQty(item.quantity)),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Dòng 4: Đơn giá | Thành tiền | Loại tiền | Tỷ giá
            Row(
              children: [
                Expanded(
                  child: _FieldCol(
                    label: 'Đơn giá',
                    value: item.unitPrice == null
                        ? '-'
                        : _moneyFmt.format(item.unitPrice),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FieldCol(
                    label: 'Thành tiền',
                    value: item.totalPrice == null
                        ? '-'
                        : _moneyFmt.format(item.totalPrice),
                    isHighlight: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FieldCol(
                    label: 'Loại tiền',
                    value: unitMoney.isEmpty ? '-' : unitMoney,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FieldCol(
                    label: 'Tỷ giá',
                    value: _formatRate(item.currencyRate),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Dòng 5: NCC | Ghi chú (ghi chú full width, NCC cùng hàng nếu đủ chỗ)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _FieldCol(label: 'NCC', value: ncc.isEmpty ? '-' : ncc),
                ),
                if (note.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: _FieldCol(label: 'Ghi chú', value: note, isNote: true),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Phần chi tiết khi expand — chỉ chứa Lý do huỷ (riêng từng dòng SP).
  Widget _buildSectionDetails() {
    final reasonCancel = (item.reasonCancel ?? '').trim();

    if (reasonCancel.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
        child: Row(
          children: [
            Icon(Icons.info_outline, size: 14, color: AppColors.gray),
            const SizedBox(width: 6),
            Text(
              'Không có lý do huỷ',
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.gray,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.cancel_outlined,
                size: 14,
                color: AppColors.stateWarningColor,
              ),
              const SizedBox(width: 6),
              const Text(
                'Lý do huỷ',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.stateWarningColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            reasonCancel,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.stateWarningColor,
              fontStyle: FontStyle.italic,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(
        height: 1,
        color: AppColors.gray.withValues(alpha: 0.06),
      );

  // ── Helpers ─────────────────────────────────────────────────────────────

  String _formatQty(double? qty) {
    if (qty == null) return '-';
    return qty % 1 == 0 ? qty.toInt().toString() : qty.toString();
  }

  String _formatRate(double? rate) {
    if (rate == null) return '-';
    return _rateFmt.format(rate);
  }
}

/// 1 cột field: label phía trên, value phía dưới.
class _FieldCol extends StatelessWidget {
  const _FieldCol({
    required this.label,
    required this.value,
    this.isHighlight = false,
    this.valueIsBold = false,
    this.isNote = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool isHighlight;
  final bool valueIsBold;
  final bool isNote;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final displayValue = value.isEmpty ? '-' : value;
    final isDash = displayValue == '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          displayValue,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isHighlight
                ? FontWeight.w700
                : (valueIsBold ? FontWeight.w600 : FontWeight.w500),
            color: valueColor ??
                (isHighlight
                    ? AppColors.alert
                    : (isNote
                        ? AppColors.textSecondaryColor
                        : (isDash ? AppColors.gray : AppColors.enableText))),
            fontStyle: isNote && displayValue != '-'
                ? FontStyle.italic
                : FontStyle.normal,
          ),
          maxLines: isNote ? 3 : 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Chip trạng thái duyệt BGĐ: đỏ (chờ duyệt) / xanh (đã duyệt) / xám (khác).
class _ApprovalBadge extends StatelessWidget {
  const _ApprovalBadge({required this.text, required this.isApproved});

  final String text;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    final color = isApproved
        ? AppColors.stateSuccessColor
        : AppColors.stateWarningColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

