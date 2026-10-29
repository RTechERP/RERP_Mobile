import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';
import 'lead_marketing_files_tab.dart';

/// Bottom sheet hiển thị đầy đủ thông tin chi tiết của một phiếu lead.
///
/// Dữ liệu được ghép từ 2 nguồn:
/// - Danh sách (`LeadMarketingItem`) — có sẵn ngay khi mở, hiển thị tức thì.
/// - API `GET /Lead/get-detail?id=X` — bổ sung hoạt động, lịch sử chuyển giai đoạn
///   và các quyền thao tác của người dùng hiện tại.
///
/// Bố cục chia 2 tab: Thông tin / Hoạt động.
class LeadMarketingDetailSheet extends StatefulWidget {
  const LeadMarketingDetailSheet({super.key, required this.item});

  /// Phiếu lead cần hiển thị chi tiết.
  final LeadMarketingItem item;

  /// Mở bottom sheet chi tiết.
  ///
  /// Bloc được truyền lại từ context của màn danh sách vì bottom sheet được
  /// đẩy lên navigator nên không nằm trong cây BlocProvider của màn hình.
  static Future<void> show(BuildContext context, LeadMarketingItem item) {
    final bloc = context.read<LeadMarketingBloc>();
    if (item.id == null) {
      return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: LeadMarketingDetailSheet(item: item),
        ),
      );
    }

    bloc.add(LeadMarketingEvent.loadDetail(id: item.id!));
    bloc.add(LeadMarketingEvent.loadFiles(customerContactId: item.id!));

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: LeadMarketingDetailSheet(item: item),
      ),
    );
  }

  @override
  State<LeadMarketingDetailSheet> createState() =>
      _LeadMarketingDetailSheetState();
}

