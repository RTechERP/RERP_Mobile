// Màn hình Duyệt phiếu yêu cầu mua hàng (ProjectPartlistPurchaseRequest).
// Hiển thị 3 tab (ID 1, 7, 8) — danh sách phiếu theo loại và khoảng ngày.
//
// Pattern lấy từ `reg_work/view/pages/personal_summary`:
//  - `TabController` tạo 1 lần trong `initState` với số tab cố định.
//  - Đổi tab → dispatch event, bloc load lại dữ liệu cho tab mới.
//  - Tabs chỉ định nghĩa `label` + `requestTypeId` (whitelist 1/7/8), không
//    phụ thuộc vào API `/request-types`. API chỉ dùng để xác nhận label
//    (nếu BE trả khác thì ưu tiên label từ API).

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../../base/bloc/bloc_status.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
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

  /// Key để điều khiển `RefreshIndicator` — auto-show spinner kiểu
  /// pull-to-refresh khi bloc phát `isRefreshing = true` (đổi khoảng
  /// ngày…). Trigger qua `BlocListener` ở `renderUI`.
  ///
  /// Mỗi tab cần 1 GlobalKey riêng: `TabBarView` giữ cả 3 tab con trong
  /// cây đồ thị, nếu dùng chung 1 key sẽ gây "Duplicate GlobalKey" khi
  /// chuyển tab.
  late final List<GlobalKey<RefreshIndicatorState>> _refreshKeys =
      List.generate(
    _tabDefs.length,
    (i) => GlobalKey<RefreshIndicatorState>(),
  );

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

  /// Trigger [listener] khi (a) bloc vừa bật `isRefreshing` để auto-show
  /// pull-to-refresh, hoặc (b) bloc vừa set `approveFeedback` để hiện
  /// snackbar kết quả duyệt / huỷ duyệt.
  @override
  bool listenWhen(
    ApprovePurchasingState previous,
    ApprovePurchasingState current,
  ) {
    final refreshChanged =
        !previous.isRefreshing && current.isRefreshing;
    final feedbackChanged = previous.approveFeedback !=
            current.approveFeedback &&
        current.approveFeedback != null;
    return refreshChanged || feedbackChanged;
  }

  /// Khi bloc vừa bật `isRefreshing` → auto-show spinner pull-to-
  /// refresh (không phủ overlay đen, giữ nguyên list cũ cho đến khi
  /// load xong). Khi bloc vừa set `approveFeedback` → show snackbar
  /// kết quả và clear ngay để tránh lặp.
  @override
  void listener(BuildContext context, ApprovePurchasingState state) {
    final fb = state.approveFeedback;
    if (fb != null) {
      _showApproveFeedback(context, fb);
      bloc.add(const ApprovePurchasingEvent.clearApproveFeedback());
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Chỉ show spinner trên tab đang xem, tránh 3 RefreshIndicator
      // cùng chạy và tránh GlobalKey bị reparent khi đổi tab.
      final idx = _tabController.index;
      if (idx >= 0 && idx < _refreshKeys.length) {
        _refreshKeys[idx].currentState?.show();
      }
    });
  }

  /// Hiện snackbar với message do BE trả về (ví dụ "Đã cập nhật trạng
  /// thái 1 yêu cầu duyệt thành công."). Màu snackbar theo
  /// [ApprovePurchasingFeedback.isSuccess].
  void _showApproveFeedback(
    BuildContext context,
    ApprovePurchasingFeedback fb,
  ) {
    if (!mounted) return;
    showMessage(
      context,
      fb.message,
      type: fb.isSuccess ? SnackBarType.success : SnackBarType.error,
    );
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
            if (!state.isSelectionMode) ...[
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
            if (state.isSelectionMode)
              TextButton(
                onPressed: () => bloc.add(
                  const ApprovePurchasingEvent.exitSelectionMode(),
                ),
                child: Text(
                  'Huỷ (${state.selectedIds.length})',
                  style: const TextStyle(
                    color: AppColors.alert,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
        body: Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: [
                for (var i = 0; i < _tabDefs.length; i++)
                  _buildTabContent(
                    context,
                    state,
                    refreshKey: _refreshKeys[i],
                    requestTypeId: _tabDefs[i].requestTypeId,
                  ),
              ],
            ),
            if (state.isSelectionMode)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _SelectionActionBar(
                  selectedCount: state.selectedIds.length,
                  totalCount: selectedId == null
                      ? 0
                      : state
                          .filteredItemsFor(selectedId)
                          .where((it) => it.id != null)
                          .length,
                  isApproving: state.isApproving,
                  onSelectAll: state.isApproving
                      ? () {}
                      : () => bloc.add(
                          const ApprovePurchasingEvent.selectAllVisible(),
                        ),
                  onClearSelection: () => bloc.add(
                    const ApprovePurchasingEvent.clearSelection(),
                  ),
                  onApprove: _onApprove,
                  onReject: _onReject,
                ),
              ),
          ],
        ),
      );
    });
  }

  /// Hiện dialog xác nhận và dispatch event duyệt / huỷ duyệt.
  ///
  /// Dùng chung 1 hàm cho cả 2 nút — khác `title`, `description`, và
  /// `isApproved` truyền vào.
  Future<void> _confirmAndDispatch({
    required bool isApproved,
  }) async {
    // Chặn thao tác khi đang gọi API (tránh bấm đúp / nhân đôi).
    if (bloc.state.isApproving) return;
    final count = bloc.state.selectedIds.length;
    if (count == 0) return;
    final title = isApproved ? 'Duyệt phiếu' : 'Huỷ duyệt';
    final action = isApproved ? 'duyệt' : 'huỷ duyệt';
    final confirmed = await DialogService.showConfirmDialog(
      context: context,
      title: title,
      message: 'Bạn có muốn $action $count phiếu đã chọn không?',
    );
    if (!confirmed) return;
    if (!mounted) return;
    bloc.add(ApprovePurchasingEvent.approveSelected(isApproved: isApproved));
  }

  Future<void> _onApprove() => _confirmAndDispatch(isApproved: true);

  Future<void> _onReject() => _confirmAndDispatch(isApproved: false);

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

  /// Build nội dung 1 tab.
  ///
  /// Mỗi tab tự resolve data của riêng nó qua
  /// [ApprovePurchasingState.filteredItemsFor] thay vì đọc
  /// `state.filteredItems` (chỉ chứa data tab đang chọn). Nhờ vậy khi
  /// vuốt sang tab mới, tab đó hiện đúng data của nó ngay, không phải
  /// chờ bloc emit rồi mới đổi.
  Widget _buildTabContent(
    BuildContext context,
    ApprovePurchasingState state, {
    required GlobalKey<RefreshIndicatorState> refreshKey,
    required int requestTypeId,
  }) {
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
      key: refreshKey,
      onRefresh: () async {
        bloc.add(const ApprovePurchasingEvent.refresh());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading && !s.isRefreshing,
        );
      },
      child: _buildList(context, state, requestTypeId: requestTypeId),
    );
  }

  Widget _buildList(
    BuildContext context,
    ApprovePurchasingState state, {
    required int requestTypeId,
  }) {
    // Chỉ hiện spinner toàn màn hình lúc init (chưa có data nào).
    // Khi đã có `itemsByType` thì mỗi tab tự hiện empty state riêng —
    // tránh cảnh báo tab mới nhảy về data tab cũ.
    final items = state.filteredItemsFor(requestTypeId);

    if (items.isEmpty) {
      // Còn đang tải lần đầc → spinner.
      final isInitialLoad = state.itemsByType.isEmpty &&
          (state.status == BaseStateStatus.loading ||
              state.status == BaseStateStatus.init ||
              state.isRefreshing);
      if (isInitialLoad) {
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 200),
            Center(child: CircularProgressIndicator()),
          ],
        );
      }
      // Load xong mà tab này không có phiếu → empty state.
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

    return _PurchasingList(items: items);
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

    return BlocSelector<ApprovePurchasingBloc, ApprovePurchasingState,
        (bool, Set<int>)>(
      selector: (s) => (s.isSelectionMode, s.selectedIds),
      builder: (context, sel) {
        final selectionMode = sel.$1;
        final selectedIds = sel.$2;
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: sortedKeys.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final projectId = sortedKeys[index];
            return _PurchasingCard(
              projectId: projectId,
              projectItems: grouped[projectId]!,
              selectionMode: selectionMode,
              selectedIds: selectedIds,
            );
          },
        );
      },
    );
  }
}

