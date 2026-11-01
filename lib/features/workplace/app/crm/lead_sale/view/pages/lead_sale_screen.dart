import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/constants/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/date_range_picker.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/lead_sale_model.dart';
import '../../data/datasource/models/lead_sale_permission.dart';
import '../../view/bloc/lead_sale_bloc.dart';
import '../../view/widgets/lead_sale_handover_sheet.dart';
import '../../view/widgets/lead_sale_assign_dialog.dart';
import '../../view/widgets/lead_sale_transfer_po_sheet.dart';
import '../../view/widgets/lead_sale_card.dart';
import '../../view/widgets/lead_sale_detail_sheet.dart';
import '../../view/widgets/lead_sale_filter_sheet.dart';
import '../../view/widgets/lead_sale_menu_sheet.dart';

/// Màn hình danh sách phiếu lead của phòng ban Marketing trong CRM.
///
/// Hỗ trợ tìm kiếm, chọn khoảng thời gian và bộ lọc theo nguồn lead,
/// nhân viên marketing / sale.
class LeadSaleScreen extends StatefulWidget {
  const LeadSaleScreen({super.key});

  @override
  State<LeadSaleScreen> createState() => _LeadSaleScreenState();
}

class _LeadSaleScreenState
    extends
        BaseShareState<
          LeadSaleScreen,
          LeadSaleEvent,
          LeadSaleState,
          LeadSaleBloc
        > {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(const LeadSaleEvent.init());
      // Tải trước danh mục cho form tạo phiếu lead để khi mở màn add
      // không phải chờ mạng.
      bloc.add(const LeadSaleEvent.loadFormOptions());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  /// Mở / đóng ô tìm kiếm trên AppBar.
  void _toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (_isSearchOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _searchFocusNode.requestFocus();
        });
      } else {
        _searchFocusNode.unfocus();
        if (_searchController.text.isNotEmpty) {
          _searchController.clear();
          bloc.add(const LeadSaleEvent.changeKeyword(keyword: ''));
        }
      }
    });
  }

  /// Xóa nội dung tìm kiếm.
  void _clearSearch() {
    _searchController.clear();
    bloc.add(const LeadSaleEvent.changeKeyword(keyword: ''));
  }

  /// Mở bottom sheet chọn khoảng thời gian.
  void _showDateRangePicker(LeadSaleState state) {
    final now = DateTime.now();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: state.dateStart ?? DateTime(now.year, now.month, 1),
        initialEnd: state.dateEnd ?? now,
        onApply: (start, end) {
          bloc.add(
            LeadSaleEvent.changeDateRange(dateStart: start, dateEnd: end),
          );
        },
      ),
    );
  }

  /// Mở bottom sheet bộ lọc nguồn, NV marketing, NV sale và lead đang mở.
  void _showFilterSheet(LeadSaleState state) {
    showLeadSaleFilterSheet(
      context: context,
      sources: state.sources,
      marketingEmployees: state.marketingEmployees,
      saleEmployees: state.saleEmployees,
      selectedSourceId: state.leadSourceId,
      selectedMarketingEmployeeId: state.marketingEmployeeId,
      selectedSaleEmployeeId: state.saleEmployeeId,
      includeOpen: state.includeOpen,
      selectedStage: state.stageFilter,
      stageCounts: state.stageCounts,
      onApply: (sourceId, marketingId, saleId, includeOpen, stage) {
        bloc.add(
          LeadSaleEvent.applyFilter(
            leadSourceId: sourceId,
            marketingEmployeeId: marketingId,
            saleEmployeeId: saleId,
            includeOpen: includeOpen,
            stage: stage,
          ),
        );
      },
      onClear: () => bloc.add(const LeadSaleEvent.clearFilter()),
    );
  }

  /// Mở menu thao tác khi bấm vào card phiếu lead.
  ///
  /// Menu gồm: xem chi tiết, chỉnh sửa, ghi hoạt động, xoá phiếu, chuyển PO,
  /// hoàn trả Marketing, không thành công / mở lại. Các mục cần quyền thao tác chỉ
  /// hiện khi người dùng có quyền theo giai đoạn của phiếu.
  ///
  /// Quyền sở hữu phiếu được kiểm tra khi bấm vào thao tác, để người dùng thường
  /// thao tác nhầm phiếu của người khác sẽ nhận được thông báo báo lỗi.
  Future<void> _openMenu(BuildContext context, LeadSaleItem item) async {
    final stageCode = LeadSalePermission.resolveStageCode(
      stageCode: item.stage,
      stageName: item.stageName,
    );

    // Người dùng không có quyền thao tác theo giai đoạn phiếu → chỉ cho xem.
    final blockedMessage = LeadSalePermission.blockedMessage(
      stageCode: stageCode,
      roleContext: bloc.state.roleContext,
      user: bloc.state.currentUser,
    );
    final canOperate = blockedMessage == null;

    final actionId = await LeadSaleMenuSheet.show(
      context,
      leadCode: item.leadCode,
      menuItems: _menuItemsFor(item, canOperate: canOperate),
    );
    if (!context.mounted || actionId == null) return;

    switch (actionId) {
      case 'detail':
        await LeadSaleDetailSheet.show(context, item);
        break;
      case 'edit':
        _goToEditScreen(item);
        break;
      case 'activity':
        _goToAddActivityScreen(item);
        break;
      case 'delete':
        await _confirmDeleteLead(context, item);
        break;
      case 'handover':
        await _confirmHandoverLead(context, item);
        break;
      case 'assign':
        await _confirmAssignLead(context, item);
        break;
      case 'transfer_po':
        await _confirmTransferPo(context, item);
        break;
      case 'return_marketing':
        await _confirmReturnMarketing(context, item);
        break;
      case 'close':
        await _confirmCloseLead(context, item);
        break;
      case 'reopen_failed':
        await _confirmReopenFailedLead(context, item);
        break;
    }
  }

  /// Danh sách thao tác hiển thị trong menu theo quyền của người dùng.
  ///
  /// - [canOperate] = false → chỉ hiện mục xem (chi tiết, ghi hoạt động).
  /// - Phiếu đã ở giai đoạn "Thất bại" thì hiện "Mở lại Không thành công",
  ///   ngược lại hiện "Không thành công".
  /// - Thao tác "Bàn giao Sale" chỉ hiện cho nhân viên đặc biệt khi phiếu ở
  ///   giai đoạn 1–2.
  /// - Thao tác "Phân công" chỉ hiện khi phiếu ở giai đoạn 4 (Chờ phân công).
  List<LeadSaleMenuItem> _menuItemsFor(
    LeadSaleItem item, {
    required bool canOperate,
  }) {
    final stageCode = LeadSalePermission.resolveStageCode(
      stageCode: item.stage,
      stageName: item.stageName,
    );
    final isFailed = stageCode == LeadSalePermission.failedStageCode;

    final canHandover = LeadSalePermission.canHandover(
      stageCode: stageCode,
      roleContext: bloc.state.roleContext,
      user: bloc.state.currentUser,
    );

    final items = LeadSaleMenuItem.menuItems.toList();

    return items.where((menu) {
      if (!canOperate && menu.requiresOperationPermission) return false;

      // Bàn giao Sale là thao tác riêng của nhân viên đặc biệt.
      if (menu.id == LeadSaleMenuItem.handover.id) return canHandover;

      // Lead đã thất bại chỉ cho mở lại; lead chưa thất bại mới cho chuyển
      // PO, hoàn trả Marketing hoặc xác nhận không thành công.
      if (menu.id == LeadSaleMenuItem.reopenFailed.id) return isFailed;
      // Phân công chỉ hiện khi phiếu ở giai đoạn Chờ phân công.
      if (menu.id == LeadSaleMenuItem.assign.id) {
        return stageCode == LeadSalePermission.pendingAssignStageCode;
      }
      if (menu.id == LeadSaleMenuItem.transferPo.id ||
          menu.id == LeadSaleMenuItem.returnMarketing.id ||
          menu.id == LeadSaleMenuItem.close.id) {
        return !isFailed;
      }

      return true;
    }).toList();
  }

  /// Kiểm tra quyền thao tác phiếu lead theo giai đoạn.
  ///
  /// Áp dụng cho chỉnh sửa, chuyển PO, hoàn trả Marketing, không thành công
  /// và mở lại không thành công.
  ///
  /// Trả về `true` nếu được phép; `false` kèm thông báo đã hiển thị.
  bool _checkOperationPermission(BuildContext context, LeadSaleItem item) {
    final stageCode = LeadSalePermission.resolveStageCode(
      stageCode: item.stage,
      stageName: item.stageName,
    );

    final blockedMessage = LeadSalePermission.blockedMessage(
      stageCode: stageCode,
      roleContext: bloc.state.roleContext,
      user: bloc.state.currentUser,
    );
    if (blockedMessage == null) return true;

    context.showMessage(blockedMessage, type: SnackBarType.error);
    return false;
  }

  /// Kiểm tra quyền **xoá** phiếu lead.
  ///
  /// Quyền xoá phụ thuộc giai đoạn của phiếu; quyền xoá phiếu của người khác
  /// do API quyết định.
  ///
  /// Trả về `true` nếu được phép; `false` kèm thông báo đã hiển thị.
  bool _checkDeletePermission(BuildContext context, LeadSaleItem item) {
    final blockedMessage = LeadSalePermission.blockedDeleteMessage(
      item: item,
      roleContext: bloc.state.roleContext,
      user: bloc.state.currentUser,
    );
    if (blockedMessage == null) return true;

    context.showMessage(blockedMessage, type: SnackBarType.error);
    return false;
  }

  /// Mở màn chỉnh sửa phiếu lead.
  ///
  /// Truyền `ID`, giai đoạn hiện tại và thông tin khách hàng qua `extra` để
  /// màn edit dựng payload khi lưu đúng với phiếu đang sửa.
  void _goToEditScreen(LeadSaleItem item) {
    final id = item.id;
    if (id == null) return;
    if (!_checkOperationPermission(context, item)) return;

    // Ảnh chụp thông tin khách hàng từ danh sách để dựng payload khi API
    // chi tiết khách hàng chưa kịp về (các field API chi tiết phiếu không
    // trả: TaxCode, Website, BusinessFieldID).
    final customerId = item.customerId;
    final customerMatches = customerId == null
        ? const <LeadSaleCustomer>[]
        : bloc.state.customers.where((c) => c.id == customerId).toList();
    final customer = customerMatches.isEmpty ? null : customerMatches.first;

    context.push(
      RouteNames.crmLeadSaleEdit,
      extra: {
        'id': id,
        'stage': item.stage,
        'customerLabel': item.companyName,
        'customerSnapshot': customer,
      },
    );
  }

  /// Mở màn ghi hoạt động cho phiếu lead.
  void _goToAddActivityScreen(LeadSaleItem item) {
    final id = item.id;
    if (id == null) return;

    context.push(
      RouteNames.crmLeadSaleActivityAdd,
      extra: {'id': id, 'leadCode': item.leadCode},
    );
  }

  /// Xác nhận rồi xoá phiếu lead.
  ///
  /// Quyền xoá phụ thuộc giai đoạn của phiếu và người phụ trách phiếu — kiểm
  /// tra trước khi gọi API.
  /// Thông báo kết quả được hiển thị qua listener của bloc trong [renderUI].
  Future<void> _confirmDeleteLead(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;
    if (!_checkDeletePermission(context, item)) return;

    final confirmed = await DialogService.showConfirmDeleteLead(
      context: context,
      leadCode: item.leadCode,
    );
    if (!context.mounted || !confirmed) return;

    bloc.add(LeadSaleEvent.deleteLead(id: id));
  }

  /// Bàn giao phiếu lead cho Leader Sale.
  ///
  /// Mở dialog chọn Leader Sale nhận bàn giao, Admin Sale xử lý và ghi chú.
  /// Thông báo kết quả được hiển thị qua listener của bloc trong [renderUI].
  Future<void> _confirmHandoverLead(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;

    // Tải danh sách Leader Sale / Admin Sale trước khi mở bottom sheet.
    bloc.add(const LeadSaleEvent.loadHandoverOptions());

    final selection = await LeadSaleHandoverSheet.show(
      context,
      bloc: bloc,
      leadCode: item.leadCode,
      companyName: item.companyName,
    );
    if (!context.mounted || selection == null) return;

    bloc.add(
      LeadSaleEvent.handoverLead(
        id: id,
        leaderEmployeeId: selection.leaderEmployeeId,
        adminSaleId: selection.adminSaleId,
        note: selection.note,
      ),
    );
  }

  /// Phân công lead — mở dialog chọn nhân viên sale + ghi chú, sau đó gọi
  /// `POST /Lead/assign`.
  Future<void> _confirmAssignLead(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;

    // Tải danh sách nhân viên sale được phân công trước khi mở dialog.
    bloc.add(const LeadSaleEvent.loadAssignableSales());

    final selection = await LeadSaleAssignDialog.show(
      context,
      bloc: bloc,
      leadCode: item.leadCode,
      companyName: item.companyName,
    );
    if (!context.mounted || selection == null) return;

    bloc.add(
      LeadSaleEvent.assignLead(
        id: id,
        saleEmployeeId: selection.saleEmployeeId,
        note: selection.note,
      ),
    );
  }

  /// Chuyển PO — mở sheet chọn file PO + ghi chú, sau đó gọi
  /// `POST /Lead/customer-po` với `fileType = 2`.
  Future<void> _confirmTransferPo(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;
    if (!_checkOperationPermission(context, item)) return;

    final selection = await LeadSaleTransferPoSheet.show(context, item: item);
    if (!context.mounted || selection == null) return;

    bloc.add(
      LeadSaleEvent.transferPo(
        id: id,
        files: selection.files,
        note: selection.note,
      ),
    );
  }

  /// Hoàn trả lead về Marketing — nhập lý do rồi gọi `POST /Lead/return`.
  Future<void> _confirmReturnMarketing(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;
    if (!_checkOperationPermission(context, item)) return;

    final reason = await DialogService.showLeadSaleReasonDialog(
      context: context,
      title: 'Hoàn trả Marketing',
      confirmText: 'Hoàn trả',
      accentColor: LeadSaleMenuItem.returnMarketing.color,
      icon: LeadSaleMenuItem.returnMarketing.icon,
      inputLabel: 'Lý do hoàn trả',
      leadCode: item.leadCode,
      companyName: item.companyName,
    );
    if (!context.mounted || reason == null) return;

    bloc.add(LeadSaleEvent.returnLead(id: id, reason: reason));
  }

  /// Xác nhận lead không thành công — nhập lý do rồi gọi `POST /Lead/close`.
  Future<void> _confirmCloseLead(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;
    if (!_checkOperationPermission(context, item)) return;

    final reason = await DialogService.showLeadSaleReasonDialog(
      context: context,
      title: 'Xác nhận không thành công',
      confirmText: 'Xác nhận',
      accentColor: AppColors.stateErrorColor,
      icon: LeadSaleMenuItem.close.icon,
      inputLabel: 'Lý do',
      leadCode: item.leadCode,
      companyName: item.companyName,
      saleName: item.saleEmployeeName,
    );
    if (!context.mounted || reason == null) return;

    bloc.add(LeadSaleEvent.closeLead(id: id, reason: reason));
  }

  /// Mở lại lead đã không thành công — nhập ghi chú rồi gọi
  /// `POST /Lead/reopen`.
  Future<void> _confirmReopenFailedLead(
    BuildContext context,
    LeadSaleItem item,
  ) async {
    final id = item.id;
    if (id == null) return;
    if (!_checkOperationPermission(context, item)) return;

    final note = await DialogService.showLeadSaleReasonDialog(
      context: context,
      title: 'Mở lại Không thành công',
      confirmText: 'Mở lại',
      accentColor: AppColors.stateSuccessColor,
      icon: LeadSaleMenuItem.reopenFailed.icon,
      inputLabel: 'Ghi chú',
      isRequired: false,
      leadCode: item.leadCode,
      companyName: item.companyName,
      saleName: item.saleEmployeeName,
    );
    if (!context.mounted || note == null) return;

    bloc.add(LeadSaleEvent.reopenLead(id: id, note: note));
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocConsumer<LeadSaleBloc, LeadSaleState>(
      // Bỏ qua thay đổi của chi tiết phiếu để không dựng lại danh sách
      // (và không mất vị trí scroll) khi bottom sheet đang tải dữ liệu.
      buildWhen: (previous, current) =>
          previous.leads != current.leads ||
          previous.status != current.status ||
          previous.message != current.message ||
          previous.roleContext != current.roleContext ||
          previous.dateStart != current.dateStart ||
          previous.dateEnd != current.dateEnd ||
          previous.keyword != current.keyword ||
          previous.stageFilter != current.stageFilter,
      listenWhen: (previous, current) =>
          previous.deleteStatus != current.deleteStatus ||
          previous.stageActionStatus != current.stageActionStatus ||
          previous.handoverStatus != current.handoverStatus,
      listener: (context, state) {
        // Kết quả xoá phiếu lead — thông báo rồi tải lại danh sách.
        if (state.deleteStatus == BaseStateStatus.success) {
          context.showMessage(
            state.deleteMessage ?? 'Xóa lead thành công!',
            type: SnackBarType.success,
          );
          bloc.add(const LeadSaleEvent.clearDeleteState());
          bloc.add(const LeadSaleEvent.refresh());
        } else if (state.deleteStatus == BaseStateStatus.failed) {
          context.showMessage(
            state.deleteMessage ?? 'Xóa lead thất bại',
            type: SnackBarType.error,
          );
          bloc.add(const LeadSaleEvent.clearDeleteState());
        }

        // Kết quả loại bỏ / mở lại lead.
        if (state.stageActionStatus == BaseStateStatus.success) {
          context.showMessage(
            state.stageActionMessage ?? 'Thành công!',
            type: SnackBarType.success,
          );
          bloc.add(const LeadSaleEvent.clearStageActionState());
          bloc.add(const LeadSaleEvent.refresh());
        } else if (state.stageActionStatus == BaseStateStatus.failed) {
          context.showMessage(
            state.stageActionMessage ?? 'Thất bại',
            type: SnackBarType.error,
          );
          bloc.add(const LeadSaleEvent.clearStageActionState());
        }

        // Kết quả bàn giao lead cho Leader Sale.
        if (state.handoverStatus == BaseStateStatus.success) {
          context.showMessage(
            state.handoverMessage ?? 'Bàn giao lead thành công!',
            type: SnackBarType.success,
          );
          bloc.add(const LeadSaleEvent.clearHandoverState());
          bloc.add(const LeadSaleEvent.refresh());
        } else if (state.handoverStatus == BaseStateStatus.failed) {
          context.showMessage(
            state.handoverMessage ?? 'Bàn giao lead thất bại',
            type: SnackBarType.error,
          );
          bloc.add(const LeadSaleEvent.clearHandoverState());
        }
      },
      builder: (context, state) {
        final loading = state.status == BaseStateStatus.loading;
        final failed = state.status == BaseStateStatus.failed;
        final leads = state.displayLeads;
        final isInitialLoading = loading && state.leads.isEmpty;

        return BaseScaffold(
          appBar: AppBarCommon(
            onBackTap: () => context.pop(),
            centerTitle: false,
            title: Text(
              _isSearchOpen ? 'Tìm kiếm' : 'Lead Sale',
              style: AppStyles.headingTitle2,
            ),
            // Ô tìm kiếm nằm ở thanh dưới AppBar để chiếm toàn bộ chiều rộng,
            // không bị bóp còn nhỏ bởi các nút hành động trên AppBar.
            bottom: _isSearchOpen
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(64),
                    child: _buildSearchField(),
                  )
                : null,
            actions: [
              if (!_isSearchOpen) ...[
                IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  tooltip: 'Chọn khoảng thời gian',
                  onPressed: () => _showDateRangePicker(state),
                ),
                _buildFilterButton(state),
              ],
              IconButton(
                icon: Icon(_isSearchOpen ? Icons.close : Icons.search),
                tooltip: _isSearchOpen ? 'Đóng tìm kiếm' : 'Tìm kiếm',
                onPressed: _toggleSearch,
              ),
            ],
          ),
          body: Column(
            children: [
              _ListHeader(
                total: leads.length,
                dateStart: state.dateStart,
                dateEnd: state.dateEnd,
                isSearching: state.keyword.isNotEmpty,
              ),
              Expanded(
                child: _buildContent(
                  context,
                  state,
                  loading,
                  failed,
                  leads,
                  isInitialLoading,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final reload = await context.push(RouteNames.crmLeadSaleAdd);

              if (reload == true) {
                bloc.add(const LeadSaleEvent.init());
              }
            },
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  /// Nút mở bộ lọc, kèm badge số tiêu chí đang được áp dụng.
  Widget _buildFilterButton(LeadSaleState state) {
    final activeCount = [
      state.leadSourceId != 0,
      state.marketingEmployeeId != 0,
      state.saleEmployeeId != 0,
      state.stageFilter != null,
      !state.includeOpen,
    ].where((e) => e).length;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.tune_rounded),
          tooltip: 'Bộ lọc',
          onPressed: () => _showFilterSheet(state),
        ),
        if (activeCount > 0)
          Positioned(
            top: 6,
            right: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: AppColors.primaryERP,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$activeCount',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Ô tìm kiếm hiển thị ở thanh dưới AppBar khi đang bật chế độ tìm kiếm.
  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: SizedBox(
        height: 44,
        child: TextField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onChanged: (value) =>
              bloc.add(LeadSaleEvent.changeKeyword(keyword: value)),
          onSubmitted: (value) =>
              bloc.add(LeadSaleEvent.changeKeyword(keyword: value.trim())),
          style: const TextStyle(fontSize: 14, color: AppColors.heading),
          decoration: InputDecoration(
            hintText: 'Tìm mã lead, công ty, người liên hệ',
            hintStyle: const TextStyle(color: AppColors.hintText, fontSize: 14),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.gray,
              size: 20,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
            ),
            suffixIcon: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _searchController,
              builder: (context, value, _) {
                if (value.text.isEmpty) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.gray,
                    size: 18,
                  ),
                  onPressed: _clearSearch,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                );
              },
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryERP,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Nội dung danh sách: lỗi / trống / danh sách phiếu lead.
  Widget _buildContent(
    BuildContext context,
    LeadSaleState state,
    bool loading,
    bool failed,
    List<LeadSaleItem> leads,
    bool isInitialLoading,
  ) {
    if (failed && state.leads.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            Text(state.message ?? 'Load dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => bloc.add(const LeadSaleEvent.refresh()),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (leads.isEmpty && !isInitialLoading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 10),
            Text(
              state.keyword.isNotEmpty
                  ? 'Không tìm thấy phiếu lead phù hợp'
                  : 'Không có dữ liệu lead',
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(const LeadSaleEvent.refresh());
        await bloc.stream.firstWhere(
          (s) => s.status != BaseStateStatus.loading,
        );
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: leads.length,
        itemBuilder: (context, index) {
          final item = leads[index];
          return LeadSaleCard(
            item: item,
            onTap: () => _openMenu(context, item),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(height: 8),
      ),
    );
  }
}

/// Header hiển thị tổng số phiếu lead và khoảng thời gian đang lọc.
class _ListHeader extends StatelessWidget {
  const _ListHeader({
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.isSearching,
  });

  final int total;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final hasRange = dateStart != null && dateEnd != null;
    final rangeText = hasRange
        ? '${df.format(dateStart!)} - ${df.format(dateEnd!)}'
        : null;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryERP,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryERP.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$total',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'phiếu lead',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  isSearching ? 'Đang tìm kiếm' : 'Tổng số phiếu',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          if (rangeText != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.event_outlined,
                    size: 14,
                    color: AppColors.primaryERP,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      rangeText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryERP,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