class _LeadMarketingDetailSheetState extends State<LeadMarketingDetailSheet>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.92,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
            builder: (context, state) => _buildTabs(state),
          ),
          Flexible(
            child: BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
              builder: (context, state) {
                // Chỉ dùng chi tiết đúng với phiếu đang xem, tránh hiển thị
                // dữ liệu của phiếu trước đó trong lúc API đang tải.
                final rawDetail = state.detail;
                final detail = rawDetail?.lead?.id == widget.item.id
                    ? rawDetail
                    : null;
                final isLoading = state.detailStatus == BaseStateStatus.loading;
                final activities = detail?.activities ?? const [];

                // Danh sách file chỉ dùng khi đúng phiếu đang xem.
                final files = state.filesLeadId == widget.item.id
                    ? state.files
                    : const <LeadFile>[];
                final isFilesLoading =
                    state.filesStatus == BaseStateStatus.loading;

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildInfoTab(detail, isLoading),
                    _buildActivitiesTab(activities, isLoading),
                    LeadMarketingFilesTab(
                      files: files,
                      isLoading: isFilesLoading,
                      errorMessage:
                          state.filesLeadId == widget.item.id
                              ? state.filesMessage
                              : null,
                    ),
                    _buildLogsTab(detail?.logs ?? const [], isLoading),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Header: mã lead, công ty, chip giai đoạn + các chỉ số nổi bật.
  Widget _buildHeader(BuildContext context) {
    final item = widget.item;
    final company = (item.companyName ?? '').trim();
    final customer = (item.customerName ?? '').trim();
    final title = company.isNotEmpty ? company : customer;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondaryERP, AppColors.heading],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 8, 12),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    _orDash(item.leadCode),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (item.isOverdue == true) ...[
                                  const SizedBox(width: 8),
                                  _glassChip('Quá hạn'),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              title.isEmpty ? '-' : title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                _glassChip(_orDash(item.stageName)),
                                if ((item.customerType ?? '').trim().isNotEmpty)
                                  _glassChip(item.customerType!.trim()),
                                if ((item.poTypeName ?? '').trim().isNotEmpty)
                                  _glassChip(item.poTypeName!.trim()),
                                if ((item.leadSourceName ?? '').trim().isNotEmpty)
                                  _glassChip(item.leadSourceName!.trim()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildStatStrip(),
          ],
        ),
      ),
    );
  }

  /// Dải chỉ số nổi bật: giá trị dự kiến, số HĐ, hoạt động, hẹn liên hệ.
  Widget _buildStatStrip() {
    final item = widget.item;
    final hasFollowUp = (item.nextFollowUpDate ?? '').trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
      ),
      child: Row(
        children: [
          _StatItem(
            label: 'Giá trị dự kiến',
            value: _formatMoney(item.estimatedValue),
          ),
          _StatItem(
            label: 'Số HĐ',
            value: '${item.activityCount ?? 0}',
          ),
          _StatItem(
            label: 'Hẹn liên hệ',
            value: _formatDate(item.nextFollowUpDate),
            highlight: hasFollowUp,
          ),
        ],
      ),
    );
  }

  /// Chip nền trong mờ trên nền gradient.
  Widget _glassChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1.2,
        ),
      ),
    );
  }

  /// Thanh tab chuyển giữa Thông tin / Hoạt động / Files.
  Widget _buildTabs(LeadMarketingState state) {
    final filesCount = state.filesLeadId == widget.item.id
        ? state.files.length
        : 0;

    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: AppColors.secondaryERP,
        unselectedLabelColor: AppColors.gray,
        indicatorColor: AppColors.secondaryERP,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: AppColors.borderColor,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        tabs: [
          const Tab(text: 'Thông tin'),
          const Tab(text: 'Hoạt động'),
          Tab(text: 'Files ($filesCount)'),
          const Tab(text: 'Lịch sử'),
        ],
      ),
    );
  }

  /// Tab 1: toàn bộ thông tin phiếu lead.
  Widget _buildInfoTab(LeadDetail? detail, bool isLoading) {
    final item = widget.item;
    final lead = detail?.lead;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      children: [
        if (isLoading) ...[
          const LinearProgressIndicator(minHeight: 2),
          const SizedBox(height: 10),
        ],
        _buildSummary(lead),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.person_outline,
          title: 'Liên hệ',
          children: [
            _gridRow(
              _gridCell(
                'Người liên hệ',
                _first(lead?.contactName, item.contactName),
              ),
              _gridCell(
                'SĐT',
                _first(lead?.contactPhone, item.contactPhone),
                copyable: true,
              ),
            ),
            _gridRow(
              _gridCell(
                'Email',
                _first(lead?.contactEmail, item.contactEmail),
              ),
              _gridCell('Tỉnh/thành', _orDash(item.province)),
            ),
            _gridRow(
              _gridCell('Địa chỉ', _orDash(item.address)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.insights_outlined,
          title: 'Đánh giá & nhu cầu',
          children: [
            _gridRow(
              _gridCell(
                'Loại lead',
                _leadTypeName(lead?.leadType ?? item.leadType),
              ),
              _gridCell(
                'Chiến dịch',
                _first(lead?.campaignName, item.campaignName),
              ),
            ),
            _gridRow(
              _gridCell(
                'Ngày thu thập',
                _formatDate(
                  _first(lead?.collectedDate, item.collectedDate),
                ),
              ),
              _gridCell('Đánh giá', _orDash(item.ratingName)),
            ),
            _gridRow(
              _gridCell(
                'Giá trị dự kiến',
                _formatMoney(
                  lead?.estimatedValue ?? item.estimatedValue,
                ),
              ),
              _gridCell(
                'Sản phẩm quan tâm',
                _first(lead?.productInterest, item.productInterest),
              ),
            ),
            _gridRow(
              _gridCell('Ghi chú', _first(lead?.note, item.note)),
            ),
            if ((_firstOrNull(lead?.needDescription, item.needDescription) ?? '')
                .trim()
                .isNotEmpty)
              _buildNeedDescription(
                _first(lead?.needDescription, item.needDescription),
              ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.groups_outlined,
          title: 'Phân công',
          children: [
            _gridRow(
              _gridCell('NV Marketing', _orDash(item.marketingEmployeeName)),
              _gridCell('Leader nhận', _orDash(item.handoverLeaderName)),
            ),
            _gridRow(
              _gridCell('Admin Sale', _orDash(item.adminSaleName)),
              _gridCell('NV Sale', _orDash(item.saleEmployeeName)),
            ),
            _gridRow(
              _gridCell(
                'Ngày bàn giao',
                _formatDateTime(
                  _first(lead?.handoverDate, item.handoverDate),
                ),
              ),
              _gridCell(
                'Ngày phân công',
                _formatDate(
                  _first(lead?.assignedDate, item.assignedDate),
                ),
              ),
            ),
            _gridRow(
              _gridCell(
                'Hẹn liên hệ',
                _formatDateTime(
                  _first(lead?.nextFollowUpDate, item.nextFollowUpDate),
                ),
              ),
              _gridCell(
                'Ngày qualify',
                _formatDate(
                  _first(lead?.qualifiedDate, item.qualifiedDate),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.description_outlined,
          title: 'Hợp đồng & liên kết',
          children: [
            _gridRow(
              _gridCell('Số HĐ', '${item.activityCount ?? 0}'),
              _gridCell('HĐ gần nhất', _formatDateTime(item.lastActivityDate)),
            ),
            _gridRow(
              _gridCell(
                'Khách hàng liên kết',
                _orDash(item.customerName),
              ),
              _gridCell('Mã KH liên kết', _orDash(item.customerCode)),
            ),
            _gridRow(
              _gridCell('Tổng tiền PO', _formatMoney(item.totalMoneyPo)),
              _gridCell('Loại PO', _orDash(item.poTypeName)),
            ),
            _gridRow(
              _gridCell('Ngày PO', _formatDate(lead?.poDate)),
              _gridCell('Lý do PO', _orDash(lead?.poReason)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.flag_outlined,
          title: 'Kết quả',
          children: [
            _gridRow(
              _gridCell(
                'Lý do không thành công',
                _first(lead?.lostReason, item.lostReason),
              ),
              _gridCell(
                'Lý do hoàn trả MKT',
                _first(lead?.returnReason, item.returnReason),
              ),
            ),
            _gridRow(
              _gridCell(
                'Ngày đóng',
                _formatDate(_first(lead?.closedDate, item.closedDate)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSection(
          icon: Icons.history_outlined,
          title: 'Thông tin tạo',
          children: [
            _gridRow(
              _gridCell(
                'Ngày tạo',
                _formatDateTime(
                  _first(lead?.createdDate, item.createdDate),
                ),
              ),
              _gridCell('Người tạo', _first(lead?.createdBy, item.createdBy)),
            ),
            _gridRow(
              _gridCell(
                'Ngày cập nhật',
                _formatDateTime(
                  _first(lead?.updatedDate, item.updatedDate),
                ),
              ),
              _gridCell(
                'Người cập nhật',
                _first(lead?.updatedBy, item.updatedBy),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Tab 2: danh sách hoạt động đã ghi nhận trên phiếu, hiển thị dạng timeline.
  Widget _buildActivitiesTab(List<LeadActivity> activities, bool isLoading) {
    if (isLoading && activities.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (activities.isEmpty) {
      return _buildEmptyState(
        icon: Icons.task_alt_outlined,
        message: 'Chưa có hoạt động nào được ghi nhận',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      itemCount: activities.length,
      itemBuilder: (context, index) => _ActivityTile(
        activity: activities[index],
        isLast: index == activities.length - 1,
      ),
    );
  }

  /// Tab 4: lịch sử chuyển giai đoạn / phân công.
  Widget _buildLogsTab(List<LeadLog> logs, bool isLoading) {
    if (isLoading && logs.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (logs.isEmpty) {
      return _buildEmptyState(
        icon: Icons.history_outlined,
        message: 'Chưa có lịch sử thay đổi',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      itemCount: logs.length,
      itemBuilder: (context, index) => _LogTile(
        log: logs[index],
        isLast: index == logs.length - 1,
      ),
    );
  }

  /// Trạng thái trống khi không có dữ liệu.
  Widget _buildEmptyState({required IconData icon, required String message}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: AppColors.placeholder),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 13, color: AppColors.gray),
          ),
        ],
      ),
    );
  }

  /// Khối tóm tắt: loại khách hàng, ngành nghề, lĩnh vực.
  Widget _buildSummary(LeadDetailLead? lead) {
    final item = widget.item;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blueA100.withValues(alpha: 0.55),
            AppColors.backgroundLight,
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.badge_outlined,
                size: 14,
                color: AppColors.secondaryERP,
              ),
              const SizedBox(width: 6),
              const Text(
                'Khách hàng',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryERP,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _gridRow(
            _gridCell(
              'Loại khách hàng',
              _first(lead?.customerType.toString(), item.customerType),
            ),
            _gridCell('Mã KH', _orDash(item.customerCode)),
          ),
          _gridRow(
            _gridCell(
              'Công ty',
              _orDash(item.companyName ?? item.customerName),
            ),
            _gridCell('MST', _orDash(item.taxCode)),
          ),
          _gridRow(
            _gridCell('Nhóm hàng', _orDash(item.poTypeName)),
            _gridCell('Ngành nghề', _orDash(item.industryName)),
          ),
          _gridRow(
            _gridCell('Lĩnh vực', _orDash(item.businessFieldName)),
          ),
        ],
      ),
    );
  }

  /// Mô tả nhu cầu được API trả về dạng TSV — hiển thị mỗi cột một dòng.
  Widget _buildNeedDescription(String raw) {
    final columns = raw
        .split('\t')
        .map((e) => e.trim().replaceAll('"', '').trim())
        .where((e) => e.isNotEmpty)
        .toList();

    if (columns.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nhu cầu',
            style: TextStyle(fontSize: 12, color: AppColors.gray),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columns
                  .map(
                    (line) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        line,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.enableText,
                          height: 1.35,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Một nhóm thông tin có tiêu đề.
  Widget _buildSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            ),
            child: Row(
              children: [
                Icon(icon, size: 15, color: AppColors.secondaryERP),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.enableText,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  /// Hàng lưới 2 cột trong các khối thông tin.
  ///
  /// Cột bên trái chiếm 1 phần, cột bên phải chiếm 1 phần. Khi chỉ có 1 ô
  /// thì ô đó chiếm toàn bộ chiều rộng.
  Widget _gridRow(Widget first, [Widget? second]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: first),
          const SizedBox(width: 12),
          Expanded(child: second ?? const SizedBox.shrink()),
        ],
      ),
    );
  }

  /// Một ô trong lưới thông tin: nhãn nhỏ ở trên, giá trị ở dưới.
  ///
  /// Khi [copyable] bật, hiển thị nút sao chép cạnh giá trị.
  Widget _gridCell(String label, String value, {bool copyable = false}) {
    final isEmpty = value == '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w500,
            color: AppColors.gray,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: isEmpty ? FontWeight.w400 : FontWeight.w700,
                  color:
                      isEmpty ? AppColors.disableText : AppColors.enableText,
                  height: 1.35,
                ),
              ),
            ),
            if (copyable && !isEmpty)
              GestureDetector(
                onTap: () => _copyToClipboard(context, label, value),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.copy_outlined,
                    size: 14,
                    color: AppColors.gray,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  /// Sao chép giá trị vào clipboard và thông báo cho người dùng.
  void _copyToClipboard(BuildContext context, String label, String value) {
    Clipboard.setData(ClipboardData(text: value));
    context.showMessage('Đã sao chép $label');
  }

  /// Tên loại lead theo mã: `1` = Marketing, `2` = Sale.
  String _leadTypeName(int? leadType) {
    switch (leadType) {
      case 1:
        return 'Marketing';
      case 2:
        return 'Sale';
      default:
        return '-';
    }
  }

  /// Lấy giá trị đầu tiên khác null trong chuỗi ưu tiên, trả về '-'
  /// khi cả hai đều rỗng.
  String _first(String? preferred, String? fallback) {
    final a = (preferred ?? '').trim();
    if (a.isNotEmpty) return a;
    final b = (fallback ?? '').trim();
    return b.isEmpty ? '-' : b;
  }

  /// Lấy giá trị đầu tiên khác null, giữ null nếu cả hai đều rỗng.
  String? _firstOrNull(String? preferred, String? fallback) {
    final a = (preferred ?? '').trim();
    if (a.isNotEmpty) return a;
    final b = (fallback ?? '').trim();
    return b.isEmpty ? null : b;
  }

  /// Hiển thị giá trị hoặc '-' khi rỗng.
  String _orDash(String? value) {
    final trimmed = (value ?? '').trim();
    return trimmed.isEmpty ? '-' : trimmed;
  }

  /// Định dạng ngày, trả về '-' nếu không hợp lệ.
  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '-';
    try {
      return DateFormat('dd/MM/yyyy').format(DateTime.parse(value).toLocal());
    } catch (_) {
      return value;
    }
  }

  /// Định dạng ngày giờ, trả về '-' nếu không hợp lệ.
  String _formatDateTime(String? value) {
    if (value == null || value.isEmpty) return '-';
    try {
      return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(value).toLocal());
    } catch (_) {
      return value;
    }
  }

  /// Định dạng giá trị tiền.
  String _formatMoney(double? value) {
    if (value == null) return '-';
    final formatter = NumberFormat('#,##0', 'vi_VN');
    return '${formatter.format(value)} đ';
  }
}

/// Một chỉ số trong dải thống kê của header.
class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;

  /// Làm nổi bật giá trị khi có dữ liệu đáng chú ý.
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: highlight ? AppColors.yellowA300 : Colors.white,
              height: 1.25,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Một hoạt động trong tab Hoạt động, hiển thị dạng timeline dọc.
class _ActivityTile extends StatelessWidget {
  const _ActivityTile({required this.activity, required this.isLast});

  final LeadActivity activity;

  /// Hoạt động cuối cùng — không vẽ đường nối xuống dưới.
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final date = _formatDateTimeValue(activity.activityDate);
    final typeName = (activity.activityTypeName ?? '').trim();

    return _TimelineEntry(
      color: AppColors.blueMain,
      isLast: isLast,
      title: typeName.isEmpty ? 'Hoạt động' : typeName,
      date: date,
      content: (activity.content ?? '').trim(),
      children: [
        if ((activity.employeeName ?? '').trim().isNotEmpty)
          _meta(
            icon: Icons.person_outline,
            text: activity.employeeName!.trim(),
            label: 'Người thực hiện',
            color: AppColors.blueMain,
          ),
        if ((activity.result ?? '').trim().isNotEmpty)
          _meta(
            icon: Icons.check_circle,
            text: activity.result!.trim(),
            label: 'Kết quả',
            color: AppColors.greenA500,
          ),
        if ((activity.nextAction ?? '').trim().isNotEmpty)
          _meta(
            icon: Icons.flag_rounded,
            text: activity.nextAction!.trim(),
            label: 'Kế hoạch',
            color: AppColors.orangeA500,
          ),
      ],
    );
  }

  /// Một thẻ meta: icon tròn + nhãn nhỏ + giá trị.
  ///
  /// Thẻ chiếm hết bề ngang để giá trị dài xuống dòng thay vì tràn ngang.
  Widget _meta({
    required IconData icon,
    required String text,
    required String label,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 13, color: color),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                  color: AppColors.gray,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: color,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Một dòng lịch sử trong tab Lịch sử.
class _LogTile extends StatelessWidget {
  const _LogTile({required this.log, required this.isLast});

  final LeadLog log;

  /// Dòng cuối cùng — không vẽ đường nối xuống dưới.
  final bool isLast;

  /// Tên giai đoạn theo mã, khớp với nội dung log của API.
  static const _stageNames = <int, String>{
    1: 'Mới',
    3: 'Hoàn trả MKT',
    4: 'Chờ phân công',
    5: 'Đã phân công',
    6: 'Đang chăm sóc',
  };

  @override
  Widget build(BuildContext context) {
    final date = _formatDateTimeValue(log.createdDate);
    final fromStage = _stageNames[log.fromStage];
    final toStage = _stageNames[log.toStage];
    final fromEmployee = (log.fromEmployeeName ?? '').trim();
    final toEmployee = (log.toEmployeeName ?? '').trim();

    return _TimelineEntry(
      color: AppColors.primaryERP,
      isLast: isLast,
      title: (log.typeLogName ?? '').trim().isEmpty
          ? 'Cập nhật'
          : log.typeLogName!.trim(),
      date: date,
      content: (log.contentLog ?? '').trim(),
      children: [
        if (fromStage != null || toStage != null)
          _stageFlow(fromStage, toStage),
        if (fromEmployee.isNotEmpty || toEmployee.isNotEmpty)
          _employeeFlow(fromEmployee, toEmployee),
      ],
    );
  }

  /// Dòng chuyển giai đoạn dạng `Mới → Đã phân công`, gọn trong 1 hàng.
  Widget _stageFlow(String? fromStage, String? toStage) {
    if (fromStage == null && toStage == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Flexible(
          child: Text(
            'Giai đoạn',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: AppColors.gray,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (fromStage != null) _stageTag(fromStage, AppColors.gray),
        if (fromStage != null && toStage != null) ...[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.arrow_forward_rounded,
              size: 12,
              color: AppColors.gray,
            ),
          ),
        ],
        if (toStage != null) _stageTag(toStage, AppColors.primaryERP),
      ],
    );
  }

  /// Dòng người thực hiện dạng `Từ A → B` (bỏ trống nếu trùng nhau).
  Widget _employeeFlow(String fromEmployee, String toEmployee) {
    final names = <String>[];
    if (fromEmployee.isNotEmpty && fromEmployee != toEmployee) {
      names.add(fromEmployee);
    }
    if (toEmployee.isNotEmpty) names.add(toEmployee);

    if (names.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        const Icon(Icons.person_outline, size: 13, color: AppColors.gray),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            names.join('  →  '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  /// Chip tên giai đoạn.
  Widget _stageTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color == AppColors.gray ? AppColors.label : color,
        ),
      ),
    );
  }
}

/// Một mắt xích trên timeline dọc, dùng chung cho tab Hoạt động và Lịch sử.
class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.color,
    required this.isLast,
    required this.title,
    required this.date,
    this.content,
    this.children = const [],
  });

  /// Màu của chấm tròn đầu mắt xích.
  final Color color;

  /// Mắt xích cuối cùng — không vẽ đường nối xuống dưới.
  final bool isLast;

  /// Tiêu đề mắt xích.
  final String title;

  /// Thời gian hiển thị bên phải.
  final String date;

  /// Nội dung mô tả (tuỳ chọn).
  final String? content;

  /// Các widget meta hiển thị dưới nội dung.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cột chấm tròn + đường nối dọc của timeline.
          SizedBox(
            width: 14,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.35),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 11),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.enableText,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            date,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (content != null && content!.isNotEmpty) ...[
                      const SizedBox(height: 5),
                      Text(
                        content!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondaryColor,
                          height: 1.35,
                        ),
                      ),
                    ],
                    if (children.isNotEmpty) ...[
                      const SizedBox(height: 9),
                      // Các meta xếp dọc: mỗi thẻ chiếm 1 hàng nên Wrap sẽ làm
                      // chúng nằm cạnh nhau và dễ tràn ngang trên màn hình hẹp.
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < children.length; i++) ...[
                            if (i > 0) const SizedBox(height: 6),
                            children[i],
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Định dạng chuỗi ngày giờ của API, trả về '-' nếu thiếu hoặc không hợp lệ.
String _formatDateTimeValue(String? value) {
  if (value == null || value.isEmpty) return '-';
  try {
    return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(value).toLocal());
  } catch (_) {
    return value;
  }
}