/// Card hiển thị 1 project cùng danh sách card con (mỗi card con = 1 SP).
///
/// Structure:
/// - Header: Dự án: ProjectFullName | x sản phẩm | nút expand/collapse
/// - Body: danh sách _ProductChildCard (mỗi card = 1 SP với đầy đủ trường)
/// - Footer: Lý do huỷ (nếu có) — không còn Tổng tiền
///
/// Mặc định thu gọn, bấm header để expand/collapse toàn bộ card SP.
class _PurchasingCard extends StatefulWidget {
  const _PurchasingCard({
    required this.projectId,
    required this.projectItems,
    required this.selectionMode,
    required this.selectedIds,
  });

  final int? projectId;
  final List<ApprovePurchasingItem> projectItems;
  final bool selectionMode;
  final Set<int> selectedIds;

  @override
  State<_PurchasingCard> createState() => _PurchasingCardState();
}

class _PurchasingCardState extends State<_PurchasingCard> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final projectItems = widget.projectItems;
    if (projectItems.isEmpty) return const SizedBox.shrink();

    final first = projectItems.first;
    final projectName =
        (first.projectFullName ?? first.projectName ?? '').trim();
    final reasonCancel = first.reasonCancel ?? '';

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
          // ── Header: Dự án: ProjectFullName | x sản phẩm | nút expand ──
          InkWell(
            onTap: () =>
                setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
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
                  const SizedBox(width: 4),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 22,
                    color: AppColors.primaryERP,
                  ),
                ],
              ),
            ),
          ),

          // ── Danh sách card con (chỉ hiển thị khi expand) ───────────────
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < projectItems.length; i++)
                    _ProductChildCard(
                      key: ValueKey(projectItems[i].id ?? i),
                      item: projectItems[i],
                      selectionMode: widget.selectionMode,
                      selected: projectItems[i].id != null &&
                          widget.selectedIds.contains(projectItems[i].id),
                      selectedCount: widget.selectedIds.length,
                      onToggleSelection: () {
                        final id = projectItems[i].id;
                        if (id == null) return;
                        context.read<ApprovePurchasingBloc>().add(
                              ApprovePurchasingEvent.toggleSelection(
                                itemId: id,
                              ),
                            );
                      },
                    ),
                ],
              ),
            ),

          // ── Lý do huỷ (nếu có) — luôn hiển thị ở footer ───────────────
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
/// Hiển thị phẳng (không expand/collapse). Mỗi card có viền bao quanh
/// (trên/dưới/trái/phải) để tách biệt rõ ràng giữa các phiếu sản phẩm.
/// Tap checkbox hoặc tap card đều toggle chọn.
class _ProductChildCard extends StatelessWidget {
  const _ProductChildCard({
    super.key,
    required this.item,
    required this.selectionMode,
    required this.selected,
    required this.selectedCount,
    required this.onToggleSelection,
  });

  final ApprovePurchasingItem item;
  final bool selectionMode;
  final bool selected;

  /// Tổng số card đang chọn — dùng cho logic tap ở tương lai.
  final int selectedCount;
  final VoidCallback onToggleSelection;

  static final NumberFormat _moneyFmt =
      NumberFormat('#,##0.00', 'en_US');
  static final NumberFormat _rateFmt =
      NumberFormat('#,##0.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primaryERP.withValues(alpha: 0.06)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE3E8EF),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onToggleSelection,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderRow(),
              const SizedBox(height: 8),
              _buildMainFields(),
              const SizedBox(height: 6),
              _buildRateRow(),
              const SizedBox(height: 6),
              _buildMoneyRow(),
              if ((item.note ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 8),
                _buildNote(context),
              ],
              if (item.reasonCancel != null &&
                  (item.reasonCancel ?? '').trim().isNotEmpty) ...[
                const SizedBox(height: 8),
                _buildReasonCancel(),
              ],
            ],
          ),
        ),
      ),
      ),
    );
  }

  /// Hàng 1: checkbox + #TT + statusChip BGD.
  Widget _buildHeaderRow() {
    return Row(
      children: [
        _SelectionCheckbox(
          value: selected,
          onTap: onToggleSelection,
        ),
        const SizedBox(width: 8),
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
      ],
    );
  }

  /// Hàng nội dung chính: Tên SP (không label) – Mã SP – TSKT – NCC.
  /// Bỏ hẳn expand/collapse — toàn bộ trường luôn hiển thị.
  Widget _buildMainFields() {
    final code = (item.productCode ?? '').trim();
    final name = (item.productName ?? '-').trim();
    final model = (item.model ?? '').trim();
    final ncc = (item.nameNcc ?? '').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tên sản phẩm không cần label — hiển thị thẳng, in đậm.
        if (name.isNotEmpty && name != '-')
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
          ),
        _InfoLine(label: 'Mã sản phẩm', value: code.isEmpty ? '-' : code),
        if (model.isNotEmpty) _InfoLine(label: 'Thông số kỹ thuật', value: model),
        if (ncc.isNotEmpty) _InfoLine(label: 'Nhà cung cấp', value: ncc),
      ],
    );
  }

  /// Row cố định: ĐVT – SL – Loại tiền – Tỷ giá (4 cột cách đều nhau).
  Widget _buildRateRow() {
    final unit = (item.unitName ?? '').trim();
    final unitMoney = (item.unitMoney ?? '').trim();
    return Row(
      children: [
        Expanded(
          child: _FieldCol(
            label: 'Đơn vị tính',
            value: unit.isEmpty ? '-' : unit,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _FieldCol(
            label: 'Số lượng',
            value: _formatQty(item.quantity),
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
    );
  }

  /// Row cuối: Đơn giá – Thành tiền (căn trái, mỗi cột chiếm 1/2).
  Widget _buildMoneyRow() {
    return Row(
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
      ],
    );
  }

  /// Ghi chú — nằm ở cuối phiếu, giao diện note vàng nhạt.
  ///
  /// Hyperlink (http/https/www) được tô đậm + gạch chân màu primary để user
  /// nhận biết, tap sẽ mở bằng trình duyệt.
  Widget _buildNote(BuildContext context) {
    final note = (item.note ?? '').trim();
    final spans = _buildNoteSpans(context, note);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.orangeA100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.orangeA300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.orangeA200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.edit_note_rounded,
                  size: 14,
                  color: AppColors.warning,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Ghi chú',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(children: spans),
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.45,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Tách nội dung ghi chú thành các span, tô sáng đoạn là hyperlink.
  ///
  /// Dùng regex thủ công cho URL http/https/www (không thêm dependency).
  /// Link được gắn `TapGestureRecognizer` để tap mở bằng app trình duyệt.
  List<InlineSpan> _buildNoteSpans(BuildContext context, String note) {
    final baseStyle = const TextStyle(
      fontSize: 12.5,
      height: 1.45,
      color: AppColors.textSecondaryColor,
    );
    final linkStyle = const TextStyle(
      fontSize: 12.5,
      height: 1.45,
      color: AppColors.primaryERP,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryERP,
      decorationThickness: 1.5,
    );

    // Regex bắt URL http/https/www — đủ dùng, không cần thêm dependency.
    final urlPattern = RegExp(
      r'(https?://[^\s]+|www\.[^\s]+)',
      caseSensitive: false,
    );

    final matches = urlPattern.allMatches(note).toList();
    if (matches.isEmpty) {
      return [TextSpan(text: note, style: baseStyle)];
    }

    final spans = <InlineSpan>[];
    var cursor = 0;
    for (final m in matches) {
      if (m.start > cursor) {
        spans.add(
          TextSpan(text: note.substring(cursor, m.start), style: baseStyle),
        );
      }
      final url = m.group(0)!;
      // Bỏ dấu chấm cuối nếu URL bị vướng punctuation.
      final trimmed = url.replaceFirst(RegExp(r'[.,;)]+$'), '');
      final trailing = url.substring(trimmed.length);

      final uri = Uri.tryParse(
        trimmed.startsWith('http') ? trimmed : 'https://$trimmed',
      );
      if (uri != null) {
        spans.add(
          TextSpan(
            text: trimmed,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () => _openLink(context, uri),
          ),
        );
      } else {
        spans.add(TextSpan(text: trimmed, style: baseStyle));
      }

      if (trailing.isNotEmpty) {
        spans.add(TextSpan(text: trailing, style: baseStyle));
      }
      cursor = m.end;
    }
    if (cursor < note.length) {
      spans.add(TextSpan(text: note.substring(cursor), style: baseStyle));
    }

    return spans;
  }

  /// Mở hyperlink bằng app ngoài (browser mặc định của hệ thống).
  Future<void> _openLink(BuildContext context, Uri uri) async {
    final messenger = ScaffoldMessenger.maybeOf(context);
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && messenger != null) {
        messenger.showSnackBar(
          SnackBar(content: Text('Không mở được liên kết: $uri')),
        );
      }
    } catch (_) {
      messenger?.showSnackBar(
        SnackBar(content: Text('Không mở được liên kết: $uri')),
      );
    }
  }

  /// Lý do huỷ — hiển thị thẳng dưới cùng nếu có.
  Widget _buildReasonCancel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.stateWarningColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.stateWarningColor.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 14,
            color: AppColors.stateWarningColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              item.reasonCancel!.trim(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
  });

  final String label;
  final String value;

  /// Thành tiền — in đậm + màu nhấn.
  final bool isHighlight;

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
            fontWeight:
                isHighlight ? FontWeight.w700 : FontWeight.w500,
            color: isHighlight
                ? AppColors.alert
                : (isDash ? AppColors.gray : AppColors.enableText),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// Dòng label + value tự giãn theo text, value ở dưới (label ở trên).
class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final displayValue = value.isEmpty ? '-' : value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            displayValue,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.heading,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
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

/// Checkbox custom (vuông bo tròn nhỏ) dùng cho từng `_ProductChildCard`
/// khi màn hình đang ở chế độ chọn hàng loạt. Tap trực tiếp cũng là
/// toggle selection (kể cả khi user tap đúng vào checkbox).
class _SelectionCheckbox extends StatelessWidget {
  const _SelectionCheckbox({required this.value, required this.onTap});

  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: value ? AppColors.primaryERP : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: value
                ? AppColors.primaryERP
                : AppColors.gray.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}

/// Bottom action bar xuất hiện khi `isSelectionMode == true`.
/// Layout:
///   Huỷ chọn hàng loạt | (đã chọn N/tất cả) | [Duyệt] [Huỷ duyệt]
///
/// - 2 nút Duyệt / Huỷ duyệt chỉ enable khi đã chọn ≥1.
/// - Có nút "Chọn tất cả" / "Bỏ chọn" thay phiên nhau tuỳ `selectedCount`.
/// - Cả 2 nút "Duyệt" / "Huỷ duyệt" đều disabled khi `isApproving`
///   để tránh bấm đúp trong lúc API chạy.
class _SelectionActionBar extends StatelessWidget {
  const _SelectionActionBar({
    required this.selectedCount,
    required this.totalCount,
    required this.isApproving,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onApprove,
    required this.onReject,
  });

  final int selectedCount;
  final int totalCount;
  final bool isApproving;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final hasSelection = selectedCount > 0;
    // Safe area bottom (home indicator) được cộng thẳng vào padding
    // trong của container, thay vì bọc `SafeArea` bên ngoài — nếu bọc ngoài
    // thì nền trắng và viền trên sẽ dừng lại trên inset, để lại khoảng
    // trắng trống dưới thanh bar.
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.heading.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: AppColors.primaryERP.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hàng info + nút chọn tất cả / bỏ chọn
          Row(
            children: [
              Expanded(
                child: Text(
                  hasSelection
                      ? 'Đã chọn $selectedCount / $totalCount'
                      : 'Chưa chọn card nào',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                  ),
                ),
              ),
              TextButton(
                onPressed: hasSelection ? onClearSelection : onSelectAll,
                child: Text(
                  hasSelection ? 'Bỏ chọn' : 'Chọn tất cả',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Hàng 2 nút Duyệt / Huỷ duyệt. Disabled khi đang approving hoặc
          // chưa chọn card nào.
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 46,
                  child: OutlinedButton.icon(
                    onPressed: (hasSelection && !isApproving)
                        ? onReject
                        : null,
                    icon: const Icon(Icons.cancel_outlined, size: 18),
                    label: const Text(
                      'Huỷ duyệt',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.alert,
                      side: BorderSide(
                        color: AppColors.alert.withValues(alpha: 0.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 46,
                  child: ElevatedButton.icon(
                    onPressed: (hasSelection && !isApproving)
                        ? onApprove
                        : null,
                    icon: const Icon(Icons.check_circle_outline, size: 18),
                    label: const Text(
                      'Duyệt',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryERP,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor:
                          AppColors.gray.withValues(alpha: 0.3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

